
void setup(){
  size(250,200);
  background(150,22,20);
}

void draw(){
  strokeWeight(8);
  strokeCap(SQUARE);
   line(175,20,115,140);
  beginShape(LINES);
  vertex(55,20);
  vertex(125,20);
  vertex(152,20);
  vertex(195,20);
  endShape();
  fill(0);
  noStroke();
  beginShape();
  vertex(70,20);
  vertex(100,20);
  vertex(134,97);
  vertex(119,127);
  vertex(70,20);
  endShape(CLOSE);
  noFill();
  stroke(8);
  bezier(115,140,110,150,95,180,78,180);
  ellipseMode(CENTER);
  fill(0);
  ellipse(78,169,22,22);
}


