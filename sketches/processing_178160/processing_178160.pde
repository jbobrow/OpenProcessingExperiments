
//Project 3

/*
MOUSE 
drag : reveal/obscure background image
click : random color of ellipses

KEYS
press "h" : play sound
*/

//import "Minim" library
import ddf.minim.*;

//declare PImage variable
PImage dream;

//declare sound variable
Minim minim;
AudioSample bubbles;

//variable mouse interaction - obscure & reveal image
float max_distance;

void setup() {
  
 size(800, 600);
 
//load image file
 dream = loadImage("dream.png");
 
//load audio file
  minim = new Minim(this);
  bubbles = minim.loadSample("bubbles.mp3");
 
//define characteristics of mouse interaction
 smooth();

 noStroke();
  
 max_distance = dist(0, 0, width, height); 
}

void draw() {
  
//draw image  
  image(dream, 0, 0);
 
//generate ellipses with mouse interaction
  for(int i = 0; i <= width; i += 20) {

    for(int j = 0; j <= width; j += 20) {

      float size = dist(mouseX, mouseY, i, j);
      
      size = size/max_distance * 79;

      ellipse(i, j, size, size);
      
//mouse input      
    if (mousePressed == true) {
    fill(random(53), random(20), random(27));
    strokeWeight(25);
  } else {
    fill(54, 0, 0);}    
      }
  }
}
//keyboard audio input
void keyPressed(){
 if (key == 'h') bubbles.trigger(); 
}

