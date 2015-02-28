
// yidong's shape program
// january 26
// homework#1

void setup(){
  size(500,500,P3D);
  background(75);
}

void draw(){
  
  noStroke();
  pointLight(100,180,226,95,110,180);
  translate(250,250,0);
  sphere(50);
  smooth();

  strokeWeight(2);
  stroke(120);
  beginShape(QUAD_STRIP);
  vertex(60,40);
  vertex(60,150);
  vertex(100,150);
  vertex(100,40);
  vertex(130,40);
  vertex(130,150);
  vertex(170,150);
  vertex(170,0);
  endShape();
}

