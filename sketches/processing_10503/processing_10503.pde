
import processing.opengl.*;


Twitter myTwitter;

String twit;

void setup()
{
  size(800,600);
  background(50, 50 ,50 , 180);
  PFont f1;
  f1 = createFont("SeoulNamsanB",20);
  textFont(f1);
  smooth();
}
 
void draw()
{
  background(50, 50 , 50 , 180);
  noStroke();
  fill(0,0,0,150);
 
  myTwitter = new Twitter("yourTwitterUserName","yourTwitterPassword");
 
  try{
 
    Query query = new Query("서울&울역");
    query.setRpp((int)random(50));
    QueryResult result = myTwitter.search(query);
   
    ArrayList tweets = (ArrayList) result.getTweets();
   
    for (int i = 0; i < tweets.size(); i++){
      Tweet t = (Tweet) tweets.get(i);
      String usr = t.getFromUser();
      String msg = t.getText();
      Date d = t.getCreatedAt();
      String twit = "by" + usr + "date" + d + "-" + msg;
      printTweet(twit, 20, 20, (int)random(800), (int)random(600));
    }
   }

    catch(TwitterException te)
    {
      println("couldn't connect:" + te);
    }  
    delay(200);
}

void printTweet(String sentence, int wSize, int hPixelSize, int x, int y)
{
  int tweetLength = sentence.length();
  for (int i = 0; i < tweetLength; i = i + wSize)
  {
    int alter = i + wSize;
    if (alter > tweetLength) alter = tweetLength;
    String tweet = sentence.substring(i, alter);
    fill((int)random(255),(int)random(255),(int)random(255),20);
    ellipse(x+tweetLength/2, y, 100, 100);
    fill((int)random(255),(int)random(255),(int)random(255),(int)random(255));
    text(trim(tweet), x, y);
    y = y + hPixelSize;
  }
}

