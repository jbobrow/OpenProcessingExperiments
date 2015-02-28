
int rad = 40;
float x = width -40;
float speed = 0.5;

void setup() {
  size(200,120);
  smooth();
  ellipseMode(RADIUS);
}

void draw(){
  background(0);
  fill(255,255,0);
  x += 2*speed;
  arc(x, 60, rad , rad, 0.55,5.5);
  
  if (x > width + 40)
    x = -40;
}

