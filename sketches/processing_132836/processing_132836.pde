
// airTrack.pde

class FloatCanvas
{
  int X, Y, SCALE;

  FloatCanvas(int X, int Y, int SCALE) {
    this.X = X;
    this.Y = Y;
    this.SCALE = SCALE;
  }

  void text2(String s, float x1, float y1)
  {
    int _x1, _y1;

    _x1 = int((x1 * SCALE) + X/2);
    _y1 = int((y1 * -SCALE) + Y/2);

    text(s, _x1, _y1);
  }

  void line2(float x1, float y1, float x2, float y2)
  {
    int _x1, _x2, _y1, _y2;

    _x1 = int((x1 * SCALE) + X/2);
    _x2 = int((x2 * SCALE) + X/2);
    _y1 = int((y1 * -SCALE) + Y/2);
    _y2 = int((y2 * -SCALE) + Y/2);

    line(_x1, _y1, _x2, _y2);
  }

  void rect2(float x1, float y1, float x2, float y2)
  {
    int _x1, _x2, _y1, _y2;

    _x1 = int((x1 * SCALE) + X/2);
    _x2 = int((x2 * SCALE));
    _y1 = int((y1 * -SCALE) + Y/2);
    _y2 = int((y2 * SCALE));

    rect(_x1, _y1, _x2, _y2);
  }

  void ellipse2(float x1, float y1, float x2, float y2)
  {
    int _x1, _x2, _y1, _y2;

    _x1 = int((x1 * SCALE) + X/2);
    _x2 = int((x2 * SCALE));
    _y1 = int((y1 * -SCALE) + Y/2);
    _y2 = int((y2 * SCALE));

    ellipseMode(RADIUS);
    ellipse(_x1, _y1, _x2, _y2);
  }
}

class AirTrack
{
  float t;
  float tstep;
  float KE;
  ArrayList<Block> blocks;
  Marker cm;        // center of mass

  AirTrack() {
    t = 0.0;
    tstep = 0.01;

    blocks = new ArrayList<Block>();
    cm = new Marker(track, 0.05);
  }

  void newBlock(float x, float v, float mass) {
    blocks.add(new Block(track, x, v, mass));
  }

  void draw() {
    fill(0, 0, 0);
    canvas.text2("t " + t.toFixed(2), -5.0, 0.8);
    canvas.text2("KE " + KE.toFixed(3), -5.0, 0.65);
    canvas.line2(-5.0, 0.0, 5.0, 0.0);
    for (float x = -5.0; x <= 5.0; x += 1.0) {
      canvas.line2(x, 0.0, x, -0.15);
    }

    for (int i = blocks.size() - 1; i >= 0; --i) {
      Block block = blocks.get(i);
      block.draw();
    }
    cm.draw();
  }

  void update() {
    float total_xm = 0.0;
    float total_m = 0.0;

    t = t + tstep;

    // calculate kinetic energy of total system
    KE = 0.0;
    for (int i = blocks.size() - 1; i >= 0; --i) {
      Block block = blocks.get(i);
      KE = KE + block.mass * pow(block.v, 2);
    }

    // find the center of mass/velocity
    for (int i = blocks.size() - 1; i >= 0; --i) {
      Block block = blocks.get(i);
      block.update();
      total_xm += block.x * block.mass;
      total_m += block.mass;
    }
    cm.update(total_xm/total_m, 0.0);

    // check for collisions
    for (int i = blocks.size() - 1; i >= 0; --i) {
      for (int j = blocks.size() - 1; j >= 0; --j) {
        Block a = blocks.get(i);
        Block b = blocks.get(j);

    if (i == j) {
          continue;
        }

        if (a.isCollision(b)) {
          a.elasticCollision(b); 
          // a.inelasticCollision(b); 
    }
      }
    }
  }
}

class Marker
{
  AirTrack track;
  float x, y, radius;

  Marker(AirTrack track, float radius) {
    this.track = track;
    this.radius = radius;
  }

  void update(float x, float y) {
    this.x = x;
    this.y = y;
    return;
  }

  void draw() {
    fill(0, 0, 255);
    canvas.ellipse2(x, y, radius, radius);
  }
}

int blockCount = 0;

class Block
{
  float x0; // original position
  float v;  // velocity
  float x;  // x(t)
  float l;  // side length
  float t;  // time
  float mass;   // mass
  int id;
  AirTrack track;

