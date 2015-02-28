
int h;
int w;
int thickness;
int a;
int x;
int y;

void setup(){
  size(500,500);
  
  h=200;
  w=100;
  a=10;

  x=100;
  y=120;
  
 }

void draw
(){
background (255);
//x=(int)random(500);
//y=(int)random(500);

line(x+a,y,x+w-a,y);        //top
line(x+a,y+h,x+w-a,y+h);    //bottom
line(x,y+a,x,y+h-a);        //left
line(x+w,y+a,x+w,y+h-a);    //right

line(x+a,y,x,y+a);          //corners
line(x+w-a,y,x+w,y+a);
line(x,y+h-a,x+a,y+h);
line(x+w,y+h-a,x+w-a,y+h);
//triangle
//line(x, y, x+w, y+h);
// line(x, y, x+w*2, y);
//line(x+w*2, y, x+w, y+h);
// line(x+w, y, x+w, y+h);
  
//x=x+10;
}

