
void setup() {
  size(200,200);
}
int x = 200;
int y = 100;
int a = 255;
int s = 110;
int w = 0;
int f = 255;
int h = 0;

void draw() {
background(h,f,a);
a = a-2;
f = f-1;
h = h+1;
if(w==200)
{
  w = 0;
}
if(x==0)
{
  x = 200;
}
if(h==255)
{
h = 0;
f = 255;
a = 255;
}
fill(a,f,h);
ellipse(x,s,10,10);
ellipse(x,120,10,10);
ellipse(x,130,10,10);
ellipse(x,140,10,10);
ellipse(x,150,10,10);
ellipse(x,160,10,10);
ellipse(x,170,10,10);
ellipse(x,180,10,10);
ellipse(x,190,10,10);
ellipse(x,200,10,10);
fill(f,a,h);
ellipse(w,y,10,10);
ellipse(w,80,10,10);
ellipse(w,70,10,10);
ellipse(w,60,10,10);
ellipse(w,50,10,10);
ellipse(w,40,10,10);
ellipse(w,30,10,10);
ellipse(w,20,10,10);
ellipse(w,10,10,10);
ellipse(w,0,10,10);
ellipse(w,90,10,10);
x = x-1;
w = w+1;
}


