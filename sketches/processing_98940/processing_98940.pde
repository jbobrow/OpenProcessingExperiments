

import processing.serial.*;
import cc.arduino.*;
import java.util.Date;

Serial port;
float sensorvalue = 0;

// This is where you enter your Oauth info
static String OAuthConsumerKey = "4BIf65czf6t5mUyO1OF8A";
static String OAuthConsumerSecret = "z8w1DhxJLlAAwlkeWzC1cxhp4bQgLPEp8MplUTwQ";

// This is where you enter your Access Token info
static String AccessToken = "1331796871-EMGZ3l0neI7sZt5DNINmWm3olmZlSoVa8XdOG52";
static String AccessTokenSecret = "Rsc9zKZrm38CN2JAsE0JKdmBBqbDshup0DuFmeg";

// Just some random variables kicking around
String myTimeline;
java.util.List statuses = null;
User[] friends;
Twitter twitter = new TwitterFactory().getInstance();
RequestToken requestToken;
String[] theSearchTweets = new String[11];

void setup()
{
 
  size(400,400);
  background(0);
  port = new Serial(this, "/dev/cu.usbmodemfd121", 9600);
  port.bufferUntil('\n');
  connectTwitter();

  
}
// Initial connection
void connectTwitter() 
{

  twitter.setOAuthConsumer(OAuthConsumerKey, OAuthConsumerSecret);
  AccessToken accessToken = loadAccessToken();
  twitter.setOAuthAccessToken(accessToken);

}


// Sending a tweet
void sendTweet(String t) {

  try {
    Status status = twitter.updateStatus(t);
    println("Successfully updated the status to [" + status.getText() + "].");
  } catch(TwitterException e) { 
    println("Send tweet: " + e + " Status code: " + e.getStatusCode());
  }

}


// Loading up the access token
private static AccessToken loadAccessToken(){
  return new AccessToken(AccessToken, AccessTokenSecret);
}
 

void draw()
{
  background ( 64,153,sensorvalue);
}
  void serialEvent (Serial port)
  {
    sensorvalue = float(port.readStringUntil('\n'));
    if (sensorvalue >= 255)
    {
    sendTweet("@mikaelfer this tweet is from my birdfeeder via Arduino and Processing!");
    }
    ; 
    println(sensorvalue);
  };
      
    
  


    

  


