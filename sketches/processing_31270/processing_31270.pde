
float r;
float g;
float b;
float a;
 
float diam;
float x;
float y;

void setup()
{
  
  size(800,800);
  background(0);
  smooth();
  
}
void draw() {
  
  r = random(155);
  g = random(155);
  b = random(155);
  a = random(155);
  diam = random(155);
  x = random(width);
  y = random(height);
  
  noStroke();
  fill(r,g,b,a);
  rect(x,y,diam,diam);
}
  


