
// Beatriz Bukvic - February 10th, Creative Computing B, Benjamin Bacon

void setup() {
  size(800, 800);
  background(255);
  smooth();
}

void draw() {

  noStroke();
  rect(0, 0, 800, 800);

  stroke(253, 255, 162);
  strokeWeight(20);
  for (int i=-800; i<=1600;i=i+100) {
    line(i, -40, -mouseX+i, 200);
    line(-mouseX+i, 200, i, 400);
  }
  stroke(253, 255, 162);
  strokeWeight(20);
  for (int i=-800; i<=800;i=i+100) {
      line(i, 400, mouseX+i, 600);
      line(mouseX+i, 600, i, 840);
    }
  }



