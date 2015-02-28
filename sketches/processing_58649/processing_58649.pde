
import simpleML.*;
 PImage b;
 PFont font;
// our HTMLRequest object that we'll use to grab HTML data
HTMLRequest r;
//HTMLRequest ab;
//HTMLRequest cd;

 

String html = "";
float startTime;
boolean gotnew = false;
 

int w = 800;
int h = 370;
int fps = 10;
 

float x = 0;
int interval = 15000;
float jump = w/(fps*interval/1000);
 
// starting size for elements
int osize = 10;
int rsize = 10;
 
// how many obamas vs romneys are on the page?
int china = 0;
int iran = 0;
int korea = 0;
int libya = 0;
int merica = 0;
int af = 0;
int syria = 0;
int ger = 0;

// setup the basics
void setup() {
  size(800,370);
   b=loadImage("map.png");
    font = loadFont("Helvetica-48.vlw");
  background(b);
  smooth();
  frameRate(fps);
  
  //r = new HTMLRequest(this,"http://www.foxnews.com/world/index.html");
 // r = new HTMLRequest(this,"http://www.cnn.com/WORLD/");
  r = new HTMLRequest(this,"http://www.msnbc.msn.com/id/3032507/ns/world_news/");
  //r = new HTMLRequest(this,"http://news.yahoo.com/world/");
  r.makeRequest();
}
 
// draw it out
void draw() {
  noStroke();
 
 
  float now = millis();
   
 
  if(now > startTime + interval) {
      r.makeRequest();
      background(b);
      startTime = now;
    //  textFont(font,36);
      //text("Fox News", 5, 25);
  }
  // if(now > (startTime + (2*interval))) {
  //   cd.makeRequest();
   //  background(b);
   //  startTime = now;
 //    textFont(font, 36);
 //    text("MSNBC", 5, 25); 
  // }
  
   
  if(gotnew) {
    gotnew = false;
    //background(60);
 
   
    china = getMatchCount("China", html);
    iran = getMatchCount("Iran", html);
    korea = getMatchCount("Korea", html);
    libya = getMatchCount("Libya", html);
    merica = getMatchCount("U.S.", html);
    af = getMatchCount("Afghanistan", html);
    syria = getMatchCount("Syria", html);
    ger = getMatchCount("Germany", html);
    
    //println("Syria: "+syria);
    //println("China: "+china);
    //println("Iran: "+iran);
    //println("Korea: "+korea);
    //println("Libya: "+libya);
    //println("US: "+merica);
    //println("Afghan: "+af);
    //println("Germany: "+ger);
 
  
  }
 
  // draw our representations (if appropriate)
  drawChina();
  drawIran();
  drawKorea();
  drawLibya();
  drawUS();
  drawAf();
  drawSyria();
  drawGer();
 
}

void drawSyria(){
  if(syria > 0) {
    ellipseMode(CENTER);
    fill(0);
    ellipse(420,120,10,10);
  }
  syria=syria;
}

void drawAf(){
  if(af > 0){
    ellipseMode(CENTER);
    fill(0);
    ellipse(435,121,10,10);
  }
  af=af;
}
void drawUS(){
  if(merica > 0){
    ellipseMode(CENTER);
    fill(0);
    ellipse(100,100,15,15);
  }
  merica=merica;
}
 
 void drawLibya(){
   if(libya > 0){
     ellipseMode(CENTER);
     fill(0);
     ellipse(370,140,15,15);
   }
   libya=libya;
 }
 
// draw circles based on the # of romneys found
void drawChina() {
  if(china > 0) {
     ellipseMode(CENTER);
     fill(0);
     ellipse(575,120,25,25);
    
  }
  china=china;
}
 
// draw rects based on the # of romneys found
void drawIran() {
  if(iran > 0) {
 ellipseMode(CENTER);
 fill(0);
 ellipse(455,125,15,15);
  }
  iran=iran;
 
}

void drawKorea() {
 if(korea > 0) {
   ellipseMode(CENTER);
   fill(0);
   ellipse(615,110,10,10);
 }
 korea=korea;
}

 void drawGer() {
   if(ger > 0){
     ellipseMode(CENTER);
     fill(0);
     ellipse(350,75,15,15);
   }
}


void mousePressed() {
  
 float d = dist(615,110,mouseX,mouseY);
 if(d <= 10) {
   textFont(font, 24);
   text("North Korea "+korea, 400,20);
  
}  
 float bb = dist(455,125,mouseX,mouseY);
 if(bb <= 15) {
   textFont(font, 24);
   text("Iran "+iran, 400,40);
}

 float yy = dist(575,120,mouseX,mouseY);
 if(yy <= 25) {
   textFont(font, 24);
   text("China "+china, 500,40);
}
 float aa = dist(420,120,mouseX,mouseY);
 if(aa <= 10) {
   textFont(font, 24);
   text("Syria "+syria, 300,20);
}
 float cc = dist(435,121,mouseX,mouseY);
 if(cc <= 10) {
   textFont(font, 24);
   text("Afghanistan "+af, 240,40); 
}
 float dd = dist(100,100,mouseX,mouseY);
 if(dd <= 10) {
   textFont(font, 24);
   text("America "+merica, 170,20);
}
 float ee = dist(370,140,mouseX,mouseY);
 if(ee <= 15) {
   textFont(font, 24);
   text("Libya "+libya, 150,40);
}
float gg = dist(350,75,mouseX,mouseY);
if(gg <= 15) {
  textFont(font, 24);
  text("Germany "+ger, 650,20);
}

}

void netEvent(HTMLRequest r) {
  html = r.readRawSource();
  gotnew = true;
}
 
 
int getMatchCount(String find, String s) {
  int m = s.split(find).length;
  return m - 1;
}






