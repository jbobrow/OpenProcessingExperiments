
int x;
int x2= 200;
int x3= 300;
void setup (){
size (400,400);
smooth ();
noFill();
background (255);
x= 200;
}


void draw(){
  background (255);
fill(255,255,0);
ellipse (x,100,50,50);
x=x+1;
fill(80);
stroke (255,255,0);
ellipse (200,x2,50,50);
  x2=x2-1;
fill (0,0,255);
ellipse (x3,300,50,50);
x3=x3+1;
}
