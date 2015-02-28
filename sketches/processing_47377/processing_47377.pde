
// import the necessary toxiclibs libraries
import toxi.geom.*; 
import toxi.processing.*;

// declare the vectors we will be using
ToxiclibsSupport gfx;
Vec2D m, n, p;

void setup() {
  size(400,400);
  smooth();
  // initialise the ToxiclibsSupport class
  gfx=new ToxiclibsSupport(this);
  // create the three vectors
  m = new Vec2D(50,50); 
  n = new Vec2D(30,30);
  p = new Vec2D(10,10);
  background(0);
  strokeWeight(1);
}

void draw() {
  // translate so the centre of the screen is the origin
  translate(200,200);
  for(int i=0;i<20;i++){
    // rotate each of the vectors a little, change these
    // to produce a variety of patterns
    m.rotate(0.01);
    n.rotate(0.021);
    p.rotate(0.052);
    // calculate the angle between m and n vectors and
    // use this to set the stroke colour
    float ang = m.angleBetween(n,true);
    stroke(100*ang,255-100*ang,100+50*ang);
    // create a temporary vector for the final position of
    // the dot so we don't change our original vectors
    Vec2D blob = m.add(n);
    blob.addSelf(p);
    // draw a dot at the x,y co-ordinates of the sum of the
    // three vectors
    // we can now do this just by passing the Vec2D object
    // to the point command, easy!
    gfx.point(blob);
  }
}

