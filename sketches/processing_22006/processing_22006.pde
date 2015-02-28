

int a=100;

void setup () {
  size (700,900);
  background (0,20);
  smooth ();
}

void draw() {

  noStroke ();
  if (frameCount % 6 == 0) {
    a =a+1;
    fill(frameCount * 3 % 255, frameCount * 5 % 255,
    frameCount * 7 % 255);
    pushMatrix();
    translate(100, 100);
    rotate(radians(frameCount * 2  % 360));
    ellipse(a,350, 200,200);
    rect (a,250, 100,200);
    popMatrix();
  }
}

void keyPressed () {
  if (key == 'p') {
    saveFrame();
  }
}

                
