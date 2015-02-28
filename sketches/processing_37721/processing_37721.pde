
//a window filled by 10x10 rectangles in two colors.
//if the rectangle is black it has a red diagonal line

void setup() {
  size(400, 400);
  background(255);
  smooth();
  for ( int i =5; i < 380; i = i+20) {
    for ( int j =5; j < 380; j = j+20)
      figure(i, j);
  }
}

float colorrandom;

void figure(float x, float y) {
  pushMatrix();
  translate(x, y);
  colorrandom = random(400);
  //changes the rectangle color
  if (colorrandom < 100) {
    fill(0);
  }
  else {
    fill(142);
  }
  noStroke();
  rect(10, 10, 10, 10);
//if the rectangle is black it has 
//a red line 

  if (colorrandom < 100) {
    rotate(radians(45));
    stroke(255, 0, 0);
    strokeWeight(1.2);
    line(20, 10, 20, 20);
  }

  popMatrix();
}


