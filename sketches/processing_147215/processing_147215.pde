
/* @pjs  preload = "finn.png, jake.jpg, ice.png"  ; */
PImage finn1, jake1, ice1 ;


import twitter4j.conf.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;
import java.util.*;

Twitter twitter;
String searchString = "adventuretime";
List<Status> tweets;

int currentTweet;

void setup()
{
  size(559, 800);
    finn1 = loadImage("finn.png") ;
    jake1 = loadImage("jake.jpg") ;
    ice1 = loadImage("ice.png") ;
     image(jake1, 0, 0) ;

  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("1GE0pxGaNyaiRsFGJZHiIoWzV");
  cb.setOAuthConsumerSecret("RdUGvc5X4PxIsSdC8uDS2rhRPbZzwaYFgL3zfeFVug0GXtpCPI");
  cb.setOAuthAccessToken("2458355130-bXvDefXrtrtpwXjJqUHzHPtrCNhjTyLjU84YG6i");
  cb.setOAuthAccessTokenSecret("H4vWFj55VtjtoaN30y5zCMC7ZBJKb7otzhFTk1uBd06to");

  TwitterFactory tf = new TwitterFactory(cb.build());

  twitter = tf.getInstance();

  getNewTweets();
  
  currentTweet = 0;
}

void draw()
{
  //fill(0, 40);
  //rect(0, 0, width/2, height/2);
       image(jake1, 0, 0) ;

  currentTweet = currentTweet + 1;

  if (currentTweet >= tweets.size())
  {
    currentTweet = 0;
  }
  
  if (currentTweet >= 10)
  {
   // text("iceking", 75, 100) ;
    image(ice1, random(-100, 400), random(-100,700), width/2, height/3) ;
  }

  Status status = tweets.get(currentTweet);

  fill(255);
 // text(status.getText(), random(width), random(height), 300, 200);
       image(finn1, random(-100, 400), random(-100,700), width/3, height/3) ;

  delay(400);
}

void getNewTweets()
{
  try 
  {
    Query query = new Query(searchString);

    QueryResult result = twitter.search(query);

    tweets = result.getTweets();
  } 
  catch (TwitterException te) 
  {
    System.out.println("Failed to search tweets: " + te.getMessage());
    System.exit(-1);
  }
}



