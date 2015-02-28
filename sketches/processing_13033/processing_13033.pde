
import com.twitter.processing.*;


int totalTweets = 0;

String keyword1="cool";

String keyword2="lame";

// and this stores the text of the last tweet
String tweetText = "";


void setup() {
  size(1000,800);
  PFont font = loadFont("HelveticaNeue-48.vlw");
  textFont(font, 16);
  // set up twitter stream object
  TweetStream s = new TweetStream(this, "stream.twitter.com", 80, "1/statuses/filter.json?track=" + keyword1 + "," + keyword2, "zachtweeting", "publicpass");
  s.go();
  background(0);


}

void draw() {
  /*background(0); */

	//default, lets go blue
  fill(0, 0, 220);


//contains keyword 2, go red
  if (tweetText.indexOf(keyword2)!=-1)
  {
    fill(225, 0, 0);
  }


//conatins both! crazy, go green
  if ((tweetText.indexOf(keyword2)!=-1)&&(tweetText.indexOf(keyword1)!=-1))
  {
    fill(0, 2550, 0);
  }



  if (tweetText.length()>0)
  {
    text(tweetText, random(0,width-200), random(0,height));
    tweetText="";
    fill(0,0,0, 25);
    rect(0,0,width, height);
  }

}

void tweet(Status tweet) {

  tweetText = tweet.text();
  totalTweets += 1;
}

