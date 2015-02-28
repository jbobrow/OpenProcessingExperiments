
//Build an ArrayList to hold all of the words that we get from the imported tweets
ArrayList<String> words = new ArrayList();
 
void setup() {
  //Set the size of the stage, and the background to black.
  size(550,550);
  background(0);
  smooth();



ConfigurationBuilder cb = new ConfigurationBuilder();
cb.setOAuthConsumerKey("0fMAB7S3qTagnIxOR4CgA");
cb.setOAuthConsumerSecret("ObKAvM5fRmyWJ9Xs4kU96RHwh3XYOTjGR7YT2HLNM");
cb.setOAuthAccessToken("16603196-SV9gDYhrzDMCPhoJRZ9yNzLF53xFylUXSzEBX17Oj");
cb.setOAuthAccessTokenSecret("4okEb8FREzeVPqpxRWt5tRogwtcZr8HRZvRUK7c0qU");
 
//Make the twitter object and prepare the query
  Twitter twitter = new TwitterFactory(cb.build()).getInstance();
  Query query = new Query("@EhMattLee");
  query.setRpp(100);
 
  //Try making the query request.
  try {
    QueryResult result = twitter.search(query);
    ArrayList tweets = (ArrayList) result.getTweets();
 
    for (int i = 0; i < tweets.size(); i++) {
      Tweet t = (Tweet) tweets.get(i);
      String user = t.getFromUser();
      String msg = t.getText();
      Date d = t.getCreatedAt();
      println("Tweet by " + user + " at " + d + ": " + msg);
 
      //Break the tweet into words
      String[] input = msg.split(" ");
      for (int j = 0;  j < input.length; j++) {
       //Put each word into the words ArrayList
       words.add(input[j]);
      }
    };
  }
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  };
}
 
void draw() {
  //Draw a faint black rectangle over what is currently on the stage so it fades over time.
  fill(0,1);
  rect(0,0,width,height);
 
  //Draw a word from the list of words that we've built
  int i = (frameCount % words.size());
  String word = words.get(i);
 
  //Put it somewhere random on the stage, with a random size and colour
  fill(255,random(50,150));
  textSize(random(10,30));
  text(word, random(width), random(height));
}

