
int w;
int h;
int x1;
int y1;
int x2;
int y2;
int a;
int b;
int c;

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
 line(x1, y1, x1+w, y1-b);
  line(x1-b, y1+h, x1+a-b, y1+h);
  line(x1, y1, x1-b, y1+h);
  line(x1+w, y1-b, x1+w, y1+a-b);
  line(x1+a, y1+a, x1+w, y1+a-b);
  line(x1+a, y1+a, x1+a-b, y1+h);

  line(x2, y1, x2-w, y1-c);
  line(x2+c, y1+h, x2-a+c, y1+h);
  line(x2-w, y1-c, x2-w, y1+a-c);
  line(x2, y1, x2+c, y1+h);
  line(x2-a, y1+a, x2-w, y1+a-c);
  line(x2-a, y1+a, x2-a+c, y1+h);

  line(x1-c, y2-h, x1+a-c, y2-h);
  line(x1, y2, x1+w, y2+c);
  line(x1, y2, x1-c, y2-h);
  line(x1+w, y2+c, x1+w, y2-a+c);
  line(x1+a, y2-a, x1+w, y2-a+c);
  line(x1+a, y2-a, x1+a-c, y2-h);
 
  line(x2+b, y2-h, x2-a+b, y2-h);
  line(x2, y2, x2-w, y2+b);
  line(x2-w, y2+b, x2-w, y2-a+b);
  line(x2, y2, x2+b, y2-h);
  line(x2-a, y2-a, x2-w, y2-a+b);
  line(x2-a, y2-a, x2-a+b, y2-h);

    b=b-1;
    c=c+1;
}

