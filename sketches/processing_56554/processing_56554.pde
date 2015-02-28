
int w;
int h;
int x1;
int y1;
int x2;
int y2;
int a;

void setup(){
  size(500,500);
  frameRate(20);
  
  w=60;
  h=w;
  x1=50;
  y1=50;
  x2=x1+400;
  y2=y1+400;
  a=w/2;
}

void draw
(){
  background (255);
  
  line(x1, y1, x1+w, y1);
  line(x1, y1+h, x1+a, y1+h);
  line(x1, y1, x1, y1+h);
  line(x1+w, y1, x1+w, y1+a);
  line(x1+a, y1+a, x1+w, y1+a);
  line(x1+a, y1+a, x1+a, y1+h);

  line(x2, y1, x2-w, y1);
  line(x2, y1+h, x2-a, y1+h);
  line(x2-w, y1, x2-w, y1+a);
  line(x2, y1, x2, y1+h);
  line(x2-a, y1+a, x2-w, y1+a);
  line(x2-a, y1+a, x2-a, y1+h);

  line(x1, y2-h, x1+a, y2-h);
  line(x1, y2, x1+w, y2);
  line(x1, y2, x1, y2-h);
  line(x1+w, y2, x1+w, y2-a);
  line(x1+a, y2-a, x1+w, y2-a);
  line(x1+a, y2-a, x1+a, y2-h);
 
  line(x2, y2-h, x2-a, y2-h);
  line(x2, y2, x2-w, y2);
  line(x2-w, y2, x2-w, y2-a);
  line(x2, y2, x2, y2-h);
  line(x2-a, y2-a, x2-w, y2-a);
  line(x2-a, y2-a, x2-a, y2-h);

  w=w+1;
  h=h+1;
}

