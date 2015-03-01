
// Draws a Lissajous figures
// Based on code by Javier Romero 
// http://www.fjromero.com/processing/lissajous/

// 27 March 2011
// http://www.rupert.id.au/tutorials/processing/examples.php

int screen_width = 400;
int screen_height = 400;

/* Scale image and reduce by 10 pixels to remove from edge of screen */
int AX = (screen_width/2) - 10;
int BX = (screen_height/2) - 10;

/* Try different values for a & b */
// eg a=1, b=3; a=1, b=2; a = 3, b = 4; a=9, b=8; 

float a = 2.7;
float b = 1.8;
float delta = PI/2;

float x, y;
float t=10;
float inc_t = 0.001;

void setup(){
  smooth();
  fill(255);
  size(400,400);
  }

void draw(){
 // background(0);
  x = AX*sin(a*t + delta) + screen_width/2;
  y = BX*sin(b*t) + screen_height/2;
 
  fill(#ffff00);
  ellipse(x,y,1,1);
  
  t = t+inc_t;
  }

// Save tif when mouse is clicked
void mouseClicked(){
noLoop();
save("lissa_7.tif");
}               
