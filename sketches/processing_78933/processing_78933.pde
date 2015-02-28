
import ddf.minim.*;

Minim minim;
AudioInput in;

void setup() {
  background(0);
  size(400, 400);
  noStroke();
  smooth();

  minim = new Minim(this);
  in = minim.getLineIn();
}

void draw() {

  if (frameCount % 20 == 0) {
    fill(0, 5);
    rect(0, 0, width, height);
    filter(BLUR, 1.0);
  }

  fill(255, 5);
  float r = width*in.left.level();
  int x = width/2 + int(random(-100, 100));
  int y = height/2 + int(random(-100, 100));
  ellipse(x, y, r, r);

  if (mousePressed && mouseButton == LEFT) {
    fill(0);
    ellipse(mouseX, mouseY, 10, 10);
  }
}


