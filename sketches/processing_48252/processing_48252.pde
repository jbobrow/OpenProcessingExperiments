
//////////////////////////global variables//////////////////////////
XMLElement xml;
String url = "http://search.twitter.com/search.atom?q="+"love";
int[] twitCount;
int count=0;
int dotCount = 1;
int curSec, nextSec;
int tSize;
import processing.pdf.*;





//////////////////////////setup/////////////////////////////////////

void setup() {
  size(1000, 1000);
  smooth();
  background(0);
  colorMode(HSB);
  curSec=second();
  nextSec=curSec+1;
  beginRecord(PDF, "lines4.pdf");
}


//////////////////////////draw loop//////////////////////////

void draw() {

  //create new xml element populate with twitter query 
  xml = new XMLElement(this, url);
  XMLElement[] tweets = xml.getChildren("entry/title");

  //run through all the tweets
  for (int i=0; i<tweets.length; i++) {
    println(tweets[i].getContent());
    String msg = tweets[i].getContent();
    //look for all keywords sad in the tweets
    String[][] m = matchAll(msg, "love"); 
    //check lenght of the tweet
    tSize = msg.length();
    println("message length "+tSize);

    if (m!=null) {
      count = m.length;
    }
    println(count);
  }

  translate(width/2, height/2);
  stroke(0);
  strokeWeight(1);
  curSec=second();
  if (nextSec==curSec) {
    dotCount++;
    drawLines(tSize);
    nextSec=curSec+1;
  }

  if (nextSec>=60) {
    nextSec=0;
  }
  //  println(second());
}


/////////////////////////custom functions//////////////////////////




void drawLines (int lineL) {
  rotate(radians(dotCount));
  float randVal = curSec+random(20, 100);
  float randC = curSec+random(50, 85);
  stroke(randC, 200, 200);
  line(0, 0, lineL, lineL);
}  

void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}


