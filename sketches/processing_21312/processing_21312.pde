
///////////////////////////////////////////
//                                       //
// Credits:                              //
// Toxiclibs for the fantastic libraries //
// James Clark for poking                //
//                                       //
///////////////////////////////////////////




import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

VerletPhysics2D physics;
AttractionBehavior gravityWell;

float xIncrement;
float yIncrement;
float randomCounter = 9.7;
int counter;
ArrayList smallParts = new ArrayList();
ArrayList mediumParts = new ArrayList();
ArrayList largeParts = new ArrayList();
int holes = 0;

Vec2D wellPos;

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

  counter = holes;

  if(counter < 4) {
    quadrants(counter);
  } 
  else if (counter < 70) {
    center();
  } 
  else {
     randomSpot();
  }  

  physics.update();
  for (int i = 0; i < smallParts.size(); i++) {
    VerletParticle2D p = (VerletParticle2D) smallParts.get(i);   //Cast returned item as SphereItem Class
    fill(0,200,0);
    ellipse(p.x, p.y, 5, 5);
  }
  for (int h = 0; h < mediumParts.size(); h++) {
    VerletParticle2D p = (VerletParticle2D) mediumParts.get(h);   //Cast returned item as SphereItem Class
    fill(255,0,0);
    ellipse(p.x, p.y, 20, 20);
  }
  for (int j = 0; j < largeParts.size(); j++) {
    VerletParticle2D p = (VerletParticle2D) largeParts.get(j);   //Cast returned item as SphereItem Class
    fill(0,0,255);
    ellipse(p.x, p.y, 50, 50);
  }
}

void buildGrid() {
  float xIncrement = width/3;
  float yIncrement = height/3;
  float ran;
  for (int i = 0; i < width; i += xIncrement) {
    for (int j = 0; j < height; j += yIncrement) {
      for (int h = 0; h < 10; h++) {
        ran = random(0,10);
        if (ran < 6) {
          VerletParticle2D p = new VerletParticle2D(Vec2D.randomVector().scale(5).addSelf(i + (20 * h),j + (20 * h)));
          physics.addParticle(p);
          physics.addBehavior(new AttractionBehavior(p, 20, -1.2f, 0.01f));
          smallParts.add(smallParts.size(), p);
        } 
        else if (ran < 9) {
          VerletParticle2D p = new VerletParticle2D(Vec2D.randomVector().scale(5).addSelf(i + (20 * h),j + (20 * h)));
          physics.addParticle(p);
          physics.addBehavior(new AttractionBehavior(p, 40, -2.2f, 0.01f));
          mediumParts.add(mediumParts.size(), p);
        } 
        else {
          VerletParticle2D p = new VerletParticle2D(Vec2D.randomVector().scale(5).addSelf(i + (20 * h),j + (20 * h)));
          physics.addParticle(p);
          physics.addBehavior(new AttractionBehavior(p, 60, -4f, 0.01f));
          largeParts.add(largeParts.size(), p);
        }
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

void randomSpot() {
  // float ranX = random(0,width);
  float ranY = random(3 * height/2,height);
  float r = random(0,10);
  if(r > (randomCounter + 0.02999)) {
    wellPos = new Vec2D(width/2, ranY);
    gravityWell = new AttractionBehavior(wellPos, 300, 0.9f);
    physics.addBehavior(gravityWell);
  }
}  

