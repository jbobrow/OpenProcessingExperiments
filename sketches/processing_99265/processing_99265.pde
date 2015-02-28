

//Build an ArrayList to hold all of the words that we get from the imported tweets
ArrayList<String> words = new ArrayList();
  
  void setup() {
  
  //Set the size of the stage, and the background to black.
  size(1080,720);
  background(0);
  smooth();
  frameRate(20); // The framerate determines the speed at which the word appear, this is achieved in the draw method.
  
  
  
  //Credentials, these are the oAuth credentials needed to access twitter.
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("RYPWyLqzmNHXdd3h6HtbDw");
  cb.setOAuthConsumerSecret("yQSvUYA82w9lZRTiBozxlqWBwezz3RKVYUZplSYbFWk");
  cb.setOAuthAccessToken("182641532-88RvgyjQxTeWbtCshRHxoVj4xZm59ri1wqYWIptD");
  cb.setOAuthAccessTokenSecret("91x3acHVCl2kQfYyTBvzjCWpAM0cmlbzSMT2B1j5PIY");
 
  
  Twitter twitter = new TwitterFactory(cb.build()).getInstance(); //this makes the twitter object
  Query query = new Query("#creative"); //this prepares the search query, here you can enter a user,searchterm or a hashtag
  query.setCount(100); //set how many latest tweets it will display.
 
 
  //Try making the query request.
  try {
    QueryResult result = twitter.search(query);
    ArrayList tweets = (ArrayList) result.getTweets();
 
    for (int i = 0; i < tweets.size(); i++) {
      Status t = (Status) tweets.get(i);
      User u=(User) t.getUser(); 
String user=u.getName(); 
      String msg = t.getText();
      Date d = t.getCreatedAt();
      println("Tweet by " + user + " at " + d + ": " + msg);
       
      //once the tweet is received by the above code, it will be broken into words and stored in the arraylist
      String[] input = msg.split(" ");
      for (int j = 0;  j < input.length; j++) {
       //Put each word into the words ArrayList
       words.add(input[j]);
      }
    };
  }
  catch (TwitterException te) {            //should the search fail for any reason, this will catch the explanation and print it.
    println("Couldn't connect: " + te);
  };
}

void draw() {
  

  fill(0,5);
  rect(0,0,width,height); //this draws a faint black rectangle over the whole sketch, each time 'draw' cycles it will fade the words by drawing the black rectangle over them.
   
  //Draw a word from the list of words in the arraylist
  int i = (frameCount % words.size());
  String word = words.get(i);
  
  float xpos = random(width); //these are variables that will allow the sketch to draw ellipses beside the words, so the values are random but they get drawn together.
  float ypos = random(height); 
  float r = random(0,255);
  float g = random(0,255);
  float b = random(0,255);
  noStroke();
  fill(r,g,b,70);
  ellipseMode(CENTER );
  ellipse(xpos,ypos,50,50); //drawing ellipses
  fill(r,g,b); //changes the fill back to 0 opacity
  textSize(random(20,60));//random sized text
  text(word, xpos, ypos); //Put it somewhere random on the stage, with a random size and colour
 }
 

