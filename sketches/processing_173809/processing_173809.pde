
float x, y, a, b, c, m, n;

void setup() {
  size(1200, 600);
  background(255);
  a=5;
  b=98;
  c=245;
  x=0.000001;
  y=0.000001;
  m=1;
  n=0.5;
}

void draw() {
  //background(255);
  strokeWeight(2);
  stroke(a, b, c);
  point(x, y);
  if ((x>=width)|| (y>=height)) {
    x=mouseX;
    y=mouseY;
    //background(255);
    stroke(a=random(255), b=random(255), c=random(255) );
    //point(x=random(0, width), y=random(0, height));
    point(x, y);
  } 
  if ((x<=0)|| (y<=0)) {
    x=mouseX;
    y=mouseY;
    //background(255);
    stroke(a=random(255), b=random(255), c=random(255));
    //point(x=random(0, width), y=random(0, height));
    point(x, y);
  }
  x=x+m;
  y=y+n;
  
}

void mousePressed() {
  m=-m;
  n=-n;
}

