
PFont i; 
String url = "http://search.twitter.com/search.atom?q=trytoreadme&rpp=1";

void setup() {
  size(900, 200);
  smooth();
  frameRate (2);
  i = loadFont( "Istanbul-48.vlw" );
}

void draw() {
  background(255);
  textSize(random(4, 30));
  fill(0, random(0, 150));
  textAlign (CENTER);
  text (getTweet(), random(width), random(height));
}

String getTweet()
{
  XMLElement tweet = new XMLElement(this, url);
  XMLElement tmp = tweet.getChild("entry/title");
  return tmp.getContent();
}


