
import com.wyldco.romefeeder.*;
import com.sun.syndication.feed.synd.*;

TwitterFeeder feeder;  // the feeder
SyndEntry entry;       // a feed entry
int numTweets = 35;
float[] values = new float[numTweets];
String labelVal;
float plotX1, plotX2, plotY1, plotY2;
int leftMargin = 110;
int topMargin = 341;
int plotHeight = 80;
float timer = 0.0;
PFont helvetica;
ArrayList tweets;
PImage bkgnd;
float pX, pY;
int count = 0;

void setup() {
  size(960, 800, P2D);
  bkgnd = loadImage("bkgnd.png");
  smooth();
  helvetica = createFont("Helvetica-Bold", 14);
  textFont(helvetica);

  generateValues();

  // set plot size
  plotX1 = leftMargin;
  plotX2 = 306; //zswidth - leftMargin;
  plotY1 = topMargin;
  plotY2 = 400; //height - topMargin;

  ////////////twitter feed setup///////
  /////////////////////////////////////
  tweets = new ArrayList();
  tweets.add("Begin");
  //create the feeder
  feeder = new TwitterFeeder(this);

  //turn on output to the console (useful for debugging)
  feeder.verbose = true;

  //set sort by published date
  //default is unsorted (i.e. as ordered in the feed)
  feeder.sortByPublishedDate();

  //if you are exporting your sketch to an applet
  //set the proxy to bypass applet domain limitations
  //make sure you copy the proxy.php provided in the
  //data folder of example SimpleUrlFeed to your applet directory
  //feeder.setProxy("http://[urlToApplet]/DetailedTwitterFeed/applet/proxy.php");

  //set the update interval to check for new posts in the loaded feed(s)
  feeder.setUpdateInterval(60*1000); // milliseconds

  //start updating
  feeder.startUpdate();
  feeder.tag("edinburgh");  //get tweets with the word master
  //feeder.not("lol");  //exclude the tweets with the word thesis
  feeder.lang("en");     //get only tweets in english
  feeder.question(false); //get tweets that are questions
  feeder.rpp(numTweets);       //get 50 tweets at a time
  feeder.search();       //set search
  ////////////////END Twitter feed setup///////////////
  smooth();
}

void draw() {
  background(0);
  image(bkgnd, 0, 0);
  // draw plot bg
  fill(40, 192);
  noStroke();
  rectMode(CORNERS);
  //rect(plotX1, plotY1, plotX2, plotY2);

  //line(plotX1, height - topMargin, plotX2, height - topMargin);
  //line(plotX1, height - topMargin, plotX1, height - topMargin - plotHeight);

  noFill();
  stroke(255);
  strokeWeight(0.5); 
  //beginShape();

  float x, y;

  /*
  // double curve vertext points
   x = map(0, 0, values.length-1, plotX1, plotX2);
   y = map(values[0], 0, 200, height - topMargin, height - topMargin - plotHeight);
   curveVertex(x, y);
   */

  for (int i = 0; i < values.length; i++) {
    // function to check tweets and load them

    x = map(i, 0, values.length-1, plotX1, plotX2);
    y = map(values[i], 0, 200, 341, 400);
    stroke(84,114,122);
    fill(84, 114, 122);
    ellipse(x, y, 3, 3);
  }

  /*
  // double curve vertext points
   x = map(values.length-1, 0, values.length-1, plotX1, plotX2);
   y = map(values[values.length-1], 0, 200, height - topMargin, height - topMargin - plotHeight);
   curveVertex(x, y);
   */

  // endShape();

  // draw points on mouse over
  for (int i = 0; i < values.length; i++) {
    tweetFeedCheck();
    x = map(i, 0, values.length-1, plotX1, plotX2);
    y = map(values[i],  0, 200, 341, 400);
    // check mouse pos
    // float delta = dist(mouseX, mouseY, x, y);
    float deltaX = abs(mouseX - x);
    float deltaY = abs(mouseY - Y);

    if ((deltaX < 15) && (mouseX > x-2) && (mouseX < x+2) && (mouseY > y-2) && (mouseY < y+2) && (y > plotY1) && (y < plotY2)) {
      stroke(255);
      fill(172,202,209);
      ellipse(x, y, 3.5, 3.5);
      labelVal = ""+ tweets.get(i);

      Label label = new Label("" + labelVal, x, y);
    }
  }
}

void keyPressed() {
  generateValues();
}

void generateValues() {
  for (int i = 0; i < values.length; i++) {
    //values[i] = (int) random(200);
    values[i] = noise(timer) * 200;
    timer += 0.7;
  }

  // get min/max range
  plotX1 = leftMargin;
  plotX2 = 306;//width - plotX1;
}
void tweetFeedCheck() {
  //display the next entries
  while (feeder.hasNext ()) {
    //get the next entry
    entry = feeder.next();
    //println(counter);
    //println("\n" + entry.getTitle());
    tweets.add(entry.getTitle());
  }
}

class Label {

  Label(String txt, float x, float y) {

    //println(pX + "\t" + pY);
    String[] list = split(txt, '#');
    for (int i = 0; i <= list.length; i++) {
      if (list.equals("RT") == true) {
        println("NOT INCLUDED");
      }
      else {
        println(list);
      }
    }
    // get text width
    float labelW = textWidth(txt);
    // check if label would go beyond screen dims
    if (x + labelW + 20 > width) {
      x -= labelW + 20;
    }

    // draw bg
    fill(255);
    if (count == 1) {
      line(x, y, pX, pY);
    }
    noStroke();
    rectMode(CORNER); // note: this is the default mode. confusing b/c similar to CORNERS (plural)
    rect(x+10, y-30, labelW+10, 22);

    // draw text
    fill(0);
    text(txt, x+15, y-15);

    pX = x;
    pY = y;
    count = 1;
  }
}



