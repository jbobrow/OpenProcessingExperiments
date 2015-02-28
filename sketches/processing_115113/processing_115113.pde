
float v=50;
float z=50;

float t=300;
float u=300;

float k=50;
float l=50;




int a1=75;
int a2=100;

float deg=270;
float r2=250;

int tx=300;
int ty=300;

float s=0;

void setup(){
size(450,400);
background(255);
}
void draw(){


pushMatrix();
translate(tx, ty);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50,50);  //black
fill(255);
rect(-0,-2,r2,5);
r2=r2+0;
popMatrix();












pushMatrix();
translate(tx+150, ty+150);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/4,50/4);  //black
fill(255);
rect(-0,-2,r2/4,5/4);
r2=r2+0;
popMatrix();





pushMatrix();
translate(tx+105, ty+105);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/4,50/4);  //black
fill(255);
rect(-0,-2,r2/4,5/4);
r2=r2+0;
popMatrix();







pushMatrix();
translate(tx+25, ty+105);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/2,50/2);  //black
fill(255);
rect(-0,-2,r2/2,5/2);
r2=r2+0;
popMatrix();



arc(t, u, 80, 80, 0,s);
t=t-2;
u=u-1;
s=s+0.03;


pushMatrix();
translate(250,250);
arc(k, l, 50, 50, 0,s);
k=k+1;
l=l-1;
s=s+0.03;
popMatrix();

pushMatrix();
translate(250,250);
arc(v, z, 10, 10, 0,s);
v=v+1;
z=z+2;

s=s+0.03;
popMatrix();













































pushMatrix();
translate(-100,-100);
pushMatrix();
translate(tx, ty);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50,50);  //black
fill(255);
rect(-0,-2,r2,5);
r2=r2+0;
popMatrix();












pushMatrix();
translate(tx+150, ty+150);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/4,50/4);  //black
fill(255);
rect(-0,-2,r2/4,5/4);
r2=r2+0;
popMatrix();





pushMatrix();
translate(tx+105, ty+105);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/4,50/4);  //black
fill(255);
rect(-0,-2,r2/4,5/4);
r2=r2+0;
popMatrix();







pushMatrix();
translate(tx+25, ty+105);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/2,50/2);  //black
fill(255);
rect(-0,-2,r2/2,5/2);
r2=r2+0;
popMatrix();



arc(t, u, 80, 80, 0,s);
t=t-2;
u=u-1;
s=s+0.03;


pushMatrix();
translate(250,250);
arc(k, l, 50, 50, 0,s);
k=k+1;
l=l-1;
s=s+0.03;
popMatrix();

pushMatrix();
translate(250,250);
arc(v, z, 10, 10, 0,s);
v=v+1;
z=z+2;

s=s+0.03;
popMatrix();
popMatrix();


















//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

pushMatrix();
translate(tx, ty);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50,50);  //black
fill(255);
rect(-0,-2,r2,5);
r2=r2+0;
popMatrix();












pushMatrix();
translate(tx+150, ty+150);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/4,50/4);  //black
fill(255);
rect(-0,-2,r2/4,5/4);
r2=r2+0;
popMatrix();





pushMatrix();
translate(tx+105, ty+105);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/4,50/4);  //black
fill(255);
rect(-0,-2,r2/4,5/4);
r2=r2+0;
popMatrix();







pushMatrix();
translate(tx+25, ty+105);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/2,50/2);  //black
fill(255);
rect(-0,-2,r2/2,5/2);
r2=r2+0;
popMatrix();



arc(t, u, 80, 80, 0,s);
t=t-2;
u=u-1;
s=s+0.03;


pushMatrix();
translate(500,500);
arc(k, l, 50, 50, 0,s);
k=k+1;
l=l-1;
s=s+0.03;
popMatrix();

pushMatrix();
translate(250,250);
arc(v, z, 10, 10, 0,s);
v=v+1;
z=z+2;

s=s+0.03;
popMatrix();













































pushMatrix();
translate(-0,-0);
pushMatrix();
translate(tx, ty);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50,50);  //black
fill(255);
rect(-0,-2,r2,5);
r2=r2+0;
popMatrix();












pushMatrix();
translate(tx+150, ty+150);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/4,50/4);  //black
fill(255);
rect(-0,-2,r2/4,5/4);
r2=r2+0;
popMatrix();





pushMatrix();
translate(tx+105, ty+105);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/4,50/4);  //black
fill(255);
rect(-0,-2,r2/4,5/4);
r2=r2+0;
popMatrix();







pushMatrix();
translate(tx+25, ty+105);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/2,50/2);  //black
fill(255);
rect(-0,-2,r2/2,5/2);
r2=r2+0;
popMatrix();



arc(t, u, 80, 80, 0,s);
t=t-2;
u=u-1;
s=s+0.03;


pushMatrix();
translate(250,250);
arc(k, l, 50, 50, 0,s);
k=k+1;
l=l-1;
s=s+0.03;
popMatrix();

pushMatrix();
translate(250,250);
arc(v, z, 10, 10, 0,s);
v=v+1;
z=z+2;

