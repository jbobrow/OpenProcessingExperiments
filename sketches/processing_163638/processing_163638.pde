
int numBalls = 20;
float spring = 0.02;
float gravity = 0.09;
float friction = -0.8;
Ball[] balls = new Ball[numBalls];
void setup() 
{
  
  size(1000,1000,P3D);

smooth();
frameRate(20);
for (int i = 0; i < numBalls; i++) {
  float r = random(width);
  balls[i] = new Ball(r, random(height), r ,random(20, 40), i, balls);
}
}
void draw() 
{ 
  background(255);
  lights();
  rotateX(PI/12);

noStroke();
if(mousePressed)
{for (int i = 0; i < numBalls; i++) {
//balls[i].collide();
balls[i].move();
balls[i].display(); 
}
}
for (int i = 0; i < numBalls; i++) {
balls[i].collide();
balls[i].move();
balls[i].display(); 
}
}
class Ball {
float x, y,z;

float diameter;
float vx = 0;
float vy = 0;
float vz = 0;
int id;

Ball[] others;
Ball(float xin, float yin, float zin, float din, int idin, Ball[] oin) {
x = xin;
y = yin;
z = zin;
diameter = din;
id = idin;
others = oin;
}
void collide() {
for (int i = id + 1; i < numBalls; i++) {
float dx = others[i].x - x;
float dy = others[i].y - y;
float dz = others[i].z - z;
float distance = sqrt(dx*dx + dy*dy+ dz*dz);
float minDist = others[i].diameter/2 + diameter/2;
if (distance < minDist) { 
float angle = atan2(dy, dx);
float angle1 = atan2(dy, dz);
float angle2 = atan2(dx, dz);

float targetX = x + cos(angle) * minDist;
float targetY = y + sin(angle) * minDist;
float ax = (targetX - others[i].x) * spring;
float ay = (targetY - others[i].y) * spring;

float targetZ = z + cos(angle1) * minDist;
      targetY += y + sin(angle1) * minDist;
float az = (targetZ - others[i].z) * spring;
      ay += (targetY - others[i].y) * spring;

      targetZ += z + cos(angle2) * minDist;
      targetX += x + sin(angle2) * minDist;
      az += (targetZ - others[i].z) * spring;
      ax += (targetX - others[i].x) * spring;



vx -= ax;
vy -= ay;
vx -= az;
others[i].vx += ax;
others[i].vy += ay;
others[i].vz += az;
}
} 
}
void move() {
vy += gravity;
x += vx;
y += vy;
z += vz;
if (x + diameter/2 > width) {
x = width - diameter/2;
vx *= friction; 
}
else if (x - diameter/2 < 0) {
x = diameter/2;
vx *= friction;
}
if (y + diameter/2 > height) {
y = height - diameter/2;
vy *= friction; 
} 
else if (y - diameter/2 < 0) {
y = diameter/2;
vy *= friction;
}
if (z + diameter/2 > width) {
z = width - diameter/2;
vz *= friction; 
}
else if (z - diameter/2 < 0) {
z = diameter/2;
vz *= friction;
}
}
void display() {

  
fill(109,0,0);
drawSphere(diameter, x,y);
}
}

void drawSphere(float r, float x, float y)
{
  translate(x,y);
  sphere(r);
  translate(-x,-y);
}
