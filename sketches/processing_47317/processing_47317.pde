
String url = "http://search.twitter.com/search.atom?q=omg&rpp=10";
XMLElement tweet;
PFont font;
PImage omg;




void setup()
{
  size(800, 400);
  smooth();
  frameRate(1);
  font = loadFont("UniversLTStd-Bold-48.vlw");
  textFont(font);
  omg = loadImage("omg.jpg");
}




void draw()
{
  image(omg, 0, 0);
  fill(0);
  textSize(20);
  textLeading(24);
  textAlign(CENTER);
  text(getTweet(), 100, 140, 600, 200);
  println(getTweet());
  delay(3000);
}




String getTweet()
{
  XMLElement tweet = new XMLElement(this, url);
  XMLElement tmp = tweet.getChild("entry/title");
  String thisTweet = tmp.getContent();
  return thisTweet.toUpperCase();
}


