
void setup() {
  size(400,400);
  /*noFill();
  noStroke();
  Calling both of these would result in nothing being drawn
  to the screen. */
  noLoop();
}

void draw() {
  int w = 395, l = 395; // width, length for ellipses.
  fill(random(255), random(255), random(255));
  ellipse(200, 200, w, l);
  for (int i = 0; i < 10; i++) {
    w -= 30;
    l -= 30;
    fill(random(255), random(255), random(255));
    ellipse(200, 200, w, l);
  }
  strokeWeight(5);
  line(0, 0, 400, 400);
  line(400, 0, 0, 400);
  
  // Outer triangles
  fill(random(255), random(255), random(255));  
  triangle(205, 200, 245, 160, 245, 240); // right
  fill(random(255), random(255), random(255));
  triangle(197, 200, 160, 161, 160, 238); // left
  fill(random(255), random(255), random(255));
  triangle(201, 205, 240, 243, 163, 243); // bottom
  fill(random(255), random(255), random(255));
  triangle(202, 196, 163, 159, 242, 158); // top
  
  // Inner triangles
  noStroke();
  fill(random(255), random(255), random(255));  
  triangle(223, 182, 223, 219, 390, 200); // right
  fill(random(255), random(255), random(255));  
  triangle(220, 180, 182, 180, 200, 5); // top
  fill(random(255), random(255), random(255));  
  triangle(185, 220, 220, 220, 202, 397); // bottom
  fill(random(255), random(255), random(255));  
  triangle(180, 180, 180, 220, 5, 200); // right
}


