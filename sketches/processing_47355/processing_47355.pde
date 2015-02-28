
PFont font;
String url = "http://search.twitter.com/search.atom?q=occupy&rpp=1";

void setup()
{
  size(800,200);
  frameRate(1);
  font = loadFont("TradeGothic-48.vlw"); 
}

void draw()
{
  background(0);
  textFont(font, 14); 
  fill(255);
  text( getTweet(), 20, 20 );
  
}

String getTweet()
{
XMLElement tweet = new XMLElement( this, url); //asks for tweet
XMLElement tmp = tweet.getChild("entry/title"); //finds the content

String thisTweet = tmp.getContent(); //extract content

return tmp.getContent(); //return that
  
}

