

import org.jbox2d.testbed.*;
//import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.p5.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.common.*;
//import org.jbox2d.util.blob.*;
import org.jbox2d.collision.*;
//import org.jbox2d.testbed.timingTests.*;
import org.jbox2d.dynamics.joints.*;

// Physics things we must store
Physics physics;

PFont futura;
int counter = 0;
boolean debug = true, isPressed = false;

// The Quote Params
int quoteLength = 30;

Body[] randomBod = new Body[quoteLength];

String[] quote = {
  "It", "is", "no", "longer", "a",
  "question", "of", "imitation,",
  "nor", "of", "reduplication,", "nor",
  "even", "of", "parody.", "It", "is",
  "rather", "a", "question", "of",
  "substituting", "signs", "of", "the", 
  "real", "for", "the", "real", "itself."  
};

float[] x = {
  72, 102, 139, 194, 311, 70, 222, 268, 72, 138, 184, 72, 138, 223, 273, 72, 102, 140, 250, 284, 70, 115, 313, 70, 115, 178, 253, 311, 374, 450
};

float[] y = {
  53, 53, 55, 45, 58, 107, 111, 111, 172, 166, 161, 231, 231, 221, 218, 287, 287, 282, 298, 287, 342, 342, 347, 401, 402, 402, 402, 402, 402, 402
};

float[] w = {
  17, 22, 39, 105, 19, 136, 33, 152, 55, 33, 227, 55, 74, 33, 124, 17, 22, 98, 19, 136, 33, 183, 82, 33, 48, 59, 46, 48, 59, 80
};

float[] h = {
  30, 30, 25, 45, 20, 41, 36, 37, 20, 36, 45, 20, 20, 36, 45, 30, 30, 35, 20, 41, 36, 45, 41, 36, 35, 35, 36, 35, 35, 36
};

void setup() {
  size(640,480);
  frameRate(30);

  smooth();
  initScene();
  futura = loadFont("Futura-Medium-40.vlw");
  textFont(futura, 40);
  textAlign(CENTER, CENTER);

  cursor(HAND);
}

void draw() {
  background(255, 70);
  fill(0);

  for(int i = 0; i < quoteLength; i++) {
    Vec2 pos = physics.getCMPosition(randomBod[i]);
    float a  = physics.getAngle(randomBod[i]);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    text(quote[i], 0, 0);
    popMatrix();
  }

  if(debug == false) {
    physics.unsetCustomRenderingMethod();
  } 
  else {
    physics.setCustomRenderingMethod(this, "myDrawMethod");
  }
  if(mousePressed || counter == 150) {
    //Reset everything
    physics.destroy();
    isPressed = true;
    initScene();
  }
  if(counter <= 150) {
    counter++;
  }
}

void initScene() {
  physics = new Physics(this, width, height);
  physics.setCustomRenderingMethod(this, "myDrawMethod");

  // Make bounding box
  physics.removeBorder();
  physics.setDensity(0.0f);
  physics.createRect(-1.0, 0.0, -5.0, height);
  physics.createRect(0.0, height, width, height + 5.0);
  physics.createRect(width, 0.0, width + 5.0, height);

  // Create the physics
  if(isPressed == true) {
    physics.setDensity(10.0f);
    physics.setFriction(100.0f);
    physics.setRestitution(.75f);
    isPressed = false;
  }

  for(int i = 0; i < quoteLength; i++) {
    randomBod[i] = physics.createRect(x[i], y[i], x[i] + w[i], y[i] + h[i]);
    Vec2 vel = new Vec2(0,random(0,10.0f));
    randomBod[i].setLinearVelocity(vel);
  }
}

void myDrawMethod(World world) {
  // Do not display any of the Box2
}

void keyReleased() {
  if(debug == true) debug = false;
  else debug = true;
}
















