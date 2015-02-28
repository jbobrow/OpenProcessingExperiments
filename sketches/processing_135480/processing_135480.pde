
float i=0;
void setup() {
  size(300, 300);
}
void draw() {
  background(255);
  i=i+0.1;
  float posicionX= 300*sin(1);
  float posicionY= 150*cos(1);
  rect(mouseX,posicionY,pmouseX, posicionY);
  fill(245,0,135);
   line(mouseY,posicionY/i,pmouseY, posicionY);
  fill(random(0));
  i=i+1;
}
