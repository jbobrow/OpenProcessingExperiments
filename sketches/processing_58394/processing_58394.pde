
// Obama vs. Romney 
// Simple Demonstration App for ARTS444 Data Map Project
// by Ben Grosser, 2012


// easy library from Shiffman
// grab it from: http://www.shiffman.net/p5/simpleML/simpleML.zip
import simpleML.*;

// our HTMLRequest object that we'll use to grab HTML data
XMLRequest r;

// this will hold whatever the current HTML is from
// our source URL
String[] headlines;

// we'll use this for timing in draw()
float startTime;

// is the requested HTML data ready yet?
boolean gotnew = false;

// some basic settings
int w = 500;
int h = 500;
int fps = 10;

// for our timer line
float x = 0;
int interval = 10000;
float jump = w/(fps*interval/1000);

// starting size for elements
int osize = 10;
int rsize = 10;

// how many obamas vs romneys are on the page?
int obamas = 0;
int romneys = 0;

// setup the basics
void setup() {
  size(500,500);
  smooth();
  frameRate(fps);
  //r = new HTMLRequest(this,"http://www.washingtonpost.com/politics");
  //r = new HTMLRequest(this,"http://nytimes.com/pages/politics/index.html");
  //r = new HTMLRequest(this,"http://www.foxnews.com/politics/index.html");
  r = new XMLRequest(this,"http://www.nytimes.com/services/xml/rss/nyt/Politics.xml");
  r.makeRequest();
}

// draw it out
void draw() {
  noStroke();

  // make things fade
  fill(60,50);
  rectMode(CORNER);
  rect(0,0,500,500);

  // what time is it
  float now = millis();
  
  // every five seconds, check the website
  if(now > startTime + interval) {
      r.makeRequest();
      startTime = now;
  }
  
  // x is for our timer line.  it advances every frame by jump
  // unless we've reached the edge when it starts over
  x+=jump;
  if(x >= width) x = 0;
  
  // if we have new HTML data, set it up
  if(gotnew) {
    gotnew = false;
    //background(60);

    // use getMatchCount() (copy from below) to count instances of 
    // the first argument in the second (in our case, "Romney" or
    // "Obama" in the html we grabbed.  html is set in netEvent()
    obamas = getMatchCount("Romney", headlines);
    romneys = getMatchCount("Obama", headlines);
    
    println("Obama: "+obamas);
    println("Romney: "+romneys);

    // reset our element size whenever we have new data to start
    // showing
    osize = 10;
    rsize = 10;
  }

  // draw our representations (if appropriate)
  drawObamas();
  drawRomneys();

  // draw the timer line
  stroke(255,20);
  strokeWeight(2);
  line(x,0,x,height);
}

// draw circles based on the # of romneys found
void drawObamas() {
  if(obamas > 0) {
    rectMode(CENTER);
    noFill();
    //stroke(150,150,200);
    stroke(135,206,231);
    ellipse(width/4,height/2,osize,osize);
    osize+=10;
  }
  obamas--;
}

// draw rects based on the # of romneys found
void drawRomneys() {
  if(romneys > 0) {
    rectMode(CENTER);
    noFill();
    stroke(200,150,150);
    //rect(width/4+width/2,height/2,osize,osize);
    ellipse(width/4+width/2,height/2,rsize,rsize);
    rsize+=10;
  }
  romneys--;

}

// netEvent() is kind of like mousePressed() in that it 
// gets called whenever a makeRequest() finishes.  so
// use it to drive your actions in response to returned
// HTML
void netEvent(XMLRequest r) {
  headlines = r.getElementArray("title");
  for (int i = 0; i < headlines.length; i++) {
    println(headlines[i]);
  }
  gotnew = true;
}

// a simple function to find how many times string 'find'
// occurs in string 's'.  copy and use!
int getMatchCount(String find, String[] s) {
  int m = 0;
  int lastm = 0;
  for (int i = 0; i < headlines.length; i++) {
    
    m += s[i].split(find).length;
    if(lastm < m) m -= 1;
    lastm = m;
    //println(headlines[i]);
  }
  return m;
}

