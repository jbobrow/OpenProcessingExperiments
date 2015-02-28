
int circleX = 0;
int circleY = 0;
int speedX = 1;
int speedY = 10;


void setup() {
  size (500, 402);
  stroke(.1);
  background(250, 60, 150);
}
void draw () {
  
  fill(255, mouseX,  mouseY);
  circleX = circleX + speedX;
  circleY = circleY + speedY;
  ellipse(circleX, circleY, circleY, circleY);
  if (circleY > height) {
    speedY = -1 * speedY;
  }
  if (circleY < 0) {
    speedY = -1* speedY;}
    if (circleX > width) {
      circleX = 0;}



}
