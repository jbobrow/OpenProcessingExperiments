
// Final Project : rectsProject
// Introduction to Computational Arts : Processing
// Open Suny on Coursera
// If mouse pressed, draw squares with different size and different color; 
// little squares next to the edge, getting bigger to the center of the canvas
// When mouse pressed, there's a sound by default
// Sound file taken from http://www.freesound.org/people/looppool/sounds/13119/
// m or M to mute and unmute sound
// s or S to save, DELETE or BACKSPACE to restart drawing
// Change the strokeWeight by pressing 1, 2, 3, 4, or 5 (for 2, 4, 6, 8, 10 strokeWeight)
// Last Modified 3 March 2014

// Import Minim library
import ddf.minim.*;

// default strokeWeight = 2
Minim minim;
AudioSample bells;
int sWeight = 2;
int w;
int h;
int side;

// Setup
void setup() {
  size(720, 720);
  colorMode(HSB, 360, 100, 100);
  noFill();
  background(0);
  minim = new Minim(this);
  bells = minim.loadSample("blip.wav");
}

// Draw
void draw() {
  if (mousePressed) {
    pushMatrix();
    bells.trigger();  
    strokeWeight(sWeight);
    // The stroke color depends on mouse position
    stroke(abs(mouseX-width/2), abs(mouseY-height/2), abs(mouseX+mouseY));
    //stroke(random(360), random(100), 100);

    // The side of the square getting bigger to the center of canvas 
    if (mouseX<=width/2) {
      w = mouseX;
    } else {
      w = width - mouseX;
    }
    if (mouseY<=height/2) {
      h = mouseY;
    } else {
      h = height - mouseY;
    }
    side = (h+w)/2;
    rect(mouseX, mouseY, side, side);
    popMatrix();
  }
}

// keyPressed()
void keyPressed() {
  // Press s or S to save image
  if (key == 's' || key == 'S') {
    saveFrame("screenshot.png"); 
  }
  
  // DELETE or BACKSPACE to restart drawing
  if (key == DELETE || key == BACKSPACE) {
    background(0); 
  }
  
  // To mute or unmute sound
  if (key == 'm' || key == 'M') {
    if (bells.isMuted()) {
      bells.unmute();
    } else {
      bells.mute();
    }
  }
  
  // Keys to change the strokeWeight
  switch(key) {
    case '1' : 
      sWeight = 2;
      break;
    case '2' : 
      sWeight = 4;
      break;
    case '3' : 
      sWeight = 6;
      break;
    case '4' : 
      sWeight = 8;
      break;
    case '5' : 
      sWeight = 10;
      break;
  }
}


