
//fer
//libraries
import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
//image

//for table

int NUM_PARTICLES;
//for thing moving
VerletPhysics2D physics;
AttractionBehavior mouseAttractor;
//AttractionBehavior initialP;
//ConstantForceBehavior initialP; nice try but no
VerletSpring2D initialP;


Vec2D mousePos;
//Vec2D initialP;
VerletParticle2D p;


//float[] values = new float[100];
//
//for (int i = 0; i < values.length; i ++ ) {
//  values[i] = 0;
//}  

void setup() {
  size(600, 600);
  smooth();


  NUM_PARTICLES = 10;
  // setup physics with 10% drag
  physics = new VerletPhysics2D();
  physics.setDrag(0.05f);
  physics.setWorldBounds(new Rect(0, 0, width, height));
}

Vec2D prevP;//d = new Vec2D[rowCount];
float[] prevX = new float[11];
float[] prevY  = new float[11];

void addParticle() {


  for ( int row =0 ; row< 10; row++) {

    float[] x = new float[10];
    x[row] = random(10);
    float[] y = new float[10];
    y[row] = random(10);
    x[row]= map(x[row], 1, 10, 50, 500); // map those values in to a consistent way  
    y[row]= map(y[row], 1, 10, 500, 50);
    prevX[row] =  x[row];
    prevY[row] =  y[row];

    p =  new VerletParticle2D(x[row], y[row]);

    //println(x);
    //prevP = p.getPreviousPosition();

    physics.addParticle(p);

    //println(a);
  }
  println(prevX);
}



void draw() {
  background(250);
  fill(60, 210);
  text("ann", 300, 20);
  text("romney", 20, 300);

  if (physics.particles.size() < NUM_PARTICLES) {
    addParticle();
  }
  physics.update();
  for (VerletParticle2D p : physics.particles) {
    fill(250, 0, 0, 50);
    ellipse(p.x, p.y, 5, 5);
  }
  noFill();
  strokeWeight(3);
  stroke(2, 20);
  line(300, 0, 300, 600);
  line(0, 300, 600, 300);
}


void mousePressed() {

  mousePos = new Vec2D(mouseX, mouseY);
  // create a new positive attraction force field around the mouse position (radius=250px)
  mouseAttractor = new AttractionBehavior(mousePos, 60, 0.9f, 1.2);
  physics.addBehavior(mouseAttractor);
  //physics.setDrag(.01);
}

void mouseDragged() {
  // update mouse attraction focal point
  mousePos.set(mouseX, mouseY);
}

void mouseReleased() {
  // remove the mouse attraction when button has been released
  physics.removeBehavior(mouseAttractor);

  //  AttractionBehavior ret = new AttractionBehavior(prevP, 1000, 1.9f, 1.2);
  //  physics.addBehavior(ret);

  for ( int row =0 ; row< 10; row++) {
    prevP = new Vec2D(prevX[row], prevY[row]);
    //initialP = new AttractionBehavior.setAttractor(prevP);
    
    initialP = new VerletSpring2D(p,p,10.1,10.2);
    physics.addSpring(initialP);
    physics.update();


    // println("2:"+prevX[row]);
    // p.setPreviousPosition(prevP);
    //p =  p.setPreviousPosition(prevP);
    //physics.addParticle(p);
    // println(prevP);
    
    
  }
  
}


