
void setup() {
  size(400, 400);
  background(0);
  strokeWeight(3);
  noFill();
}

void draw() {
  background(0,230);
  stroke(random(255), random(255), random(255));
//  translate(width/2,height/2);
// rotate(angulo);

  beginShape();
  curveVertex(250, 150);
  curveVertex(200, 50);
  curveVertex(150, 150);
  curveVertex(50, 150);
  curveVertex(125, 225);  
  curveVertex(75, 350);
  curveVertex(200, 300);
  curveVertex(325, 350);
  curveVertex(275, 225);
  curveVertex(350, 150);
  curveVertex(250, 150);
  curveVertex(200, 50);
  curveVertex(150, 50);
  endShape();
}
