
/// twitter demo from jer thorp
/// http://blog.blprnt.com/blog/blprnt/quick-tutorial-twitter-processing

Twitter myTwitter;
ArrayList tweets;

PFont font;

float timescale = 0.05;

void setup() {
  
  size(400,400);
  
  font = createFont("Helvetica",24);
  myTwitter = new Twitter("mtchl ", "1tsm3ok");
  
  try {

    Query query = new Query("footy");
    
    query.setRpp(100); // set num results
    
    QueryResult result = myTwitter.search(query); // generate the result (run the search)

     tweets = (ArrayList) result.getTweets(); // get the tweets, put them in the tweets list
    println("got " + tweets.size() + " tweets");
    for (int i = 0; i < tweets.size(); i++) { // run through tweets list
      Tweet t = (Tweet) tweets.get(i); // get the tweet
      String user = t.getFromUser(); // get the user name
      String msg = t.getText(); // tweet text
      Date d = t.getCreatedAt(); // date 
      //println("Tweet by " + user + " at " + d + " : " + msg); // print it all
    };

  }
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  }
  
  //noLoop();
  smooth();
}

void draw() {
  background(255);
  Date now = new Date();
  long nowmillis = now.getTime(); // get the current time in millis since 1970
  
  for (int i=0; i<tweets.size(); i++){
    Tweet t = (Tweet) tweets.get(i); // get the tweet
    Date d = t.getCreatedAt(); // date 
    long tweetmillis = d.getTime(); // time in millis of this tweet
    // how long ago was this tweet?
    long timeinterval = nowmillis - tweetmillis;
    //println(int(timeinterval/1000) + " seconds ago");
    int secondsago = int(timeinterval)/1000;
    fill(0,100);
    float dotxpos = (width- 200) - (secondsago * timescale);
    int dotypos = 100 + (i*11);
    PVector mousevec = new PVector(mouseX,mouseY);
    PVector dotvec = new PVector(dotxpos,dotypos);
    if( mousevec.dist(dotvec) < 4 ) { // if we have a rollover
     
      fill(0);
      textFont(font,11);
      fill(255,0,0);
      text(t.getFromUser(), dotxpos, 20);
      fill(0);
      text(t.getText(), dotxpos, 30, 200,70);
      line(dotxpos,90,dotxpos,dotypos - 5);
       fill(255,0,0,100);
    }
    
   // ellipse( dotxpos, dotypos, 10,10);
   fill(dotxpos,0,100,100);
  //ellipse( dotxpos, dotypos,20,20);
  rect( dotxpos, dotypos,10,10);
  //ellipse( dotxpos, dotypos,50,dotypos/3);
  //fill(100,dotxpos);
  //arc(dotxpos, dotypos, 500,dotypos/2, TWO_PI, PI/2);
    
    
  }
  
}


