
import toxi.geom.*;
import toxi.math.waves.*;
import toxi.processing.*;

int COLS = 8;
int ROWS = 6;

List cells = new ArrayList();
ToxiclibsSupport gfx;

boolean isClipped=true;

void setup() {
  size(680,382);
  gfx=new ToxiclibsSupport(this);
  strokeWeight(2);
  Vec2D cellSize = new Vec2D((float)width/COLS,(float)height/ROWS);
  for(float y=0; y<height; y+=cellSize.y) {
    for(float x=0; x<width; x+=cellSize.x) {
      ClipCell c=new ClipCell(new Rect(x+2,y+2,cellSize.x-4,cellSize.y-4));
      cells.add(c);
    }
  }
}

void draw() {
  background(255,0,0);
  noFill();
  stroke(255);
  for(Iterator i=cells.iterator(); i.hasNext();) {
    ClipCell c = (ClipCell)i.next();
    c.update();
    c.draw(gfx,isClipped);
  }
}

void keyPressed() {
  isClipped=!isClipped;
}

class Lissajous {

  AbstractWave xmod, ymod;
  float x, y;

  public Lissajous(AbstractWave x, AbstractWave y) {
    xmod = x;
    ymod = y;
  }

  void update() {
    x = xmod.update();
    y = ymod.update();
  }
}

class ClipCell {

  Rect bounds;
  Circle dot;
  Lissajous curve;

  public ClipCell(Rect bounds) {
    this.bounds = bounds;
    this.dot = new Circle(bounds.getCentroid(), random(10,60));
    SineWave wx = new SineWave(0, random(0.01f, 0.08f), bounds.width * 0.5f, bounds.getCentroid().x);
    SineWave wy = new SineWave(0, random(0.01f, 0.08f), bounds.height * 0.5f, bounds.getCentroid().y);
    this.curve = new Lissajous(wx, wy);
  }

  void update() {
    curve.update();
    dot.set(curve.x,curve.y);
  }

  void draw(ToxiclibsSupport gfx, boolean useClipping) {
    Polygon2D poly=dot.toPolygon2D(30);
    if (useClipping) {
      PolygonClipper2D clipper=new SutherlandHodgemanClipper(bounds);
      poly=clipper.clipPolygon(poly);
    }
    gfx.polygon2D(poly);
  }
}


