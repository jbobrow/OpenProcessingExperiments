
//Juliana Freitas Verlangieri
//Creative Computing . Section B

void setup() {
  size(500, 500);
  smooth();
  cursor(CROSS);
  noStroke();
}

void draw() {
  background(20);
  
  float y1 = map(mouseY, 0, width, 0, 1);
  float x2 = map(mouseX, 0, width, 0, 1);
  float x3 = map(mouseX, 250, width, 0, 1);

  fill(224, 72, 18);
  beginShape();
  vertex(250*x3, 250);
  vertex(362*x3, 313);
  vertex(250*x3, 362);
  vertex(137*x3, 313);
  endShape(CLOSE);

  fill(239, 84, 17);
  beginShape();
  vertex(250*x3, 121*y1);
  vertex(362*x3, 185*y1);
  vertex(362*x3, 313*y1);
  vertex(250*x3, 250*y1);
  endShape(CLOSE);
  
  fill(250, 91, 15);
  beginShape();
  vertex(250*x2, 121*y1);
  vertex(250*x2, 250*y1);
  vertex(137*x2, 313*y1);
  vertex(137*x2, 185*y1);
  endShape(CLOSE);
  
  float r = map(mouseX, 0, width, 255, 255);
  float g = map(mouseX, 0, width, 79, 189);
  float b = map(mouseY, 0, width, 102, 67);
  
  fill(r, g, b, 200);
  beginShape();   //treasure
  vertex(250, 202);
  vertex(297, 250);
  vertex(250, 297);
  vertex(202, 250);
  endShape(CLOSE);
  
  fill(255, 101, 23);
  beginShape();
  vertex(250, 121*y1);
  vertex(362, 185*y1);
  vertex(250, 250*y1);
  vertex(137, 185*y1);
  endShape(CLOSE);
  
  fill(255, 109, 31);
  beginShape();
  vertex(250*x2, 250);
  vertex(362*x2, 185);
  vertex(362*x2, 313);
  vertex(250*x2, 377);
  endShape(CLOSE);
  
  fill(255, 130, 46);
  beginShape();
  vertex(250*x3, 250);
  vertex(250*x3, 377);
  vertex(137*x3, 313);
  vertex(137*x3, 185);
  endShape(CLOSE);
}


