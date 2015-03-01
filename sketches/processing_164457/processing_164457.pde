
float x = 0.0;
float y = 0.0;
float easing = 0.05; // Numbers 0.0 to 1.0
float speed = 0.0;

void setup() {
  size(500, 500);
//  noStroke();
  noCursor();
}

void draw() {
  noStroke();
  background(0);
  float targetX = mouseX;
  float targetY = mouseY;
  float dx = targetX - x;
  float dy = targetY-y;
  float target = dist(mouseX, mouseY, pmouseX, pmouseY);
  float y1 = 33;
  float y2 = 66;
  x += (targetX - x) * easing;
  y += (targetY - y) * easing;
  speed += (target - speed) * easing;

  if (abs(dx) > 1.0)  {
    x += dx * easing;
  }

  if (abs(dy) > 1.0)  {
    y += dy * easing;
  }

pushMatrix();
  fill(120,250,250,100);
  ellipse(mouseX, mouseY, 50, 50);
  fill(255,255,75,80);
  quad(x,y,0,60,0,0,60,0);
  fill(250,120,120,100);
  rect(0,y, speed*15, y);
  popMatrix();
  
  pushMatrix();
  float angle = atan2(mouseY-y1, mouseX-x);
  translate(x, y1-50);
  rotate(angle);
  stroke(255);
  line(0, 0, 500, 0);
  popMatrix();
}


