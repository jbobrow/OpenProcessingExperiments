
import twitter4j.*;
import twitter4j.http.*;
import processing.pdf.*;

boolean recording;
PGraphicsPDF pdf;

int gHeight = 60;
int x;
//Speed of scroll
int speed = 5;
//added space for xPos
int pW = 50;

PFont font;
PFont font2;

//Opacity for Shapes
int opacity = 200;
int y[] = new int[10];
float target[] = new float[10];

//float timer = 200;

String[] LABEL = {
  "HATE", "LIKE", "ANNOYED", "EXCITED", "UPSET", "IN LOVE", "STUPID", "NICE", "MEAN", "PROUD"
};

String searchTerms[] = {
  "hate", "like", "annoyed", "EXCITED", "upset", "in love", "stupid", "nice", "mean", "proud"
};

String gt[] = new String[10];
String gf[] = new String[10];
String gn[] = new String[10];

//X POS OF LABELS
int labelX[] = {90, 150, 90, 150, 90, 150, 90, 150, 90, 150};
//POS OF TRAINGLE POINTS
int xPos[] = {
  220+pW, 120+pW, 160+pW, 200+pW, 220+pW, 260+pW, 220+pW, 180+pW, 140+pW, 100+pW
};
/**int scrollHeight[] = {
  570, 560, 700, 700, 700, 700, 700
};**/
int tweetCount;




//color of box outline left to right  
color[] clr = {
  color(158,217,223, opacity), color(237,25,89, opacity), 
  color(246,235, 20, opacity), color(138,121,119, opacity), 
  color(61,20,77, opacity), color(61,20,77, opacity), 
  color(138,121,119, opacity), color(246,235, 20, opacity), 
  color(237,25,89, opacity), color(158,217,223, opacity), 
};



int now;
int lastSecond;
String startTime;

long lastId[] = new long[10];

boolean connected = true;

void setup() {
  //size (600, 1067);
  size(600, 825);
  //PDF
    pdf = (PGraphicsPDF) createGraphics(width, height, PDF, "TwitterEmotions.pdf");

  x = width;
 // b = loadImage("cbkg.png");
  smooth();
  font = loadFont("Establo-48.vlw");
  font2 = loadFont("Enigmatic-48.vlw");

  if (connected) {
    Twitter twitter = new Twitter();
    for (int party = 0; party < 10; party++) {
      try {
        Query query = new Query(searchTerms[party]);
        QueryResult result = (QueryResult) twitter.search(query);

        java.util.List tweets = result.getTweets();
        println(tweets.size());
        Tweet t = (Tweet) tweets.get(0);
        lastId[party] = t.getId();
        println(lastId[party]);
        gt[party] = t.getText();
        gf[party] = t.getFromUser();
      }
      catch (Exception e) {
        System.out.println(e);
      }
    }
  }

  for (int i = 0; i < 10; i++) {
    target[i]=height-90;
  }

  startTime = hour() + ":" + trim(nfs(minute(), 2));


  textAlign(CENTER);
}


void draw() {

 background(0);
 now = second();
 
 int maximum = max(y[0], y[1], y[2]);
 int total = y[0]+y[1]+y[2];

 textFont(font,30);
 fill(255,255,255,80);
 text("-", width-90, height*.1); 
 fill(255,255,255,80);
 text("+", width-150, height*.1);
 textAlign(LEFT);
 fill(255);
 textFont(font2, 30);
 text("TWITTER EMOTIONS", 10, 60);
 textFont(font2, 10);
 text("THE GOOD & THE BAD", 10, 80);
 

 
 textAlign(CENTER);
 textFont(font,30);
 fill(255);
 String label =startTime + " - " + hour() + ":" + trim(nfs(minute(), 2));
 text(label, width/2, height-40);




  for (int i = 0; i < 10; i++) {
    if (y[i]!=0) target[i] = 0.95*target[i]  + 0.05*map(y[i], 0, maximum, height, height/4);

//String count = "total tweets" + y[i];
//text(count, width/7, height/2);
  textAlign(CENTER);
  fill(255);
  textFont(font2, 10);
 // String display = "TOTAL  TWEETS   " + y[i];
 // text(display, (2*i+1)*width/2,height-20);
  String tweets = y[i]+"";
  text (tweets, xPos[i], target[i]-50 );
  
 
 textFont(font2, 12); 
   //COUNT TWEETS
 text("TOTAL TWEETS:", width/2, height -25);  
 textAlign(RIGHT); 
 text(tweetCount, width/2+20, height-10);
 noStroke();
 fill(0,0,0);
 rect(width/2+13, height-20, 20, 15);
 tweetCount++;
  


    fill(clr[i]);
    //strokeWeight(4);
    noStroke();


    beginShape();
    //vertex(300, target[i]);
    vertex(xPos[i], target[i]-50);
    vertex(0, height/2-gHeight);
    vertex(0, height/2-gHeight+90);
    endShape(CLOSE);
    
    fill(255);
   

    fill(0,0,0);
    ellipse(0 , height/2-15, 90,90);
    int percent = 0;
    if (total > 0) percent = int((100*y[i])/total);
    //textFont(font,26);
    fill(0, 0, 0);
    //changes position of the lables
     float x = 30;
  float y = 150;
 // textAlign(LEFT);
 
  stroke(100,100,100);
  strokeWeight(.5);
  line (width-120, height-65, width - 120, height-760);
  textAlign(CENTER);
  fill(250);
  textFont(font2,10); 
  text(LABEL[i],width-labelX[i],target[i]-50);
  

     
  }

  //every 3 seconds
  if (now!= lastSecond && now%3==0) {
    //do a new twitter search since the last ID
    if (connected) {
      Twitter twitter = new Twitter();
      for (int party = 0; party < 10; party++) {
        try {
          Query query = new Query(searchTerms[party]);
          query.setSinceId(lastId[party]);
          QueryResult result = (QueryResult) twitter.search(query);
          java.util.List tweets = result.getTweets();
          //println(tweets.size());
          if (tweets.size()>0) {
            Tweet t = (Tweet) tweets.get(0);
            //ALLOW TWEETS TO CHANGE
            lastId[party] = t.getId();
            gt[party] = t.getText();
            //ALLOWS USER TO CHANGE
            gf[party] = t.getFromUser();
            gn[party] = t.getProfileImageUrl();
            println(gt[party]);
            println(lastId[party]);
            y[party]=min(height/6*height, y[party]+tweets.size());   // height/6 replaces 100
          }
        }
        catch (Exception e) {
          System.out.println(e);
        }
      }
    }
    else {
      for (int i = 0; i < 3; i++) {
        y[i]+= int(random(10));
      }
    }
  }

  lastSecond = now;
}

void keyPressed() {
  if (key == 'r') {
    if (recording) {
      endRecord();
      println("Recording stopped.");
      recording = false;
    } 
    else {
      beginRecord(pdf);
      println("Recording started.");
      recording = true;
    }
  } 
  else if (key == 'q') {
    if (recording) {
      endRecord();
    }
    exit();
  }
}


