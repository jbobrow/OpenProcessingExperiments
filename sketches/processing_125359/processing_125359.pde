
import ddf.minim.*;

/* this in en experiment called 'ethereal shapes', every canvas will be different and unique. 
It reminds me the entropy of universe: all random wavelengh, but with some sort of order.
I hope you enjoy (and sorry for my bad english)
*/
//audio
Minim minim;
AudioPlayer bubble;
//image import
PImage warp;
// global variables
float oriMouseLocationX=0;
float oriMouseLocationY=0;

// Set up of the screen 
void setup() {
  minim = new Minim(this);
  bubble = minim.loadFile("bubble.mp3");
  size(800, 720);
  warp = loadImage("warp.jpg");   
  background(warp);
//rectMode(CENTER);  // this change the origin of rectangle, try and see the difference 
}
// draw section
void draw() {
    float mouseLocationX = mouseX; 
    float mouseLocationY = mouseY; 

    // if mouse is pressed, draw rectangles of random size and color
    if (mousePressed) {    
      pushMatrix();                         
      translate(mouseLocationX, mouseLocationY);  

      // if mouse location is changed, then draw filled rectangles
      if (mouseLocationX != oriMouseLocationX) { 
        rotate(random(radians(360)));
        fill(random(255), random (255), random(255), random(10,80));  // blue palette is very nice too
        rect(0, 0, random(5, 80), random(5, 80), random(1,8)); //random rounded rect
      }

      // if mouse location is not changed, then draw outlines
     else {
        noFill();
        strokeWeight(1/2);
        stroke(255);   // 1 was too thick
        rotate(random(radians(360)));
        rect(0, 0, random(0, 400), random(0, 400), random(2,8)); //again, random rounded rect
      }
      popMatrix();
    
}
  // for mouse location
  oriMouseLocationX = mouseX;
  oriMouseLocationY = mouseY;
  
}

// defining keys functions
void keyReleased() {
 if (key== 'c' || key== 'C') background(warp); 
 if (key== 's' || key== 'S') saveFrame("screenshot.png");

}

void mousePressed()
{
  bubble.play();
}

void mouseReleased()
{
  bubble.close();

  //since close closes the file, we'll load it again
  bubble = minim.loadFile("bubble.mp3");
}






