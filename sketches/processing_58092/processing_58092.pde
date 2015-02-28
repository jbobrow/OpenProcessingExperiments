
  

import wordcram.*;
import wordcram.text.*;

WordCram wordCram;
   
   
 String mytweets="";
 
void setup() {
  size(800, 600);
  background(255);
  colorMode(HSB);
 frameRate(1); 
 
  
 // println(tweets.length);
  //println(mytweets);
  
   initWordCram();
   wordCram.drawAll();
}

void initWordCram() {
  
  
  
  
  mytweets="";
  
  XMLElement xml = new XMLElement(this, "https://api.twitter.com/statuses/public_timeline.atom");

 XMLElement[] tweets = xml.getChildren("entry/title");
 //  println(tweets.length);
  
  for (int i = 0; i < 15; i++) {
     mytweets+= mytweets+tweets[i].getContent();
  }
  
  wordCram = new WordCram(this)
  .fromTextString(mytweets)
      .withFont(createFont("MINYN___.TTF", 1))
      .sizedByWeight(10, 90)
      .withColors(color(0, 250, 200), color(30), color(170, 230, 200));


}

 void draw() {
 }
 
 
 void mouseClicked() {
  background(255);
  println("next");
  initWordCram();
   wordCram.drawAll();
}

 

