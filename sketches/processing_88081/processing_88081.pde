
int x=250;
int y=250;
int nx=250;
int ny=250;
s=10;

void setup() { 
  size(500, 500);
  background(255);
}

void draw() { 
stroke(0,225-(s*20)); 
  strokeWeight(10/s); 
  curve(x+random(s*2)-s,y+random(s*2)-s,x,y,nx,ny,nx+random(s*2)-s,ny+random(s*2)-s);
  x=nx;
  y=ny;
  nx=nx+random(s*4)-s*2;
  ny=ny+random(s*4)-s*2;
  if (dist(x,y,nx,ny)>s/.6){s++;} else {s--;}
  if (s<1) {s=1;}
  if (s>10) {s=10;}
}
