
void setup() {
  size(400,400);
  background(0);
  colorMode(HSB,100);
  smooth();
}

void draw() {
  pushMatrix();
  translate(random(width), random(height));  
  translate(-50,-55);
  rotate(random(TWO_PI));
  strokeWeight(1);
  fill(color(0, random(100), 100));
  noStroke();
  arc(25,50,50,50,PI-QUARTER_PI,TWO_PI);
  arc(75,50,50,50,PI,TWO_PI+QUARTER_PI);
  beginShape();
  vertex(5,65);
  vertex(50,110);
  vertex(95,65);
  vertex(75,49);
  vertex(25,49);
  vertex(5,65);
  endShape(CLOSE);
  noFill();
  stroke(0);
  strokeWeight(3);
  arc(25,50,50,50,PI-QUARTER_PI,TWO_PI);
  arc(75,50,50,50,PI,TWO_PI+QUARTER_PI);
  line(5,65,50,110);
  line(50,110,95,65);
  fill(0,0,0,3);
  popMatrix();
  noStroke();
  rect(0,0,width,height);
}

