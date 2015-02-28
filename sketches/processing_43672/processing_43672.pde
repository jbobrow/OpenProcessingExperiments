
import toxi.geom.*;
import toxi.geom.mesh2d.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.util.datatypes.*;
import toxi.processing.*;

ArrayList <breakCircle> circles = new ArrayList <breakCircle> ();
VerletPhysics2D physics;
ToxiclibsSupport gfx;
FloatRange radius;
Vec2D origin, mouse;

int maxCircles = 90; // maximum amount of circles on the screen
int numPoints = 50;  // number of voronoi points / segments
int minSpeed = 2;    // minimum speed of a voronoi segment
int maxSpeed = 20;   // maximum speed of a voronoi segment



void setup() {

  size (640, 480);
  smooth();
  noStroke();
  gfx = new ToxiclibsSupport(this);
  physics = new VerletPhysics2D();
  physics.setDrag(0.05f);
  physics.setWorldBounds(new Rect(0, 0, width, height));
  radius = new BiasedFloatRange(10, 50, 30, 0.6f);
  origin = new Vec2D(width/2, height/2);
  reset();
}

void draw() {
  removeAddCircles();
  background(0);
  physics.update();

  mouse = new Vec2D(mouseX, mouseY);
  for (breakCircle bc:circles) {
    bc.run();
  }
}

void removeAddCircles() {

  for (int i=circles.size()-1;i>=0;i--) {
    //if a circle is invisible, remove it
    if (circles.get(i).transparency <0) {
      circles.remove(i);
      //and add two new circles
      if (circles.size()<maxCircles) {
        circles.add(new breakCircle(origin, radius.pickRandom()));
        circles.add(new breakCircle(origin, radius.pickRandom()));
      }
    }
  }
}

void keyPressed () {
  if (key==' ') {
    reset();
  }
}

void reset () {

  for (breakCircle bc:circles) {
    physics.removeParticle(bc.vp);
    physics.removeBehavior(bc.abh);
  }

  circles.clear();

  circles.add(new breakCircle(origin, 50));
}


