
// Loads a PNG image with 8-bit transparency
PImage img;
float  angle= 0.0;

void setup() {
  size(600, 600);
  smooth();
  img = loadImage("arch.png");
  background(255, 0, 0);
  image(img, 0, 0);
  image(img, -20, 0);
}

void draw() {
  tint(255, 50);
  pushMatrix(); //Moving background
  translate(mouseX, mouseY);
  rotate(radians(frameCount));
  image(img, 0, 0);
  popMatrix(); //???
}

void keyPressed () { //??
  if ( key == CODED)
    if (keyCode == LEFT) {
      angle -= 10;
    }
    else if (keyCode == RIGHT) {
      angle += 10;
    }
}
}
