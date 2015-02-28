
/* @pjs preload="grumpy-cat.jpg"; */

PImage cat;
PVector direction;
PVector position;
PVector toMouse;
PVector chaserPosition;

void setup() {
  size(400, 400);
  cat = loadImage("grumpy-cat.jpg");
  direction = new PVector(0, 1);
  position = new PVector(200, 200);
  chaserPosition = new PVector(0, 0);
  image(cat, 0, 0, 30, 30);
}

void draw() {
  background(0);
  image(cat, mouseX, mouseY, 30, 30);
  
  position.add(direction); // Add (0, 1) to bigger cat so it just falls 1 pixel each frame.
  image(cat, position.x, position.y, 50, 50); // draw bigger Cat
  
  // Reset when it goes off screen
  if (position.y > height) {
    position.y = 0;
  }
  
  toMouse = new PVector(mouseX, mouseY);
  toMouse.sub(chaserPosition); // Get the vector between two points (direction)

  toMouse.normalize(); // Make direction length of 1

  stroke(255);
  line(chaserPosition.x, chaserPosition.y, chaserPosition.x + toMouse.x, chaserPosition.y + toMouse.y);
  stroke(0);
  
  //toMouse.mult(0.05); // set speed
  chaserPosition.add(toMouse.x, toMouse.y); // Add that offset to the chaserPosition to move it
  image(cat, chaserPosition.x, chaserPosition.y, 20, 20); // Draw the chase.
   
}
  
