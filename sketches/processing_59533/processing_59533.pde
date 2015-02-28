
// PROCESSING FINAL
// INTERACTIVE 2
// Peter Santos
// Term 4
// Spring 2012
// Instructor: Michael Kontopolous

ArrayList windows = new ArrayList();
ArrayList tweets;
PImage bg;
PShape logo;
int thresh;
int prevMillis=0;
float t = 0;
int counter = 0;
int index = 0;
int index2 = 0;
int index3 = 0;
int numTweets = 20;
Twitter twitter;
QueryResult result;
Query query;

//Background and Search Arrays
String[] _bg = {
  "BG1.jpg", "BG2.jpg", "BG3.jpg", "BG4.jpg", "BG5.jpg"
};
String[] search = {
  "#HungerGames", "#21JumpStreet", "#AmericanReunion", "#Titanic3D", "#TheCabinInTheWoods"
};
String trend = search[0];

//global color array
color[] _eFill = { 
  #FF6905, #036CFC, #FC0324, #03FCC8, #A403FC
};
color eFill = _eFill[0]; 


void setup() {
  frame.setBackground(new java.awt.Color(0, 0, 0));
  size(1280, 720);
  bg = loadImage(_bg[0]);
  logo = loadShape("center_logo.svg");
  //timer speed
  thresh = 600;
  smooth();

  //Credentials
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("ZZ5LIqPsILV0BOBEt7jQ");
  cb.setOAuthConsumerSecret("MJtzP4SlUrLuqwwEymsorxwRmq8xDbGutxu31qlZWo");
  cb.setOAuthAccessToken("537409771-KeFoX35cxAFR60VriY7H1UZMCcCl7VIL2cUtKVWc");
  cb.setOAuthAccessTokenSecret("2QkVZ5LiQDJHwNKrNRQQxkJrVrCCL0onCoqJje3DkzU");

  //Twitter object and query
  twitter = new TwitterFactory(cb.build()).getInstance();


  //Try Request
  getTweets();
  TweetToWindow();
}

void draw() {
  background(bg);
  logo();

  for (int i=windows.size()-1; i>=0; i--)
  {
    Window w = (Window) windows.get(i);
    w.display(i);
    w.checkHover(i);
    w.update(i);
    if (w.isDead())
      windows.remove(i);
  }

  //TIMER
  if (millis() - prevMillis >= thresh)
  {
    TweetToWindow();
    counter++;
    if (counter>=tweets.size())
    {
      tweetUpdate();
      }
      prevMillis = millis();
  }
}

//Fill list with tweets
void getTweets()
{
  try {
    query = new Query(trend); // SEARCH
    query.setRpp(numTweets); // Results Per Page ( x )
    result = twitter.search(query);
    tweets = (ArrayList) result.getTweets();
    println("Hitting the Twitter API...");
  }
  catch (TwitterException te) {
    println("Counldn't Connect: " + te);
  }
}

//Tweet Update cycles through array
void tweetUpdate()
{
  println("Refreshing");
  index = index++ % search.length;
  index2 = index2++ % _eFill.length;
  index3 = index3++ % _bg.length;
  counter=0;
  trend = search[index++];
  eFill = _eFill[index2++];
  bg = loadImage (_bg[index3++]);
  getTweets();
}


//Transfer data to visuals
void TweetToWindow()
{
  println("Transfering " + counter + " out of " + tweets.size()); 
  Tweet t = (Tweet) tweets.get(counter);
  String profpic = t.getProfileImageUrl();
  String user = t.getFromUser();
  String msg = t.getText();
  Date d = t.getCreatedAt();
  String _d = d.toString();
  windows.add( new Window(user, msg, _d, profpic, eFill) );
}

void keyPressed()
{
  tweetUpdate();
}


