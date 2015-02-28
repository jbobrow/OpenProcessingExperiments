
void setup() {
  size(640, 480);
  background(0);
  noStroke();
  smooth();
}

void draw() {
  float x1 = map(pmouseX, 0, height, 20, 40);
  float y1 = map(pmouseY, 0, width, 20, 40);
  fill(255);
  ellipse(200,220,100+(x1*2),100+(y1*2));
  ellipse(400,220,100+(x1*2),100+(y1*2));
  fill(#56A5EC);
  ellipse(200,220,50+x1,50+y1);
  ellipse(400,220,50+x1,50+y1);
  fill(255);
  //stroke(1);
  ellipse(215,200,10+x1,10+y1);
  ellipse(415,200,10+x1,10+y1);
  
}




