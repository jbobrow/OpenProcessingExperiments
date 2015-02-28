
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//Final Project
//Mouse/Keyboard Input
//Based on Generative Design (2010) P_2_0_03
//Available at http://generative-gestatltung.de

//My Interactive figures are combinations of triangles, hexagons, octagons, and decagons.
//They are in shades of  dark blues and grays/silver.
//This is my attempt to draw my interactive figure using colors with the keystrokes 1, 2, 3.

/*
MOUSE
position x : length
position y : thickness and number lines to be drawn
drag : draw

KEYs
1-3 : stroke color
del, backspace : erase
s : save png
*/

//Declare global variables
Minim minim;
AudioSample test11;


//Global Variables
color strokeColor = color (300, 100);


//setup()
void setup() {
  size (720, 720);
  colorMode(HSB, 360, 735, 400, 20);
  //colorMode(mode, redRange, greenRange, blueRange);
  noFill();
  background(360);
  
}
//draw()
void draw() {
if(mousePressed) {
  pushMatrix();
  translate(width/2, height/2);
  //map(value, start1, stop1, start2, stop2);
  int circleResolution = (int)map(mouseY+100, 0, height, 2, 10);
  int radius = mouseX-width/2;
  float angle = TWO_PI/circleResolution;


  //style
  strokeWeight(2);
  stroke(strokeColor);
 

beginShape();
for (int i=0; i<=circleResolution; i++){
  float x = 0 + cos(angle*i) * radius;
  float y = 0 + sin(angle*i) * radius;
  vertex(x, y);
}
  endShape(); 
  popMatrix();
}
}

//keyPressed()
void keyPressed() {
  if (key == DELETE || key == BACKSPACE) background (360);
  if (key == 's' || key =='S') saveFrame("screenshot.png");
  
  switch(key){
    case '1' :
      strokeColor = color(0, 20);
      break;
    case '2':
      strokeColor = color(192, 110, 64, 20);
      break;
    case '3': 
      strokeColor = color(52, 100, 71, 10);
      break;
    }
} 


