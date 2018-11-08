## Blocmetrics

## An analytics service to track events on websites.


* A client-side JavaScript snippet that allows a user to track events on their website.

* A server-side API that captures and saves those events to a database.

* A Rails application that displays the captured event data for a user.

* The developers can put into their applications the **JavaScript snippet** to track the events (see below). Include the snippet in your Rails App: app/assets/javascripts/application.js  
  ```
    blocmetrics.report = function(eventName) {
     var event = {event: { name: eventName }};

     var request = new XMLHttpRequest();

     request.open("POST", "http://localhost:3000/api/events", true);

     request.setRequestHeader('Content-Type', 'application/json');

     request.send(JSON.stringify(event));
   }
  ```



* made by [Viktoryia Dounar-Schabowska](https://www.linkedin.com/in/viktoria-dounar-schabowska-6946857/).

* made at [Bloc](http://bloc.io).

* you can see up here [Heroku]

* ...
