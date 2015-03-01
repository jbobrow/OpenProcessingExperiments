
/*
@pjs preload="water.png,brick.png,canon_shaft.png,canon_base.png,bullet.png"
 */

/*
 
 Andor Salga
 Feb 2015
 
 */
ArrayList<Sprite> sprites;
PImage water;
Canon canon;
PVector gravity = new PVector(0, 10);
int TILE_SIZE = 32;

void setup() {
  size(640, 480);
  imageMode(CENTER);

  canon = new Canon();
  sprites = new ArrayList<Sprite>();
  water = loadImage("water.png");
}

void draw() {
  background(95, 64, 255);

  for (int i = 0; i < sprites.size(); i++) {
    Sprite s = sprites.get(i);
    s.applyForce(gravity);
    s.update(0.016 );
    s.render();
  }

  removeDeadBullets();

  renderWater();
  canon.render();
}

void renderWater() {
  for (int i = 0; i < width; i += 32) {
    image(water, i + TILE_SIZE/2, height - TILE_SIZE/2);
  }
}

void removeDeadBullets() {
  for (int i = sprites.size()-1; i >= 0; i--) {
    Sprite s = sprites.get(i);
    if (s.pos.y > height) {
      sprites.remove(s);
    }
  }
}

void mousePressed() {
  canon.fire();
}

/*

 */
public class Canon {

  PImage brick;
  PImage base;
  PImage shaft;
  float fireForce;

  public Canon() {
    brick = loadImage("brick.png");
    base = loadImage("canon_base.png");
    shaft = loadImage("canon_shaft.png");
    fireForce = 600;
  }

  public void render() {
    image(brick, TILE_SIZE/2, height - TILE_SIZE/2);

    pushMatrix();
    translate(TILE_SIZE/2, height - TILE_SIZE*2 - TILE_SIZE/4);
    rotate(getDir());
    image(shaft, 0, 0);
    popMatrix();

    image(base, TILE_SIZE/2, height - TILE_SIZE - TILE_SIZE/1.5);
  }

  public void fire() {
    Sprite s = new Sprite();
    s.pos.x = TILE_SIZE/2;
    s.pos.y =  height - TILE_SIZE*2 - TILE_SIZE/4;

    float dir = getDir();
    float rot = dir + PI/2;
    
    float x = sin(rot) * fireForce;
    float y = -cos(rot) * fireForce;

    s.applyForce( new PVector(x, y));

    sprites.add(s);
  }
  
  float getDir() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector cannon = new PVector(16, height-72);
    PVector dir = PVector.sub(mouse, cannon);    
    return atan2(dir.y, dir.x);
  }
}

/*

 */
class Sprite {

  PVector pos;
  PVector acc;
  PVector vel;

  PImage img;

  Sprite() {
    pos = new PVector();
    vel = new PVector();
    acc = new PVector();

    img = loadImage("bullet.png");
  }

  void update(float delta) {
    vel.add(acc);

    pos.x += vel.x * delta;
    pos.y += vel.y * delta;

    acc.mult(0);
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(atan2(vel.y, vel.x));
    image(img, 0, 0);
    popMatrix();
  }
}



