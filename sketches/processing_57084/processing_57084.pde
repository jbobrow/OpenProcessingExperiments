
int w;
int h;
int x1;
int y1;
int x2;
int y2;
int x3;
int y3;

void setup(){
  size(500,500);
  frameRate(1);
  
  w=50;
  h=w;
  x1=200;
  y1=200;
  x2=x1+w;
  y2=y1+w;
  x3=x1+w/2;
  y3=y1+w/2;
}

void draw
(){
background (255);

  rect(x1, y1, w, h);
  rect(x2, y1, w, h);
  rect(x1, y2, w, h);
  rect(x2, y2, w, h);
  rect(x3, y3, w, h);
  
x3=x3+1;
y3=y3-1;
}

