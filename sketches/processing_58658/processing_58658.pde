
import simpleML.*;

HTMLRequest a;
HTMLRequest b;
HTMLRequest c;

String htmla = "";
String htmlb = "";
String htmlc = "";

float startTime;

boolean gotnew = false;

int w = 500;
int h = 500;
int fps = 10;

float x = 0;
int interval = 10000;
float jump = w/(fps*interval/1000);

int ssize_a = 10;
int esize_a = 10;
int lsize_a = 10;
int ysize_a = 10;
int tsize_a = 10;
int bsize_a = 10;

int syria_a = 0;
int egypt_a = 0;
int libya_a = 0;
int yemen_a = 0;
int tunisia_a = 0;
int bahrain_a = 0; 

int ssize_b = 10;
int esize_b = 10;
int lsize_b = 10;
int ysize_b = 10;
int tsize_b = 10;
int bsize_b = 10;

int syria_b = 0;
int egypt_b = 0;
int libya_b = 0;
int yemen_b = 0;
int tunisia_b = 0;
int bahrain_b = 0;

int ssize_c = 10;
int esize_c = 10;
int lsize_c = 10;
int ysize_c = 10;
int tsize_c = 10;
int bsize_c = 10;

int syria_c = 0;
int egypt_c = 0;
int libya_c = 0;
int yemen_c = 0;
int tunisia_c = 0;
int bahrain_c = 0; 

PImage img;

void setup() {
  
  size(740,500);
  img = loadImage("arab-spring-map.jpg");
  smooth();
  frameRate(fps);
  a = new HTMLRequest(this, "http://www.aljazeera.com/news/middleeast/");
  a.makeRequest();
  b = new HTMLRequest(this, "http://www.cnn.com/MIDDLEEAST/?hpt=wo_bn8");
  b.makeRequest();
  c = new HTMLRequest(this, "http://www.bbc.co.uk/news/world/middle_east/");
  c.makeRequest();
}

void draw() {
  
  noStroke();
  fill(60,50);
  rectMode(CORNER);
  rect(0,0,740,500);
  tint(255,255,255,20);
  image(img, 0, 0);
  //background(loadImage("arab-spring-map.jpg"));
  
  float now = millis();
  
  if(now > startTime + interval) {
    a.makeRequest();
    b.makeRequest();
    c.makeRequest();
    startTime = now;
   
  }
  
  x+=jump;
  if(x >= width) x = 0;
  if(gotnew) {
    gotnew = false;
    
    syria_a = getMatchCount("Syria", htmla);
    egypt_a = getMatchCount("Egypt", htmla);
    libya_a = getMatchCount("Libya", htmla);
    yemen_a = getMatchCount("Yemen", htmla);
    tunisia_a = getMatchCount("Tunisia", htmla);
    bahrain_a = getMatchCount("Bahrain", htmla);
    println("Syria aljaz: "+syria_a);
    println("Egypt aljaz: "+egypt_a);
    println("Libya aljaz: "+libya_a);
    println("Yemen aljaz: "+yemen_a);
    println("Tunisia aljaz: "+tunisia_a);
    println("Bahrain aljaz: "+bahrain_a);
    
    syria_b = getMatchCount("Syria", htmlb);
    egypt_b = getMatchCount("Egypt", htmlb);
    libya_b = getMatchCount("Libya", htmlb);
    yemen_b = getMatchCount("Yemen", htmlb);
    tunisia_b = getMatchCount("Tunisia", htmlb);
    bahrain_b = getMatchCount("Bahrain", htmlb);
    println("Syria CNN: "+syria_b);
    println("Egypt CNN: "+egypt_b);
    println("Libya CNN: "+libya_b);
    println("Yemen CNN: "+yemen_b);
    println("Tunisia CNN: "+tunisia_b);
    println("Bahrain CNN: "+bahrain_b);
    
    syria_c = getMatchCount("Syria", htmlc);
    egypt_c = getMatchCount("Egypt", htmlc);
    libya_c = getMatchCount("Libya", htmlc);
    yemen_c = getMatchCount("Yemen", htmlc);
    tunisia_c = getMatchCount("Tunisia", htmlc);
    bahrain_c = getMatchCount("Bahrain", htmlc);
    println("Syria BBC: "+syria_c);
    println("Egypt BBC: "+egypt_c);
    println("Libya BBC: "+libya_c);
    println("Yemen BBC: "+yemen_c);
    println("Tunisia BBC: "+tunisia_c);
    println("Bahrain BBC: "+bahrain_c);
    
    
    ssize_a = 10;
    esize_a = 10;
    lsize_a = 10;
    ysize_a = 10;
    tsize_a = 10;
    bsize_a = 10; 
    
    ssize_b = 10;
    esize_b = 10;
    lsize_b = 10;
    ysize_b = 10;
    tsize_b = 10;
    bsize_b = 10;
   
    ssize_c = 10;
    esize_c = 10;
    lsize_c = 10;
    ysize_c = 10;
    tsize_c = 10;
    bsize_c = 10;  
  }

  

  drawSyria_a();
  drawEgypt_a();
  drawLibya_a();
  drawYemen_a();
  drawTunisia_a();
  drawBahrain_a();


  drawSyria_b();
  drawEgypt_b();
  drawLibya_b();
  drawYemen_b();
  drawTunisia_b();
  drawBahrain_b();


  drawSyria_c();
  drawEgypt_c();
  drawLibya_c();
  drawYemen_c();
  drawTunisia_c();
  drawBahrain_c();

  stroke(255,20);
  strokeWeight(2);
  line(x,0,x,height);
}

