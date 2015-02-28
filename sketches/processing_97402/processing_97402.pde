
float Aa;
float Ta;

void setup(){
  size(800, 800);
  strokeWeight(10);
  smooth(8);
  Aa = 0;
  Ta = 0;
}
void draw(){
  stroke(0, 30, 30);
  background(0, 150, 100);
  Aa = Aa + radians(3);
  Ta = Ta + radians(-3);
  pushMatrix();
  noFill();
  translate(mouseX, mouseY);
  rotate(Ta);
  triangle(-50, -50, -95,35 ,-50, 35);
  popMatrix();
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(Aa);
  line(-25, 0, 25, 0);
  line(0, -25, 0, 25);
  popMatrix();
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(Ta);
  line(50, -50, 100,-50);
  line(90, -50, 70, 35);
  popMatrix();
}
