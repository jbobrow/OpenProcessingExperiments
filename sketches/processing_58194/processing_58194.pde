

//rpp = returns per page
String letters = "";
String q = "omg";

void setup()
{
  size(600, 300);

  frameRate(1);
  fill(5);
}
 
void draw()
{
  background(255);
 
  String tmp = getTweets();
  text(tmp, 50, 50, width-150, height-50);
 
  text(letters,400,200);
}
 
String getTweets()
{ 
  String query = q;
  String url = "http://search.twitter.com/search.atom?q="+query+"&rpp=1"; 
  
  String tmp;
  XMLElement tweet = new XMLElement(this, url);
  if (tweet != null)
    tmp = tweet.getChild("entry/title").getContent();
  else
    tmp = "";
 
  return tmp;
}

void keyPressed()
{
  if ((key == ENTER)||(key == RETURN)){
    letters = letters.toLowerCase();
    println(letters);
    
    q = letters;
   
    letters = "";
  }
  else if ((key > 31) && (key!= CODED)){
    letters =letters+key;
  }
}

