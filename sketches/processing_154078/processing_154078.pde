
float x,y, angle,radius=220;

void setup() {
  size(500, 500);
  background(0);
  //frameRate(5);
  colorMode(HSB,255,100,100);
}

void draw() {

  x = width/2 + cos(angle)*radius;
  y = height/2 + sin(angle)*radius;
  fill(frameCount%255,90,90);
  noStroke();
  ellipse(x, y, 5, 5);
  if (frameCount%15==0) radius -= 2;
  angle += radians(137.5);
  if (radius<10) noLoop();
}

