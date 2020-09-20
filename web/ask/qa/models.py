from django.db import models
from django.contrib.auth.models import User


class Question(models.Model):
    objects = QuestionManager()
    title = models.CharField()
    text = models.TextField()
    added_at = models.DateTimeField(auto_now_add=True)
    rating = models.IntegerField(default=0)
    author = models.ForeignKey(User)
    likes = models.ManyToManyField(User)


class Answer(models.Model):
    text = models.TextField()
    added_at = models.DateTimeField()
    question = models.ForeignKey(Question,
            null=False, on_delete=models.CASCADE)
    author = models.ForeignKey(User)


class QuestionManager(models.Manager):

    def new(self):
        return self.order_by('-added_at')

    def popular(self):
        return self.order_by('-rating')
