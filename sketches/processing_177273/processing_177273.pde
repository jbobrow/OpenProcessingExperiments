
//Breathe: Click, drag, hover to create concentric rings. 
//Change colours using the numbers 1-4. Each key press 
//will also produce a sound--one breath in, one breath out, 
//inhale-exhale. 

 
//Click s or S to save. Thank you.
import ddf.minim.*;
/*
MOUSE
position x : length
position y : thickness and number lines to be drawn
drag : draw

KEYS
1-4 : stroke color (with sound cue)
del, backspace : erase
s : save png

*/




//Global variables
PImage bg;
Minim minim;
AudioSample breath;
color strokeColor = color(0, 10);

//setup()

void setup() {
  size(800, 800);
  colorMode(HSB, 174, 200, 100);
  noFill();
  bg = loadImage("glassx.jpg");
  minim = new Minim(this);
  breath = minim.loadSample("breath.wav");
      background(bg);
  
  
}

//MOUSE INPUT
void draw() {
if(mousePressed){
  pushMatrix();
  translate(width/2, height/2);
  int circleResolution = (int)map(mouseY+100, 0, height, 2, 5000);
  int radius = mouseX-width/2;
  float angle = TWO_PI/circleResolution;
  //style
  strokeWeight(2);
  stroke(strokeColor);
  beginShape();
  for (int i=0; i<+circleResolution; i++){
    float x = 0 + cos(angle*i) * radius;
    float y = 0 + sin(angle*i) * radius;
    vertex(x, y);

 }
 endShape();
 popMatrix();
}
}

//KEYBOARD INPUT
//IMAGE SAVING
void keyReleased(){
  if (key == DELETE || key == BACKSPACE) background (bg);
  if (key == 's' || key == 'S') saveFrame("screenshot.png");
  //switch--allows to toggle between an if/else structure
  switch(key){
   case '1':
     strokeColor = color(0, 10);
     breath.trigger();
     break;
  case '2':
     strokeColor = color(192, 100, 100, 30);
     breath.trigger();
     break;
  case '3':
     strokeColor = color(117, 100, 100, 40);
     breath.trigger();
     break;
  case '4':
     strokeColor = color(55, 100, 100, 20);
     breath.trigger();
     break;
  }
}  







