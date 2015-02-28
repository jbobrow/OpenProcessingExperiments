
import guicomponents.*;

import game2dai.utils.*;
import game2dai.steering.*;
import game2dai.maths.*;
import game2dai.fsm.*;
import game2dai.entityshapes.*;
import game2dai.entities.*;
import game2dai.graph.*;
import game2dai.*;

final int NBR_BOIDS = 200;

World w;
Domain wd;
StopWatch sw = new StopWatch();

Vehicle boid;
Vehicle[] boids;
SB sb;
SB[] sbarray;
BoidPic view;
float deltaTime;
int backcol, boidcol;
long count = 0;

void setup() {
  size(800, 600);
  createGUI();
  customGUI();

  w = new World(width, height, 67, 0);
  wd = new Domain(0, 0, width - 200, height);
  w.setNoOverlap(true);

  view = new BoidPic(8, color(220, 220, 255));	
  setColors(1);


  sb = new SB();
  sb.enableBehaviours(SBF.WANDER | SBF.FLOCK);
  sb.setWanderDetails(6, 30, 100);
  sb.setFlockRadius(50);
  sb.setWeight(SBF.WANDER, 1);
  sb.setWeight(SBF.ALIGNMENT, 8);
  sb.setWeight(SBF.COHESION, 2.2);
  sb.setWeight(SBF.SEPARATION, 1.3);
  sb.setWeight(SBF.FLOCK, 16.0);

  boids = new Vehicle[NBR_BOIDS];
  sbarray = new SB[NBR_BOIDS];
  for (int i = 0; i < NBR_BOIDS; i++) {
    float dirX = (rnd(0, 1) < 0.5) ? -1 : 1;
    float dirY = (rnd(0, 1) < 0.5) ? -1 : 1;
    float x = dirX * rnd(5, 10);
    float y = dirY * rnd(5, 10);
    boid = new Vehicle(new Vector2D(), // position
    5, // collision radius
    new Vector2D(), // velocity
    60, // maximum speed
    new Vector2D(), // heading
    1, // mass
    1, // turning rate
    400 // max force
    ); 
    boid.setRenderer(view);
    boids[i] = boid;
    sbarray[i] = (SB) sb.clone();
    boid.setSB(sbarray[i]);
    boid.setWorldDomain(wd);
    w.addMover(boid);
  }
  resetBoids();
  frameRate(1000); // as fast as possible
  sw.reset();
}


void draw() {
  deltaTime = (float) sw.getElapsedTime();

  background(backcol);
  fill(0, 64, 0);
  noStroke();

  w.update(deltaTime);
  w.draw();
  fill(180, 180, 255);
  noStroke();
  rect(600, 0, 200, 600);
  if (++count % 100 == 0) {
    lblFPSvalue.setText(""+frameRate);
    lblCalcTimeValue.setText(""+ (float)w.worldUpdateTime + " s");
  }
}

void changeWeighting(int type, float value) {
  for (int i = 0; i < NBR_BOIDS; i++) 
    sbarray[i].setWeight(type, value);
}

void changeWander() {
  for (int i = 0; i < NBR_BOIDS; i++) 
    sbarray[i].setWanderDetails(wanderJitter, wanderRadius, wanderDist);
}

void changeNeighbourhood(float radius) {
  for (int i = 0; i < NBR_BOIDS; i++) 
    sbarray[i].setFlockRadius(radius);
}

void changeMaxSpeed(float radius) {
  for (int i = 0; i < NBR_BOIDS; i++) 
    boids[i].setMaxSpeed(radius);
}

void resetBoids() {
  for (int i = 0; i < NBR_BOIDS; i++) {
    w.removeMover(boids[i]);
    float x = (width - 200)/2 + random(-150, 150);
    float y = height/2 + random(-150, 150);
    float dirX = (rnd(0, 1) < 0.5) ? -1 : 1;
    float dirY = (rnd(0, 1) < 0.5) ? -1 : 1;
    float vx = dirX * rnd(5, 10);
    float vy = dirY * rnd(5, 10);
    boids[i].setPos(x, y);
    boids[i].setHeading(vx, vy);
    boids[i].setVelocity(vx, vy);
    w.addMover(boids[i]);
  }
}

float rnd(float low, float high) {
  return (float)Math.random()*(high - low) + low;
}

void setColors(int cols) {
  switch(cols) {
  case 2:
    backcol = color(32, 32, 0);
    boidcol = color(0, 255, 0); 
    break;
  case 3:
    backcol = color(200, 255, 200);
    boidcol = color(0); 
    break;
  case 4:
    backcol = color(255, 255, 200);
    boidcol = color(255, 0, 0); 
    break;
  default:
    backcol = color(0, 0, 64);
    boidcol = color(220, 220, 255);
  };
  view.setFill(boidcol);
}


