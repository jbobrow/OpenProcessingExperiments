
float x =0;
float y=0;

float x2=0;
float y2=0;
float easing= 0.01;
float nEasing= 0.05;
void setup() {
  size(1200, 700);
  stroke(10, 50);
  background(254);
  frameRate(100);
  fill(50);
  textSize(12);
  textAlign(RIGHT);
  text("press the left mouse button to refresh", width-250, height-6);
}
void draw() {

  strokeWeight(0.2);
  x+=(mouseX-x)*easing;
  y+=(mouseY-y)*easing;

  x2+=(mouseX-x2)*nEasing;
  y2+=(mouseY-y2)*nEasing;
  line(x, y, x2, y2);
  if (mousePressed) {
    background(254);
    text("press the left mouse button to refresh", width-250, height-6);
  };

}
