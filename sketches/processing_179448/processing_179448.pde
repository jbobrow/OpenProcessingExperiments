
//rose vastola 
// Final project

import twitter4j.conf.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;
import java.util.*;

PImage hill;
Wanderer[] wanderer = new Wanderer[75]; // The array set for wanderer that creats a new array of 75 wanders
Leaf[] leaf = new Leaf[200]; // The array set for wanderer that creats a new array of 75 wanders
int[] leafPos = new int[2];
humanColony tweets; // Calls the Constructor of Class HumanColony and the status of Tweets
Status tweetText; // Calls the object of tweetText


void setup()
{
  tweets = new humanColony(); //
  hill = loadImage("hill.jpg");// Loads image and sets a a Pimage of hill
  hill.resize(100,100); // resizes the hill image
  size(700, 700);  //Size of sketch
  background(205,133,63);
  fill(0);
  noStroke();
 
  tweetText = tweets.getTweet(); // gets all the tweets and loads in the variable of type status, then you can receieve the tweet text  from the status getText function
                                  //Part if the wanderer orginal code ^^

  for (int i=0; i<wanderer.length; i++)  // loop to creating 75 instances of class wanderer
  {
    wanderer[i] = new Wanderer(width/2, height/2); // Loop to create wanderer Objects with wanderer objects have x and y values at center of screen
    tweetText = tweets.getTweet(); //from orginal tweet code gets list of all retreived tweets for "ants"
    wanderer[i].setFinalTweet(tweetText.getText());// Resetting each ants final tweet
  }

  for (int m=0; m < leaf.length; m++) { // loop To create leaf objects of 200 of class Leaf
    leaf[m] = new Leaf(); 
  }
}

void draw()
{


  background(205,133,63);
  image(hill, width/2-50, height/2-50); // Sets image at center 
  for (int i=0; i < leaf.length; i++) { // Loop to place leaf on screen, or skip over if already eaten by a ant
    if (leaf[i].isEaten()) {            // Checking to see if leaf was eaten (ant ellispe shape collided with leaf image)
      leaf[i].reGrow();                 // Check to see if leaf timer has reached the point to replace the leaf on the screen
    } 
    else {
      leaf[i].placeLeaf();              // If leaf wasn;t eaten place on the screen
    }
  }


  for (int i=0; i<wanderer.length; i++)
  {
    wanderer[i].stayInsideCanvas(); // brabed from wanderer code
    wanderer[i].move();
    wanderer[i].drawWanderer();

    if (wanderer[i].isDead()) {  // loop for grabing tweet for dead wanderer 
      fill(0,255,0);
      textSize(14);  // text size of tweet
      text(wanderer[i].getFinalTweet(), wanderer[i].getX(), wanderer[i].getY());  // check to see if wanderer timer has acended it's maxiumu time, and if he is dea then diplay the final tweet at the x,y value of of ant
      fill(0);
    }

      // Loop to check to compare x and y value of the ant "wanderer" and the x and Y of the leaf image
      // LeafPos variable is an array with x and y values for the leaf
      // Camparison of Ant wanderer and leaf is based on size of the leaf image which is 20x20
      // When ant x and y are within the x and y sqaure of the 20 x20 leaf image (ant colliding with leaf) leaf is considered to be is eat and the 
      //   eatLeaf(); is called 
      // is fed function on ant"wanderer" resets the timer for how long the ant can move (live)
    for (int z=0; z < leaf.length; z++) {
      leafPos = leaf[z].getLeafPos();
      if ((wanderer[i].getX() >= leafPos[0]) &&  (wanderer[i].getY() >= leafPos[1]) &&  
        ((wanderer[i].getX() <= leafPos[0]+20) &&  (wanderer[i].getY() <= leafPos[1]+20))) {
        leaf[z].eatLeaf();
        wanderer[i].isFeed();
      }
    }
  }
}






class humanColony {    //Shamelessly copied and modified from http://blog.blprnt.com/blog/blprnt/updated-quick-tutorial-processing-twitter
  Twitter twitter;
  String searchString = "#ants";
  List<Status> tweets;
  ConfigurationBuilder cb;
  TwitterFactory tf;
  int currentTweet;

