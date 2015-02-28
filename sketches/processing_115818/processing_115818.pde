
float x = 100;   // x location of square
float y = 0;     // y location of square

float speed = 0;  
float gravity = 0.1;  
float c1 = 0;      
float c2 = 250;
float c1dir = 0.5;  
float c2dir = -0.5;

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100, 100);
  background(214,21,29);
  
}

void draw() {
  
  strokeWeight(0.1);
  stroke(c1, 50, c2+20, 80);
  noFill();
  
  
  triangle(0,height/2, x, y, width, height/2);

  c1=c1+c1dir;
  c2 = c2+c2dir;  
  y = y + 2*speed;
  speed = speed + gravity;
  x= 400*sin(y);

  if (y > height) {
    speed = speed * -0.95;
  }
  if (c1 < 0 || c1 > 360) {
    c1dir *= -1;
  }

  if (c2 < 0 || c2 > 100) {
    c2dir *= -1;
  }
}



