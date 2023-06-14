from django.shortcuts import render, redirect
from django.http import HttpResponse
from news1.models import *
from django.db.models import Q
from django.core.paginator import Paginator


def get_blog_posts(request):
    blog_posts = Post.objects.order_by('-id')
    paginator = Paginator(blog_posts, 2)
    
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    
    return page_obj

def get_blog_users(request,id):
    blog_users = User.objects.order_by('-id')
    paginator = Paginator(blog_users, 2)
    
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    
    return page_obj

def recentPost():
    rcpost = Post.objects.order_by('-id')[:3]
    return rcpost

def index(request):
    recent = recentPost()
    page_obj = get_blog_posts(request)
    post = Post.objects.all().order_by('-id')
    data = Category.objects.all()
    return render(request, 'index.html',{'data':data,'post':post,'recent':recent,'page_obj': page_obj})

def login(request):
    if request.method == "POST":
        username1=request.POST['username']
        password1=request.POST['password']
      
        try:
            data=User.objects.filter(username=username1,password=password1)
            if data:
                request.session['userid']=data[0].id
                request.session['role']=data[0].role
                request.session['username']=data[0].username
                return redirect('post1')
            else:
                return render(request,'login.html',{'message':'Invalid email or password'})
        except:
            # print("in except")
            return render(request,'login.html',{'message':'Invalid email or password'})
    else:
        return render(request,'login.html')
    
def logout(request):
    if 'userid' in request.session:
        del request.session['userid']
        return redirect('index')
    else:
        return redirect('index')
    
def cancel(request):
    if 'userid' in request.session:
        return redirect('post1')
    else:
        return redirect('index')
    
def post(request):
    try:
        if 'userid' in request.session:
            id = request.session['userid']
            data=User.objects.get(pk=id)
        
            allpost = Post.objects.filter(author_id=id).order_by('-id')
            paginator = Paginator(allpost, 2)
    
            page_number = request.GET.get('page')
            page_obj = paginator.get_page(page_number)
            return render(request,'post.html',{'data':data,'allpost':allpost,'page_obj': page_obj})
        else:
            return redirect('login1')
    except:
        return redirect('login1')

def editPost(request,id):
    if 'userid' in request.session:
        data = Post.objects.get(pk=id)
        category = Category.objects.all()
        if request.method=="POST" or request.FILES:
            prevCat = Category.objects.get(pk=data.category_id) 
            
            data.title = request.POST['title']
            data.description = request.POST['description']
            data.category_id = request.POST['id']
            
            if request.FILES:
                data.img = request.FILES['img']
            
            data.save()
            if prevCat!=data.category:
                updateCategory = Category.objects.get(pk=request.POST['id'])
                updateCategory.noOfPost = updateCategory.noOfPost + 1
                updateCategory.save()

                prevCategory = Category.objects.get(categoryname=prevCat.categoryname)
                prevCategory.noOfPost = prevCategory.noOfPost - 1

                prevCategory.save()
            
            
            return render(request,'update-post.html',{'data':data,'message':"Product update successfully",'category':category})
        return render(request,'update-post.html',{'data':data,'category':category})
    else:
        return redirect('login1')

def deletePost(request,id):
    if 'userid' in request.session:
        data = Post.objects.get(pk=id)
        
        updateCategory = Category.objects.get(pk=data.category_id)
        updateCategory.noOfPost = updateCategory.noOfPost - 1
        updateCategory.save()
        
        data.delete()
        return redirect('post1')
    else:
        return redirect('login1')
    
def newPost(request):
    if 'userid' in request.session:
        id = request.session['userid']
        category = Category.objects.all()
        
        if request.method=="POST" and request.FILES:
            try:
                data=Post()
                data.title = request.POST['title']
                data.description = request.POST['description']
                data.category_id = request.POST['category']
                data.author_id = id
                data.img = request.FILES['img']
                data.save()
                
                updateCategory = Category.objects.get(pk=request.POST['category'])
                updateCategory.noOfPost = updateCategory.noOfPost + 1
                updateCategory.save()
                
                return redirect('newpost1')
            except:
                return render(request,'add-post.html',{'category':category,'message':"Something went wrong"})
        else:
            return render(request,'add-post.html',{'category':category})
    else:
        return redirect('login1')

def allCategory(request):
    if 'userid' in request.session:
        if request.session['role']:
            data = Category.objects.all().order_by('-id')
            
            return render(request,'category.html',{'data':data})
        else:
            return redirect('post1')    
    else:
        return redirect('index')

