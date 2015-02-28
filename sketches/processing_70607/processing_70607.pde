

/*
Access level	 Read-only 
About the application permission model
Consumer key	40S0VgMqjGOeVwWkNd04A
Consumer secret	OK17rTUHsLoKllzjqvVc0x2Ezublz8jtXOvcpIXXU


Access token	461694233-DjmXNUFkn9MBXWicjo5Yhe83cuJTx3ink9wQKnqU
Access token secret	bqNPnLv4aL0eDmEzqKlJcxesXqZL5awZMhO0Hh9H6Zs
Access level	Read-only
*/

ArrayList<String> words = new ArrayList();
ArrayList<String> mesgs = new ArrayList();

int q =0;
boolean receipt;

PImage lilb;

void setup(){

  size(900,550);
  background(0);
  smooth();
  
  lilb = loadImage("lilb.png");  
  //credentials
ConfigurationBuilder cb = new ConfigurationBuilder();
cb.setOAuthConsumerKey("40S0VgMqjGOeVwWkNd04A");
cb.setOAuthConsumerSecret("OK17rTUHsLoKllzjqvVc0x2Ezublz8jtXOvcpIXXU");
cb.setOAuthAccessToken("461694233-DjmXNUFkn9MBXWicjo5Yhe83cuJTx3ink9wQKnqU");
cb.setOAuthAccessTokenSecret("bqNPnLv4aL0eDmEzqKlJcxesXqZL5awZMhO0Hh9H6Zs");

Twitter twitter = new TwitterFactory(cb.build()).getInstance();
Query query = new Query("from:@LILBTHEBASEDGOD -video -RT love OR positive OR girls");
query.setRpp(100);


//try making the query request
try {
  QueryResult result = twitter.search(query);
  ArrayList tweets = (ArrayList) result.getTweets();
  
  for (int i = 0; i < tweets.size(); i++) {
    Tweet t = (Tweet) tweets.get(i);
    String msg = t.getText();
    Date d = t.getCreatedAt();
    
    mesgs.add(msg);
    
    println("BG Said " + msg + " at " + d);
    
  
    
    //Break the tweet into words
      String[] input = msg.split(" ");
      for (int j = 0;  j < input.length; j++) {
       //Put each word into the words ArrayList
       words.add(input[j]);
      }
  };
}
catch (TwitterException te) {
  println("couldn't connect: " + te);
};
}

void draw() {

   image(lilb,0,0); 
   int i = (frameCount % words.size());
  String word = words.get(i);
  
  int k = (mesgs.size());
  int r = int(random(k)); 
  String mesg = mesgs.get(r);
  
  if(receipt == true) {

    //draw the 'letter'
    fill(255);
    textSize(5);
   
    text(mesg,10,50);
    textSize(10);
    text(mesg,10,70);
    textSize(20);
    text(mesg,10,90);
    textSize(30);
    text(mesg,10,120);
    textSize(40);
    text(mesg,10,150);
    textSize(50);
    text(mesg,10,180);
    textSize(60);
    text(mesg,10,210);
    textSize(70);
    text(mesg,10,240);
    textSize(80);
    text(mesg,10,270);
    receipt = false;
    if(q == 11) {q = 1;};
  }
  
  //draw a black rectangle to fade
  fill(50,2);
  //rect(0,0,width,height);
  rect(0,0,width,height);
  
  //draw a word from the list of words

 
  
  //put it somewhere random
  fill(random(255),random(255),random(255),random(255));
  textSize(random(10,30));
  text(word, random(width), random(height));
  
  
  

  
}

void keyPressed()
{
  if(key == 'a') {
    receipt = true;
  }
}



