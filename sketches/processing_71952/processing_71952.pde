
void setup() {
  size(400, 400);
  background(255);
  rectMode(CENTER);
  smooth();
}

void draw() {
  background(255);
  noFill();
  noCursor();
  strokeWeight(3);
  translate(height/2, width/2);
  if (mousePressed==true) {
    stroke(0, 0, random(0, 255));
  }

  if (key == ' ') {
    for (int i=20; i>0; --i) { 
      fill(i*20, i*80, i*20,20);
      ellipse(0,0,i*20,i*20);
      ellipse(0, 0, map(mouseY, 0, 600, 0, 400), map(mouseY, 0, 600, 0, 400));
    }
  }

  for (int x = 10; x<height; x++) {
    rect(300, 300, map(mouseY, 0, 1000, 0, 1000), map(mouseY, 0, 1000, 0, 1000));
    rect(300, 300, map(mouseY, 0, 1000, 20, 1020), map(mouseY, 0, 1000, 20, 1020));

    rotate(x/300+0);
  }
}
