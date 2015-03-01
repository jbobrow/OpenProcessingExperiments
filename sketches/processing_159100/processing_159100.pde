
float r;
float g;
float b;
float a;

float d;
float i;
float c;
float o;

float diam;
float x;
float y; 

void setup(){
  size(1000,1000);
  background(255);
  noSmooth();
}
void draw(){
  r = random(245);
  g = random(5); 
  b = random(177);
  a = random(255);
  d = random(5);
  i = random(245);
  c = random(239);
  o = random(255);
  diam = random(100);
  x = random(width);
  y = random(height);
  
  noStroke();
  fill(r,g,b,a);
  rect(x,y,diam,diam);
  fill(d,i,c,o);
  ellipse(x,y,diam,diam);
  fill(d,i,c,o);
  triangle(30,75,58,20,x,y);
  }
  


