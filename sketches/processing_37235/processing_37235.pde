
void setup() {
  size(500, 500);
  smooth();
  frameRate(10);
}

void draw() {
  background(255);




  beginShape(POINTS);
  vertex(30, 20);
  vertex(85, 20);
  vertex(85, 75);
  vertex(30, 75);
  endShape();
  //triangle
  float rx1, ry1, ry2, rx2, col, rx3, ry3;
  rx1 = random(width);
  rx2 = random(width);
  ry2 = random(height);
  ry1 = random(height);
  col = random(0, 255);
  rx3 = random(70, 130);
  ry3 = random(70, 130);

  noStroke();
  fill(random(0, 255), random(0, 255), random(0, 255), random(0, 255));
  triangle(rx3, ry3, rx1, ry1, rx2, ry2);


  strokeWeight (1);
  stroke (random (0, 255));
  triangle(random(width),random(height), random(width),random(height),
random(width),random(height));

  noFill ();
   strokeWeight (1);
  stroke (random (0, 255));
  triangle(random(width),random(height), random(width),random(height),
random(width),random(height));

 stroke(col);
  triangle(random(width),random(height), random(width),random(height),
random(width),random(height));
}



