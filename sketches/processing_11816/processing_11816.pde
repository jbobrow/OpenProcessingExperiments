
// Assignment #1
// Zandalee Montero
// zmontero@brynmawr.edu
// 9/4/10

void setup() {
  size(500,500);
  smooth();
  background(127,255,0);
}
void draw() {
  //circles
  noStroke();
  fill(135,206,250,25);
  ellipse(250,100,25,25);
  ellipse(2,50,25,25);
  ellipse(100,10,25,25);
  ellipse(350,400,25,25);
  ellipse(150,200,25,25);
  ellipse(50,350,25,25);
  ellipse(400,25,25,25);
  ellipse(495,333,25,25);
  ellipse(131,313,25,25);
  //circle inside
  noStroke();
  fill(255);
  ellipse(250,200, 50,50);
  //raindrop
  strokeWeight(5);
  stroke(255,255,0,50);
  fill(0,0,255,20);
  beginShape();
  vertex(250,100);
  vertex(200,200);
  curveVertex(250,300);
  curveVertex(200,300);
  curveVertex(300,200);
  curveVertex(175,0);
  vertex(250,100);
  endShape(CLOSE); 
}
  void mousePressed() {
    noStroke();
    fill(135,206,250,200);
    ellipse(mouseX,mouseY,25,25);
  }

