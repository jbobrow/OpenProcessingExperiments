
// Mondrian Puzzle
// Patricia Oakim

color red;
color white;
color blue;
color yellow;

PImage back; //background image
PImage title; // "mondrian puzzle" copy

Draggable[] rects = new Draggable[7]; //create an array of 7 positions of draggable rectangles (see draggable class)


void setup() {
  size(900, 420);
  smooth();

  //Load Images 
  back = loadImage("back.jpg"); 
  title = loadImage("modrianpuzzle.jpg"); 

  //Set values for the colors
  red = color(255, 0, 0);
  white = color(255, 255, 255);
  blue = color(0, 0, 255);
  yellow = color(255, 255, 0);

  //Set stroke weight for the rectangles
  strokeWeight(8); 

  //Set each one of the draggable rectangles
  rects[0] = new Draggable(400, 140, 216, 252, red);
  rects[1] = new Draggable(640, 140, 63, 171, white);
  rects[2] = new Draggable(730, 140, 64, 92, blue);
  rects[3] = new Draggable(400, 30, 63, 64, white);
  rects[4]= new Draggable(480, 30, 166, 92, white);
  rects[5]= new Draggable(820, 140, 40, 36, white);
  rects[6]= new Draggable(665, 30, 41, 47, yellow);
}

void draw() {

  background(255); 
  image(back, 15, 10);
  image(title, 680, 320); 

  //Loop through the array and call drag() and display() methods defined in Draggable Class
  for (int i=0; i < rects.length; i++) {
    rects[i].drag(mouseX, mouseY);
    rects[i].display();
  }
}

void mousePressed() {
  //Loop through the array and call clicked() method defined in Draggable Class on mousePressed()
  for (int i=0; i < rects.length; i++) {
    rects[i].clicked(mouseX, mouseY);
  }
}

void mouseReleased() {
  //Loop through the array and call stropDragging() method defined in Draggable Class on mouseReleased()
  for (int i=0; i < rects.length; i++) {
    rects[i].stopDragging();
  }
}

// Click and Drag an object
// Daniel Shiffman
// Tutorial: http://www.learningprocessing.com/examples/chapter-5/draggable-shape/

// A class for a draggable thing
// Tweaked original class to add color parameter

class Draggable {
  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?
  
  float x,y,w,h;          // Location and size
  float offsetX, offsetY; // Mouseclick offset
  
  color c; // shape color

  Draggable(float tempX, float tempY, float tempW, float tempH, color tempC) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    offsetX = 0;
    offsetY = 0;
    c = tempC;
  }

  // Method to display
  void display() {
    stroke(0);
    fill(c);
    rect(x,y,w,h);
  }

  // Is a point inside the rectangle (for click)?
  void clicked(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      dragging = true;
      // If so, keep track of relative location of click to corner of rectangle
      offsetX = x-mx;
      offsetY = y-my;
    }
  }
  
 // Rollover not being used in this sketch. Leaving it here for referece
 // Is a point inside the rectangle (for rollover)
 /* void rollover(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      rollover = true;
    } else {
      rollover = false;
    }
  } */

  // Stop dragging
  void stopDragging() {
    dragging = false;
  }
  
  // Drag the rectangle
  void drag(int mx, int my) {
    if (dragging) {
      x = mx + offsetX;
      y = my + offsetY;
    }
  }

}


