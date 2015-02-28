

String message = "I love you";

PImage myImage;
PFont f;
float r = 100;
float re = 0;

void setup () {
  colorMode(HSB);
  size (600,600);
  myImage = loadImage("heart.png");
  f = createFont("Georgia",40,true);
  textFont (f);
  smooth ();
}

void draw () {
  
  background (0);
  
  image (myImage,55,60);
  
  translate (width/2, height/2);
  noFill ();
  stroke (0);
 
  float arclength = 1;
  
  for (int i = 0; i < message.length (); i++) {
    char currentChar = message.charAt (i);
    float w = textWidth (currentChar);
    
    arclength += w/1;
    float theta = PI + arclength/r;
    
    pushMatrix ();
    translate (r*cos(theta),r*sin(theta));
    rotate (theta + PI/3);
    fill (re, 255, 255);
    text (currentChar,8,0);
    popMatrix ();
    arclength += w/1;
    re = (re+0.1)%255;
  }
}


