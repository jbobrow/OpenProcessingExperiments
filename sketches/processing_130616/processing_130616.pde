
void setup(){
size(500,500);
rx=450;
ry=70;
ex=100;
ey=400;
rectMode(CENTER);
frameRate(2);
count=20;
kx=20;
ky=20;
}
void draw(){
background(225);
rect(rx,ry,20,20);
ellipse(ex,ey,20,20);
if(count!=0){
h=ey-ry;
d=ex-rx;
dh=h/count;
dd=d/count;
count--;
rx+=dd;
ry+=dh;
ex+=kx;
ey+=ky;
rx%=width;
ry%=height;
ex%=width;
ey%=height;
}
if(rx<0)rx+=width;
if(ry<0)ry+=height;
if(ex<0)ex+=width;
if(ey<0)ey+=height;
}
void mousePressed(){
if(mouseButton==LEFT){
kx=random(20,-20);
ky=random(20,-20);
}else if(mouseButton==CENTER){
ex=ex+100;
ey=ey+100;
}else if(mouseButton==RIGHT){
fx=ex;
ex=ey;
ey=fx;
}
}
