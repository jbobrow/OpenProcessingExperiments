
float x;
float y;
float px;
float py;
float easing = 0.1;

void setup () {
  size (600,600);
  background (#ff33cc);
  smooth ();
  stroke (#330099, 102);
}

void draw () {
  if (mousePressed == true) {
    stroke (#ffff33, 102);
  }
  if (mousePressed == false) {
    stroke (#330099, 102);
  }
  
  float targetX = mouseX;
  x += (targetX - x) * easing;
  float targetY = mouseY;
  y += (targetY - y) * easing;
  float weight = dist(x, y, px, py);
  strokeWeight (weight);
  line (x, y, px, py);
  py = y;
  px =x;
}

