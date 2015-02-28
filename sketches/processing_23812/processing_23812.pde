
PImage img;
String[] headlines = {
  "first floor",
  };
  
String[] headlines2 = {
  "second floor",
  };
  
String[] headlines3 = {
  "third floor",
  };
  
String[] headlines4 = {
  "fourth floor",
  };
  
String[] headlines5 = {
  "fifth floor",
  };
  
String[] headlines6 = {
  "sixth floor",
  };
  
String[] headlines7 = {
  "seventh floor",
  };
  
float offset;
PFont f;
float x; 
float y;
float c;
float b;
float s;
float d;
float e;
int index = 0;

void setup() {
  size(700,450);
  img = loadImage("DSC_0577.jpg");
  f = loadFont("LucidaSans-TypewriterBold-48.vlw");
}

void draw() {
  tint(255, 15);
  image(img, 0, 0);

  // Display headline at x  location
  textFont(f,200);
  fill(255,10,10,100);
  text(headlines[index],140,x); 
  
  textFont(f, 40);
  fill(0);
  text(headlines2[index],80,y); 
  
  textFont(f, 20);
  fill(0,10,10,100);
  text(headlines3[index],-5,c); 
  
  textFont(f, 90);
  fill(0,10,10,100);
  text(headlines4[index], 250,b); 
  
  textFont(f, 10);
  fill(255,10,10,100);
  text(headlines5[index], 300,s/10);
  
  textFont(f, 120);
  fill(255,10,10,100);
  text(headlines6[index], 500,d*.5);
  
  textFont(f, 10);
  fill(0);
  text(headlines7[index], -60,e/2);

  x = x - 9;
  y = y - 5;
  c = c - 15;
  b = b - 2;
  s = s - 50;
  d = d - 60;
  e = e - 5;

  float w = textWidth(headlines[index]);
  if (x < -w) {
    x = width; 
  }
  
  if (y < -w) {
    y = width; 
  }
  
   if (c < -w) {
    c = width; 
  }
  
  if (b < -w) {
    b = width; 
  }
  
   if (s < -w) {
    s = width; 
  }
  
  if (d < -w) {
    d = width; 
  }
  
  if (e < -w) {
    e = width; 
  }
}

