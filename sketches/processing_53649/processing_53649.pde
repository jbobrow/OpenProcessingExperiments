
Twitter twitter = new TwitterFactory().getInstance();

//Create an initial connection to the Twitter API
void connectTwitter() {
  twitter.setOAuthConsumer(OAuthConsumerKey, OAuthConsumerSecret);
  AccessToken accessToken = loadAccessToken();
  twitter.setOAuthAccessToken(accessToken);
}


//Loading up the access token
private static AccessToken loadAccessToken() {
  return new AccessToken(AccessToken, AccessTokenSecret);
}


/*
Search for Tweets by passing in a query, and number of results.
 It seems that Twitter only returns the most recent results.
 */
void searchTweets(String queryStr, int totalResults) {

  try {

    // create query object
    Query query = new Query(queryStr); // initialize the query object and pass in the query string
    query.setRpp(totalResults); // set number of results (100 max)

    // send query object to the Twitter API
    QueryResult result = twitter.search(query);

    // store Tweets in an ArrayList
    ArrayList resultTweets = (ArrayList) result.getTweets();

    println("==========");
    println("UPDATES FOR QUERY: " + queryStr);

    for (int i = 0; i < resultTweets.size(); i++) {

      Tweet tweet = (Tweet) resultTweets.get(i);
      /*
      Tweet class documentation here: http://twitter4j.org/en/javadoc/index.html
       */

      String msg = tweet.getText();
      Date date = tweet.getCreatedAt();
      String userName = tweet.getFromUser();
      int fromUserId = tweet.getFromUserId();
      int toUserId = tweet.getToUserId();
      String location = tweet.getLocation();
      GeoLocation latlons = tweet.getGeoLocation();

      println("..........");
      println("User: " + userName);
      println("Date: " + date);
      println("Message: " + msg);
      println("From_User ID: " + fromUserId);
      println("To_User ID: " + toUserId); // if available. -1 if not available
      println("Location: " + location); // this is often "null" unless the user has geolocation enabled
      println("Geolocation: " + latlons); // this is often "null" unless the user has geolocation enabled
    }
  } 
  catch (TwitterException e) {    
    println("Search tweets: " + e);
  }
}


