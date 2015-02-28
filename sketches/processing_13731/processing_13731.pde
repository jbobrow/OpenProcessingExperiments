
import com.twitter.processing.*;

int maxtweets= 300;
int totalTweets = 0;

String keyword1="blue";
String keyword2="red";

color c2= #F23D3D;
color c1= #3F3DF2;

//filterA = new zFilter("blue", 234234);

float frames;

int speed =2;

ZTweet[] mytweets= new ZTweet[maxtweets];


// and this stores the text of the last tweet



void setup() {
  size(800,400);
  PFont font = loadFont("HelveticaNeue-16.vlw");
  textFont(font, 16);
  // set up twitter stream object
  TweetStream s = new TweetStream(this, "stream.twitter.com", 80, "1/statuses/filter.json?track=" + keyword1 + "," + keyword2, "zachtweeting", "publicpass");
  s.go();
  background(0);
  frames=0;
noStroke();


}

void draw() {
  background(232,232,232); 
  frames++;

  for (int i = 0; i<totalTweets; i++){
 
    mytweets[i].display();
    
    rect(i*2+20, 20, 2, 40);
 
 }

}


void tweet(Status tweet) {
  ZTweet x= new ZTweet (tweet.text());
  mytweets[totalTweets]= x;
  totalTweets += 1;
  
  if (totalTweets>=maxtweets)
  {totalTweets=0;  }
  
}






