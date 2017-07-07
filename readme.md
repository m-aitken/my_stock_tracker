# ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png) Project #2: Building a First Full-stack Application

### Overview

My second project, and first foray into **building a full-stack database backed application.** Built on Sinatra and coded with Ruby, including a relational database   hosted on Heroku.

### My Stock Tracker app

I'm a keen trader(when I have the time), and as such I use a variety of trader platforms to keep an eye on intra-day pricing. However these can be quite cumbersome when viewing on my smartphone !
I decided to build a lightweight, clean app to allow quick ASX stock code lookup, show me the current market price, and allow a simple login service for me to 'track' a selection of stocks at a glance. These features, and the design, are also intended to be easily used on my smartphone. 

#### App deployed on Heroku:

The app can be accessed via the following link: [https://boiling-headland-83806.herokuapp.com/](https://boiling-headland-83806.herokuapp.com/)
#### App code stored on GitHub:

GitHub repo is found at: [https://github.com/m-aitken/my_stock_tracker](https://github.com/m-aitken/my_stock_tracker)

---

### Initial design wireframes

I immediately had a clear idea of functionality, and was able to draw up some wireframes of features, buttons and such that would be needed.

While the app in its current form has deviated a little from the wireframes, I will revist and develop the design for better mobile viewing.

Wireframe drawings can be viewed at: [http://imgur.com/a/9zs45](http://imgur.com/a/9zs45)

---

### App design, functionality and programming approach

As mentioned above, I really wanted this app to be 'lightweight' - so I can easily keep a browser open at this page all day on my smartphone,  refreshing the page/prices every so often to see intra-day stock price movement.

My app requires little navigation away from the main landing page, designed for the User to remain with stock search and price results viewing, reloading as needed.
Using this app assumes the User knows the precise ASX stock code desired - the search function will not return a list of 'nearest matches' though this is intended. 
The 'hero' return result is the current market price for the requested stock code. Other daily stock details such as "Open Price", "Yesterday Close Price" and movement % may be implemented in future.

A User may create a profile so that when signed in to the app, any searched stock code may be added to a persistent 'Tracker'. 
The User profile information is stored in an individual database table, as are the tracked stocks. When a User adds a stock code to their 'Tracker', a record is created in the stock table, including their User ID.

When signed in, the app will look to the current User profile ID and refer to the stock table to return all tracked stocks for that unique profile ID.
The tracked stocks will thereafter be shown on the main view, allowing the User to get at-a-glance pricing for all tracked stocks simultaneously.
At any time, the signed in User may visit their 'Tracker', where the current listing of tracked codes are displayed, each including a 'Remove' function so as to delete any unwanted stocks from being linked to their profile.

These User actions directly refer to a relational database: User profile records include password encryption, and stock codes are recorded with corresponding user profile ID for app reference. 

---

### Technical Requirements

The minimum requirements for this project are:

* **Have at _least_ 2 models** (more if they make sense) – one representing someone using the application, and one that represents the main functional idea for the app
* **Include sign up/log in functionality**, with encrypted passwords & an authorization flow
* **Have complete RESTful routes** for at least one of the resources with GET, POST, PUT, PATCH, and DELETE
* **Utilize SQL or an ORM to create a database table structure** and interact with the relationally-stored data
* **Include wireframes** designed during the planning process
* Have **semantically clean HTML and CSS**
* **Be deployed online** and accessible to the public
