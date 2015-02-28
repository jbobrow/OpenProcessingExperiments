
Twitter myTwitter;

void setup() {
  myTwitter = new TwitterFactory().getInstance();
  

  size(500,300);
  frameRate(30);
  background(255);
  noStroke();
  smooth();
  textFont(createFont("SansSerif",11));
  textAlign(LEFT);
}

int count1;
int count2;


//input two search terms here
String racer1 = "justinbieber";
String racer2 = "tsunami";

void draw() {
  
  try { 
    Query query1 = new Query(racer1);
    QueryResult result1 = myTwitter.search(query1);
    ArrayList tweets1 = (ArrayList) result1.getTweets();
    for (int i = 0; i < tweets1.size(); i++) {
      Tweet t = (Tweet) tweets1.get(i);
      String msg = t.getText();
      String user = t.getFromUser();
      fill(255);
      rect(0,0,width,180);
      fill(0,0,240);
      text("#" +racer1  +"(" +user +")", 10, 20);
      //The following code is for the "Red Box"
      fill(0);
      text(msg,10,25,350,590);
      stroke(255,0,0);
      noFill();
      rect(250,50,175,50);
      rect(255,55,165,40);
      fill(255,0,0);
      text(racer1 + "/ vs/" + racer2, 265,75);
      noStroke();
      
      println (i);
      
    }
  }
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  }

  try { 
    Query query2 = new Query(racer2);
    QueryResult result2 = myTwitter.search(query2);
    ArrayList tweets2 = (ArrayList) result2.getTweets();
    for (int i = 0; i < tweets2.size(); i++) {
      Tweet t = (Tweet) tweets2.get(i);
      String msg = t.getText();
      String user = t.getFromUser();
      fill(255);
      rect(0,180,width,200);
      fill(0,0,240);
      text("#" +racer2 +"(" +user +")", 10, 200);
      fill(0);
      text(msg,10,205,350,590);
      
      /*
      noFill();
      stroke(255,0,0);
      ellipse(320,240,60,60);
      fill(255,0,0);
      text("~", 357, 240);
      noFill();
      ellipse(400,240,60,60);
      noStroke();
      */
      }
  }
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  }
}