def editCategory(request,id):
    if 'userid' in request.session:
        if request.session['role']:
            data = Category.objects.get(pk=id)
            if request.method=="POST":
                data.categoryname = request.POST['name']
                data.save()
                return redirect('category1')
            else:
                return render(request,'update-category.html',{'data':data})
        else:
            return redirect('index')            
    else:
        return redirect('index')  
    
def deleteCategory(request,id):
    if 'userid' in request.session:
        if request.session['role']:
            data = Category.objects.get(pk=id)
            data.delete()
            return redirect('category1')
        else:
            return redirect('index')            
    else:
        return redirect('index')           
    
def addCategory(request):
    if 'userid' in request.session:
        if request.session['role']:
            if request.method=="POST":
                category = Category()
                category.categoryname = request.POST['name']
                category.save()
                return redirect('category1')
            else:
                return render(request,'add-category.html')
        else:
            return redirect('index')
    else:
        return redirect('index')
    
def allUser(request):
    if 'userid' in request.session:
        try:
            page_obj = get_blog_users(request,request.session['userid'])
            if request.session['role']:
                data = User.objects.all().order_by('-id')
                return render(request,'users.html',{'data':data,'page_obj': page_obj})
            else:
                return redirect('user1')
        except:
            return redirect('user1')
    else:
        return redirect('index')
    
def editUser(request,id):
    if 'userid' in request.session:
        if request.session['role']:
            try:
                data = User.objects.get(pk=id)
                
                if request.method=="POST":
                    data.fname = request.POST['fname']
                    data.lname = request.POST['lname']
                    data.username = request.POST['username']
                    data.role = request.POST['role']
                    data.save()
                    return redirect('user1')
                else:
                    return render(request,'update-user.html',{'data':data})
            except:
                return redirect('user1')
        else:
            return redirect('index')
    else:
        return redirect('index')

def addUser(request):
    if 'userid' in request.session:
        if request.session['role']:
            try:
                if request.method=="POST":
                    user = User()
                    user.fname = request.POST['fname']
                    user.lname = request.POST['lname']
                    user.username = request.POST['username']
                    user.password = request.POST['password']
                    user.role = request.POST['role']
                    user.save()
                    return redirect('user1')
                else:
                    return render(request,'add-user.html')
            except:
                return redirect('user1')
        else:
            return redirect('index')
    else:
        return redirect('index')    
    
def deleteUser(request,id):
    if 'userid' in request.session:
        if request.session['role']:
            try:
                data = User.objects.get(pk=id)
                post = Post.objects.filter(author_id = id)
                
                for i in post:
                    category = Category.objects.get(pk = i.category_id)
                    category.noOfPost = category.noOfPost - 1 
                    category.save()
                    
                data.delete()
                return redirect('user1')
            except:
                return redirect('user1')
        else:
            return redirect('index')
    else:
        return redirect('index')
    
def headercategory(request,id):
    recent = recentPost()
    
    try:
        post = Post.objects.filter(category_id=id)
        paginator = Paginator(post, 2)
    
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
        
        data = Category.objects.all()
        category = Category.objects.get(pk=id)
        # print(post)
        return render(request,'category_header.html',{'post':post,'data':data,'category':category,'recent':recent,'page_obj': page_obj})   
    except:
        return redirect('login1')
        
def author(request,id):
    recent = recentPost()
    page_obj = get_blog_posts(request)
    
    try:
        post = Post.objects.filter(author_id=id).order_by('-id')
        
        paginator = Paginator(post, 2)
    
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
        
        data = Category.objects.all()
        category = Category.objects.get(pk=id)
        user = User.objects.get(pk=id)
        # print(post)
        return render(request,'author.html',{'post':post,'data':data,'user':user,'recent':recent,'page_obj': page_obj})   
    except:
        return redirect('index')
    
def search(request):
    recent = recentPost()
    
    
    try:
        if request.method == 'GET':
            search = request.GET.get('search')   
            searchset = search.split(" ")
            for i in searchset:
                post = Post.objects.filter(Q(title__icontains=i) | Q(description__icontains=i))   

            paginator = Paginator(post, 2)
    
            page_number = request.GET.get('page')
            page_obj = paginator.get_page(page_number)
            
            data = Category.objects.all()
            return render(request,'search.html',{'post':post,'data':data,'search':search,'recent':recent,'page_obj': page_obj})
    except:
        return redirect('index')
    
def single(request,id):
    recent = recentPost()
    try:
        post = Post.objects.get(pk=id)
        data = Category.objects.all()
        return render(request,'single.html',{'post':post,'data':data,'recent':recent})
    except:
        return redirect('index')