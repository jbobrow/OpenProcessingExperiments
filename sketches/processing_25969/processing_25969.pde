
void setup(){
size (900,450);
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
b=b+mouseY;
c=mouseY;
d=d+mouseX;
e=e+2;
stroke(100,255,200);
if (a>500) {a=a+2;}
line(a,a,e,d);
line(a,d+mouseX,e,a);
stroke(240, 15, 130);
line(a,e,900,mouseY/3);
if (mousePressed) {
line (a,b,c,d);
line (a*2,b*2,c*2,d*2);
stroke(int(random(100)),int(random(255)),int(random(155))) ;
line (mouseX,e, height/6, int(random(150)));
}
}               
