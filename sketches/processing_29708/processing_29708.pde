
import controlP5.*;

List<ItemData> items; // stratum collection
// controllable variables
float dens; // density of stratum collection
float rot = 0; // angle of rotation
float speed = 0.1f;// speed
final int sizeDev = 20; // deviation of sizes
int n = 11; // number of stratum
int minSize = 0; // minimum size
int maxSize = 0; // minimum size
boolean shadowsOn = true;

PVector cen; // Attractor's position. Each stratum will be attracted to it
public ControlP5 controlP5;//controlP5 object
UI ui; // controlP5 controls to make some interaction

// This class represents data of one item.The picture is painted layer by
// layer,
// so such objects can only store fields and have no methods, because they
// can't for example draw themselves.
class ItemData {
  float initSz; // initial size of each stratum(needed for resizing
  // option)
  float actSz; // actual size of each stratum
  PVector loc; // location
  PVector vel; // velocity
  PVector acc; // acceleration
  PGraphics shad; // shadow

  public ItemData() {
    this.initSz = random(1, sizeDev);
    this.loc = new PVector(random(width), random(height), 0);
    this.vel = new PVector(0f, 0f, 0f);
  }
};

void setup() {
  size(550, 250, P2D);

  cen = new PVector(width / 2 + 50, 3 * height / 5);

  // create collection
  items = new ArrayList<ItemData>();
  for (int i = 0; i < n; i++) {
    items.add(new ItemData());
  }

  // some makeup
  ellipseMode(PApplet.CENTER);
  imageMode(CENTER);
  noStroke();
  smooth();

  controlP5=new ControlP5(this);
  ui = new UI();
}

void draw() {
  background(245);
  // update location
       
  for (ItemData item:items) {
    PVector attractor = new PVector(random(cen.x - 15, cen.x + 15), random(cen.y - 15, cen.y + 15));
    PVector dir=PVector.sub(attractor,item.loc);
    dir.normalize();
    dir.mult(speed);
    item.acc = dir;
    item.vel.add(item.acc);
    item.vel.limit(dens);
   
    item.loc.add(item.vel);
    
  }

  // draw first layer - shadows
  if (shadowsOn)
    for (int i = 0; i < n; i++) {
      pushMatrix();
      translate(items.get(i).loc.x, items.get(i).loc.y);
      rotate(rot);
      image(items.get(i).shad, 0, (maxSize - items.get(i).actSz) / 2);
      popMatrix();
    }

  // draw second layer - black ellipses
  for (int i = 0; i < n; i++) {
    fill(0);
    ellipse(items.get(i).loc.x, items.get(i).loc.y, items.get(i).actSz, 
    items.get(i).actSz);
  }

  // draw other three layers
  drawLayer(0, color(100));
  drawLayer(1, color(180));
  drawLayer(2, color(250));
  controlP5.draw();
}

// generates shadow for each stratum.
private PGraphics generateShadow(int i) {
  PGraphics gfx = createGraphics((int) items.get(i).actSz + 12, 
  (int) items.get(i).actSz + 12, P2D);
  gfx.beginDraw();
  gfx.background(150, 0);
  gfx.fill(150);
  gfx.noStroke();
  gfx.ellipseMode(CENTER);
  gfx.ellipse(gfx.width / 2, gfx.height / 2, items.get(i).actSz, 
  items.get(i).actSz);
  gfx.filter(BLUR, 3);
  gfx.endDraw();
  return gfx;
}

// draws ellipses of each stratum forming a new layer.
private void drawLayer(int ln, int col) {
  fill(col);
  for (int i = 0; i < n; i++) {
    pushMatrix();
    translate(items.get(i).loc.x, items.get(i).loc.y);
    float f = items.get(i).actSz / 21;
    rotate(rot);
    // some strange but working calculations...
    ellipse(0, -items.get(i).actSz / 7 - f * ln / 2, 5
      * items.get(i).actSz / 6 - 2 * f * ln, 2
      * items.get(i).actSz / 3 - 2 * f * ln);
    popMatrix();
  }
}

// resize item
public void resizeItem(int minSize) {
  for (int i = 0; i < n; i++) {
    items.get(i).actSz = items.get(i).initSz + minSize;
    items.get(i).shad = generateShadow(i);
  }
  this.maxSize = sizeDev + minSize;
  this.minSize = minSize;
}

// set density
public void setDensity(int d) {
  this.dens = d;
  for (int i = 0; i < n; i++) {
    items.get(i).vel.mult(2);
  }
}

// set speed
public void setSpeed(float s) {
  this.speed = s;
}

// set rotation angle
public void setRot(float r) {
  this.rot = r;
}

// set shadow mode on/off
public void setShad(boolean b) {
  this.shadowsOn = b;
}

// set number of Items in collection
public void setNumber(int sz) {
  if (n < sz) {
    for (int i = n; i < sz; i++) {
      ItemData item = new ItemData();
      items.add(item);
      item.actSz = item.initSz + minSize;
      item.shad = generateShadow(i);
      n = sz;
    }
  } 
  else if (n > sz) {
    while (n != sz) {
      items.remove(n - 1);
      n--;
    }
  }
}


