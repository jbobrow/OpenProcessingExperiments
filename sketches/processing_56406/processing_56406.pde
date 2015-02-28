
void setup() {
  size(400, 400);
  background(0);
  colorMode(HSB, 100);
  smooth();
}
color c;
void draw() {
  pushMatrix();
  translate(random(width), random(height));  
  //translate(-50,-55);
  scale(0.25);
  c = color(random(30,36), random(50,100), 100);
  rotate(random(TWO_PI));
  fill(c);
  noStroke();
  ellipse(50,110, 140,140);
  
  leaf();
  rotate(PI);
  translate(-100, -220);
  leaf();

  rotate(HALF_PI);
  translate(60, -160);
  leaf();
  rotate(PI);
  translate(-100, -220);
  leaf();
  fill(c);
  noStroke();
  ellipse(50,110, 40,40);

  popMatrix();
  noStroke();  
  fill(0, 0, 0, 3);
  rect(0, 0, width, height);
}

void leaf() {

  strokeWeight(1);
  fill(c);
  noStroke();
  arc(25, 50, 50, 50, PI-QUARTER_PI, TWO_PI);
  arc(75, 50, 50, 50, PI, TWO_PI+QUARTER_PI);
  beginShape();
  vertex(5, 65);
  vertex(50, 110);
  vertex(95, 65);
  vertex(75, 49);
  vertex(25, 49);
  vertex(5, 65);
  endShape(CLOSE);
  noFill();
  stroke(0);
  strokeWeight(3);
  arc(25, 50, 50, 50, PI-QUARTER_PI, TWO_PI);
  arc(75, 50, 50, 50, PI, TWO_PI+QUARTER_PI);
  line(5, 65, 50, 110);
  line(50, 110, 95, 65);
}



