
PImage img;



float deltaT = 0.7;
float gravity = 1;
float damping = 0.8;
int MAX_PARTICLES = 10000;
Particle[] ptc;

void setup()
{
 size(600, 600, P2D);
 // initialise particles
 img =loadImage("g.JPG"); 

 ptc = new Particle[MAX_PARTICLES];
 int cnt = MAX_PARTICLES;
 while (--cnt >=0) {
 ptc[cnt] = new Particle( random(0, width), random(0, height),
 (int)random(260, 255), (int)random(30, 255), (int)random(80, 255), random(220,220));

 }
}

void draw()
{
 background(255);
image(img,width/2 -img.width/2,0);
 int cnt = MAX_PARTICLES;
 while (--cnt >=0) {
 float force = 0;
 
 ptc[cnt].update(0, force);
 ptc[cnt].draw();
 
 }
}

class Particle {
 float x, y; // position
 float vx, vy; // velocity
 float ax, ay; // acceleration
 float m; // mass
 int r, g, b; // color
 Particle (float xpos, float ypos, int red, int gre, int blu, float mass) {
 x = xpos;
 y = ypos;
 r = red;
 g = gre;
 b = blu;
 m = mass;
 ax = 0;
 ay = gravity;
 }
 void update(float fx, float fy) {
 // velocty update
 vx += deltaT * (ax + fx/m);
 vy += deltaT * (ay + fy/m);
 // position update
 x += deltaT - vx;
 y += deltaT - vy;
 if (y> height) {
 y = height;
 vy = -damping*vy;
 
 }
 }
 
 
 void draw() {
 stroke(r, g, b);
 strokeWeight(30);
 point(x, y);


 }
}
