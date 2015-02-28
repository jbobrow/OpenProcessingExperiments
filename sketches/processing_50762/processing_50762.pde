
/*
  Loads an SVG file and tweens it randomly when any key is pressed.
  The SVG is loaded inside the Tile class, and the URL is passed along through the class constructor.
*/

Tile plane;
float damping = 0.09;

void setup() {
  size(640, 480);
  frameRate(60);
  smooth();
  
  plane = new Tile("plane.svg", random(width), random(height));
  
  plane.load(); // load SVG
}

void draw() {
  background(0);
  
  plane.position(); // position tile
  plane.display(); // display tile
}

void keyPressed() {
  plane.changeRotation(random(TWO_PI)); // change angle randomly
}

