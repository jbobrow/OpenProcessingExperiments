
PImage finger;
float r = 0;
float spin = 0;

void setup() {
  size(480,480);
  background(255);
  finger = loadImage("finger.png");
}

void draw() {
  background(255);
  
  float rx = map(mouseX, 0, width, width, 0);
  float ry = map(mouseY, 0, height, height, 0);
  
  pointer(mouseX,mouseY,r);
  pointer(rx,mouseY,r);
  pointer(mouseX,ry,r);
  pointer(rx,ry,r);
  
  if(keyPressed && (key == CODED)) {
    if(keyCode == LEFT) {
      r += .001;
    }
    if(keyCode == RIGHT) {
      r -= .001;
    }
  }
}

void pointer(float x, float y, float rate) {
  pushMatrix();
  translate(x,y);
  scale(1);
  rotate(spin);
  image(finger,-100,-10,100,60);
  spin += rate;
  popMatrix();
}


