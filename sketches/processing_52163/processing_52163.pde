
//Anastasios Lafazanis Π2007081,Petros Giorgolampros Π2007060
//Πολυμέσα 2011-2012


import net.obxlabs.romefeeder.*; //romefeeder
import com.sun.syndication.feed.synd.*; //ROME 

TwitterFeeder feeder;  // the feeder
boolean loaded = false; // flag that indicates if the search is loaded
int feedRate = 150; // rate for displaying posts (in miliseconds)
SyndEntry entry; // feed entry
PFont font; // the font
static final int TEXT_FONTSIZE =25;   //rest of text size
float x;
boolean last=false;
boolean sec=false;
boolean nextFlag=false;
int i=60000;
//search query
static final String QUERY = "@Petgio%20-mouni%20-arxidia%20-malakas%20-poutsa%20-malakies%20-mounara%20-kwlara%20-ksekoliara%20-poustis";
String topString = ""; //string of text that appears before 'self' in the tweet
String message = "What's on yourm ind?";
float r = 100;

void setup() {
  size(900, 450);
  background(0);
  frameRate(feedRate);
  smooth();
  
  //create and set the font
  font = createFont("Georgia.vlw", 12, true);
  textFont(font);
  //add a loading prompt
  textFont(font, 24);
  textAlign(CENTER);
  text("Loading Tweets...", width/2, height/2);
  
  //create the feeder
  feeder = new TwitterFeeder();

  //turn on output to the console (default == false)
  feeder.verbose = true;

  //load entries and sort them by published date
  //default is unsorted, same as feed order  
  feeder.sort(feeder.PUBLISHED_DATE);
  
  //set the proxy for applets' limitations
  //make sure you copy the proxy.php provided with romefeeder to
  //the applet directory
  //feeder.setProxy("http://[urlToApplet]/SelfTweet/applet/proxy.php");

  //set the feed load callback
  feeder.setLoadFeedCallback(
      new FeedCallback() { 
        public void event(SyndFeed feed)
        { 
        postLoadFeed(feed);
        } 
      }
  );

  //load the feed  
  feeder.search(QUERY);
  
  //set the update interval to check for new posts in the loaded feed(s)
  feeder.setUpdateInterval(60000);
  //start updating
  
}

//flag when the search is done loading
void postLoadFeed(SyndFeed feed) {
  //flag as loaded
  loaded = true;
}

void draw() {
  //if the search is not done loading then wait
  if (!loaded) return;
  
  //overlay with semi-transparent background to create the shadowy effect
  background(0);
  
  fill(100,100,255);
  textFont(font,45);
  text("BRISTOL",r*2+155,r*2+40);
  textFont(font,25);
  fill(100,255,100);
  text("CAFE",r*2+215,r*2-20);
  text("CORFU",r*2+205,r*2+80);
  // Start in the center and draw the circle
  translate(width/2, height/2);
  noFill();
  stroke(255);
  ellipse(0, 0, r*2, r*2);
  
  // We must keep track of our position along the curve
  float arclength = -40;
  textFont(font,40);
  // For every box
  for (int i = 0; i < message.length(); i ++ ) {
    
    // The character and its width
    char currentChar = message.charAt(i);
    // Instead of a constant width, we check the width of each character.
    float w = textWidth(currentChar); 
    // Each box is centered so we move half the width
    arclength += w/2;
    
    // Angle in radians is the arclength divided by the radius
    // Starting on the left side of the circle by adding PI
    float theta = PI + arclength / r;
    
    pushMatrix();
    
    // Polar to Cartesian conversion allows us to find the point along the curve. See Chapter 13 for a review of this concept.
    translate(r*cos(theta), r*sin(theta)); 
    // Rotate the box (rotation is offset by 90 degrees)
    rotate(theta + PI/2); 
    
    // Display the character
    fill(255);
    text(currentChar,0,0);
    
    popMatrix();
    
    // Move halfway again
    arclength += w/2;
  }

  //draw the tweet
  fill(255);
  stroke(0);
  textFont(font, TEXT_FONTSIZE);
  textAlign(LEFT, BOTTOM);
  text(topString, x-(width/2),height/2);
  x = x - 1;
  // If x is less than the negative width, then it is off the screen
  // textWidth() is used to calculate the width of the current String.
  float a = textWidth(topString); 
  if (x < -a) {
    x = width;
    if(sec){
      nextFlag=true;
      last=true;
    }
    sec=true;
    // index is incremented when the current String has left the screen in order to display a new String.
  }
  
  //if there is another entry in the feeder and
  //we waited long enough since the last displayed entry then
  //display the next entry
  if(!feeder.hasNext() && i>40000){
    feeder.startUpdate();
    i=0;
  }
  if(!feeder.hasNext()&&last){
    topString="**CAFE BRISTOL, What's on your mind? Tweet Us @Petgio **";
   }
  if (feeder.hasNext() && nextFlag) {
    //get the next entry
    entry = feeder.next();
    topString=entry.getTitle();
    nextFlag=false;
    sec=false;
    last=false;
  }
 i=i+1;
}



