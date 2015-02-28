
MainChar mainchar;
int num=60;
float cx[] = new float[num];
float cy[] = new float[num];
PImage space;
float x2=0;
float y2=0;
int m2=3;
float x3=0;
float y3=0;
int m3=7;
float x4=0;
float y4=0;
int m4=10;
float x5=0;
float y5=0;
int m5=9;

import javax.swing.JOptionPane;

void setup() {
smooth();
noStroke();
size (1000, 600);
mainchar = new MainChar(width/2, height/2, 2);
y2=height/2;
y3=height/4;
y4=height/6;
y5=width/5;
}
void draw() {
background(#83D8E8);
mainchar.Movement();

fill(0, 10);
rect(0, 0, width, height);

fill(255, 215, 0);
ellipse(x2, y2, 30, 30);
fill(100, 215, 50);
ellipse(x3, y3, 30, 30);
fill(25, 82, 247);
ellipse(x4, y4, 30, 30);
fill(25, 238, 247);
ellipse(x5, y5, 30, 30);

if (x2>width) {
m2=m2*(-1);
}

if (x2<0) {
m2=m2*(-1);
}

x2+=m2;

if (x3>width) {
m3=m3*(-1);
}

if (x3<0) {
m3=m3*(-1);
}

x3+=m3;

if (x4>width) {
m4=m4*(-1);
}

if (x4<0) {
m4=m4*(-1);
}

x4+=m4;

if (x5>width) {
m5=m5*(-1);
}

if (x5<0) {
m5=m5*(-1);
}

x5+=m5;
}

class MainChar {
int x=0;
int y=0;
int m=0;

public MainChar(int x, int y, int m) {
this.x=x;
this.y=y;
this.m=m;
}
public int getX() {
return x;
}
public int getY() {
return y;
}

public void Movement() {
int which = frameCount % num;
cx[which] = x;
cy[which] = y;

if (keyPressed) {
if (keyCode == 38) {
y-=5;
}
if (keyCode == 37) {
x-=5;
}
if (keyCode == 39) {
x+=5;
}
if (keyCode == 40) {
y+=5;
}
}
if (x>width) {
x=0;
}
if (x<0) {
x=width;
}
if (y>height) {
y=0;
}
if (y<0) {
y=height;
}
for (int i = 0; i < num; i++) {
int index = (which+1 + i) % num;
fill (#030303);
ellipse(cx[index], cy[index], i/2, i/2);
}
}
}

