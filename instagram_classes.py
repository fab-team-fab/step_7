
import time

class User:
    def __init__(self, _id, name, lname, email, phonNumber, gender, birthday_date, location, age):
        self._id = _id
        self.name = name
        self.lname = lname
        self.email = email
        self.phonNumber = phonNumber
        self.gender = gender
        self.birthday_date = birthday_date
        self.location = location
        self.age = age

        self.posts = []
        self.stories = []

    def add_post(self, post_id, post_content):
        p = post(post_id, time.time(), post_content)
        self.posts.append(p)

    def del_post(self, post_id):
        for i in range(len(self.posts)):
            if self.posts[i]._id == post_id:
                self.posts.pop(i)

    def add_story(self, story_id, story_content):
        s = story(story_id, time.time(), story_content)
        self.story.append(s)

    def del_story(self, story_id):
        for i in range(len(self.stories)):
            if self.stories[i]._id == story_id:
                self.stories.pop(i)


class Post:
    def __init__(self, _id, post_date, post_content):
        self._id = _id
        self.post_date = post_date
        self.post_content = post_content

        self.likes = 0
        self.likers = []
        self.comments = []

    def like(self, user_id):
        self.likes += 1
        self.likers.append(user_id)

    def unlike(self, user_id):
        self.likes -= 1
        self.likers.remove(user_id)

    def add_comment(self, comment_id, user_id, comment_content):
        c = comment(comment_id, user_id, time.time(), comment_content)
        self.comments.append(c)

    def del_comment(self, comment_id):
        for i in range(len(self.comments)):
            if self.comments[i]._id == comment_id:
                self.comment.pop(i)

       


class Story:
    def __init__(self, _id, story_date, story_content):
        self._id = _id
        self.story_date = story_date
        self.story_content = story_content

        self.highlight = False

    def add_to_highlight(self):
        self.highlight = True


class Comment:
    def __init__(self, _id, user_id, comment_date, content):
        self._id = _id
        self.user_id = user_id
        self.comment_date = comment_date
        self.content = content

        self.likes = 0
        self.likers = []

    def like(self, user_id):
        self.likes += 1
        self.likers.append(user_id)

