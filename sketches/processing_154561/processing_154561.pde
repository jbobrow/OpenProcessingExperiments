
void setup() {
  size(400, 400);
}
 
void draw() {
  background(25, 200, 25);
  fill(255,255,0);
//  ellipse(width/2, height/2, 85, 85);
  translate(width/4, height/4);
  for(int i = 0; i < 360; i = i + 45)
    petal(width/4, 95, radians(i));

    fill(255,255, 0);
  ellipse(width/4, height/4, 95, 95);
}

void petal(int x, int y, float angleOfRotation) {
  pushMatrix();
  translate(x, y);
  rotate(angleOfRotation); 
  fill(255); 
     noStroke();
  beginShape();

  curveVertex(0, 0); 
  curveVertex(0, 0); 
  curveVertex(0 - 10, 0 - width/4); 
  curveVertex(0 - 40, 0 - width/4); 
  curveVertex(0 - 65, 0); 
  curveVertex(0 - 65, 0); 
  endShape(); 
  popMatrix();
}
