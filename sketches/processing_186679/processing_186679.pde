
float i = 0;
void setup() {
  size(300, 300);
}
void draw() {
  //background(36);
i=i+0.01;
float posicionX = 130*sin(i);
float posicionY = 46*cos(i);
  fill(74,80,96);
strokeWeight(10);
  ellipse(width/2+posicionX, height/2+posicionY, 20, 20);
}

