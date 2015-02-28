
float angle;


void setup() {
  size(500, 500);
  background(0);
  smooth();
}


void star() {

  fill(230, 0, 120, random(50, 200));            
  stroke(255, 0, 100);
  pushMatrix();
  scale(0.2, 0.2);
  beginShape();
  vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);
  popMatrix();
}


void splatter() {

  strokeWeight(2);
  pushMatrix();
  translate(random(-30, 50), random(-50, 30));

  scale(random(0.1, 0.5));
  beginShape();
  vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);
  popMatrix();
}


void draw() {


  pushMatrix();
  translate(mouseX, mouseY);
  angle=angle+1;
  rotate(angle);
  scale(random(0.1, 0.3));
  stroke(255, 0, 127);
  noFill();
  beginShape();
  vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);
  popMatrix(); 
  frameRate(25);
}



void mouseClicked() {

  translate(mouseX+random(-3, 3), mouseY+random(-3, 3));

  star();
  star();
  star();
  splatter();
  splatter();
  splatter();
  splatter();
  splatter();
  splatter();
  splatter();
}