  Block(AirTrack track, float x, float v, float mass) {
    this.x0 = x;
    this.v = v;
    this.l = pow(mass, 0.333);
    this.track = track;
    this.mass = mass;

    this.t = 0.0;
    this.id = blockCount++;
  }

  boolean isCollision(Block block) {
    if (this.id == block.id) {
      // already collided inelastically
      return false;
    }
    return (abs(this.x - block.x) < ((this.l + block.l)/2));
  }

  void elasticCollision(Block block) {
    float v1 = this.v;
    float m1 = this.mass;
    float v2 = block.v;
    float m2 = block.mass;

    this.v = (m1 - m2)/(m1 + m2) * v1 + 2 * m2/(m1 + m2) * v2;
    block.v = (m2 - m1)/(m1 + m2) * v2 + 2 * m1/(m1 + m2) * v1;

    this.x0 = this.x;
    this.t = 0.0;
    block.x0 = block.x;
    block.t = 0.0;

    do {
      this.update();
      block.update();
    } while (this.isCollision(block));
  }

  /* static */ float massById(int id) {
    float mass = 0.0;
    for (int i = track.blocks.size() - 1; i >= 0; --i) {
      Block block = track.blocks.get(i);
      if (block.id == id) {
        mass += block.mass;
      }
    }
    return mass;
  }

  void inelasticCollision(Block block) {
    float v1 = this.v;
    float m1 = massById(this.id);
    float v2 = block.v;
    float m2 = massById(block.id);
    int oldId = block.id;

    this.v = (m1*v1 + m2*v2) / (m1 + m2);
    this.x0 = this.x;
    this.t = 0.0;

    // create/update union of all the blocks collided
    for (int i = track.blocks.size() - 1; i >= 0; --i) {
      block = track.blocks.get(i);
      if (block.id == oldId) {
        block.id = this.id;
        block.v = this.v;
        block.x0 = block.x;
        block.t = 0.0;
      }
    }
  }

  void update() {
    t = t + track.tstep;
    x = x0 + t * v;
  }

  void draw() {
    fill(0, 0, 0);
    canvas.rect2(x - l/2, l, l, l);
    canvas.text2("x " + x.toFixed(2), x - l/2, -0.5);
    canvas.text2("v " + v.toFixed(2), x - l/2, -0.65);
  }
}

AirTrack track;
FloatCanvas canvas;

void setup() {
  int width = 1024;
  int height = 256;
  int scale = 100;

  size(width, height);
  strokeWeight(1);
  frameRate(60);

  canvas = new FloatCanvas(width, height, scale);
  track = new AirTrack();

/*
  track.newBlock(-3.0, 1.0, 0.5);
  track.newBlock(0.0, 1.0, 0.1);
  track.newBlock(2.0, 2.0, 0.01);
*/
/*
  track.newBlock(-1.0, 1.0, 0.01);
  track.newBlock(1.0, 0.0, 0.8);
*/
/*
  track.newBlock(-1.0, 1.0, 0.10);
  track.newBlock(1.0, -1.0, 0.10);
*/
/* m1 = m2, m1 hits m2
  track.newBlock(-1.0, 1.0, 0.10);
  track.newBlock(0.0, 0.0, 0.10);
*/
/*
  track.newBlock(-3.0, 1.0, 0.5);
  track.newBlock(3.0, -1.0, 0.5);
*/


  // Newton's cradle
  track.newBlock(-2.5, 1.0, 0.10);
  track.newBlock(-1.0, 0.0, 0.10);
  track.newBlock(-0.5, 0.0, 0.10);
  track.newBlock( 0.0, 0.0, 0.10);
  track.newBlock( 0.5, 0.0, 0.10);
  track.newBlock( 1.0, 0.0, 0.10);
  
/*
  // Newton's cradle -- two blocks
  track.newBlock(-2.5, 1.0, 0.10);
  track.newBlock(-2.0, 1.0, 0.10);
  track.newBlock(-1.0, 0.0, 0.10);
  track.newBlock(-0.5, 0.0, 0.10);
  track.newBlock( 0.0, 0.0, 0.10);
  track.newBlock( 0.5, 0.0, 0.10);
  track.newBlock( 1.0, 0.0, 0.10);
*/
/*
  // m1 >> m2
  track.newBlock(-1.0, 1.0, 0.5);
  track.newBlock(0.0, 0.0, 0.01);
*/
}

void draw() {
  float x;

  // Fill canvas grey
  background(192);

  // Set fill-color to black
  fill(0, 0, 0);

  // Set stroke-color black
  stroke(0);

  track.update();
  track.draw();
}

