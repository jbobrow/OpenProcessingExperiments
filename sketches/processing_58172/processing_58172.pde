
String searchTerm = "fml";
String url = "http://search.twitter.com/search.atom?q=" + searchTerm + "&rpp=1";
String theTweet;
PFont font;
float x;
XMLElement tweet;

void setup()
{
  size(500, 500);
  font = loadFont("Akkurat-16.vlw");
  frameRate(15);
  textFont(font);
  x = width;
  theTweet = getTweet();
}

void draw ()
{
  background(0);
  text(theTweet, x, 50);
  x = x - 5;
  
  float w = textWidth(theTweet);
  
  if (x < -w){
    x = width;
    theTweet = getTweet();

  }
}

String getTweet()
{
  XMLElement tweet = new XMLElement(this, url);
  XMLElement tmp = tweet.getChild("entry/title");
  
  String thisTweet = tmp.getContent();

return thisTweet;

}

