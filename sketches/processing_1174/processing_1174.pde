
import peasy.*;

int gonMin = 3;
int gonMax = 15;
int nSides = 10;
int levels = 3; // levels of recursion from base
float overlap = .5; // overlap between sides
float gonRVar = .5; // r variation in each gon
float baseRadius = 60; // radius of base sphere
float levelRadius = .7; // percentage of side for new spheres
float density = .4; // percentage of sides with spheres

Sphere sphere;
PeasyCam cam;

void setup() {
  frameRate(30);
  size(640, 360, P3D);
  colorMode(RGB, 1);
  
  cam = new PeasyCam(this, min(width, height));

  noStroke();
  
  reset();
}

void reset() {
  overlap = random(.1, .6);
  gonRVar = random(.5);
  levelRadius = random(.6, .8);
  density = random(.4, 1);
  
  sphere = new Sphere(gonMin, gonMax, levels, nSides, baseRadius);
}

void draw() {
  background(0);
  if(keyPressed)
    lights();
  sphere.render();
}

void keyReleased() {
  if(keyCode != TAB)
    reset();
}

