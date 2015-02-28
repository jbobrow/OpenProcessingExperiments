
import java.util.HashMap.*; //manually importing HashMap library from Java Docs

//Build an ArrayList to hold all of the words that we get from the imported tweets
HashMap<String, Integer> words;
String[] stoplist;

void setup() {
  //Set the size of the stage, and the background to black.
  size(550, 550);
  background(0);
  smooth();
  words= new HashMap<String, Integer>(); //when declaring new instance of a class.
  stoplist = loadStrings ("StopList.txt");


  //credentials
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("8b6XxZVlTYy4PFEWy1asAA");
  cb.setOAuthConsumerSecret("wS1iM5KwsgyBZgJK8Oz72eVe6ugHBhlQPc5jORrhQ");
  cb.setOAuthAccessToken("197740976-I7dP0g5h32cgAxvOXc2HrINfLL7oFFJm0CNuBgmI");
  cb.setOAuthAccessTokenSecret("bnsMZHwYMQ28WueSTYJtDS2yWR1bth4tiP97NrdpHBI");

  //Make the twitter object and prepare the query
  Twitter twitter = new TwitterFactory(cb.build()).getInstance();
  Query query = new Query("#ows");
  query.setRpp(100);

  //Try making the query request.
  try {
    QueryResult result = twitter.search(query);
    ArrayList tweets = (ArrayList) result.getTweets(); //gives me ArrayList of tweets

      for (int i = 0; i < tweets.size(); i++) {
      Tweet t = (Tweet) tweets.get(i); // get current one, iterating through tweets
      String user = t.getFromUser();
      String msg = t.getText();
      Date d = t.getCreatedAt();
      println("Tweet by " + user + " at " + d + ": " + msg);

      //Break the tweet into words
      String[] input = msg.split(" ");
      for (int j = 0;  j < input.length; j++) {
        //Put each word into the words ArrayList
        // if input[j] = input[j] -- if it finds a word that has already appeared in that array as it cycles through
        // tweetfreqvar = tfv+1
        // assuming tfv default = 0...
        // if tweetfreqvar ==5, (if it's in there 5 times or more, add it)
        //words.add(input[j]);
        if (!words.containsKey(input[j]) && !java.util.Arrays.asList(stoplist).contains(input[j])) {
          words.put(input[j], 1);
        }
        else if (words.containsKey(input[j])) {
          int count = words.get(input[j]);
          count++;
          words.put(input[j], count);
        }
      }
    };
  }
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  };
}

void draw() {
  int xPos=0;
  int yPos=50;
  //Draw a faint black rectangle over what is currently on the stage so it fades over time.
  fill(0, 1);
  rect(0, 0, width, height);

  //Draw a word from the list of words that we've built
  //    int i = (frameCount % words.size());
  //    String word = words.get(i);

  //Put it somewhere random on the stage, with a random size and colour
  Iterator i = words.entrySet().iterator();
  while (i.hasNext ()) {
    Map.Entry entry = (Map.Entry)i.next();

    String key = (String)entry.getKey();
    Integer value = (Integer)entry.getValue();

    float fontSize = map(value, 1, 100, 10, 150);
    fill(255, random(50, 150));
    textSize(fontSize);
    //if(fontSize>=50){
    text(key, xPos, yPos);
    xPos+=textWidth(key)+10;
    if (xPos+textWidth(key)>width) {
      xPos=0;
    yPos+=40;
    }
    //text(key, random(width), random(height));
  }
}


