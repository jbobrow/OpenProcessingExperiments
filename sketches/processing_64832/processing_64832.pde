
void mouse(float x, float y, float sw, float angle, float scaling, color c) {
  pushMatrix();
  fill(c, random(255));
  translate(x, y);
  rotate(angle);
  scale(scaling);
  ellipse(0, 0, 100, 100);
  fill(222, 185, 92, 80);
  stroke(235,85,45);
strokeWeight(random(20));
  arc(0, 0, 400, 400, radians(random(15)), radians(random(50,145)));
  popMatrix();
}


void pulse(float x2, float y2){
  pushMatrix();
  translate(x2, y2);
  noFill();
  stroke(255,50);
  ellipse(0, 0, 50, 50);
  popMatrix();
}


