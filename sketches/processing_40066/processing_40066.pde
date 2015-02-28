
float x, y;
float speed;
void setup() {
  size(200, 200);
  x = 0.0;
  y = height/2.0;
  speed = 1.0;
}
 
void draw() {
  background(204);
  x += speed;
  if (x > width+60) {
    x = -60;
    y = random(30, width-45);
  }
  translate(x, y);
  drawBus();
}

void drawBus() {
  rectMode(CENTER);
  rect(0,0,120,60);
  ellipse(-35,30,30,30);
  ellipse(35,30,30,30);
  ellipse(-35,30,20,20);
  ellipse(35,30,20,20);
  rectMode(CORNER);
  rect(45,-20,15,20);
  rect(-5,-20,30,20);
  rect(-50,-20,30,20);
}
