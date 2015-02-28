
int i, j, c1, c2, imin=2, imax=200, k=0;
float nx, ny, u, ox=0.0, oy=0.0, a=PI/3, aa=-TWO_PI/10;

void setup() {
  size(800, 600);
  background(0);
  frameRate(30);
  c1=width/2;
  c2=height/2;
  u=c1/50;
  i=imin;
  j=0;
}

void draw() {
  j = j + 1;
  if (j==i-1) { 
    j=1; i+=1; a=PI*(i-2)/i;      
  }
  if (i<=imax) { 
    newside(); 
  }
}

void newside() {
  nx=ox+u*cos(aa); 
  ny=oy+u*sin(aa);
  smooth();
  noStroke();
  fill(255,0,0);
  ellipse(ox+c1, oy+c2, 5, 5);
  ox=nx; 
  oy=ny; 
  aa-=(PI-a) % TWO_PI/3;///////
  k = k + 1;
}               