  humanColony()
  {
    //Credentials
    cb = new ConfigurationBuilder();
    cb.setOAuthConsumerKey("V6JCioUfyQASz6NUQL2YposS7");
    cb.setOAuthConsumerSecret("zATyzuAaRV07nk77hDNQAtdVB6RrGl43DsjfYSXZVghORli4Gk");
    cb.setOAuthAccessToken("2455231992-jLUnehTchtelBBL868Z4baFqBeOAuXq5n4uxtrS");
    cb.setOAuthAccessTokenSecret("mVkbVC4nZC37dtBIn8G4V2Pu3h8SpwgnYXksuifoVlXQ3");

    tf = new TwitterFactory(cb.build());

    twitter = tf.getInstance();

    getNewTweets();
    
    currentTweet = 0;

    //thread("refreshTweets");
  }

  Status getTweet()
  {
    currentTweet = currentTweet + 1;
    //println(currentTweet);
    if (currentTweet >= tweets.size())
    {
      getNewTweets();
      currentTweet = 0;
    }

    return(tweets.get(currentTweet));
  }

  void getNewTweets()
  {
    println("tweets retrieved");
    try 
    {
      Query query = new Query(searchString);
      query.setCount(500);
      QueryResult result = twitter.search(query);

      tweets = result.getTweets();
    } 
    catch (TwitterException te) 
    {
      System.out.println("Failed to search tweets: " + te.getMessage());
      System.exit(-1);
    }
  }

 public void refreshTweets()
  {
    while (true)
    {
      getNewTweets();

      println("Updated Tweets"); 

      delay(1000);
    }
  }
}


class Leaf {
  PImage leafPic;
  int positionX, positionY;
  int[] pos;
  int leafWidth, leafHeight;
  boolean leafIsEaten;
  int life;

  Leaf() {
    leafPic = loadImage("leaf2.gif");
    leafHeight = 20;
    leafHeight = 20;
    leafPic.resize(leafWidth, leafHeight);
    setPosition();
    pos = new int[2];
    leafIsEaten = false;
    life = 0;
    placeLeaf();
  }
  void setPosition() {
    positionX = int(random(width)); 
    positionY = int(random(height));
  }
  void placeLeaf() {

    image(leafPic, positionX, positionY);
  }

  int[] getLeafPos() {

    pos[0] = positionX;
    pos[1] = positionY;
    return(pos);
  }

  void eatLeaf() {

    leafIsEaten = true;   
    life = millis();
  } 

  boolean isEaten() {
    if (leafIsEaten) {
      return(true);
    } 
    else
      return(false);
  }

  void reGrow() {
    if (millis() > life + 10000) {
      leafIsEaten = false;
      life = 0;
      setPosition();
    }
  }
}

class Wanderer                  // Brownian motion shamelessly copied and modified from http://processing.org/discourse/beta/num_1238874012.html
{
  float x;
  float y;
  boolean first_time = true;
  float wander_theta;
  float wander_radius;
  int lifeEnergy;
  float lifeEnergyRestored;
  float eWidth, eHeight;
  String finalTweet;

  // bigger = more edgier, hectic
  float max_wander_offset = 0.3;
  // bigger = faster turns
  float max_wander_radius = 3.5;

  Wanderer(float _x, float _y)
  {
    x = _x;
    y = _y;
    lifeEnergy =5000;
    lifeEnergyRestored = 0;
    wander_theta = random(TWO_PI);
    wander_radius = random(max_wander_radius);
    eWidth = 4; 
    eHeight = 4;
   
  }

  void stayInsideCanvas()
  {
    x %= width;
    y %= height;
  }
  void drawWanderer(){
    
    ellipse(getX(), getY(), eWidth, eHeight);
  }
  void move()
  {
    float wander_offset = random(-max_wander_offset, max_wander_offset);
    wander_theta += wander_offset;
    lifeEnergy = lifeEnergy -2;
    if (lifeEnergy > 0) {
      x += cos(wander_theta);
      y += sin(wander_theta);
      if (x < 0  || y < 0) {
        x = width/2;
        y = height/2;
      }
    } 
  }

  float getX()
  {
    return x;
  }

  float getY()
  {
    return y;
  }

  boolean isDead(){
    if(lifeEnergy <= 0){
        return(true);
    } else {
      return(false);
    }
  }
  
  void isFeed() {
    lifeEnergy = 1000;
    lifeEnergyRestored = lifeEnergyRestored + 1;
    if(lifeEnergyRestored % 10 == 0){
      eWidth = eWidth +.02;
      eHeight = eHeight + .02;

    }
  }
  
  void setFinalTweet(String fTweet){
   finalTweet = fTweet; 
  }
  
  String getFinalTweet(){
   return(finalTweet); 
  }
}



