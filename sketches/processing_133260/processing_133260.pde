
float c=15.0;


void setup() {
  size (500, 500);
  background (#E5E0B7);
  smooth();
}

void draw() {
  arch(c);
  sopracciglio();
  eye(40, 0);
  eye(0, 6);
 
}
void arch(float curvature) {
  pushMatrix();
  translate((width/2)+65, ((height/4)*3)-25);
  float y=90.0;
  float sw=(65.0 - curvature)/4.0;
  strokeWeight(sw);
  noFill();
  beginShape();
  vertex(15.0, y);
  bezierVertex(15.0, y-curvature, 30.0, 55.0, 50.0, 55.0);
  bezierVertex(70.0, 55.0, 85.0, y-curvature, 85.0, y);
  rotate(radians(180));
  scale(1.0, 0.9);
  endShape();
  popMatrix();
}


void sopracciglio(){
  pushMatrix();
  translate(width/2, height/5 + 20);
  fill(0);
  //left
  line(0, 0, -30, -15);
  //right
  line(25, 0, 50, -20);
  popMatrix();
}
  
void eye(int x, int y) {
  //smooth();
  noStroke();
  pushMatrix();
  translate(width/2, height/3);
  fill(255);
  ellipse(x, y, 60, 60);
  fill(0);
  ellipse(x+10, y, 25, 25);
  fill(255);
  ellipse(x+17, y-5, 4, 4);
  popMatrix();
}






