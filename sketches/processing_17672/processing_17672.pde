
import twitter4j.conf.*;
import twitter4j.internal.async.*;
import twitter4j.internal.org.json.*;
import twitter4j.internal.logging.*;
import twitter4j.http.*;
import twitter4j.internal.util.*;
import twitter4j.api.*;
import twitter4j.util.*;
import twitter4j.internal.http.*;
import twitter4j.*;

//import twitter4j.org.json.*;
import twitter4j.*;
import twitter4j.http.*;
//import twitter4j.examples.*;
 
PFont font;
PFont font2;
 
int y[] = new int[3];
float target[] = new float[3];

//float timer = 200;
 
String[] LABEL = {
  "LOVE","HATE","SEX"
};
 
String searchTerms[] = {
  "love","hate",
  "sex"
};

String gt[] = new String[3];
String gf[] = new String[3];
String gn[] = new String[3];
 
color[] clr = {
  color(99,99,250),color(204,0,0),color(255,153,0)};
 
color bg = color(250,255,250);
 
int now;
int lastSecond;
String startTime;

PImage profile;
 
long lastId[] = new long[3];
 
boolean connected = true;
 
void setup(){
  size(1067,600);
  //size(800,450); //.75 size
  //size(533,300); //halfsize
  smooth();
  font = loadFont("TrebuchetMS-26.vlw");
  font2 = loadFont("TrebuchetMS-Italic-22.vlw");
 
  if (connected){
    Twitter twitter = new Twitter();
    for (int party = 0; party < 3; party++){
      try{
        Query query = new Query(searchTerms[party]);
        QueryResult result = (QueryResult) twitter.search(query);
 
        java.util.List tweets = result.getTweets();
        println(tweets.size());
        Tweet t = (Tweet) tweets.get(0);
        lastId[party] = t.getId();
        println(lastId[party]);
        gt[party] = t.getText();
        gf[party] = t.getFromUser();
        gn[party] = t.getProfileImageUrl();
       
      }
      catch (Exception e){
        System.out.println(e);
      }
    }
  }
 
  for (int i = 0; i < 3; i++){
    target[i]=height-12;
  }
 
  startTime = hour() + ":" + trim(nfs(minute(),2));
 
  textAlign(CENTER);
  //noStroke();
  background(255);
  //background(bg);
}
 
 
void draw(){
 
  now = second();
 
  background(bg);
  
  //timer = timer-50;
 
  int maximum = max(y[0],y[1],y[2]);
  int total = y[0]+y[1]+y[2];
 
  fill(0,200);
  textFont(font,26);
  fill(0,0,200);
  text("Love, Sex, and Hatred",width/2,height*.075);  //.075 replaces 45
  textFont(font2,22);
  String label = "Tweets between " + startTime + " and " + hour() + ":" + trim(nfs(minute(),2));
  text(label,width/2,height/8); // /8 replaces 75
 
  for (int i = 0; i < 3; i++){
    if (y[i]!=0) target[i] = 0.95*target[i]  + 0.05*map(y[i],0,maximum,height,height/3);
 
    stroke(clr[i]);
    strokeWeight(4);
    fill(255);
    rect(i*width/3+4,target[i],width/3-8,height-target[i]-4);
 
    fill(0,200);
    int percent = 0;
    if (total > 0) percent = int((100*y[i])/total);
    textFont(font,26);
    fill(200,0,0);
    text(LABEL[i], (2*i+1)*width/6,height-height*.13); //  .13 replaces 78
    textFont(font2,22);
    String display =  percent + "%\n"+ y[i] + " tweets";
    text(display, (2*i+1)*width/6,height-height*.076);  //.076 replaces 46
    fill(0,200);
    textFont(font2,20);
    text(gt[i] + 
    "               FROM: " + gf[i],(2*i+1)*width/6-(width*.14),height-height*.83,width*.215,height*.5); //width*.14 use to be 150, .83 replaces 500, .215 replaces 280, .5 replaces 300  
    //text("From: " + gf[i],(2*i+1)*width/6-40,height-215,80,200);
    profile = loadImage(gn[i], "png");
    profile.resize(width/6, height/4); // .25 replaces 150
    image(profile,(2*i+1)*width/6-width*.094,height-height*.467); //.094 replaces 100, .467 replaces 280
    
  }
 
  //every 3 seconds
  if (now!= lastSecond && now%3==0){
    //do a new twitter search since the last ID
    if (connected){
      Twitter twitter = new Twitter();
      for (int party = 0; party < 3; party++){
        try{
          Query query = new Query(searchTerms[party]);
          query.setSinceId(lastId[party]);
          QueryResult result = (QueryResult) twitter.search(query);
          java.util.List tweets = result.getTweets();
          //println(tweets.size());
          if (tweets.size()>0){
            Tweet t = (Tweet) tweets.get(0);
            lastId[party] = t.getId();
            gt[party] = t.getText();
            gf[party] = t.getFromUser();
            gn[party] = t.getProfileImageUrl();
            println(gt[party]);
            //println(lastId[party]);
            y[party]=min(height/6*height,y[party]+tweets.size());   // height/6 replaces 100
          }
        }
        catch (Exception e){
          System.out.println(e);
        }
      }
    }
    else{
      for (int i = 0; i < 3; i++){
        y[i]+= int(random(10));
      }
    }
  }
 
  lastSecond = now;
 
}



