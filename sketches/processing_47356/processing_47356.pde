
String[] getTweet = {
  //"http://search.twitter.com/search.atom?q=occupy&rpp=1"
  "BREAKING NEWS: A dangerous car chase in a suspected abduction came to an abrupt end yesterday when Ottawa police threw an officer’s bicycle under a stolen van, deflating one of the vehicle’s tires."
};
PFont font;
String url = "http://search.twitter.com/search.atom?q=occupy&rpp=1";
float x;
int index = 0;

void setup()
{
  size(800,200);
  frameRate(30);
  font = loadFont("TradeGothic-48.vlw");
  x = width;
}

void draw()
{
  background(0);
  fill(255);
  textFont(font, 14); 
  textAlign(LEFT);
  text( getTweet[index], x, 180 );
  x = x-3;
  
  float w = textWidth( getTweet[index] );
  if (x < -w) {
    x = width;
    index = (index + 1) % getTweet.length;
  }
    
}

String getTweet()
{
XMLElement tweet = new XMLElement( this, url); //asks for tweet
XMLElement tmp = tweet.getChild("entry/title"); //finds the content

String thisTweet = tmp.getContent(); //extract content

return tmp.getContent(); //return that
  
}

