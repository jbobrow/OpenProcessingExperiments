
/**
 * Based on Load Sample by Damien Di Fede.
 */

import ddf.minim.*;
float x;
float R = 255;
float G = 255;
float B = 0;
float incremento = +1;
float mincol = 0, maxcol = 255;
PImage b;

Minim minim;
AudioPlayer longSound;

int RECT_WIDTH = 400;
int RECT_OFFSET = 50;
float normalizedPosition;
int newPosition;
int soundLength;
int playHeadPos;


void setup()
{
  size(800, 600, P2D);
  minim = new Minim(this);
  longSound = minim.loadFile("choose.mp3", 2048);
  
  textMode(SCREEN);
  textFont(createFont("SanSerif", 12));
  x=100;
  background(0);
   b = loadImage("dance.gif");
image(b, 0, 0);
  

}

void draw()
{
  smooth();
  fill(mouseX,mouseY,mouseX);
  rect(700,500, 100,100);
  fill(mouseY,mouseX,mouseY);
  rect(700,400, 100,100);
  fill(mouseY,mouseY,mouseX);
  rect(700,300, 100,100);
  fill(mouseX,mouseY,mouseY);
  rect(700,200, 100,100);
  fill(mouseX,mouseX,mouseY);
  rect(700,100, 100,100);
  fill(mouseY,mouseX,mouseX);
  rect(700,000, 100,100);
  
 
  longSound.play();
  fill(R,mouseY,mouseX);
   rotate(x/10);
  ellipse(x,250, 100, 100);
  x=x+5;
  if (x > height)
  x=x/5;
    R += incremento;
 if (R > maxcol)
 incremento = -.5;
 else if (R < mincol)
 incremento = random(2);
   B += incremento;
 if (B > maxcol)
 incremento = -1;
 else if (B < mincol)
 incremento = +5;
   G += incremento;
 if (G > maxcol)
 incremento = -1;
 else if (G < mincol)
 incremento = +10;
 frameRate(150);
 

}


void stop()
{
  // always close Minim audio classes when you are done with them
  longSound.close();
  minim.stop();
  
  super.stop();
} 

