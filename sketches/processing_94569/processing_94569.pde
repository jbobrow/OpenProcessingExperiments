
// -----------------------
// ----
// This is based on code by  @@@ Jer Thorp @@@
// From http://blog.blprnt.com/blog/blprnt/updated-quick-tutorial-processing-twitter
// Awesome!
// version 5 - trying to add GUI elements, based on 
// controlP5 GUI Library by @@@ Andreas Schlegel @@@, 2012. sojamo.de
// http://www.sojamo.de/libraries/controlP5/
// For positioning see (also @@@ Andreas Schlegel @@@) - 
// https://code.google.com/p/controlp5/source/browse/trunk/examples/controlP5button/controlP5button.pde?r=6
// ----
// -----------------------
//Build an ArrayList to hold all of the words that we get from the imported tweets
ArrayList<String> words = new ArrayList();

// define Twitter Developer keys (you need to register your app to get one of these
// Obviously these four variables are not real Twitter strings ones
//String twitOAuthConsumerKey="xxxxxxxxxxxxxxx";
//String twitOAuthConsumerSecret="yyyyyyyyyyyyyyyyyyyy";
//String twitOAuthAccessToken="zzzzzzzzzzzzzzzzzzzzzzzz";
//String twitOAuthAccessTokenSecret="wwwwwwwwwwwwwwwwwwwwwwwwww";
String tweetTextIntro = "Hive fortune reading for ";


import controlP5.*; // import the GUI library
//import twitterOAUTH.*;// import the twitter handshake keys
ControlP5 cp5; // creates a controller I think!
ControlFont font;
controlP5.Button b;
controlP5.Textfield tf;
controlP5.Textlabel tfAlert;

controlP5.Textlabel lb;

//  ------------- needed to stop Twitter overpolling from within sendTweet
float tweetTimer = 5000; // wait period (in milliseconds) after sending a tweet, before you can send the next one
float delayCheck; //delayCheck; // THIS IS IMPORTANT. it i what stops overpollin g of the Twitte API
//  ---------------

void setup() {
  //Set the size of the stage, and the background to black.
  size(550, 550);
  background(0);
  // now draw the admin panel

  //PFont font = createFont("arial",20);
  font = new ControlFont(createFont("arial", 100), 15);
  
  // ------------------
  noStroke();
  cp5 = new ControlP5(this); // adds in a control instance to add buttons and text field to



  noStroke();
  tf = cp5.addTextfield("Enter your twitter username");
  tf.setPosition(10, 475);
  // tf.setStringValue("@");
  tf.setSize(250, 25);
  tf.setFont(font);
  tf.setFocus(true);
  //tf.setAutoClear(true);
  tf.setColor(color(255, 255, 255));
  tf.setText ("@");
  tf.captionLabel().setControlFont(font);

  tfAlert = cp5.addTextlabel("please wait");
  tfAlert.setPosition(150, 400);
  tfAlert.setSize(250, 25);
  tfAlert.setFont(font);
 
  //tf.setAutoClear(true);
  tfAlert.setColor(color(255, 255, 255));
    tfAlert.getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
    
  tfAlert.setText ("Reading the twitter hive mind");
  
  //tfAlert.setVisible(false) 
  tfAlert.captionLabel().setControlFont(font);



  // create a new button with name 'Tell my Fortune'
  b = cp5.addButton("Press to tell your fortune", 20, 100, 50, 80, 20);
  b.setId(2);  // id to target this element
  b.setWidth(250); // width
  b.setHeight(25);
  b.setPosition(290, 475);

  b.captionLabel().setControlFont(font);
  b.captionLabel().style().marginLeft = 1;
  b.captionLabel().style().marginTop = 1;
  b.setVisible(true);
  b.isOn();


  //


  // -----------------

  smooth();
  // Now call tweeting action functions...
  grabTweets();
  println ("finished grabbing tweets");
  println ();
  }

