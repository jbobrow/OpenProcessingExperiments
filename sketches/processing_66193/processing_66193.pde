
void setup() {
  size(400, 400);
  frameRate(24);
  //  smooth();
}

void draw() {
  
  for(int i = 0; i < mouseY+50; i++) {
  colorMode(HSB, 360, 100, 80);
  background(280, 100, (mouseX/4)-50);
  
  noStroke();
  fill(random(255), random(255), random(255));
  rect(random(width),random(height), 1, 1);
  rect(random(width),random(height), 1, 1);
  rect(random(width),random(height), 1, 1);
  rect(random(width),random(height), 1, 1);
  rect(random(width),random(height), 1, 1);
  rect(random(width),random(height), 1, 1);
  rect(random(width),random(height), 1, 1);
  
/*
  stroke(#9CFF00);
  strokeWeight(random(50));
  strokeCap(SQUARE);
  line((width/2), (height/2), random(width)-mouseX, random(height)-mouseY);
  line((width/2), (height/2), random(width), random(height));
*/

  int bVx = int(random(1, 60));

/*  
  beginShape();
  noStroke();
  fill(#9CFF00);
  vertex(bVx, bVy);
  bezierVertex(bVx1, bVy1, bVx2, bVy2, bVx3, bVy3);
  bezierVertex(bVx3, bVy3, bVx4, bVy4, bVx1, bVy1);
  bezierVertex(bVx2, bVy2, bVx3, bVy3, bVx4, bVy4);
  endShape();
*/
  
  noStroke();
  fill(#9CFF00);
  ellipse((mouseX), (mouseY), bVx, bVx);
  
  int cVx1 = int(random(100, 300));
  int cVy1 = int(random(100, 300));
  int cVx2 = int(random(50, 350));
  int cVy2 = int(random(50, 350));
  int cVx3 = int(random(25, 375));
  int cVy3 = int(random(25, 375));
  
  stroke(#9CFF00);
  noFill();
  ellipse((mouseX), (mouseY), bVx+20, bVx+20);
  
  noFill();
  stroke(#9B00FF);
  strokeWeight(random(3));
  beginShape();
  curveVertex(width/2, height/2);
  curveVertex(width/2, height/2);
  curveVertex(cVx1, cVy1);
  curveVertex(cVx2, cVy2);
  curveVertex(cVx3, cVy3);
//  curveVertex(random(width), random(height));
//  curveVertex(random(width), random(height));
  curveVertex(mouseX, mouseY);
  curveVertex(mouseX, mouseY);
  endShape();
  
  fill(#9CFF00);
  ellipse(cVx1, cVy1, 2, 2);
  ellipse(cVx2, cVy2, 4, 4);
  ellipse(cVx3, cVy3, 8, 8);
  }
}