void drawSyria_a() {
  if(syria_a > 0) {
    rectMode(CENTER);
    noFill();
    stroke(236,143,22); //orange
    ellipse(width/1.35,height/7,ssize_a, ssize_a);
    ssize_a+=10;
  }
  syria_a--;
}

void drawSyria_b() {
  if(syria_b > 0) {
    rectMode(CENTER);
    noFill();
    stroke(236,22,22); //red
    ellipse(width/1.5,height/7,ssize_b, ssize_b);
    ssize_b+=10;
  }
  syria_b--;
}

void drawSyria_c() {
  if(syria_c > 0) {
    rectMode(CENTER);
    noFill();
    stroke(0,0,0); //black
    ellipse(width/1.4,height/8,ssize_c, ssize_c);
    ssize_c+=10;
  }
  syria_c--;
}


void drawEgypt_a() {
  if(egypt_a > 0) {
    rectMode(CENTER);
    noFill();
    stroke(236,143,22); //orange
    ellipse(width/3+width/4,height/4, esize_a, esize_a);
    esize_a+=10;
  }
  egypt_a--;
}

void drawEgypt_b() {
  if(egypt_b > 0) {
    rectMode(CENTER);
    noFill();
    stroke(236,22,22); //red
    ellipse(width/3+width/4,height/3, esize_b, esize_b);
    esize_b+=10;
  }
  egypt_b--;
}

void drawEgypt_c() {
  if(egypt_c > 0) {
    rectMode(CENTER);
    noFill();
    stroke(0, 0, 0); //black
    ellipse(width/3+width/3.5,height/3, esize_c, esize_c);
    esize_c+=10;
  }
  egypt_c--;
}

void drawLibya_a() {
  if(libya_a > 0) {
    rectMode(CENTER);
    noFill();
    stroke(236,143,22); //orange
    ellipse(width/3+width/11,height/3.5, lsize_a, lsize_a);
    lsize_a+=10;
  }
  libya_a--;
}

void drawLibya_b() {
  if(libya_b > 0) {
    rectMode(CENTER);
    noFill();
    stroke(236,22,22); //red
    ellipse(width/3+width/9,height/3.5, lsize_b, lsize_b);
    lsize_b+=10;
  }
  libya_b--;
}

void drawLibya_c() {
  if(libya_c > 0) {
    rectMode(CENTER);
    noFill();
    stroke(0, 0, 0); //black
    ellipse(width/3+width/7,height/3.5, lsize_c, lsize_c);
    lsize_c+=10;
  }
  libya_c--;
}

void drawYemen_a() {
  if(yemen_a > 0) {
    rectMode(CENTER);
    noFill();
    stroke(236,143,22); //orange
    ellipse(width/4+width/1.6,height/2, ysize_a, ysize_a);
    ysize_a+=10;
  }
  yemen_a--;
}

void drawYemen_b() {
  if(yemen_b > 0) {
    rectMode(CENTER);
    noFill();
    stroke(236,22,22); //red
    ellipse(width/4+width/1.7,height/2, ysize_b, ysize_b);
    ysize_b+=10;
  }
  yemen_b--;
}

void drawYemen_c() {
  if(yemen_c > 0) {
    rectMode(CENTER);
    noFill();
    stroke(0, 0, 0); //black
    ellipse(width/4+width/1.8,height/2, ysize_c, ysize_c);
    ysize_c+=10;
  }
  yemen_c--;
}

void drawTunisia_a() {
  if(tunisia_a > 0) {
    rectMode(CENTER);
    noFill();
    stroke(236,143,22); //orange
    ellipse(width/4+width/10,height/6, tsize_a, tsize_a);
    tsize_a+=10;
  }
  tunisia_a--;
}

void drawTunisia_b() {
  if(tunisia_b > 0) {
    rectMode(CENTER);
    noFill();
    stroke(236,22,22); //red 
    ellipse(width/4+width/10,height/6, tsize_b, tsize_b);
    tsize_b+=10;
  }
  tunisia_b--;
}

void drawTunisia_c() {
  if(tunisia_c > 0) {
    rectMode(CENTER);
    noFill();
    stroke(0, 0, 0); //black
    ellipse(width/4+width/10,height/6, tsize_c, tsize_c);
    tsize_c+=10;
  }
  tunisia_c--;
}

void drawBahrain_a() {
  if(bahrain_a > 0) {
    rectMode(CENTER);
    noFill();
    stroke(236,143,22); //orange
    ellipse(width/4+width/1.6,height/3, bsize_a, bsize_a);
    bsize_a+=10;
  }
  bahrain_a--;
}

void drawBahrain_b() {
  if(bahrain_b > 0) {
    rectMode(CENTER);
    noFill();
    stroke(236,22,22); //red
    ellipse(width/4+width/1.5,height/3, bsize_b, bsize_b);
    bsize_b+=10;
  }
  bahrain_b--;
}

void drawBahrain_c() {
  if(bahrain_c > 0) {
    rectMode(CENTER);
    noFill();
    stroke(0,  0, 0); //black
    ellipse(width/4+width/1.7,height/3, bsize_c, bsize_c);
    bsize_c+=10;
  }
  bahrain_c--;
}
void netEvent(HTMLRequest r) {
  htmla = a.readRawSource();
  htmlb = b.readRawSource();
  htmlc = c.readRawSource();
  gotnew = true;
}

int getMatchCount(String find, String s) {
  int m = s.split(find).length;
  return m - 1;
}


