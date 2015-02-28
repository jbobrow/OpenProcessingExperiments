
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.effects.*;
 
Minim minim;
AudioOutput out;
SineWave sine;

float amp;


// This is where you enter your Oauth info
static String OAuthConsumerKey = "toLo80rXjZcBLnBxDi9tFA";
static String OAuthConsumerSecret = "tBbewbbB8e7dLMLQCgsh3Ajm9HNJWcGFn9RhRpJB0";

// This is where you enter your Access Token info
static String AccessToken = "633042393-CrlUTZZM3Gn6946rUYIEXPzDqfrMRYrxCUFiSlu1";
static String AccessTokenSecret = "z7tqoFkoJRsIl4sSitO2sVZtG8LHKzBWPNyQaQdfE";
//String containing the latest tweet
String latestTweet;
String latestViewerTweet;
String myTimeline;
java.util.List statuses = null;
//User[] friends;
Twitter twitter = new TwitterFactory().getInstance();
//RequestToken requestToken;
String[] theSearchTweets = new String[11];
//backround image scanned to generate background colour
public PImage colourSquare;


//public PImage writing;
//color array storing the pixel colour values of the colourSquare image
public color pixelColour[]; 

private int i = 0;
private int j = 0;
private int k = 0;

PFont font1;
//counter to test when the pixels get to the end of the screen to alternate the text
int textCounter = 0;
int wordCounter = 0;

public void setup() {

  connectTwitter();
  frameRate(60); 
  size(685, 385);
  //size(1920,1080);
  noStroke();
  loadColourSquare();
  getImagePixelColour();
  //  writing = loadImage("thebizzle500.png");
  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);

  sine = new SineWave(440, 1, out.sampleRate());

  out.addSignal(sine);
  //font1 = loadFont("AvenirLTStd-Heavy-70.vlw");
  font1 = loadFont("AvenirLTStd-Heavy-20.vlw");
  textFont(font1, 20);
  textAlign(CENTER, CENTER);
  getLatestTweet();
  getLatestViewerTweet();
}

public void draw() {
  
   if(mousePressed == false) {
    noCursor();
  } else {
    cursor(HAND);
  }

  // pan always changes smoothly to avoid crackles getting into the signal
  // note that we could call setPan on out, instead of on sine
  // this would sound the same, but the waveforms in out would not reflect the panning

  int porta = int(map(color(pixelColour[int(k)]), 0, -200000, 0, 10000));
  // set the portamento speed on the oscillator
  sine.portamento(porta);
  
  float freq = map(color(pixelColour[int(k)]), 0, -200000, 100, 160);
  //float freq = map(color(pixelColour[int(k)]), 0, -200000, 10, 60);
  sine.setFreq(freq);

  // pan always changes smoothly to avoid crackles getting into the signal
  // note that we could call setPan on out, instead of on sine
  // this would sound the same, but the waveforms in out would not reflect the panning
  float pan = map(color(pixelColour[int(k)]), 0, -200000, -1, 1);
  sine.setPan(pan);

  setBackgroundColour();
  
  alternateText();
  
  if(k % colourSquare.width == 0){
    getLatestViewerTweet();
    getLatestTweet();
    playSound();
  }

  //System.out.println(color(pixelColour[int(k)]));
  System.out.println("pixel number: " +k);
  System.out.println("text counter: " +textCounter);
  System.out.println("latest tweet: " +latestTweet);
  //System.out.println("back image width: " +colourSquare.width);
  //System.out.println ("\n Portamento= " + porta + "   Frequency= " + freq + "  Pan= " + pan);
}

void stop()
{
// always closes audio I/O classes
out.close();
// always stop your Minim object
minim.stop();

super.stop();
}

public void playSound(){
int porta = int(map(color(pixelColour[int(k)]), 0, -200000, 0, 100));
  // set the portamento speed on the oscillator
  sine.portamento(porta);
  
  float freq = map(color(pixelColour[int(k)]), 0, -200000, 160, 210);
  //float freq = map(color(pixelColour[int(k)]), 0, -200000, 10, 60);
  sine.setFreq(freq*0.25);

  // pan always changes smoothly to avoid crackles getting into the signal
  // note that we could call setPan on out, instead of on sine
  // this would sound the same, but the waveforms in out would not reflect the panning
  float pan = map(color(pixelColour[int(k)]), 0, -200000, -1, 1);
  sine.setPan(pan);
}

public void loadColourSquare() {

  colourSquare = loadImage("back_colour500.jpg");
  colourSquare.loadPixels();
  colourSquare.updatePixels();
}

public void getImagePixelColour() {

  pixelColour = new color[colourSquare.width * colourSquare.height];

  
    for (int yCol = 0; yCol < colourSquare.height; yCol++) { 
      if(yCol % 2 == 0){
        for (int xCol = 0; xCol < colourSquare.width; xCol++){
        i = (i+1) % pixelColour.length;
        pixelColour[i] = colourSquare.pixels[xCol+(yCol*colourSquare.width)];//get(xCol, yCol);
      }
      }
      else{
        for(int xCol = colourSquare.width-1; xCol >= 0; xCol--) {
        i = (i+1) % pixelColour.length;
        pixelColour[i] = colourSquare.pixels[xCol+(yCol*colourSquare.width)];//get(xCol, yCol);
        }
      }
    }
}

public void setBackgroundColour() {
  if (k < pixelColour.length){
  k++; // = k+1 % pixelColour.length;
  }
  if(k < pixelColour.length){
    background(pixelColour[k]);
  }
  else{
    background(0);
  }
  //image(writing, 0, 0);
}

public void alternateText(){
  
  if(k<30){
      fill(pixelColour[k]);
  }
      else{
        fill(pixelColour[k-29]);
  }
  
  if(k % colourSquare.width == 0){
    textCounter ++;
  }
    if(textCounter % 2 == 0){
      text("/AR/ /W//EE/ /B//E//T//UR/ /K//O//N//E//K//T//E//D/?", width*0.5, height*0.5);
      //text("" + latestViewerTweet, width*0.5, height*0.5);
  }
    else{
      text("" + latestTweet, width*0.5, height*0.5);
}
}

// Initial connection
void connectTwitter() {

  twitter.setOAuthConsumer(OAuthConsumerKey, OAuthConsumerSecret);
  AccessToken accessToken = loadAccessToken();
  twitter.setOAuthAccessToken(accessToken);

}

// Loading up the access token
private static AccessToken loadAccessToken(){
  return new AccessToken(AccessToken, AccessTokenSecret);
}

void getLatestTweet(){
  
 try {
    statuses = twitter.getUserTimeline(); 
  } catch(TwitterException e) { 
    println("Get timeline: " + e + " Status code: " + e.getStatusCode());
  }

    Status status = (Status)statuses.get(0);
    println(status.getUser().getName() + ": " + status.getText());
    latestTweet = "" + status.getText();
}

void getLatestViewerTweet(){
  try {
    Query query = new Query("@BETUR_KONEKTED");
    query.setRpp(1);
    QueryResult result = twitter.search(query);
    
    ArrayList tweets = (ArrayList) result.getTweets();
    
      Tweet t = (Tweet) tweets.get(0);
      String user = t.getFromUser();
      String msg = t.getText();
      Date d = t.getCreatedAt();
      println("Tweet by " + user + " at " + d + ": " + msg);
      
      latestViewerTweet = "" + t.getText();
  }
  catch (TwitterException te) {
      println("Couldn't connect: " + te);
  }
}



