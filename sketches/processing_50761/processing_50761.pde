
/*
  Loads a bitmap image and tweens it randomly when any key is pressed.
  The image is loaded inside the Tile class, and the URL is passed along through the class constructor.
  Note that this example uses transparent PNGs.
*/

Tile eye;
Tile bee;
Tile m;
float damping = 0.09;

void setup() {
  size(640, 480);
  frameRate(60);
  smooth();
  
  eye = new Tile("eye.png", random(width), random(height));
  bee = new Tile("bee.png", random(width), random(height));
  m = new Tile("m.png", random(width), random(height));
  
  eye.load(); // load image
  bee.load();
  m.load();
}

void draw() {
  background(0);
  
  eye.display(); // display image
  bee.display();
  m.display();
}

void keyPressed() {
  eye.position(random(width), random(height)); // reposition image
  bee.position(random(width), random(height));
  m.position(random(width), random(height));
}

