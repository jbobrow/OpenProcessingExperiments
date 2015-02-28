
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/47356*@* */
import twitter4j.*;
import twitter4j.conf.*;
import java.util.List;
import java.util.Date;

String screen_name = "cnnbrk"; // CNN breaking news
int cycle_size = 10; //how many tweets are cycled before refreshing (up to 20)
int distance = 30; //whitespace in pixels between tweets
StringList getTweet;
PFont font;
String url = "http://search.twitter.com/search.atom?q=occupy&rpp=1";
float x;
int index = 0;
int count = 0;
String tweet1 = "It seems you're not connected to the twitter API";
String tweet2 = "Sucks to be you, man";
boolean running = true;

void setup()
{
  size(500, 30);
  frameRate(30);
  font = loadFont("CourierNewPS-BoldItalicMT-48.vlw");
  x = width;
  //getTweet = new StringList();
}

StringList fetch() {
  StringList out;
  out = new StringList();
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setDebugEnabled(true)
    .setOAuthConsumerKey("insert consumer key here")
      .setOAuthConsumerSecret("insert consumer secret here")
        .setOAuthAccessToken("insert access token here")
          .setOAuthAccessTokenSecret("insert acces token secret here");
  TwitterFactory tf = new TwitterFactory(cb.build());
  Twitter twitter = tf.getInstance();
  try {
    List<Status> statuses = twitter.getUserTimeline(screen_name);
    for (Status status : statuses) {
      out.append(status.getText());
    }
  }
  catch (TwitterException te) {
    te.printStackTrace();
    System.out.println("Failed to get timeline: " + te.getMessage());
    System.exit(-1);
  }
  return out;
}

void draw() {

  background(250);
  fill(0);
  textFont(font, 14); 
  textAlign(LEFT);
  try {
    tweet1 = getTweet.get(index);
    tweet2 = getTweet.get((index+1)%cycle_size);
  }
  catch (NullPointerException foo) {
    getTweet = fetch();
  }
  float w = textWidth( tweet1 );
  text( tweet1, x, 20 );
  text( tweet2, x+w+distance, 20); 
  if (index == cycle_size) {
    fetch();
    index = 0;
  } 
  x = x-3;  

  if (x < -w) {
    x = distance;
    index = (index + 1) % getTweet.size();
  }
}



