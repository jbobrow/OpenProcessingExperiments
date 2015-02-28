
void setup(){
  size(400, 60);
  smooth();
  frameRate(30);
  colorMode(HSB, 360, 100, 100);
}

int   r  = 29;
int   x  = -30, dx = 3, y = 30;
int   dh = 5;
float h  = r / sqrt(2);
float colorHue = random(360);

void draw(){
  background(0);
  
  noStroke();
  fill(60, 80, 100);
  for (int i = 30; i < 400; i += 50)  ellipse(i, 30, 10, 10);
  
  fill(0);
  rect(x - 150, 0, 150, 60);
  
  fill(colorHue, 80, 100);
  ellipse(x, 30, 58, 58);

  fill(0);
  triangle(x, y, x + r + dx, y - h, x + r + dx, y + h);
  
  h -= dh;
  if (h <= 0 || (h >= r / sqrt(2)))  dh *= -1;
  
  x += dx;
  
  if (x >= 550) {
    x = -30;
    colorHue = random(360);
    draw();
  }
}



