
     import traer.physics.*;

ParticleSystem system1;
Particle[] particles;
Particle force1;
Particle force2;
Particle force3;
Particle force4;
Particle force5;
Ball [] balls;

float x;
float x1;
float y;
float y1;

int numBalls = 50;
float gravity = 0;
float friction = .5;

PImage pic;




void setup() {
size(500, 375);
background(0);
noStroke();
smooth();


system1 = new ParticleSystem (0, .02);
particles = new Particle[50];
balls = new Ball[50];

x = width/2;
x1 = 150;
y = height/2;
y1 = 150;

pic = loadImage("tie dye.jpg");



//introducing i and sets parameters
for (int i = 0; i < numBalls; i++) { 
particles[i] = system1.makeParticle(25, random(0, width), random(0, height), 0.0);


//random vertex width and height & sets ball size
balls[i] = new Ball(100, 100, 5, particles[i], color(255, 100), .5, balls);
}


force1 = system1.makeParticle(1, x, y, 0);
force1.makeFixed();
force2 = system1.makeParticle(1, x, y, 0);
force2.makeFixed();
force3 = system1.makeParticle(1, x, y, 0);
force3.makeFixed();
force4 = system1.makeParticle(1, x, y, 0);
force4.makeFixed();
force5 = system1.makeParticle(1, x, y, 0);
force5.makeFixed();

for (int i=0; i<numBalls; i++) {
system1.makeAttraction(force1, particles [i], 100, 50);//by changing the last 2 numbers the amount of attractivity
system1.makeAttraction(force2, particles [i], 200, 50);//also changes which can also change the pattern that the 
system1.makeAttraction(force3, particles [i], 500, 100);//particles leave
system1.makeAttraction(force4, particles [i], 500, 100);
system1.makeAttraction(force5, particles [i], 500, 100);
}
}









void draw() {

system1.tick();


force1.position().set(250, 185, 20);
force2.position().set(425, 90, 20);
force3.position().set(125, 300, 20);
force4.position().set(125, 75, 20);
force5.position().set(425, 300, 20);
fill(255);
stroke(0);
strokeWeight(.5);






for (int i = 0; i < numBalls; i++) {
balls[i].move();
balls[i].collide();
balls[i].display();

}
}





class Ball {

float x;
float y;


float ballDiameter;
float vx = 0;
float vy = 0;

int id;
Ball[] others;
Particle p;
float r; 
color c;

Ball (float x_, float y_, float r_, Particle p_, color c_, float din, Ball [] oin) {

x = x_;
y = y_;
r = r_;
p = p_;
c = c_;

others = oin;
ballDiameter = din;
}


void collide() {
for (int i = id + 1; i < numBalls; i++) {
float dx = others[i].x - x;
float dy = others[i].y - y;
float distance = sqrt(dx*dx + dy*dy);
float minDist = others[i].ballDiameter/2 + ballDiameter/2;
if (distance < minDist) { 
float angle = atan2(dy, dx);
float targetX = x + cos(angle) * minDist;
float targetY = y + sin(angle) * minDist;
float ax = (targetX - others[i].x);
float ay = (targetY - others[i].y);
vx -= ax;
vy -= ay;
others[i].vx += ax;
others[i].vy += ay;
}
}
}




void move() {

x = p.position().x();
y = p.position().y();
x1 = p.position().x();
y1 = p.position().y();


vy += gravity;
vx += gravity;
x += vx;
y += vy;
x1 += vx;
y1 += vy;


}



void display() { 
noStroke();
c= pic.get(int(x), int(y));
fill(c);
ellipse(x, y, ballDiameter, ballDiameter);
}
}

