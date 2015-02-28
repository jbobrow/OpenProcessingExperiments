
float x;
float y;
float px;
float py;
float easing = 0.09;

void setup() {
  size(1000, 600);
  background(255);
  smooth();
 
}

void draw() {
   stroke(random(255),random(255),random(255));
  if(mousePressed){
  float targetX = mouseX;
  x += (targetX - x) * easing;
  float targetY = mouseY;
  y += (targetY - y) * easing;
  float weight = dist(pmouseX, pmouseY, px, py);
  strokeWeight(weight);
  line( px, py, x, y);
  py = y;
  px = x;
  }
}



