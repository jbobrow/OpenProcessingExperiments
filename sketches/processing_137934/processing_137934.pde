
/*
---Plant a Tree (RecursiveTree)---

---Important Note---
The applet might NOT run because of the Java security, also mentioned in the videos. Probably that will be the case with all of our sketches. 
However, there is a simple solution. Thanks to this post (https://class.coursera.org/compartsprocessing-001/forum/thread?thread_id=291).
Go to ‘Control Panel’ (on Windows), then ‘Java (32-bit)’, then go to the ‘Security’ tab and press the ’Edit Site List’ button. 
In the new window press ‘Add’, then copy and paste this URL (http://www.openprocessing.org/) as location and press ‘Add’ again. 
A security prompt will pop up, click ‘Continue’ and finally press ‘Ok’ to close the windows. 
What it does is adding an exception for that particular website only.

---Description---
This sketch is an example of a self-similar patterned shape also known as a fractal (http://en.wikipedia.org/wiki/Fractal). 
In Processing fractals can be drawn with recursion or calling a function from within itself. 
Based on this, the following code first draws an empty canvas (with a landscape background). 
Then taking the mouse position as input you can plant a tree on it wherever you like (preferably on the ground:) ).

---Known Issues---
Long mouse press draws trees on top of eash other. Solution - just a quick mouse click. 
*/

PImage background;

void setup() {
  size(800, 600);
  background = loadImage("landscape.png");
  image(background, 0, 0);
  stroke(#5e2605);
  strokeWeight(4);
  smooth();
  frameRate(12);                   // sets a frame rate of 12fps
}

void draw()  {
  translate(mouseX, mouseY);       // takes mouse position as input
  if(mousePressed)  {
  tree(100.0);                     // calls tree() with argument float(100.0)
  }
}

void tree(float length) {          // declares variable length
  line(0, 0, 0, -length);          // the trunk of the tree; length is 100.0px
  translate(0, -length);
  length *= 0.66;                  // decreases length with .66 with each itteration
  
  if(length > 1) {                 // exit condition; itterates until length is 1px
    
    pushMatrix();                  // first transformation matrix; draws a new branch
    scale(random(0.5, 1));         // makes a smaller copy of the trunk with some randomness
    rotate(PI/6);                  // rotates the new branch with 30 degrees to the right
    tree(length);                  // tree() calls itself
    popMatrix();
    
    pushMatrix();                  // second transformation matrix; draws a new branch
    scale(random(0.5, 1));         // makes a smaller copy of the trunk with some randomness
    rotate(-PI/6);                 // rotates the new branch with 30 degrees to the left
    tree(length);                  // tree() calls itself
    popMatrix();
  }
}

// end of code