s=s+0.03;
popMatrix();
popMatrix();
















//SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS

pushMatrix();
translate(50,-150);

pushMatrix();
translate(tx, ty);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50,50);  //black
fill(255);
rect(-0,-2,r2,5);
r2=r2+0;
popMatrix();












pushMatrix();
translate(tx+150, ty+150);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/4,50/4);  //black
fill(255);
rect(-0,-2,r2/4,5/4);
r2=r2+0;
popMatrix();





pushMatrix();
translate(tx+105, ty+105);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/4,50/4);  //black
fill(255);
rect(-0,-2,r2/4,5/4);
r2=r2+0;
popMatrix();







pushMatrix();
translate(tx+25, ty+105);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/2,50/2);  //black
fill(255);
rect(-0,-2,r2/2,5/2);
r2=r2+0;
popMatrix();



arc(t, u, 80, 80, 0,s);
t=t-2;
u=u-1;
s=s+0.03;


pushMatrix();
translate(250,250);
arc(k, l, 50, 50, 0,s);
k=k+1;
l=l-1;
s=s+0.03;
popMatrix();

pushMatrix();
translate(250,250);
arc(v, z, 10, 10, 0,s);
v=v+1;
z=z+2;

s=s+0.03;
popMatrix();













































pushMatrix();
translate(-100,-100);
pushMatrix();
translate(tx, ty);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50,50);  //black
fill(255);
rect(-0,-2,r2,5);
r2=r2+0;
popMatrix();












pushMatrix();
translate(tx+150, ty+150);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/4,50/4);  //black
fill(255);
rect(-0,-2,r2/4,5/4);
r2=r2+0;
popMatrix();





pushMatrix();
translate(tx+105, ty+105);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/4,50/4);  //black
fill(255);
rect(-0,-2,r2/4,5/4);
r2=r2+0;
popMatrix();







pushMatrix();
translate(tx+25, ty+105);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/2,50/2);  //black
fill(255);
rect(-0,-2,r2/2,5/2);
r2=r2+0;
popMatrix();



arc(t, u, 80, 80, 0,s);
t=t-2;
u=u-1;
s=s+0.03;


pushMatrix();
translate(250,250);
arc(k, l, 50, 50, 0,s);
k=k+1;
l=l-1;
s=s+0.03;
popMatrix();

pushMatrix();
translate(250,250);
arc(v, z, 10, 10, 0,s);
v=v+1;
z=z+2;

s=s+0.03;
popMatrix();
popMatrix();


















//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

pushMatrix();
translate(tx, ty);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50,50);  //black
fill(255);
rect(-0,-2,r2,5);
r2=r2+0;
popMatrix();












pushMatrix();
translate(tx+150, ty+150);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/4,50/4);  //black
fill(255);
rect(-0,-2,r2/4,5/4);
r2=r2+0;
popMatrix();





pushMatrix();
translate(tx+105, ty+105);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/4,50/4);  //black
fill(255);
rect(-0,-2,r2/4,5/4);
r2=r2+0;
popMatrix();







pushMatrix();
translate(tx+25, ty+105);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/2,50/2);  //black
fill(255);
rect(-0,-2,r2/2,5/2);
r2=r2+0;
popMatrix();



arc(t, u, 80, 80, 0,s);
t=t-2;
u=u-1;
s=s+0.03;


pushMatrix();
translate(500,500);
arc(k, l, 50, 50, 0,s);
k=k+1;
l=l-1;
s=s+0.03;
popMatrix();

pushMatrix();
translate(250,250);
arc(v, z, 10, 10, 0,s);
v=v+1;
z=z+2;

s=s+0.03;
popMatrix();













































pushMatrix();
translate(-0,-0);
pushMatrix();
translate(tx, ty);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50,50);  //black
fill(255);
rect(-0,-2,r2,5);
r2=r2+0;
popMatrix();












pushMatrix();
translate(tx+150, ty+150);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/4,50/4);  //black
fill(255);
rect(-0,-2,r2/4,5/4);
r2=r2+0;
popMatrix();





pushMatrix();
translate(tx+105, ty+105);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/4,50/4);  //black
fill(255);
rect(-0,-2,r2/4,5/4);
r2=r2+0;
popMatrix();







pushMatrix();
translate(tx+25, ty+105);
fill(0);
rotate(radians(deg));
deg=deg+10;
rect(-25,-25,50/2,50/2);  //black
fill(255);
rect(-0,-2,r2/2,5/2);
r2=r2+0;
popMatrix();



arc(t, u, 80, 80, 0,s);
t=t-2;
u=u-1;
s=s+0.03;


pushMatrix();
translate(250,250);
arc(k, l, 50, 50, 0,s);
k=k+1;
l=l-1;
s=s+0.03;
popMatrix();

pushMatrix();
translate(250,250);
arc(v, z, 10, 10, 0,s);
v=v+1;
z=z+2;

s=s+0.03;
popMatrix();
popMatrix();
popMatrix();


















  
}


