
int h;
int h1;
int w;
int x;
int y;

void setup (){
  size(550,400);
  h=70;
  h1=50;
  w=55;
  x=160;
  y=160;
  }

void draw (){
  background(0);
  stroke (255);
  strokeWeight (4);
  line (x,y,x+w,y+h);
  line (x+w,y+h,x,y+h*2);
  line (x,y+h*2,x+w*2,y+h1*2);
  line (x+w*2,y+h1*2,x+w*4,y+h*2);
  line (x+w*4,y+h*2,x+w*3,y+h);
  line (x+w*3,y+h,x+w*4,y);
  line (x+w*4,y,x+w*2,y+h1);
  line (x+w*2,y+h1,x,y);

  
 line (x+w,y+h,x+w*2,y+h1);
 line (x+w*2,y+h1,x+w*3,y+h);
 line (x+w*3,y+h,x+w*2,y+h1*2);
 line (x+w,y+h,x+w*2,y+h1*2);
 
 line (x,y,x+w*4,y);
 line (x,y,x,y+h*2);
 line (x,y+h*2,x+w*4,y+h*2);
 line (x+w*4,y+h*2,x+w*4,y);
 
 line (x+w*2,y-h*3,x+w*2,y+h*6);


 line (x,y,x-w*4,y-h1*2);
 line (x+w*4,y,x+w*8,y-h1*2);
 line (x,y+h*2,x-w*4,y+h1*4);
 line (x+w*4,y+h*2,x+w*8,y+h1*4); 


if(h1>0){h1=h1-150;}


}
