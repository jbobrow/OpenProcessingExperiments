
import twitter4j.conf.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;
import java.util.*;

Twitter twitter;
String searchString = "Crashed my Car";
List<Status> tweets;

int currentTweet;
int yPos= 0 ;
int xPos= 0 ;
void setup()
{
  size(800, 600);

  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("3hu3d7SkGOgnDBzolWnsrBcai");
  cb.setOAuthConsumerSecret("AZtSTdKLdITNErx2GciD2wWFc198OCUAKCdkw0VwSq4h7FV0dA");
  cb.setOAuthAccessToken("2277212354-rQnSTSjDx6HLl3xCacQc9qO2oxdUGrH9ToynkRL");
  cb.setOAuthAccessTokenSecret("euAvJRCz52fuWYG8kNxMnOtLxzJ7qx5vFNR4I4e8p1jiX");

  TwitterFactory tf = new TwitterFactory(cb.build());

  twitter = tf.getInstance();

  getNewTweets();

  currentTweet = 0;

  thread("refreshTweets");
  
   fill(0);
  rect(0, 0, width, height);

}

void draw()
{

  fill(0, 50);
  rect(0, 0, width, height);

  currentTweet = currentTweet + 1;

  if (currentTweet >= tweets.size())
  {
    currentTweet = 0;
  }

  Status status = tweets.get(currentTweet);
  textSize(12) ;
  fill( int(random(255)), int(random(255)), int(random(255)));
  text(status.getText()+ status.getCreatedAt(), xPos, yPos, 300, 100);

  yPos= yPos + 70 ;

  if (yPos >= height) {
    yPos = 0;  
    xPos= xPos + 50 ;
  } 
  
  if (xPos >= width) {
    xPos = 0;
  }

  delay(250);
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

void refreshTweets()
{
  while (true)
  {
    getNewTweets();

    println("Updated Tweets"); 

    delay(30000);
  }
}



