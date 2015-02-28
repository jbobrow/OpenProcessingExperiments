
float angle = 0.0;
float angle2 = 0.0;
float offset = 60;
float scalar = 5;
float speed = 0.05;

void setup() {
  size(200, 200);
  smooth();
  background(255);
}

void draw() {
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle2);

  float x1 = (offset + (cos(angle) * scalar))-60;
  float x2 = (offset + (cos(angle + 0.5) * scalar))-60;
  float x3 = (offset + (cos(angle + 1) * scalar))-60;

  float y2 = (offset + sin(angle + 0.4) * scalar)-60;
  float y3 = (offset + sin(angle + 0.8) * scalar)-60;
  float y1 = (offset + sin(angle) * scalar)-60;
  ellipse(x1, y1, cos(angle)*(scalar*.1), cos(angle)*(scalar*.1));
  ellipse(x2, y2, cos(angle)*(scalar*.1), cos(angle)*(scalar*.1));
  ellipse(x3, y3, cos(angle)*(scalar*.1), cos(angle)*(scalar*.1));

  popMatrix();
  angle += .25;
  scalar += .25;
  println(x2, " ", y2, angle, " ", scalar);
  angle2 += 1;
/*  if (frameCount % 10 == 0) {
    saveFrame("image-####.gif");
  }*/
  if (scalar >= 80.0) {
    scalar = 5;
    background(255);
    //noLoop();
  }
}



