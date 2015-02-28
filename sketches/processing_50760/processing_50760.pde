
/*
  Simple tweening example. Press any key to tween the circle to a new, random position.
  Modify damping to change the speed.
*/

Tile tile;
float damping = 0.09;

void setup() {
  size(640, 480);
  frameRate(60);
  smooth();
  
  tile = new Tile(width/2, height/2);
}

void draw() {
  background(0);
  tile.display();
}

void keyPressed() {
  tile.position(random(width), random(height));
}

