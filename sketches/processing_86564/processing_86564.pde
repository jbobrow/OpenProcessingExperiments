

import traer.physics.*;
import peasy.*;
import processing.pdf.*;
boolean record;

ParticleSystem solarsystem;
Particle sun;
Particle[] bodies;
Particle[] asteroids;
int[] orbitSize;
PeasyCam cam;

int numberofbodies = 8;
int numberofasteroids = 32;

void stars () {
  for (int i = 1; i <2500; i++) {
    float xs = random (1590);
    float ys = random (780);
    float ds = random (1,2);
    float starColor = random (64,192);
    fill (starColor);
    ellipse (xs, ys, ds, ds);
  }
}

void setup () {
  
  size (780,390,P3D);
  cam = new PeasyCam(this,780);
  frameRate (60);
  background (0);
  smooth ();
  noStroke ();
  
  solarsystem = new ParticleSystem (0, 0);
  sun = solarsystem.makeParticle (100,0,0,0);
  sun.makeFixed();
  
  bodies = new Particle[numberofbodies];
  for (int i=0; i < bodies.length; i++) {
    float distancetoSun = random (600)+50;
    float wiggle = random (-2,2);
    //makeParticle (mass,x,y,z)
    bodies[i] = solarsystem.makeParticle(1, distancetoSun, 0, 0);
    bodies[i].velocity().set(wiggle, 100/sqrt(distancetoSun), wiggle);
    bodies[i].makeFree();
    // a,b,strength,minimum distance
    solarsystem.makeAttraction(sun, bodies[i], 100, 1);
  }
  
  asteroids = new Particle[numberofasteroids];
  for (int i=0; i < asteroids.length; i++) {
    float distancetoSun = random (400)+800;
    float positionSplit = random (-0.75,0.75);
    //makeParticle (mass,x,y,z)
    asteroids[i] = solarsystem.makeParticle(1, distancetoSun*(1-positionSplit), 0, distancetoSun*positionSplit);
    float velo = 100/sqrt(distancetoSun);
    float velocitySplit = random (-0.5,0.5);
    asteroids[i].velocity().set(0, velo*(1-velocitySplit), velo*velocitySplit);
    asteroids[i].makeFree();
    // a,b,strength,minimum distance
    solarsystem.makeAttraction(sun, asteroids[i], 100, 1);
  }
  
  orbitSize = new int[numberofbodies];
  for (int i=0; i < bodies.length; i++) {
    int orbitS = int(random (8,20));
    orbitSize[i] = orbitS;
  }
  
  cam.beginHUD();
  stars ();
  cam.endHUD();
  
}

void draw () {
  
  //activate the background to eliminate orbits
  //background (0,1);
  
  noStroke();
  fill(255);
  sphere (20);
  
  for (int i=0; i < bodies.length; i++) {
    fill(255, 128);
    int bodysize = orbitSize[i];
    ellipse (bodies[i].position().x(), bodies[i].position().y(), bodysize, bodysize);
  }
  
  for (int i=0; i < asteroids.length; i++) {
    fill(128);
    int bodysize = 4;
    ellipse (asteroids[i].position().x(), asteroids[i].position().y(), bodysize, bodysize);
  }
  
  solarsystem.tick();
  
}

void keyPressed() {
  if (key == BACKSPACE) {
    background (0);
    cam.beginHUD();
    stars ();
    cam.endHUD();
  }
  //if (key == ENTER) {
  //  millis();
  //  save(millis()+".tif");
  //}
}

