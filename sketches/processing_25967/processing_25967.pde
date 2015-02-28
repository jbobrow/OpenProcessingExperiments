
void setup(){
size (500,350);
background(0);
stroke(0,255,0);
}
int a=0;
int b=175;
int c=255;
int d=350;
int e=500;

void draw(){
a=a+2;
b=b+2;
c=c+2;
d=d+2;
e=e+2;
if (a>500) {a=0;}
line(a,a,e,d);
line(a,d,e,a);
stroke(c,a,a);
line(a,b,e,b);
}
