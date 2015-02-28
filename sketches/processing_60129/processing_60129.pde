
float a = 0.0;

void setup() {
  size(1440,900);
}

void draw() {
  fill(0);
  smooth();
  strokeWeight(5);
  stroke(255);
  
  a = map(mouseX,0,1440,0,2);
  scale(a);
  println(a);  
  
  ellipse(720,140,150,150);
  
  beginShape();
  vertex(430, 230);
  vertex(840, 220);
  vertex(950, 500);
  vertex(710, 520);
  vertex(650, 290);
  endShape(CLOSE);
  
  beginShape();
  vertex(710, 520);
  vertex(950, 520);
  vertex(950, 890);
  vertex(820, 630);
  vertex(650, 890);
  endShape(CLOSE);
}

void mousePressed() {
  saveFrame("test.png");
}

