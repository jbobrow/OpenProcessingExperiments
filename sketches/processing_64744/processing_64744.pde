
import toxi.geom.*;
import toxi.geom.mesh2d.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.util.datatypes.*;
import toxi.processing.*;

ArrayList <BreakCircle> circles = new ArrayList <BreakCircle> ();
VerletPhysics2D physics;
ToxiclibsSupport gfx;
FloatRange radius;
Vec2D origin, mouse;

int maxCircles = 90;
int numPoints = 50; 
int minSpeed = 2; 
int maxSpeed = 14;

void setup() {
  size(640,500);
  smooth();
  noStroke();
  gfx = new ToxiclibsSupport(this);
  physics = new VerletPhysics2D();
  physics.setDrag(0.05f);
  physics.setWorldBounds(new Rect(0,0,width,height));
  radius = new BiasedFloatRange(30, 100, 30, 0.6f);
  origin = new Vec2D(width/2,height/2);
  reset();
}

void draw() {
  removeAddCircles();
  background(255);
  physics.update();

  mouse = new Vec2D(mouseX,mouseY);
  for (BreakCircle bc : circles) {
    bc.run();
  }
}

void removeAddCircles() {
  for (int i=circles.size()-1; i>=0; i--) {
  
    if (circles.get(i).transparency < 0) {
      circles.remove(i);

      if (circles.size() < maxCircles) {
        circles.add(new BreakCircle(origin,radius.pickRandom()));
        circles.add(new BreakCircle(origin,radius.pickRandom()));
      }
    }
  }
}

void keyPressed() {
  if (key == ' ') { reset(); }
}

void reset() {
  for (BreakCircle bc : circles) {
    physics.removeParticle(bc.vp);
    physics.removeBehavior(bc.abh);
  }
  circles.clear();
  circles.add(new BreakCircle(origin,200));
}

class BreakCircle {
  ArrayList <Polygon2D> polygons = new ArrayList <Polygon2D> ();
  Voronoi voronoi;
  FloatRange xpos, ypos;
  PolygonClipper2D clip;
  float[] moveSpeeds;
  Vec2D pos, impact;
  float radius;
  int transparency;
  int start;
  VerletParticle2D vp;
  AttractionBehavior abh;
  boolean broken;

  BreakCircle(Vec2D pos, float radius) {
    this.pos = pos;
    this.radius = radius;
    vp = new VerletParticle2D(pos);
    abh = new AttractionBehavior(vp, radius*2.5 + max(0,50-radius), -1.2f, 0.01f);
    physics.addParticle(vp);
    physics.addBehavior(abh);
  }

  void run() {
    if (!broken) {
      moveVerlet();
      displayVerlet();
      checkBreak();
    } else {
      moveBreak();
      displayBreak();
    }
  }

  void moveVerlet() {
    pos = vp;
  }

  void displayVerlet() {
    fill(178,247,29);
    gfx.circle(pos,radius*2);
  }

  void checkBreak() {
    if (mouse.isInCircle(pos,radius) && mousePressed) {
      physics.removeParticle(vp);
      physics.removeBehavior(abh);
      impact = mouse;
      initiateBreak();
    }
  }

  void initiateBreak() {
    broken = true;
    transparency = 255;
    start = frameCount;
    voronoi = new Voronoi();
    xpos = new BiasedFloatRange(pos.x-radius, pos.x+radius, impact.x, 0.333f);
    ypos = new BiasedFloatRange(pos.y-radius, pos.y+radius, impact.y, 0.5f);
    clip = new SutherlandHodgemanClipper(new Rect(pos.x-radius, pos.y-radius, radius*2, radius*2));
    addPolygons();
    addSpeeds();
  }

  void addPolygons() {
    for (int i=0; i<numPoints; i++) {
      voronoi.addPoint(new Vec2D(xpos.pickRandom(), ypos.pickRandom()));
    }
    for (Polygon2D poly : voronoi.getRegions()) {
      poly = clip.clipPolygon(poly);
      for (Vec2D v : poly.vertices) {
        if (!v.isInCircle(pos,radius)) {
          clipPoint(v);
        }
      }
      polygons.add(new Polygon2D(poly.vertices));
    }
  }

  void addSpeeds() {
    moveSpeeds = new float[polygons.size()];
    for (int i=0; i<moveSpeeds.length; i++) {
      moveSpeeds[i] = random(minSpeed,maxSpeed);
    }
  }

  void moveBreak() {
    for (int i=0; i<polygons.size(); i++) {
      Polygon2D poly = polygons.get(i);
      Vec2D centroid = poly.getCentroid();
      Vec2D targetDir = centroid.sub(impact).normalize();
      targetDir.scaleSelf(moveSpeeds[i]);
      for (Vec2D v : poly.vertices) {
        v.set(v.addSelf(targetDir));
      }
    }
  }

  void displayBreak() {
    if (frameCount-start > 12) { transparency -= 7; }
    fill(244,34,108,transparency);
    for (Polygon2D poly : polygons) {
      gfx.polygon2D(poly);
    }
  }

  void clipPoint(Vec2D v) {
    v.subSelf(pos);
    v.normalize();
    v.scaleSelf(radius);
    v.addSelf(pos);
  }
}

