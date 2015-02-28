
// demo with two sources
//
import simpleML.*;

HTMLRequest source1;
HTMLRequest source2;

String htmlsource1 = "";
String htmlsource2 = "";

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
int osize1 = 5;
int rsize1 = 5;
int osize2 = 5;
int rsize2 = 5;
// how many obamas vs romneys are on the page?
int obamas_source1 = 0;
int obamas_source2 = 0;
int romneys_source1 = 0;
int romneys_source2 = 0;

// setup the basics
void setup() {
  size(500, 500);
  smooth();
  frameRate(fps);
  source1 = new HTMLRequest(this,"http://www.foxnews.com/politics/index.html");
  source2 = new HTMLRequest(this,"http://nytimes.com/pages/politics/index.html");
  source1.makeRequest();
  source2.makeRequest();
}

// draw it out
void draw() {
  
  
  noStroke();

  fill(60, 50);
  rectMode(CORNER);
  rect(0, 0, 500, 500);

  float now = millis();

  if (now > startTime + interval) {
    source1.makeRequest();
    source2.makeRequest();
    startTime = now;
  }

  x+=jump;
  if (x >= width) x = 0;

  if (gotnew) {
    
    gotnew = false;

    obamas_source1 = getMatchCount("Obama",htmlsource1);
    obamas_source2 = getMatchCount("Obama",htmlsource2);

    romneys_source1 = getMatchCount("Romney", htmlsource1);
    romneys_source2 = getMatchCount("Romney", htmlsource2);
    
    
    println("Obama Source 1: "+obamas_source1);
   
    println("Romney Source 1: "+romneys_source1);
    println("Obama Source 2: "+obamas_source2);
   
    println("Romney Source 2: "+romneys_source2);

    // reset our element size whenever we have new data to start
    // showing
    osize1 = 10;
    osize2 = 10;
    rsize1 = 10;
    rsize2 = 10;
  }

  // draw our representations (if appropriate)
  drawObamas1();
  drawObamas2();
  drawRomneys1();
  drawRomneys2();

  // draw the timer line
  stroke(255, 20);
  strokeWeight(2);
  line(x, 0, x, height);
}

// draw circles based on the # of romneys found
void drawObamas1() {
  if (obamas_source1 > 0) {
    rectMode(CENTER);
    noFill();
    //stroke(150,150,200);
    stroke(135, 206, 231);
    ellipse(width/4, height/4, osize1, osize1);
    osize1+=5;
  }
  obamas_source1--;
}

// draw circles based on the # of romneys found
void drawObamas2() {
  if (obamas_source2 > 0) {
    rectMode(CENTER);
    noFill();
    //stroke(150,150,200);
    stroke(135, 206, 231);
    ellipse(width/4, height/4+height/2, osize2, osize2);
    osize2+=5;
  }
  obamas_source2--;
}

// draw rects based on the # of romneys found
void drawRomneys1() {
  if (romneys_source1 > 0) {
    rectMode(CENTER);
    noFill();
    stroke(200, 150, 150);
    ellipse(width/4+width/2, height/4, rsize1, rsize1);
    rsize1+=5;
  }
  romneys_source1--;
}

void drawRomneys2() {
  if (romneys_source2 > 0) {
    rectMode(CENTER);
    noFill();
    stroke(200, 150, 150);
    ellipse(width/4+width/2, height/4+height/2, rsize2, rsize2);
    rsize2+=5;
  }
  romneys_source2--;
}

// netEvent() is kind of like mousePressed() in that it 
// gets called whenever a makeRequest() finishes.  so
// use it to drive your actions in response to returned
// HTML

// NOT PERFECT!  I need access to a name or some other identifier
// to know which HTMLRequest object called netEvent()
void netEvent(HTMLRequest r) {
  htmlsource1 = source1.readRawSource();
  htmlsource2 = source2.readRawSource();
  gotnew = true;
}

// a simple function to find how many times string 'find'
// occurs in string 's'.  copy and use!
int getMatchCount(String find, String s) {
  int m = s.split(find).length;
  return m - 1;
}



