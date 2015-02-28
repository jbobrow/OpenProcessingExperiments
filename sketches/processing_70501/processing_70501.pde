
import processing.opengl.*;

import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

import toxi.math.conversion.*;
import toxi.geom.*;
import toxi.math.*;
import toxi.geom.mesh2d.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh.*;
import toxi.math.waves.*;
import toxi.util.*;
import toxi.math.noise.*;

import toxi.processing.*;

final int RANDOM = 1;
final int AGE = 2;
final int FRACTAL = 3;
final int FIXED = 4;

int condition = AGE;
int rule_number = FIXED;

PeasyCam cam;
ToxiclibsSupport gfx;
PGraphics3D g3; 
PMatrix3D currCameraMatrix;

ArrayList<Box> boxes = new ArrayList<Box>();
ArrayList<Box> newBoxes = new ArrayList<Box>();

boolean camera_setted = false;

void setup() {

  size(1200, 800, OPENGL);
  g3 = (PGraphics3D)g;

  cam = new PeasyCam(this, 500);
  gfx = new ToxiclibsSupport(this);

  zero();
}

void zero() {
  boxes = new ArrayList<Box>();
  newBoxes = new ArrayList<Box>();

  boxes.add(new Box(0, 0, 0, 600, 600, 0));

  update();

  background(250);
  gfx.origin(10);
  lights();
}

float m =0 ;
void draw() {

  // update
  update();

  // draw
  background(250);
  gfx.origin(10);
  lights();

  rotateZ(m);
  m += 0.001;

  for (Box p : boxes) {
    pushMatrix();
    translate(p.x, p.y, p.z+p.deep/2);

    fill(0+ p.generation*25); //, 100);
    stroke(0);


    box(p.width, p.height, p.deep);
    popMatrix();
  }

  gui();

  // frame saving
  if (frameCount%15==0 && camera_setted) {  
    //saveFrame("randomized_quad###.png");
    //background(255, 0, 0);
  }
}

void gui() {
  pushMatrix();
  pushStyle();
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  currCameraMatrix = new PMatrix3D(g3.camera);
  camera();
  noLights();

  //noStroke();
  fill(255, 255, 255, 100);
  rect(5, 20, 180, 55);
  fill(100, 0, 0);
  stroke(100, 0, 0);
  text("change rule - press q,w,e", 10, 30);
  text("change condition - press a,s", 10, 50);
  text("reset - press .", 10, 70);

  hint(ENABLE_DEPTH_TEST);
  cam.endHUD();
  g3.camera = currCameraMatrix;
  popStyle();
  popMatrix();
}

void update() {
  if (newBoxes.size()>0) {
    boxes.addAll(newBoxes); 
    newBoxes.clear();
  }
  for (Box p : boxes) {
    p.grow();
  }
}

void generateChilds(Box parent) {

  switch(rule_number) {
  case FRACTAL : 
    ruleFractal(parent); 
    break;
  case FIXED : 
    ruleFixed(parent); 
    break;
  case RANDOM : 
    ruleRandom(parent); 
    break;
  }
}

void keyPressed() {
  camera_setted = true;
  //zero(); 
  //k = 0;

  switch((int)key) {
  case '.': 
    {
      zero();
      break;
    }
  case 'q': 
    rule_number = FRACTAL; 
    break;
  case 'w': 
    rule_number = FIXED; 
    break;
  case 'e': 
    rule_number = RANDOM; 
    break;

  case 'a': 
    condition = AGE; 
    break;
  case 's': 
    condition = RANDOM; 
    break;
  }
}


