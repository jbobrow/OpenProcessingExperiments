
/* 
SimpleTwitterStreaming
 Developed by: Michael Zick Doherty
 2011-10-18
 http://neufuture.com
 */

//////////////////////// Config your setup here! ///////////////////////

// This is where you enter your Oauth info
static String OAuthConsumerKey = "vMRIa9BOs5Y3GHvFBkSg7w";
static String OAuthConsumerSecret = "OOFXVaGLNLfDKN2Z3FE5qaFkW8ay1WTMEhq8klJ0Q";
// This is where you enter your Access Token info
static String AccessToken = "532115507-GCuLb1vnRCuhSm5Uh32Tfh7YvazfU27URrpD4AfA";
static String AccessTokenSecret = "TniabBkSMpQxILNug5vLTu40TP9lfSAUx0mlEAZ6qMY";

TwitterStream twitter = new TwitterStreamFactory().getInstance();


void initTwitter() {
  connectTwitter();
  twitter.addListener(listener);
  if (keywords.length==0) twitter.sample();
  else twitter.filter(new FilterQuery().track(keywords));
}


// Initial connection
void connectTwitter() {
  twitter.setOAuthConsumer(OAuthConsumerKey, OAuthConsumerSecret);
  AccessToken accessToken = loadAccessToken();
  twitter.setOAuthAccessToken(accessToken);
}


// Loading up the access token
private static AccessToken loadAccessToken() {
  return new AccessToken(AccessToken, AccessTokenSecret);
}


// This listens for new tweet
StatusListener listener = new StatusListener() {
  public void onStatus(Status status) {
    nuevoMensajeRecibido(status);
  }

  public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {
    //System.out.println("Got a status deletion notice id:" + statusDeletionNotice.getStatusId());
  }
  public void onTrackLimitationNotice(int numberOfLimitedStatuses) {
    //  System.out.println("Got track limitation notice:" + numberOfLimitedStatuses);
  }
  public void onScrubGeo(long userId, long upToStatusId) {
    // System.out.println("Got scrub_geo event userId:" + userId + " upToStatusId:" + upToStatusId);
  }

  public void onException(Exception ex) {
    //  ex.printStackTrace();
  }
};


