
import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

VerletPhysics2D physics;
AttractionBehavior mouseAttractor;

float xIncrement;
float yIncrement;
ArrayList smallParts = new ArrayList();
ArrayList mediumParts = new ArrayList();
ArrayList largeParts = new ArrayList();

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
  background(55);
  noStroke();
  physics.update();
  for (int i = 0; i < smallParts.size(); i++) {
    VerletParticle2D p = (VerletParticle2D) smallParts.get(i);   //Cast returned item as SphereItem Class
    fill(255);
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


