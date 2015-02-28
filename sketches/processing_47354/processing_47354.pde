
//Jennifer Lau
//Twitter Feed: Donald Duck


String url = "http://search.twitter.com/search.atom?q=donaldduck&rpp=1";


PFont univers;
PImage donald;
float prevMillis;
float thresh = 5000;




void setup() {
  size(350, 102);
  background (189,227,255);
  smooth();
  frameRate(1);
  univers = loadFont("UniversLTStd-48.vlw");
  textFont(univers);
  donald = loadImage("donald.jpg");
}

void draw() 
{
  image(donald, 0,0);
  fill(0,33,88);
  textSize(9); 
  text (getTweet(), width/2-60, height/2-20, 200, 80); 
}

String getTweet() {
  {
    XMLElement tweet = new XMLElement(this, url);
    XMLElement temp = tweet.getChild("entry/title");
    return temp.getContent();
  }
}


