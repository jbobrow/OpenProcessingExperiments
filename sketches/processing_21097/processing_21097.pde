
//SOPHIE MILTON
//Final Project

//The Twitter feed API code is from blog.blprnt.com



Twitter myTwitter;
//PFont fontA;

void setup() {
  /*
  size(800,800);
  background(0);
  smooth();
  noStroke();
  
  fill(255,8,214);
  fontA = loadFont("UniversLTStd-BoldCn.otf");
  textFont(fontA, 20);
  textAlign(LEFT, CENTER);
  */
  
  myTwitter = new Twitter("Sophie_Milton","soccergurl6625");
  
  try {
    Query query = new Query("sandwich");
    query.setRpp(100);
    QueryResult result = myTwitter.search(query);
    
    ArrayList tweets = (ArrayList) result.getTweets();
    
    for (int i = 0; i < tweets.size(); i++) {
      Tweet t = (Tweet) tweets.get(i);
      String user = t.getFromUser();
      String msg = t.getText();
      Date d = t.getCreatedAt();
      println("Tweet by " + user + " at " + d + ": " + msg);
    }
} catch(TwitterException te) {
    println("Couldn't connect: " + te);
  }
}



/*
void draw() {
 
  
}
*/

