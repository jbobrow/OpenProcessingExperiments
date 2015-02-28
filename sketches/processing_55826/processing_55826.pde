
int h;
int w;
int thickness;
int a;
int x;
int y;

void setup(){
  size(500,500);
  
  h=20;
  w=130;
  a=10;

  x=100;
  y=120;
  
 }

void draw(){
  background (255);
  
  line(x,y,x+w,y);
  line(x,y+h,x+w,y+h);
  line(x,y,x,y+h);
  
  noFill();
 
  arc(x+w-w/5, y+h/2, h*4, h*4, TWO_PI-PI/1.1, TWO_PI+PI/1.1);
  arc(x+w, y+h/2, h, h, TWO_PI-PI/2, TWO_PI+PI/2);

}

