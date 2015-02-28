
//Dan Pappas
 
//https://dev.twitter.com/docs/api/1/get/search
//http://search.twitter.com/search.atom?q=blue%20angels&rpp=5
String query = "sustainability";
String url = "http://search.twitter.com/search.atom?q="+query+"&rpp=1"; //rpp = returns per page
PFont akkurat;
void setup()
{
  size(960, 50);
  akkurat = loadFont("AkkuratLightPro-Regular-12.vlw");
  frameRate(1);
  textFont(akkurat);
}
 
void draw()
{
  background(71,123,190);
 
 text("THE CONVERSATION //", 10, 7, width-25, height-30);
  String twitreturn = getTweets();
  text(twitreturn, 10, 30, width-25, height-20);
}
 
String getTweets()
{
  String twitreturn;
  XMLElement tweet = new XMLElement(this, url);
  if (tweet != null)
    twitreturn = tweet.getChild("entry/title").getContent();
  else
    twitreturn = "";
 
  return twitreturn;
}


