
float angle = 0.0;
float offset = 60;
float scalar = 2;
float speed = 0.01;
void setup() {
  frameRate(120);
  size(600,600);
  background(255);
  smooth();
}
void draw(){
  translate(240,240);
  pushMatrix();
  rotate(angle - offset);
  float x= offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  ellipse(x,y,1,1);
  angle += speed;
  scalar += speed;
  popMatrix();
}
