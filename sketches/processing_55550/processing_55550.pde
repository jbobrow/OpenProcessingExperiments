
//Monissa Chakrabartty YSDN 2012
float speed = 2.5;
int diameter = 35;
float x;
float y;

void setup() {
  size (480, 240);
  noStroke();
  smooth();
  x = width;
  y = height;
}

void draw() {
  //Background
  fill(255,5);
  rect(0, 0, 480, 240);
  frameRate(8);
  //Circles
  fill(random(10,120),random(10,10),random(10,120),random(100,300));
  x += random(-speed, speed);
  y += random(-speed, speed);
  x = constrain(x, 0, width);
  y = constrain(y, 0, height);
  ellipse(random(x), random(y), diameter, diameter);
  ellipse(random(x), random(y), diameter + 15, diameter + 15);
  ellipse(random(x), random(y), diameter - 15, diameter - 15);
}

