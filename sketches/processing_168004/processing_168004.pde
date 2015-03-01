
int x=150;
int k=#FF0000;
int a=90;
int b=220;
int c=130;
int d=170;
int e=150;
int f=130;
int g=170;
int h=150;
int i=150;
int j=150;



void setup ()
{
size(1000,350);
background(#FF0000);
}

void draw ()
{
background(k);
fill(#030303);
stroke(0);
ellipse(x,200,170,170);
x=x+2;
k=k+1000;


fill(#030303);
stroke(#030303);
ellipse(a,100,110,110);
a=a+2;


fill(#030303);
stroke(#030303);
ellipse(b,100,110,110);
b=b+2;


fill(#FAEEE3);
stroke(#FAEEE3);
ellipse(c,180,60,110);
c=c+2;


fill(#FAEEE3);
stroke(#FAEEE3);
ellipse(d,180,60,110);
d=d+2;

fill(#FAEEE3);
stroke(#FAEEE3);
ellipse(e,250,145,75);
e=e+2;

fill(#030100);
stroke(#030100);
ellipse(f,180,25,60);
f=f+2;

fill(#030100);
stroke(#030100);
ellipse(g,180,25,60);
g=g+2;

fill(#FAEEE3);
stroke(#030100);
strokeWeight(8);
ellipse(h,245,100,60);
h=h+2;

fill(#FAEEE3);
stroke(#FAEEE3);
ellipse(i,233,110,40);
  i=i+2;

fill(#030100);
stroke(#030100);
ellipse(j,225,40,20);
j=j+2;


}
  
