
float r;
float g;
float b;
float a;

float x;
float y;
float width;
float high;

void setup () {
  size (500,500);
  background (152,206,187);
  colorMode (RGB, 255,255,255,100);
}

void draw () {
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(100);
  
  x = random(500);
  y = random(500);
  width = random(300);
  high = random (300);
  
  
  noFill ();
  stroke(255);
  rect (x,y,width, width);
}

void mousePressed() {
  fill(152,206,187);
  rect(0,0,500,500);
}


