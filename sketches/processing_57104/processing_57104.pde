
int h;
int h1;
int w;
int x;
int y;
int x1;
int y1;
int sw;
 
void setup (){
  size(500,500);
  h=70;
  h1=50;
  w=45;
  x=160;
  y=160;
  x1=188;
  y1=150;
  }
 
void draw (){
  background(0);
  stroke (255);
  strokeWeight (6);
  line (x1,y,x+w,y+h);
  line (x+w,y+h,x,y+h*2);
  line (x,y+h*2,x+w*2,y+h1*2);
  line (x+w*2,y+h1*2,x+w*4,y+h*2);
  line (x+w*4,y+h*2,x+w*3,y+h);
  line (x+w*3,y+h,x+w*4,y);
  line (x+w*4,y,x+w*2,y+h1);
  line (x+w*2,y+h1,x,y);
 
 
 
}