void draw() {
  //Draw a faint black rectangle over what is currently on the stage so it fades over time.
  fill(0, 1);
  rect(0, 0, width, height);

  //Draw a word from the list of words that we've built
  int i = (frameCount % words.size());
  String word = words.get(i);

  //Put it somewhere random on the stage, with a random size and colour
  fill(255, random(50, 150));
  textSize(random(10, 30));
  text(word, random(width), random(height));
  color c1 = color(70, 130, 180);
  fill (c1);
  rect(0, 400, 550, 150);
  
  buttonCheck(tweetTextIntro);
}

void sendTweet(String tweetText) {

  ConfigurationBuilder cb2 = new ConfigurationBuilder();
  // ------- NB - the variables twitOAuthConsumerKey, etc. need to be in a 
  // seperate 
  cb2.setOAuthConsumerKey(twitOAuthConsumerKey);
  cb2.setOAuthConsumerSecret(twitOAuthConsumerSecret);
  cb2.setOAuthAccessToken(twitOAuthAccessToken);
  cb2.setOAuthAccessTokenSecret(twitOAuthAccessTokenSecret);

  Twitter twitter2 = new TwitterFactory(cb2.build()).getInstance();

  try {
    Status status = twitter2.updateStatus(tweetText);
    println("Successfully updated the status to [" + status.getText() + "].");
  } 
  catch(TwitterException e) { 
    println("Send tweet: " + e + " Status code: " + e.getStatusCode());
  } // end try
}

void grabTweets() {
  //Credentials
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("rAh2PMw62GS4IjEDEwjOQ");
  cb.setOAuthConsumerSecret("50cxYksunoXqetscUTwBSNxK3W5dMdLqTehw41wEOs");
  cb.setOAuthAccessToken("1300752990-QXSQbtrGCAYU2vN5fcd26Vbn6mPPhzCvcX5x5VV");
  cb.setOAuthAccessTokenSecret("pau6x4FBX2mnnfpzI0iY19vFK86I6ZtyEGertXgYzak");

  //Make the twitter object and prepare the query
  Twitter twitter = new TwitterFactory(cb.build()).getInstance();
  Query query = new Query("@museumnext");
  query.setRpp(100);
  // The factory instance is re-useable and thread safe.

  //Try making the query request.
  try {
    QueryResult result = twitter.search(query);
    ArrayList tweets = (ArrayList) result.getTweets();

    for (int i = 0; i < tweets.size(); i++) {
      Tweet t = (Tweet) tweets.get(i);
      String user = t.getFromUser();
      String msg = t.getText();
      Date d = t.getCreatedAt();
      println("Tweet by " + user + " at " + d + ": " + msg);

      //Break the tweet into words
      String[] input = msg.split(" ");
      for (int j = 0;  j < input.length; j++) {
        //Put each word into the words ArrayList
        words.add(input[j]);
      }
    };
  }
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  };
}

void buttonCheck(String tweetTextIntro)
{
  String tfTextCurrent=tf.getText() ;
  float timerB=millis();  // reset the timer

  if (b.isPressed())
  {
    if (timerB-delayCheck>=tweetTimer)
    {
      delayCheck=millis();
      
      println("button being pressed");
      println("tfTextCurrent = "+ tfTextCurrent);
      String fortune = tweetTextIntro + tfTextCurrent+" username is user entered in form field!";
      sendTweet(fortune);
      println("button-pressed over");

      // CALL A FUNCTION FOR BUTTON ACTIONS HERE. 
      // NB - THIS CANNOT BE CALLED AGAIN UNTIL AFTER 
      b.setWidth (50);
    }
  }
  else {// button is no longer pressed
    if (timerB-delayCheck>=tweetTimer) {
      //println("LESS THAN: pressed at = "+(timerB-delayCheck));
      b.setWidth (250);
    } 
    //println("button NOT being pressed:  = "+(timerB-delayCheck));
  }
}


