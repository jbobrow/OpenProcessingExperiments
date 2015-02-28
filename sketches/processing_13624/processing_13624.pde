
/// twitter demo from jer thorp
/// http://blog.blprnt.com/blog/blprnt/quick-tutorial-twitter-processing

Twitter myTwitter;
ArrayList tweets;

PFont font;

float timescale = 0.02;
int wavei = 0;
boolean[] isRollover;
Bubble bub;

int[] years; // integer array for storing birthdates
float[] dataArray;
int numberOfYears;

int startyear = 1996;
int leftmargin = 50;
int lefttextmarginoffset = 43;
int bottommargin = 80;
int bottomtextmarginoffset = 13;
int xinterval = 45;
int textoffset = 10;
int ticklength = 7;
int startvalue = 35000;
int topvalue = 80000;
int yinterval = 20;
int mostrightdotx = 705;

void setup() {
  loadData();
  size(800,600);
  font = createFont("Helvetica",24);
  myTwitter = new Twitter("vv115 ", "wangwei-");

  try {

    Query query = new Query("water saving");

    query.setRpp(100); // set num results

    QueryResult result = myTwitter.search(query); // generate the result (run the search)

    tweets = (ArrayList) result.getTweets(); // get the tweets, put them in the tweets list
    isRollover = new boolean[tweets.size()];
    println("got " + tweets.size() + " tweets");
    for (int i = 0; i < tweets.size(); i++) { // run through tweets list
      Tweet t = (Tweet) tweets.get(i); // get the tweet
      String user = t.getFromUser(); // get the user name
      String msg = t.getText(); // tweet text
      Date d = t.getCreatedAt(); // date
      isRollover[i] = false;
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
  background(120);
  fill(225);
  textFont(font,11);
  for (int y=startyear; y < 2010; y ++) { // year gridlines
    text(y,leftmargin + (y - startyear)*xinterval+textoffset, height-bottommargin+bottomtextmarginoffset);
    stroke(255);
    line(leftmargin + (y - startyear)*xinterval+textoffset*2.5, height-bottommargin,leftmargin + (y - startyear)*xinterval+textoffset*2.5, height-bottommargin-ticklength);
  }
  stroke(225);
  line(leftmargin,height-bottommargin, width-leftmargin, height-bottommargin);
  text("now",leftmargin + (2010 - startyear)*xinterval+textoffset, height-bottommargin+bottomtextmarginoffset);
  line(leftmargin + (2010 - startyear)*xinterval+textoffset*2.5, height-bottommargin,leftmargin + (2010 - startyear)*xinterval+textoffset*2.5, height-bottommargin-ticklength);
  text("Water consumption data (1996 - now)", width/2-100, height-45);
  text("Tweets messages (9 hours ago - now)", width/2-100-10, height-30);
  
  line(leftmargin,height-bottommargin, leftmargin, height-yinterval*23);
  for (int ht = startvalue; ht < topvalue; ht += 2500) { // height gridlines
    fill(225);
    text(ht,leftmargin-lefttextmarginoffset,height-bottommargin-bottomtextmarginoffset-(ht-startvalue)/2500*yinterval);
    stroke(225);
    line(leftmargin,height-bottommargin-(ht+2500-startvalue)/2500*yinterval,leftmargin+ticklength,height-bottommargin-(ht+2500-startvalue)/2500*yinterval);
  }
  
  Date now = new Date();
  long nowmillis = now.getTime(); // get the current time in millis since 1970
  for (int i=0; i<tweets.size(); i++) {
    
    Tweet t = (Tweet) tweets.get(i); // get the tweet
    Date d = t.getCreatedAt(); // date 
    long tweetmillis = d.getTime(); // time in millis of this tweet
    // how long ago was this tweet?
    long timeinterval = nowmillis - tweetmillis;
    //println(int(timeinterval/1000) + " seconds ago");
    int secondsago = int(timeinterval)/1000;
    fill(0,100);
    float dotxpos = mostrightdotx - (secondsago * timescale);
    if(dotxpos <= leftmargin) continue;
    int dotypos = floor(height-bottommargin-(dataArray[floor((dotxpos-leftmargin)/46)]+2500-startvalue)/2500*yinterval);
    PVector mousevec = new PVector(mouseX,mouseY);
    PVector dotvec = new PVector(dotxpos,dotypos);
    if( mousevec.dist(dotvec) < 5 ) { // if we have a rollover
      fill(255,0,0,100);
      if(isRollover[i]) {
        bub.drive();
        bub.display();
      } 
      else {
        bub = new Bubble(mouseX, mouseY-100,80,t.getFromUser(),t.getText());
        isRollover[i] = true;
      }
    } 
    else {
      isRollover[i] = false;
    }


    noStroke();
    fill(255);
    triangle(dotxpos-4,dotypos,dotxpos+5,dotypos,dotxpos,dotypos-10);
    ellipse( dotxpos, dotypos, 10,10);
  }
  
  fill(255);
  textFont(font,16);
  text("Water saving #Twitter", width-170,50);
  textFont(font,11);
  text("By Vanessa Wang (u3009755)",width-165,70);
  text("Data Visualisation and Design, University of Canberra", width - 280, 90);
  text("Water consumption @Canberra (ML)", leftmargin-lefttextmarginoffset, height-yinterval*26,80,200);

}

void loadData() {

  String[] data_in = loadStrings("watercon.csv"); 
  numberOfYears = data_in.length;
  years = new int[data_in.length];
  dataArray = new float[numberOfYears];

  // gives us a String array, one line per element

  for ( int i = 0; i < data_in.length; i++) { // start at 1 - skip the first row
    // split the data apart
    String line = data_in[i]; // this line of the data
    String[] bits = line.split(","); // split this line at the commas 
    years[i] = int(bits[0]);
    dataArray[i] = float(bits[1]);
  }
}


class Bubble { 
  color c;
  float xpos;
  float ypos;
  float xspeed = 0.0;
  float yspeed = 0.0;
  float radius;
  float growthrate = 3;
  boolean isGrown = false;
  String txt;
  String usr;
  float bubblesize;

  // The Constructor is defined with arguments.
  Bubble(float tempXpos, float tempYpos, float r, String user, String txt) { 
    c = color(222);
    xpos = tempXpos;
    ypos = tempYpos;
    radius = 2;
    bubblesize = r;
    this.txt = txt;
    usr = user;
  }

  void display() {
    noStroke();
    fill(c);
    ellipseMode(CENTER);
    float newr=(sqrt(2)+1)*radius;
    float rcx = xpos - newr;
    float rcy = ypos - newr;
    float lcx = xpos + newr;
    float lcy = ypos - newr;
    triangle(rcx,rcy,lcx,lcy,xpos,ypos);
    //arc(xpos-);
    //curve(xpos-radius/2,ypos-sqrt(3)*(radius/2),xpos-radius/4,ypos-((ypos-sqrt(3)*(radius/2))-(ypos-radius*1.7))/3*0.8,xpos-radius/4*3,ypos-((ypos-sqrt(3)*(radius/2))-(ypos-radius*1.7))/3*2*0.8,xpos,ypos-radius*1.7);
    //triangle(xpos-radius,ypos,xpos+radius,ypos,xpos,ypos-radius*2);
    ellipse(xpos,ypos,radius*2,radius*2);
    fill(120);
    arc(rcx,rcy,newr*2,newr*2,0-PI/16,PI/3);
    arc(lcx,lcy,newr*2,newr*2,PI-PI/4,PI+PI/16);
    float textboxwidth = radius*2*0.7;
    float textboxheight = radius*2*0.6;
    fill(0);
    textFont(font,11);
    fill(255,0,0);
    text(usr, xpos-textboxwidth/2+10, ypos-textboxheight/2-5);
    fill(0);
    text(txt, xpos-textboxwidth/2, ypos-textboxheight/2+5, textboxwidth,textboxheight);
  }

  void drive() {
    if(!isGrown) {
      //growthrate = origr*(1 - sq(radius)/sq(width/2));//(1 - sq(radius)/sq(width/2))/2;
      radius = radius + growthrate;
      if(radius>=bubblesize) {
        isGrown = true;
      }
    }
  }

}


