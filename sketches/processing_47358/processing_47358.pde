
PFont i;  
String url = "http://search.twitter.com/search.atom?q=tummy&rpp=1";

void setup() {
  size(900,100);
  smooth();
  frameRate (1);
  i = loadFont( "Istanbul-48.vlw" ); 
} 

void draw() {
  background(0);
  textFont(i,12); 
  fill(0,255,30);
  textAlign (CENTER);
  text (getTweet(), width/2+1, height/2); 

}

String getTweet()
{
XMLElement tweet = new XMLElement(this, url);
XMLElement tmp = tweet.getChild("entry/title");
return tmp.getContent();
}


