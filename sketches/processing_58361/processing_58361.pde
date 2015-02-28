
Ball balls;
int a, b, g, f, s, d, q,w,e,r,v,u,z,o,p,tr,col, col2, col3;
void setup() {
background(255);
size(600, 750);
smooth();
balls = new Ball();
a = 50;
b = height - 40;
g = 100;
f = b;
s = 150;
d = b;
o = 200;
p = b;
q = width - 160;
w = b;
v = width - 120;
u = b;
z = 40;
e = width - 60;
r = b;
col = 0;
col2 = 0;
col3 = 0;
tr = 0;
}
void draw() {
noStroke();
fill(255,tr);
rect(0,0,width,height);
fill(255);
rect(0, height-80, width, height);
noFill();
balls.display();
balls.go();
noStroke();
fill(255,0,0);
ellipse(a,b,40,40);
noFill();
fill(0,0,255);
ellipse(g,f,40,40);
noFill();
fill(0);
ellipse(s,d,40,40);
noFill();
stroke(0);
fill(255);
ellipse(o,p,40,40);
noFill();
noStroke();
fill(col,col3,col2);
if(col == 255 && col2 == 255 && col3 == 255) {
stroke(0);
}
else {
noStroke();
}
ellipse(q,w,20,20);
ellipse(v,u,40,40);
ellipse(e,r,60,60);
noFill();
noStroke();
}
class Ball {
float x,y,c,vx,vy,angle,gravity;
Ball() {
x = width + 40;
y = height + 40;
gravity = .5;
}
void display() {
fill(col,col3,col2);
ellipse(x,y,z,z);
}
void go() {
if(!mousePressed) {
}
else {
if(dist(a,b,x,y) < 20) {
col = 255;
col2 = 0;
col3 = 0;
}
if(dist(g,f,x,y) < 20) {
col2 = 255;
col = 0;
col3 = 0;
}
if(dist(s,d,x,y) < 20) {
col2 = 0;
col = 0;
col3 = 0;
}
if(dist(o,p,x,y) < 20) {
col = 255;
col2=255;
col3=255;
}
if(dist(q,w,x,y) < 20) {
z = 20;
}
if(dist(v,u,x,y) < 20) {
z = 40;
}
if(dist(e,r,x,y) < 30) {
z = 60;
}
x = mouseX;
y = mouseY;
}
if (y > height - 25) {
y = height - 25;
vy = 1;
}
}
}

