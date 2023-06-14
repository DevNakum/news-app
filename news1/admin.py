from django.contrib import admin

# Register your models here.
from news1.models import *

class userRegister(admin.ModelAdmin):
    list_display=['fname','lname','username','role']

class categoryRegister(admin.ModelAdmin):
    list_display=['categoryname','noOfPost']

class postRegister(admin.ModelAdmin):
    list_display=['title','description','category','date','author','img']
    
admin.site.register(User,userRegister)
admin.site.register(Category,categoryRegister)
admin.site.register(Post,postRegister)