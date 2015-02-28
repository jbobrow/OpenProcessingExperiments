
void setup() {
  size(400,400);
  background(0,0,0);
  frameRate (10);
  }

void draw() {
    background(0,0,0);
    x = random(-5,5);
    y = random(-5,5);
    fill(255,0,0);
    ellipse(50,50+y,40,40);
    fill (0,0,255);
    ellipse (150,275+y,40,40);
    fill (0,255,0);
    ellipse (350+x,200,40,40);
    fill (255,0,0);
    rect(200+x,150,40,40);
}

