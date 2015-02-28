



void setup() {
  size(400, 400, P2D);
  smooth(4);
}

void draw() {
  background(200);
  strokeWeight(10);
  fill(255);
  ellipse(width/2, height/2, 200, 90);
  fill(0);
  ellipse(width/2, height/2, 30, 30);
  noFill();
  arc(width/2, 100, 200, 90, PI, TWO_PI);
  


  if (dist(width/2, height/2, mouseX, mouseY) < 10) {
    fill(0);
    arc(width/2, height/2, 200, 90, PI, TWO_PI);
  }
  if (mousePressed) {
    fill(200);
    noStroke();
    rect(80, 50, 250, 100);
    stroke(5);
    line(100, 50, 300, 150);
  }
}



