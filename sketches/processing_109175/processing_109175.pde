
float speed = 2.5;
int diameter = 20;
float x;
float y;
float x2;
float y2;
float x3;
float y3;

void setup() {
  size(600, 300);
  smooth();
  x = width/2;
  y = height/2;
  x2 = x-200;
  y2 = height/2;
  x3 = x + 200;
  y3 = height/2;
}

void draw() {
  x += random(-speed, speed);
  y += random(-speed, speed);
  x2 += random(-speed, speed);
  y2 += random(-speed, speed);
  x3 += random(-speed, speed);
  y3 += random(-speed, speed);
  x = constrain(x, 0, width);
  y = constrain(y, 0, height);
  x2 = constrain(x2, 0, width);
  y2 = constrain(y2, 0, height);
  x3 = constrain(x3, 0, width);
  y3 = constrain(y3, 0, height);
  stroke(0);
  ellipse(x, y, diameter, diameter);
  stroke(224, 27, 60);
  ellipse(x2, y2, diameter, diameter);
  stroke(250, 149, 7);
  ellipse(x3, y3, diameter, diameter);
  if(keyPressed && ((key == 'p') || (key == 'P'))) {
    save("screenshot.png");
    println("Screenshot taken");
  }
}

