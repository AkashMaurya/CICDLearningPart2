from django.shortcuts import render

# Create your views here.
def homepage(request):
    data={
        'title':"Home Page"
    }
    return render(request,'index.html',data)