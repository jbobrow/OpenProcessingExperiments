
float r;
float g;
float b;
float a;

float diam;
float x;
float y;
float width;
float height;

void setup () {
  size (500,500);
  background (255);
  
}


void draw () {
  
  r = random(255);
  g = random(50);
  b = random(100);
  a = random(100);
  
  x = random(500);
  y = random(500);
  width = random(150);
  height = random(150);
  
  
  fill (r,g,b,a);
  noStroke();
  ellipse(x,y,100,100);
  
}

