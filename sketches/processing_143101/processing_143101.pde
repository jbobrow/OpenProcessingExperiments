
import controlP5.*;
import twitter4j.conf.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;
import java.util.*;

Twitter twitter;
String searchString = "";
List<Status> tweets;
ControlP5 cp5;
int ready = 0;
int currentTweet;
//Twitter api used is Twitter4J
//Twitter api manipulation learnt from from http://saglamdeniz.com/blog/?p=124
//Final test program by Aaron Darling for educational purposes

void setup()
{
    size(1280,720);
    smooth();
    background(0);
    PFont font = createFont("arial",20);
  textAlign(CENTER,CENTER);
    cp5 = new ControlP5(this);
    
    cp5.addTextfield("searchString")
     .setPosition(530,650)
     .setSize(200,40)
     .setFont(font)
     .setFocus(true)
     .setColor(color(255,255,255))
     ;
      
      textSize(62);
      textAlign(CENTER,CENTER);
    text("What is the world tweeting about?", width/2, height/2);
    textSize(30);
    text("Type, press enter and go", width/2, height/2+100);
    fill(0,10,0);
    


}

void ready(){
    ready = 1;
    ConfigurationBuilder cb = new ConfigurationBuilder();
    cb.setOAuthConsumerKey("tRWSsLZp3Qje2HfSmaio8Cwg0");
    cb.setOAuthConsumerSecret("KY97P0FeOBRSEgjRGuNdbZuv7Qt2aboUjYNpnCZ4OHYkLURGgm");
    cb.setOAuthAccessToken("2428370322-F6EqBAq1A2kJvpGINpyWZs0GVnga4LYauPXSZiI");
    cb.setOAuthAccessTokenSecret("NyJhxQrf7IMiySIe7T1xja5Y2y8XiErFHzmwoNYNzlSof");
    
    TwitterFactory tf = new TwitterFactory(cb.build());
    
    twitter = tf.getInstance();
  
    getNewTweets();
    

    currentTweet = 0;

    thread("refreshTweets");
    
}

void draw()
{
 
    if(ready == 1){
    fill(0, 8);
    rect(0, 0, width, height);

    currentTweet = currentTweet + 1;

    if (currentTweet >= tweets.size())
    {
        currentTweet = 0;
    }

    Status status = tweets.get(currentTweet);
    if(random(0,50) < 1.3){
    fill(255,255,255);
    textSize(18);
    text(status.getText(), random(width-300), random(height-300), 400, 300);
    }
    delay(30);
    } else {
      text(cp5.get(Textfield.class,"searchString").getText(), 360,130);
           if(searchString != ""){
           searchString = '"' + searchString + '"';
             ready();
     }
    }
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

        delay(3000);
    }
}
