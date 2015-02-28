
void setup() {
  size(600, 600);
  background(255);
  frameRate(50);
  fill(0, 200);
  noStroke();
  ellipse(width/2, height/2, 30, 30);
}

void draw() {
  pushMatrix();
  float dgr = random(360);
  float d2 = random(-250, 250);
  translate(width/2, height/2);
  fill(250, 0, 0, 200);
  noStroke();
  ellipse(d2*cos(dgr), d2*sin(dgr), 5, 5);
  popMatrix();
}

void mousePressed () {
  fill(250);
  stroke(0, 200);
  float d = dist(width/2, height/2, mouseX, mouseY);
  if (d>250) {
    noStroke();
  }
  float D = (1000/d)+1;
  if (D>20) {
    D=20;
  }
  if (d<25) {
    noFill();
    noStroke();
  }
  ellipse(mouseX, mouseY, D, D);
}



