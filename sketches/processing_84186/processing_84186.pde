
//get tomorrow date 
import netscape.javascript.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

Date date;
String today,tomorrow;
SimpleDateFormat sdf;
Calendar cal;
//
import twitter4j.*;
//
PImage coverImg;
PImage mapImg;
String myText = " ";//for name input
Boolean welcomename = true;

//Counter
int tweetcounter = 0;

PFont FONT;//Font for twitter
PFont Fontname;//font for name input

//Art words, get code from internet
float mx = 0, my = 0;
float stepSize = 5.0;

PFont font;
String letters = "Happy Birthday!";
int fontSizeMin = 3;
float angleDistortion = 0.0;

int counter = 0;

//store the tweet into my ArrayList
ArrayList alltweets = new ArrayList();


void setup() {
  size(600, 400);
  background(0);
  smooth();
  cursor(CROSS);
  
  //about art words
  mx = mouseX;
  my = mouseY;
    fill((int)random(0,255),(int)random(0,255),(int)random(0,255));
  font = createFont("ArnhemFineTT-Normal",10);
  textFont(font,fontSizeMin);
  textAlign(LEFT);

  //about input text
  fill(#D8D2FF, 255);
  textSize(20);
  //load the image
  coverImg = loadImage("cover.png");
  mapImg = loadImage("USAmap.png");
  
  //get dates
  cal = Calendar.getInstance();
sdf = new SimpleDateFormat("yyyy-MM-dd");
println("Today's date is "+sdf.format(cal.getTime()));
today = sdf.format(cal.getTime());
cal.add(Calendar.DATE, 1);
println("Tomorrow's date is"+sdf.format(cal.getTime()));
tomorrow = sdf.format(cal.getTime());

  //twitter query 
  for (int page =0; page<20;page++) {
    Twitter twitter = new TwitterFactory().getInstance();
    Query query = new Query("birthday");
    println(query);
    
        query.setSince(today);
    query.setUntil(tomorrow);

    query.setPage(page);
    query.setGeoCode(new GeoLocation(38, -95), 3600, Query.MILES);//(somewhere,searching area)
    query.setRpp(100);//search for XX tweet  

    int time = millis();
    try {
      QueryResult result = twitter.search(query);
      for (Tweet tweet : result.getTweets()) {
        tweetcounter++;
        GeoLocation g=tweet.getGeoLocation();
        if (g!=null) {//if there is a geo information
          double lat = g.getLatitude();
          double longit = g.getLongitude();
          String onetweet = tweet.getText(); 

          float latpos = ((float)longit+120)*15;
          float longitpos = (-(float)lat+50)*20;//transfer the geo location to map
          //test
          println( longit);
          println(lat);

          alltweets.add(new Dotdot(latpos, longitpos, onetweet));//put geo information and tweet into arraylist
        }
      }
    }

    catch(TwitterException e) {
      e.printStackTrace();
      println("Twitter exception");
    }
    println("Query took " + (millis() - time) + " millis.");
  }
}


//result dot
class Dotdot {
  int transparency =255;
  float latpos, longitpos;
  String onetweet;

  Dotdot(float x, float y, String twit) {
    this.latpos = x;
    this.longitpos = y;
    this.onetweet = twit;
  }

  //draw dot and text 
  void drawDots() {
    smooth();
    noStroke();

    fill(#FF3333, transparency-100);
    ellipse(this.latpos, this.longitpos, 15, 15);

    fill(#F0FF80, transparency);
    ellipse(this.latpos, this.longitpos, 10, 10);
  }

  void drawTexts() {
    fill(#FF6600);
    FONT = loadFont("AngsanaUPC-20.vlw");
    textFont(FONT, 20);
    text(this.onetweet, 45, 385);
  }
}


boolean mouseOver(float posX, float posY) {
  float centerX = posX;
  float centerY = posY;
  if (((centerX-5<= mouseX)&&(centerX+5>= mouseX))&&((centerY-5<= mouseY)&&(centerY+5>= mouseY))) {
    return true;
  }
  else return false;
}


void draw() {
  //initial picture  
  if (welcomename == true) {
    welcome();
  }
  else {
    happybirthday();
  }

  //search picture
  if ( mouseX>370 && mouseX <480 && mouseY > 235 && mouseY <260) {
    if (mousePressed == true) {
      happybirthday();
      welcomename = false;
    }
  }  
}

void mousePressed() {
  mx = mouseX;
  my = mouseY;
}

//code for searching
void happybirthday() {
background(0);
  image(mapImg, 0, 0);
  
  fill(#FFFF00);
    Fontname = loadFont("SegoePrint-20.vlw");
    textFont(Fontname,30);
  String btext = ("Happy Birthday!");
  text(btext, 30, 330);
  
  fill(#FF3333);
  Fontname = loadFont("Arial-BoldMT-15.vlw");
  textFont(Fontname, 15);
  String ResultText = ("Move your mouse to the dots to see the newest "+alltweets.size()+" tweets!");
  text(ResultText, 45, 360);

  ArrayList visibleDots = new ArrayList();
  for (int i= 0;i< alltweets.size();i++) {
    Dotdot d1 = (Dotdot)alltweets.get(i);
    if (d1.transparency > 0) {
      visibleDots.add(d1);
    }

    d1.drawDots();
    if (mouseOver(d1.latpos, d1.longitpos)) {
      d1.drawTexts();
    }
    else {
      d1.drawDots();
    }
  }
  alltweets = visibleDots;
  
      if (mousePressed) {
    float d = dist(mx,my, mouseX,mouseY);
    textFont(font,fontSizeMin+d/2);
    char newLetter = letters.charAt(counter);
    stepSize = textWidth(newLetter);

    if (d > stepSize) {
      float angle = atan2(mouseY-my, mouseX-mx); 

      pushMatrix();
      translate(mx, my);
      rotate(angle + random(angleDistortion));
          fill((int)random(0,255),(int)random(0,255),(int)random(0,255));
      text(newLetter, 0, 0);
      popMatrix();

      counter++;
      if (counter > letters.length()-1) counter = 0;

      mx = mx + cos(angle) * stepSize;
      my = my + sin(angle) * stepSize; 
    }
  }
}


// code for input text
void welcome() {
  image(coverImg, 0, 0);
  text(myText, 380, 189);
}
void keyPressed() {
  if (keyCode == BACKSPACE) {
    if (myText.length() > 0) {
      myText = myText.substring(0, myText.length()-1);
    }
  } 
  else if (keyCode == DELETE) {
    Fontname = loadFont("ArialMT-20.vlw");
    textFont(Fontname, 20);
    myText = "";
  } 
  else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
    Fontname = loadFont("ArialMT-20.vlw");
    textFont(Fontname, 20);
    myText = myText + key;
  }
}



