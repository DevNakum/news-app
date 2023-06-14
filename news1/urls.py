from django.urls import path
from news1.views import *

urlpatterns = [
    path('',index,name='index'),
    path('login/',login,name='login1'),
    path('logout/',logout,name='logout1'),
    path('cancel/',cancel,name='cancel1'),
    
    path('post/',post,name='post1'),
    path('post/edit/<int:id>/',editPost,name='editpost1'),
    path('post/delete/<int:id>/',deletePost,name='deletepost1'),
    path('post/new/',newPost,name='newpost1'),
    path('post/<int:id>/',single,name='single1'),
    
    path('category/',allCategory,name='category1'),
    path('category/edit/<int:id>/',editCategory,name='editCategory1'),
    path('category/delete/<int:id>/',deleteCategory,name='deleteCategory1'),
    path('category/new/',addCategory,name='addCategory1'),
    path('category/<int:id>/',headercategory,name='headercategory1'),
    
    path('user/',allUser,name='user1'),
    path('user/edit/<int:id>',editUser,name='edituser1'),
    path('user/new/',addUser,name='addUser1'),
    path('user/delete/<int:id>/',deleteUser,name='deleteuser1'),
    
    path('author/<int:id>',author,name='author1'),
    path('search/',search,name='search1'),
]