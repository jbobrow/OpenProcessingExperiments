
/*
Declare Twitter object to form a STREAMING connection to the server.
 Uses the TwitterFactory API method: "An instance of this class is completely thread safe and can be re-used and used concurrently."
 More info on the "Factory Method" here: http://gsraj.tripod.com/design/creational/factory/factory.html
 */
TwitterStream twitter = new TwitterStreamFactory().getInstance();

float minValue = MAX_FLOAT;
float maxValue = MIN_FLOAT;


/*
Create an initial connection to the Twitter API
 */
void connectTwitter() {

  twitter.setOAuthConsumer(OAuthConsumerKey, OAuthConsumerSecret);
  AccessToken accessToken = loadAccessToken();
  twitter.setOAuthAccessToken(accessToken);
}


/*
Loading up the access token
 */
private static AccessToken loadAccessToken() {
  return new AccessToken(AccessToken, AccessTokenSecret);
}


/*
Invoke the listener and start streaming
 */
void startStreaming(String[] keywords) {

  // set up listener to update in real-time as new tweets stream in
  twitter.addListener(listener);

  if (keywords.length == 0) {

    // sample data from twitter object if no keywords specified
    twitter.sample();
  }
  else {

    // if keywords specified, filter stream by keywords
    twitter.filter(new FilterQuery().track(keywords));
  }
}



///TEST CODE
/*
This listens for a new status update
 */
StatusListener listener = new StatusListener() {

  public void onStatus(Status status) {


    String msg = status.getText();
    long id = status.getInReplyToStatusId();
    boolean isSolicited = false;



    if (id != -1) {
      isSolicited = true;
    }
    /*
    //check on this--what happened ot getInReplyToStatusId
     for (int i = 0; i < keywords.length; i++) {
     politicians[i].updateWordCounter(msg);
     
     }
     */

    minValue = MAX_FLOAT;
    maxValue = MIN_FLOAT;

    // loop through keywords and check for a match
    for (int i = 0; i < keywords.length; i++) {

      if (msg.contains(keywords[i])) {
/*
        // store data in new tweet object
        TStatus statusObject  = storeStatusData(status);

        // add to statuses array
        statuses.add(statusObject);
*/
        // print msg to console when there is a match
        println(msg);

        // match has been found. now, check for the corresponding politician
        for (int n = 0; n < politicians.length; n++) {
          if (keywords[i].equals(politicians[n].name)) {
            politicians[n].update();
          }
        }
      }
    }
  }

  public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {
    //System.out.println("Got a status deletion notice id:" + statusDeletionNotice.getStatusId());
  }

  public void onTrackLimitationNotice(int numberOfLimitedStatuses) {
    //  System.out.println("Got track limitation notice:" + numberOfLimitedStatuses);
  }

  public void onScrubGeo(long userId, long upToStatusId) {
    System.out.println("Got scrub_geo event userId:" + userId + " upToStatusId:" + upToStatusId);
  }

  public void onException(Exception ex) {
    ex.printStackTrace();
  }
};


TStatus storeStatusData(Status status) {

  String msg = status.getText();
  Date date = status.getCreatedAt();
  User user = status.getUser();
  long inReplyToId = status.getInReplyToStatusId();
  Place place = status.getPlace();
  long retweets = status.getRetweetCount();
  Boolean isRetweet = status.isRetweet();
  GeoLocation latlons = status.getGeoLocation();

  String imgUrl = null;
  String imgPage = null;

  // checks for images posted using twitter API
  if (status.getMediaEntities() != null) {
    imgUrl= status.getMediaEntities()[0].getMediaURL().toString();
  }
  // checks for images posted using other APIs
  else {
    if (status.getURLEntities().length > 0) {
      if (status.getURLEntities()[0].getExpandedURL() != null) {
        imgPage = status.getURLEntities()[0].getExpandedURL().toString();
      } 
      else {
        if (status.getURLEntities()[0].getDisplayURL() != null) {
          imgPage = status.getURLEntities()[0].getDisplayURL().toString();
        }
      }
    }
  }

  println("..........");
  println("User id: " + user.getId());
  println("User name: " + user.getName());
  println("Date: " + date);
  println("Message: " + msg);
  println("In reply to tweet ID: " + inReplyToId); // if available. -1 if not available
  println("Retweets: " + retweets);
  println("Is a retweet: " + isRetweet);
  println("Place: " + place);
  println("Geolocation: " + latlons); // this is often "null" unless the user has geolocation enabled
  println("Image URL: " + imgUrl);


  String[] segments = split(msg, " @");
  String category = "";
  if (segments.length > 1 ) {
    category = segments[0];
    msg = segments[1];
  }


  // create a new TStatus object to store data in
  TStatus statusObject = new TStatus(msg, date, user, inReplyToId, retweets, isRetweet, place, latlons, imgUrl);

  return statusObject;
}
/*
TUser storeUserData(User user) {
 
 long id = user.getId();
 String name = user.getName();
 int favoritesCount = user.getFavouritesCount(); // note: favourites with a "u"!
 int followersCount = user.getFollowersCount();
 int friendsCount = user.getFriendsCount();
 String location = user.getLocation();
 String profileBgColor = user.getProfileBackgroundColor();
 URL imgUrl = user.getProfileImageURL();
 String profileImageUrl = imgUrl.toString();
 
 println("..........");
 println("User ID: " + id);
 println("User name: " + name);
 println("Favorites count: " + favoritesCount);
 println("Followers count: " + followersCount);
 println("Friends count: " + friendsCount);
 println("Location: " + location);
 println("Profile background color: " + profileBgColor);
 println("Profile image URL: " + profileImageUrl);
 
 
 
 
 // create a new Tweet object to store data in
 TUser userObject = new TUser(id, name, favoritesCount, followersCount, friendsCount, location, profileBgColor, profileImageUrl);
 
 return userObject;
 }
 */

