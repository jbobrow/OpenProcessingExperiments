
/*M. Kontopoulos
 *Twitter Ticker Example
 *A simple HTML GET request to scrape a tweet in XML format
 *getTweets() performs the search and returns a String representation of the tweet.
 *This is done one fps. Rate limit is 150 tweets per hour. 
 */

//https://dev.twitter.com/docs/api/1/get/search
//http://search.twitter.com/search.atom?q=blue%20angels&rpp=5
String query = "Obama";
String url = "http://search.twitter.com/search.atom?q="+query+"&rpp=1"; //rpp = returns per page
PFont helv;
void setup()
{
  size(500, 300);
  helv = loadFont("Helvetica-20.vlw");
  frameRate(1);
  textFont(helv);
}

void draw()
{
  background(50);

  String tmp = getTweets();
  text(tmp, 50, 50, width-100, height-50);
}

String getTweets()
{
  String tmp;
  XMLElement tweet = new XMLElement(this, url);
  if (tweet != null)
    tmp = tweet.getChild("entry/title").getContent();
  else
    tmp = "";

  return tmp;
}


