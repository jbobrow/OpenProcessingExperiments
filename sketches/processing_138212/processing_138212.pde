

/*
 The idea of this sketch is to draw variable ellipses where the mouse is clicked.
 The colours are randomly selected and the stroke can be changed using the keyboard.
 It also allows to save the sketch using the 's' key or restore the canvas using DEL or Backspace keys.
 The background is a public domain image from Machinae Supremacy website

 MOUSE:
 position x and position y : determine the center of the ellipse.
 click / drag : draw

 KEYS:
 's' or 'S' : save the sketch in png format
 'f' : set stroke to fine 
 'm' : set stroke to medium
 't' : set stroke to thick
 del / backspace : erase
*/


// Import the image to be used as background
PImage machine;


color strokeColor = color(0,0,0);
int strokeW = 2; 
 
void setup(){
  size(800, 600);
  machine = loadImage("chrono-trinity.jpg");
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  smooth();
// set the background
   image(machine,0,0);
}
 
void draw(){
  if(mousePressed){
    pushMatrix();
    stroke(random(255),random(255),random(255));
    strokeWeight(strokeW);
    ellipse(mouseX,mouseY,random(width/3),random(height/3));   
    popMatrix();
  }
}
 
void keyReleased(){
  if (key == DELETE || key == BACKSPACE) image(machine,0,0);
  if (key=='s' || key=='S') saveFrame("Screenshot.png");
 
  switch(key){
  case 'f':
    strokeW = 2;
    break;
  case 'm':
    strokeW = 10;
    break;
  case 't':
    strokeW = 20;
    break;
  }
}

