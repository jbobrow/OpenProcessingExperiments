
float middleX;
float middleY;
float prevX;
float prevY;
float scaleFactor;
float t;
float r, g, b;

void setup() {
  size(600,400);
  middleX = width/2;
  middleY = height/2;
  scaleFactor = 30;
  t = 0;
  prevX = middleX;
  prevY = middleY;
  line(0, 0, width, height);
  line(0, height, width, 0);
  r = random(255);
  g = random(255);
  b = random(255);
  background(0,0,0);
  
}

void draw() {
  draw(3);
}

void draw(int times)
{
  if (times == 0)
    return;
  stroke(r, g, b);
  float radius = cos(tan(t)) * scaleFactor * random(t/10, t/10 + t/5) + random(-5, 5);
  float x = middleX + radius * sin(cos(t));
  float y = middleY + radius * sin(t);
  line(prevX, prevY, x, y);
  prevX = x;
  prevY = y;
  t += radians(1);
  r += random(-10, 10);
  g += random(-10, 10);
  b += random(-10, 10);
  strokeWeight(random(3 + (t/10)));
  constrain(r, 127, 255);
  constrain(g, 127, 255);
  constrain(b, 127, 255);
  draw(times-1);
}

