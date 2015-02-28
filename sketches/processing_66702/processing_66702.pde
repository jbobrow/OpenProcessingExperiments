
//Build an ArrayList to hold all of the words that we get from the imported tweets
ArrayList<String> words = new ArrayList();
int lastCircle=0;
String happy= ":)";
String sad= ":(";
PShape h;
PFont font;
int count=150;

 
void setup() {
  //Set the size of the stage, and the background to black.
  size(600,600);
h = loadShape("happy.svg");
smooth();
shape(h, 200, 150, 180, 180);
        noStroke();
    fill(139,61,255);
    rect(0,400,600,400);
 //   background(204,230,255);
  smooth();

ConfigurationBuilder cb = new ConfigurationBuilder();
cb.setOAuthConsumerKey("x7m8yQSqG90UyNvG27Rfbg");
cb.setOAuthConsumerSecret("PBHYdDEjzgxRLYL8EtmSsXmbwIWC4aDKbMax3B4tz70");
cb.setOAuthAccessToken("528310621-xyDDYbTLDL2wIFbyDCfCtaXvianAQDpDQKlFEuUp");
cb.setOAuthAccessTokenSecret("1EbrL1vBqnCyZITfufclFRuh9BNQgRNkWiISJkLUHA");
  

  //Make the twitter object and prepare the query
  Twitter twitter = new TwitterFactory(cb.build()).getInstance();
  Query query1 = new Query("#Pony :)");
  Query query2 = new Query("#Pony :(");
  query1.setRpp(50);
  query2.setRpp(50);
  
  //Try making the query request.
  try {
    QueryResult result1 = twitter.search(query1);
    QueryResult result2 = twitter.search(query2);
    ArrayList tweets1 = (ArrayList) result1.getTweets();
    ArrayList tweets2 = (ArrayList) result2.getTweets();
 
    for (int i = 0; i < tweets1.size(); i++) {
      Tweet t1 = (Tweet) tweets1.get(i);
      String user1 = t1.getFromUser();
      String msg1 = t1.getText();
      Date d1 = t1.getCreatedAt();
      println("Tweet by " + user1 + " at " + d1 + ": " + msg1);
 
      //Break the tweet into words
     String[] input1 = msg1.split(",");
      for (int j = 0;  j < input1.length; j++) {
       //Put each word into the words ArrayList
       words.add(input1[j]);
      }
    };
    for (int i = 0; i < tweets2.size(); i++) {
      Tweet t2 = (Tweet) tweets2.get(i);
      String user2 = t2.getFromUser();
      String msg2 = t2.getText();
      Date d2 = t2.getCreatedAt();
      println("Tweet by " + user2 + " at " + d2 + ": " + msg2);
 
      //Break the tweet into words
     String[] input2 = msg2.split(",");
      for (int j = 0;  j < input2.length; j++) {
       //Put each word into the words ArrayList
       words.add(input2[j]);
      }
    };
  }
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  };
}
  
 
void draw() {
  lastCircle++;
if (lastCircle>100)
{


  //Draw a faint black rectangle over what is currently on the stage so it fades over time.

//fill(0,255);
 // rect(0,0,width,height);
 //image(myMovie,0,0);
  //Draw a word from the list of words that we've built
  int i = (frameCount % words.size());
  String word = words.get(i);
 
  //Put it somewhere random on the stage, with a random size and colour
  
  fill(225);
  textSize(20);
  font=loadFont("Baskerville-Italic-48.vlw");
  textFont(font,20);
  text(word, 20, 450,500,200);
  lastCircle=0;
  if( word.indexOf(happy)!= -1 ){
  // background(255,20,23);
  count=count+15;
  fill(91,240,165);
  textSize(20);
  font=loadFont("Baskerville-Italic-48.vlw");
  textFont(font,20);
  text(word, 20, 450,500,200);
smooth();
 rect(0,0,600,400);
shape(h, 200, 150, count, count);
//shape(s, 150, 10, 80, 80);
//rect(0,0,600,400);

}
  if( word.indexOf(sad)!= -1 ){
    count=count-20;
  // background(255,20,23);
  fill(240,91,118);
  textSize(20);
  font=loadFont("Baskerville-Italic-48.vlw");
  textFont(font,20);
  text(word, 20, 450,500,200);
smooth();
 rect(0,0,600,400);
shape(h, 200, 150, count, count);
//rect(0,0,600,400);
//shape(s, 150, 10, 80, 80);
}
   
}
//Here is one if-condition based on words used. in this case if olympics contained in text make background pink
if(lastCircle==99)
{   
smooth();
shape(h, 200, 150, count, count);
//shape(s, 150, 10, 80, 80);
        noStroke();
    fill(139,61,255);
    rect(0,400,600,400);
   }

}




