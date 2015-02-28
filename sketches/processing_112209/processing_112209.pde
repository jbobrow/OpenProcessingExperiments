
float x;
float y;
float n = 0;
float moveX = random(1, 10);
float moveY = random(1, 10);
void setup () {
  size (800, 500);
  x = width/2;
  y = height/2;
}
void draw () {
  x=x+moveX;
  y=y+moveY;
  n=n+0.05;
  float r=noise(n)*67;
  fill(0, random(255), 0, random(255));
  ellipse (random(800), random(500), r, r);
}



