
float swing_angle=30;
void setup() {
  size(300, 300);
}
void draw() {
  background(100);
  float angle=sin(frameCount*.03)*swing_angle;
  //translate(width/2,height/2);
  translate(width/2, 0);
  rotate(radians(angle));
  line(0, 0, 0, 100);
  fill(10, 80, 80);
  ellipse(0, 100, 20, 20);
}

