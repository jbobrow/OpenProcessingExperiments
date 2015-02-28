
//when keyPressed, generate random colored bkg
//use mousePressed to draw

void setup() {
  size(800, 800);
  background(0);
  strokeWeight(30);
  frameRate(24);
}

void draw() {
  noiseSeed(1231);
  for (int i = 0; i < 3; i++) {
    float r = random(500);
    stroke(r, 50);
    if (keyPressed) {
      rect(CENTER,CENTER,displayWidth, displayHeight);
      fill(r);
    }
    if (mousePressed) {
      ellipse(mouseX, mouseY, r/2, r/2);
    }
    else {

      ellipse(mouseX, mouseY, 0, 0);
      fill (0, 200, 50, 20);
    }
  }
}



