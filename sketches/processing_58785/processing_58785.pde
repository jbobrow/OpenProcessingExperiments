
PImage img;

import simpleML.*;

HTMLRequest r;
String html = "";

float startTime;

boolean gotnew = false;

int w = 552;
int h = 335;
int fps = 10;

float x = 10;
int interval = 10000;
float jump = w/(fps*interval/1000);

int nsize = 10;
int osize = 10;
int msize = 10;
int lsize = 10;
int hsize = 10;
int csize = 10;
int ssize = 10;

int NY = 0;
int Orlando = 0;
int Miami = 0;
int LV = 0;
int Hawaii = 0;
int Chicago = 0;
int SF = 0;


void setup() {
  size(552,335);
 

  frameRate(fps);

  r = new HTMLRequest(this,"http://www.expedia.com/Deals");
  r.makeRequest();
}

void draw() {
  noStroke();
  
  img = loadImage("USmap.gif");
  tint(255,255,255,20);
  image(img,0,0);
  smooth();

  float now = millis();


  if(now > startTime + interval) {
    r.makeRequest();
    startTime = now;
  }

  x+=jump;
  if (x >= width) x = 0;
  
 

  if(gotnew) {
    gotnew = false;

    NY = getMatchCount("New York", html);
    Orlando = getMatchCount("Orlando", html);
    Miami = getMatchCount("Miami", html);
    LV = getMatchCount("Las Vegas", html);
    Hawaii = getMatchCount("Hawaii", html);
    Chicago = getMatchCount("Chicago", html);
    SF = getMatchCount("San Francisco", html);
    println("NY: "+NY);
    println("Orlando: "+Orlando);
    println("Miami: "+Miami);
    println("LV: "+LV);
    println("Hawaii: "+Hawaii);
    println("Chicago: "+Chicago);
    println("SF: "+SF);

    NY = 5;
    Orlando = 5;
    Miami = 5;
    LV = 5;
    Hawaii = 5;
    Chicago = 5;
    SF = 5;
  }

  drawNY();
  drawOrlando();
  drawMiami();
  drawLV();
  drawHawaii();
  drawChicago();
  drawSF();

 stroke(200,20);
  strokeWeight(2);
  line(x,0,x,height);
}

void drawNY() {
  if(NY > 0) {
    rectMode(CENTER);
    noFill();
    stroke(102,32,0);
    ellipse(width/2.8+width/2,height/4,nsize,nsize);
    nsize+=10;
  }
  NY--;
}

void drawOrlando() {
  if(Orlando > 0) {
    rectMode(CENTER);
    noFill();
    stroke(102,32,0);
    ellipse(width/2.9+width/2.5,height/1.3,osize,osize);
    osize+=10;
  }
  Orlando--;
}

void drawMiami() {
  if(Miami > 0) {
    rectMode(CENTER);
    noFill();
    stroke(102,32,0);
    ellipse(width/2.9+width/2,height/1.1,msize,msize);
    msize+=10;
  }
  Miami--;
}

void drawLV() {
  if(LV > 0) {
    rectMode(CENTER);
    noFill();
    stroke(102,32,0);
    ellipse(width/6.5,height/2.2,lsize,lsize);
    lsize+=10;
  }
  LV--;
}

void drawHawaii() {
  if(Hawaii > 0) {
    rectMode(CENTER);
    noFill();
    stroke(102,32,0);
    ellipse(width/3.3,height/1.1,hsize,hsize);
    hsize+=10;
  }
  Hawaii--;
}

void drawChicago() {
  if(Chicago > 0) {
    rectMode(CENTER);
    noFill();
    stroke(102,32,0);
    ellipse(width/4+width/2.5,height/2.4,csize,csize);
    csize+=10;
  }
  Chicago--;
}

void drawSF() {
  if(SF > 0) {
    rectMode(CENTER);
    noFill();
    stroke(102,32,0);
    ellipse(width/26,height/3,ssize,ssize);
    ssize+=10;
  }
  SF--;
}

void netEvent(HTMLRequest r) {
  html = r.readRawSource();
  gotnew = true;
}

// a simple function to find how many times string 'find'
// occurs in string 's'.  copy and use!
int getMatchCount(String find, String s) {
  int m = s.split(find).length;
  return m - 1;
}


