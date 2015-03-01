
float i = 0;
void setup() {
  size(300, 300);
}
void draw() {
  //background(255);
i=i+0.05;
float posicionX = 100*sin(i);
float posicionY = 100*cos(i);
  ellipse(width/2+posicionX, height/2+posicionY, 20, 20);
}
