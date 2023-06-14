from django.db import models 

class Category(models.Model):
    categoryname = models.CharField(max_length=200)
    noOfPost = models.IntegerField(default=0)
    
    def __str__(self):
        return self.categoryname
    
class User(models.Model):
    fname = models.CharField(max_length=200)
    lname = models.CharField(max_length=200)
    username = models.CharField(max_length=200)
    password = models.CharField(max_length=200)
    role = models.BooleanField(default=False)
    
    def __str__(self):
        return self.username
    
class Post(models.Model):
    title = models.CharField(max_length=200)
    description = models.CharField(max_length=200)
    category=models.ForeignKey(Category,on_delete=models.CASCADE)
    date = models.DateTimeField(auto_created=True,auto_now=True)
    author = models.ForeignKey(User,on_delete=models.CASCADE)
    img = models.ImageField(upload_to='post')