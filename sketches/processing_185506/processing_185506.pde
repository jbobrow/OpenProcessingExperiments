
float r;
float g;
float b;
float a;
float diam;
float x;
float y;


void setup() {
  size(200,200);
  background(255);
  smooth();    
}

void draw() {
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = 20;
  x = 20*(int)(random(1,10));
  y = 20*(int)(random(1,10));
  //attempted to reassign x + y to random value between 10-200 at intervals of 10
  
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
}



