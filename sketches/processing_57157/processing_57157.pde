
int w;
int h;
int x1;
int y1;
int x2;
int y2;
int a;
int b;

void setup(){
  size(500,500);
  frameRate(10);
  
  w=100;
  h=w;
  x1=150;
  y1=150;
  x2=x1+w*2;
  y2=y1+h*2;
  a=w/3;
  b=0;
}

void draw
(){fill(153);
 
  
background(180, 180, 180);
  line(x1+b, y1-b, x1+w-b, y1+b);
  line(x1+b, y1+h-b, x1+a-b, y1+h+b);
  line(x1+b, y1+b, x1-b, y1+h-b);
  line(x1+w+b, y1+b, x1+w-b, y1+a-b);
  line(x1+a+b, y1+a-b, x1+w-b, y1+a+b);
  line(x1+a+b, y1+a+b, x1+a-b, y1+h-b);

  line(x2-b, y1+b, x2-w+b, y1-b);
  line(x2-b, y1+h+b, x2-a+b, y1+h-b);
  line(x2+b, y1+b, x2-b, y1+h-b);
  line(x2-a-b, y1+a+b, x2-w+b, y1+a-b);
  line(x2-a+b, y1+a+b, x2-a-b, y1+h-b);

  line(x1+b, y2-b, x1+w-b, y2+b);
  line(x1-b, y2-b, x1+b, y2-h+b);
  line(x1+w-b, y2-b, x1+w+b, y2-a+b);
  line(x1+a+b, y2-a-b, x1+w-b, y2-a+b);
  line(x1+a-b, y2-a-b, x1+a+b, y2-h+b);
 
  line(x2-b, y2+b, x2-w+b, y2-b);
  line(x2-b, y2-b, x2+b, y2-h+b);
  line(x2-a-b, y2-a+b, x2-w+b, y2-a-b);
  line(x2-a-b, y2-a-b, x2-a+b, y2-h+b);
  
 b=b+1;
}

