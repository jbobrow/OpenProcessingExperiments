

import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

VerletPhysics2D physics;
AttractionBehavior gravityWell;
AttractionBehavior mouseAttractor;
AttractionBehavior partAttractor;

float xIncrement;
float yIncrement;
float ellipseX, ellipseY;
float partDist;
float randomCounter = 9.7;
int counter;
ArrayList smallParts = new ArrayList();
ArrayList attractions = new ArrayList();
ArrayList killList = new ArrayList();
int holes = 0;
int index;

Vec2D wellPos;
Vec2D mousePos;

void setup() {
  size(600, 600,P3D);
  // setup physics with 10% drag
  physics = new VerletPhysics2D();
  physics.setDrag(0.05f);
  physics.setWorldBounds(new Rect(0, 0, width, height));
  // the NEW way to add gravity to the simulation, using behaviors
  // physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.15f)));

  buildGrid();
}

void draw() {
  background(0);
  noStroke();
  // check aa counter to see where to put grav well
  ellipseX = mouseX;
  ellipseY = mouseY;
  fill(255,0,0);
  ellipse(ellipseX,ellipseY,50,50);
  physics.update();
  for (int i = 0; i < smallParts.size(); i++) {
    VerletParticle2D p = (VerletParticle2D) smallParts.get(i);   //Cast returned item as SphereItem Class
    AttractionBehavior ab = (AttractionBehavior) attractions.get(i);
    partDist = dist(p.x, p.y, ellipseX, ellipseY);
    if (partDist < 25) {
      physics.removeParticle(p);
      physics.removeBehavior(ab);
      smallParts.remove(i);
      attractions.remove(i);
    }
  }
  for (int i = 0; i < smallParts.size(); i++) {
    VerletParticle2D p = (VerletParticle2D) smallParts.get(i);
    fill(0,200,0);
    ellipse(p.x, p.y, 5, 5);
  }  
}

void buildGrid() {
  float xIncrement = width/3;
  float yIncrement = height/3;
  float ran;
  for (int i = 0; i < width; i += xIncrement) {
    for (int j = 0; j < height; j += yIncrement) {
      for (int h = 0; h < 40; h++) {
        VerletParticle2D p = new VerletParticle2D(Vec2D.randomVector().scale(5).addSelf(i + (20 * h),j + (20 * h)));
        physics.addParticle(p);
        partAttractor = new AttractionBehavior(p, 20, -1.2f, 0.01f);
        physics.addBehavior(partAttractor);
        smallParts.add(smallParts.size(), p);
        attractions.add(attractions.size(), partAttractor);
      }
    }
  }
}

void quadrants(int i) {
  float r = random(0,10);
  if(r > randomCounter) {
    switch(i) {
    case 0:
      wellPos = new Vec2D(width/4, height/4);
      break;
    case 1:
      wellPos = new Vec2D((3 * width/4), height/4);
      break;
    case 2:
      wellPos = new Vec2D(width/4, (3 * height/4));
      break;
    default:
      wellPos = new Vec2D((3 * width/4), (3 * height/4));
      break;
    }  
    gravityWell = new AttractionBehavior(wellPos, 300, 0.9f);
    physics.addBehavior(gravityWell);
    holes += 1;
  }
}  

void center() {
  float r = random(0,10);
  if(r > randomCounter) {
    wellPos = new Vec2D(width/2, height/2);
    gravityWell = new AttractionBehavior(wellPos, 300, 0.9f);
    physics.addBehavior(gravityWell);
    holes += 1;
  }
}  
void mousePressed() {
  mousePos = new Vec2D(mouseX, mouseY);
  // create a new positive attraction force field around the mouse position (radius=250px)
  mouseAttractor = new AttractionBehavior(mousePos, 300, 0.9f);
  physics.addBehavior(mouseAttractor);
}

void mouseDragged() {
  // update mouse attraction focal point
  mousePos.set(mouseX, mouseY);
}

void mouseReleased() {
  // remove the mouse attraction when button has been released
  physics.removeBehavior(mouseAttractor);
}


