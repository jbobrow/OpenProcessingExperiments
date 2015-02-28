
void
setup() {
  size(300, 300);
}
void
draw() {
  if (mouseX<width/2) {
    background(0);
  }
  else {
    background(255, 204, 0);
    smooth();
    fill(204, 102, 0);
    strokeWeight(5);
    rectMode(CENTER);
    rect(150, 100, 70, 55);
    strokeWeight(1);
    noFill();
    arc(50, 100, 60, 200, PI/2, PI);
    fill(34, 202, 10);
    arc(50, 55, 70, 70, PI, TWO_PI-PI/2);
    fill(125, 192, 160);
    ellipseMode(CENTER);
    ellipse(200, 245, 55, 100);
    strokeWeight(10);
    line(185, 175, 85, 175);
    strokeWeight(1);
    noStroke();
    triangle(120, 100, 150, 20, 180, 100);
    stroke(255);
    noFill();
    strokeWeight(2);
    quad(122, 31, 275, 20, 250, 200, 30, 232);
    strokeWeight(10);
    point(200, 245);
  }
}


