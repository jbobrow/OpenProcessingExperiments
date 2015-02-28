
/* Created from scratch by Fatima Zahrah Rashid for Interactivity 1. 
Uses variables, custom shapes, mouse location, key strokes, mouse 
clicks and the random feature.*/ 


float r = 0; // variable for red colour
float g = 0; // variable for green colour
float b = 0; // variable for blue colour
float a = 50; // variable for star coordinates
float c = 75; // variable for star coordinates
float d = 15; // variable for star coordinates



void setup() {
  size (1000,400);
  background(0); //background colour in setup so it doesn't redraw
  smooth();
  stroke(0,20);
  frameRate (100);  
}


void draw() {
  fill(r,g,b);
    beginShape(); // star shape coordinates, based on mouse location, 
                  // variable for points, and random point to make star vibrate
      vertex(mouseX-a-random(0,20), mouseY+c+random(0,20)); 
      vertex(mouseX, mouseY-c-random(0,20));
      vertex(mouseX+a+random(0,20), mouseY+c+random(0,20));
      vertex(mouseX-c-random(0,20), mouseY-d-random(0,20));
      vertex(mouseX+c+random(0,20), mouseY-d-random(0,20));
    endShape();

  if(keyPressed) {
    if (key == ' ') { // when spacebar is pressed the background colour changes
      background(random(0,255),random(0,255),random(0,255));
    }
  }
  
  if(keyPressed) {
    if (key == CODED) {
      if (keyCode == UP) { // when the up arrow is pressed, star gets bigger
        a +=2;
        c +=3;
        d +=0.6;
      } 
      else if (keyCode == DOWN) { // when the down arrow is pressed, 
                                  // star gets smaller
        a -=2;
        c -=3;
        d -=0.6;
      } 
    }
  }
}


void mousePressed() { // when the mouse is pressed, the star colour changes

r = random(255);
g = random(255);
b = random(255);

}


