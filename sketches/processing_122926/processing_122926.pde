
float dist = 40, radius = dist/2, alpha = 0, speed = 500;
float px, py, x, y, k;

void setup() {
  size(500, 500);
  background(0);
  stroke(#4883FF);
  smooth();
  frameRate(80);
  px = radius;
  py = 0;
}

void draw() {
  k = speed/radius;
  alpha += k;
  radius += dist/(360/k);
  x = radius*cos(radians(alpha));
  y = -radius*sin(radians(alpha));
  translate(width/2, height/2);
  
  line(px, py, x, y);
  
  px = x;
  py = y;
  
}
