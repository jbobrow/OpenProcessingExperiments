
void setup(){
  background(255);
size(600,300);
frameRate(100);
}
float xn1=10;
float yn1=0;
float zn1=5;
//
float xn2=9.99999;
float yn2=0.00001;
float zn2=4.99999;

//float t;

float dt=0.01;
float sigma=10;
float rho=28;
float beta=8/3;

float tt;
float x1,y1,z1;
float xx1,yy1,zz1;
float x2,y2,z2;
float xx2,yy2,zz2;
float f1,f2,f3;
float t=0;
float tn=0;

float radi=5;
float scale=6;

void draw(){
//background(200);
//
f1=sigma*(yn1-xn1);
f2=xn1*(rho-zn1)-yn1;
f3=xn1*yn1-beta*zn1;
//
x1=xn1+dt*f1;
y1=yn1+dt*f2;
z1=zn1+dt*f3;
//
xx1=scale*x1+height/2;
yy1=scale*y1+height/2;
zz1=scale*z1+height/2;
//
f1=sigma*(yn2-xn2);
f2=xn2*(rho-zn2)-yn2;
f3=xn2*yn2-beta*zn2;
//
x2=xn2+dt*f1;
y2=yn2+dt*f2;
z2=zn2+dt*f3;
//
xx2=scale*x2+height/2;
yy2=scale*y2+height/2;
zz2=scale*z2+height/2;
t=t+dt;
tt=50*t;
//t=width/2;
//
fill(200,0,0);
stroke(200,0,0);
ellipse(tt,xx1,radi,radi);
//fill(200,0,0);
//ellipse(width/2,yy,radi,radi);
//fill(0,0,200);
//ellipse(width/2,zz,radi,radi);
//
fill(0,0,200);
stroke(0,0,200);
ellipse(tt,xx2,radi,radi);

xn1=x1;
yn1=y1;
zn1=z1;

xn2=x2;
yn2=y2;
zn2=z2;

tn=t;

if(tt>=width){
t=0;
background(255);
}

}

