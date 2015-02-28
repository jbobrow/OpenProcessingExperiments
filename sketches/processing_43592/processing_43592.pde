
//PROJECT 2
//Seth Baird
//Will Greer

import traer.physics.*; // imports the traer physics library

//These set up the parameters for the particle system and its forces
ParticleSystem system1;
Particle[] particles;
Particle force1;
Particle force2;
//Ball Array
Ball [] balls;
//These are the floats of the x and y locations for attractors
float x;
float x1;
float y;
float y1;

int numBalls = 250;//number of balls in sketch
float friction = .01;//Sets up the interaction between balls

PImage pic;//Brings in our image into the sketch

void setup() {

  size(500, 500);//Sets up the size of the sketch
  noStroke();
  smooth();
  //This sets up the number of balls and particles in the system 'ParticleSystem'
  system1 = new ParticleSystem (0, .2);
  particles = new Particle[250];
  balls = new Ball[250];

  x = width/2;
  x1 = 150;
  y = height/2;
  y1 = 150;

  pic = loadImage("MyBalls.jpg");//Loads the image

    //introducing i and sets parameters
  for (int i = 0; i < numBalls; i++) { //sets up the size of the particles
    particles[i] = system1.makeParticle(25, random(0, width), random(0, height), 0.0);

    //random vertex width and height & sets ball size
    balls[i] = new Ball(100, 100, 5, particles[i], color(255, 0), random(10, 20), balls);
  }
  //These are the parameters for the attraction points we added to the sketch
  force1 = system1.makeParticle(1, x, y, 0);
  force1.makeFixed();
  force2 = system1.makeParticle(1, x1, y1, 0);
  force2.makeFixed();
  //This determines how strong the forces are
  for (int i=0; i<numBalls; i++) {
    system1.makeAttraction(force1, particles [i], 200, 50);
    system1.makeAttraction(force2, particles [i], 200, 50);
  }
  //This sets up where the forces are located on the sketch
  force1.position().set(random(0, 250), random(0, 250), 0);
  force2.position().set(random(250, 500), random(250, 500), 0);
}

void draw() {

  system1.tick();
  background(0, 20);
  color c;

  int mx = width/2;
  int my = height/2;
  noStroke();
  //This draws the particle attractors
  point(force1.position().x(), force1.position().y());
  point(force2.position().x(), force2.position().y());
  //Correlates the class with draw and how the balls interact on the sketch
  for (int i = 0; i < numBalls; i++) {
    balls[i].move();
    balls[i].collide();
    balls[i].display();
  }
}
//sets up the class for the balls
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
  //Determines the physics of each ball and how it interacts when it hits another ball
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
  //Gives the balls their velocity and position
  void move() {

    x = p.position().x();
    y = p.position().y();
    x1 = p.position().x();
    y1 = p.position().y();

    x += vx;
    y += vy;
    x1 += vx;
    y1 += vy;
  }
  //Syncs the class with void draw
  void display() { 
    noStroke();

    int nx = int(x);            
    int ny = int(y);
    c = pic.get(int(x), int(y));//determines the color of each ball

    fill(c);//Based off of the image
    ellipse(x, y, ballDiameter, ballDiameter);//The balls are created using the constructer
  }
}


