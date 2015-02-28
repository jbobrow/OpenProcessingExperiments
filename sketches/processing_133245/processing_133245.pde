
int x= 0;
int y= 0;
int z= 0;
int h= 0;
int i= 0;
int j= 0;
int k= 0;
int a = 1;
int b = 6;
int c = 5;
int d = 7;
int e = 6;
int f = 5;
int g = 1;
int m = 13;
void setup(){
size(500,300);
}
int gaussify(int x) {
    int res = x * randomGaussian()
    return res > 0 ? res : 0;
}
void draw (){
  frameRate (30);
  noStroke ();
  background (142,229,238);
  fill (131,111,255);
  ellipse (x,10,10,10);
  if (x==300);
  x=x+gaussify(a);
  if ((x<0)||(x>500)){
    a = a*-1;
  }
fill (145,44,238);
ellipse (z,50,10,10);
  if (z==300);
  z=z+c;
  if ((z<0)||(z>500)){
    c = c*-1;
  }
fill (125,38,205);
ellipse (y,90,10,10);
if (y==300);
y=y+b;
  if ((y<0)||(y>500)){
    b = b*-1;
  }
fill (85,26,139);
ellipse (h,130,10,10);
if (h==300);
h=h+d;
  if ((h<0)||(h>500)){
    d = d*-1;
  }
fill (125,38,205);
ellipse (i,170,10,10);
if (i==300);
i=i+e;
  if ((i<0)||(i>500)){
    e = e*-1;
  }
  fill (145,44,238);
ellipse (j,210,10,10);
  if (j==300);
  j=j+f;
  if ((j<0)||(j>500)){
    f = f*-1;
  }
   fill (131,111,255);
  ellipse (x,250,10,10);
  if (x==300);
  x=x+a;
  if ((x<0)||(x>500)){
    a = a*-1;
  }
  fill (159,121,238);
  ellipse (k,290,10,10);
  if (k==300);
  k=k+g;
  if ((k<0)||(k>500)){
    g = g*-1;
  }
strokeWeight (2);
stroke (176,23,31);
line (0,25,500,25);
line (0,65,500,65);
line (0,105,500,105);
line (0,145,500,145);
line (0,185,500,185);
line (0,225,500,225);
line (0,265,500,265);
}
