
Turret player;
Box box;
ArrayList<Bullet> friendlyBullets;
ArrayList<Asteroid> asteroids;

int level;
boolean lost;
PFont f;
boolean pause;

void setup() {
  size(500, 500, P2D);
  background(255);
  player = new Turret(new PVector(width/2, height - 10), new PVector(0, 0), new PVector(0, 0), radians(0), 10, 1);
  box = new Box(new PVector(width/2, height - 5), new PVector(0, 0), new PVector(0, 0), radians(0));
  asteroids = new ArrayList<Asteroid>(20);
  friendlyBullets = new ArrayList<Bullet>(100);

  for (int i = 0; i < 10; i++) {
    asteroids.add(generateAsteroid());
  }

  f = createFont("Arial", 50, true);
}

void draw() {
  background(0);

  fill(255);
  textFont(f, 16);
  textAlign(LEFT);
  text("Points: " + player.getPoints(), width - 100, 10);
  text("Health: " + player.getHealth(), width - 100, 30);

  player.rotate(atan2(mouseY-player.getLocation().y, mouseX-player.getLocation().x));

  if (!pause && !lost) {
    if (mousePressed) {
      if (mouseButton == LEFT) {
        ArrayList<Bullet> playerb = player.fireBullets();
        if (playerb != null) {
          friendlyBullets.addAll(playerb);
        }
      }
    }

    stroke(255);
    fill(255);
    player.move();
    box.setLocation(player.getLocation());
    box.move();
    fill(0);

    for (int i = 0; i < friendlyBullets.size(); i++) {
      PVector loc1 = friendlyBullets.get(i).getNextLocation();
      if (loc1.x > width || loc1.x < 0 || loc1.y > height || loc1.y < 0) {
        friendlyBullets.remove(i);
      } else {
        friendlyBullets.get(i).move();
      }
    }
    for (int i = 0; i < asteroids.size(); i++) {
      PVector loc = asteroids.get(i).getNextLocation();
      if (loc.x > width || loc.x < 0 || loc.y > height || loc.y < 0) {
        asteroids.set(i, generateAsteroid());
        player.loseHealth(1);
        if (player.getHealth() <= 0) {
          lost = true;
        }
      } else {
        fill(0, 0);
        asteroids.get(i).move();
      }
    }

    for (int j = 0; j < asteroids.size(); j++) { 
      for (int i = 0; i < friendlyBullets.size();) {
        if (friendlyBullets.get(i).collision(asteroids.get(j))) {
          int hb = friendlyBullets.get(i).getHealth();
          int ha = asteroids.get(j).getHealth();

          asteroids.get(j).loseHealth(hb);
          friendlyBullets.get(i).loseHealth(ha);

          if (friendlyBullets.get(i).getHealth() <= 0) {
            friendlyBullets.remove(i);
          } else {
            i++;
          } 
          if (asteroids.get(j).getHealth() <= 0) {
            asteroids.set(j, generateAsteroid());
            player.addPoints(1);
          }
        } else {
          i++;
        }
      }
    }

    if (!keyPressed) {
      player.setSpeed(player.getSpeed() - .1);
      box.setSpeed(box.getSpeed() - .1);
    }
  } else if (pause && !lost) {
    fill(0);
    textFont(f, 40);
    textAlign(CENTER);
    text("Paused", width/2, height/2);
  } else {
    fill(0);
    textFont(f, 40);
    textAlign(CENTER);
    background(255);
    text("You Lost", width/2, height/2 - 20);
    text("Score: " + player.getPoints(), width/2, height/2 + 20);

    textFont(f, 20);
    text("Press Space to Play Again", width/2, height/2 + 40);
  }
}

Asteroid generateAsteroid() {
  return new Asteroid(new PVector(random(0, width), 0), new PVector(0, random(.5, 2)), new PVector(0, 0), random(-PI, PI), (int) random(1, 2), random(.25, 1));
}

void keyPressed() {
  if (keyCode == LEFT || key == 'a') {
    player.changeAccel(new PVector(-0.1, 0));
  }
  if (keyCode == RIGHT || key == 'd') {
    player.changeAccel(new PVector(0.1, 0));
  }
  if (key == 'p') {
    pause = !pause;
  }
  if (key == ' ') {
    if (lost) {
      reset();
    }
  }
}

void keyReleased() {
  if (keyCode == RIGHT || key == 'd') {
    player.setAccelMag(0);
  } else if (keyCode == LEFT || key == 'a') {
    player.setAccelMag(0);
  }
}

void reset() {
  fill(255);
  asteroids = new ArrayList<Asteroid>(10);
  friendlyBullets = new ArrayList<Bullet>();

  for (int i = 0; i < 10; i++) {
    asteroids.add(generateAsteroid());
  }

  player = new Turret(new PVector(width/2, height - 5), new PVector(0, 0), new PVector(0, 0), radians(0), 10, 1);
  box = new Box(new PVector(width/2, height - 5), new PVector(0, 0), new PVector(0, 0), radians(0));
  lost  = false;
}
class Asteroid extends ScreenObject {
  private int health;
  
  public Asteroid(PVector initialPosn, PVector initialVel, PVector initialAccel, float initDir, int health, float size) {
    super(initialPosn, initialVel, initialAccel, initDir, (new PAsteroid()).getAsteroidShape(), size, null);
    this.health = health;
  }
  
  public void loseHealth(int lose){
    health -= lose;
  }
  
  public int getHealth(){
    return health;
  }
}

private class PAsteroid {
  private PShape ast;

  public PAsteroid(){
    ast = createShape();
    ast.beginShape();
    ast.vertex(50, 0);
    ast.vertex(cos(radians(60))*50, sin(radians(60))*50);
    ast.vertex(cos(radians(120))*50, sin(radians(120))*50);
    ast.vertex(cos(radians(180))*50, sin(radians(180))*50);
    ast.vertex(cos(radians(240))*50, sin(radians(240))*50);
    ast.vertex(cos(radians(300))*50, sin(radians(300))*50);
    ast.endShape(CLOSE);
  }
  
  public PShape getAsteroidShape(){
    return ast;
  }
}
class Box extends ScreenObject {

  public Box(PVector initialPosn, PVector initialVel, PVector initialAccel, float initDir) {
    super(initialPosn, initialVel, initialAccel, initDir, (new PBox()).getBoxShape(), 1, null);
  }

  public void setLocation(PVector p) {
    posn = p;
  }
}

private class PBox {
  private PShape Box;

  public PBox() {
    Box = createShape();
    Box.beginShape();
    Box.vertex(-25, 0);
    Box.vertex(25, 0);
    Box.vertex(25, 10);
    Box.vertex(-25, 10);
    Box.endShape(CLOSE);
  }

  public PShape getBoxShape() {
    return Box;
  }
}
class Bullet extends ScreenObject  {
  private float size;
  private color col;
  private int health;

  public Bullet(PVector initialPosn, PVector initialVel, PVector initialAccel, float initDir, int health, float size, color col) {
    super(initialPosn, initialVel, initialAccel, initDir, (new PBullet(col)).getBulletShape(), size, null);
    this.col = col;
    this.health = health;
  }

  public void loseHealth(int lose) {
    health -= lose;
  }

  public int getHealth() {
    return health;
  }
}

private class PBullet {
  private PShape bullet;

  public PBullet(color col) {
    bullet = createShape();
    bullet.beginShape();
    bullet.vertex(3, -1);
    bullet.vertex(3, 1);
    bullet.vertex(-3, 1);
    bullet.vertex(-3, -1);
    bullet.endShape(CLOSE);
  }

  public PShape getBulletShape() {
    return bullet;
  }
}
class LineSegment {
  private float slope;
  private float minX;
  private float maxX;
  private float minY;
  private float maxY;
  public PVector p1;
  public PVector p2;

  public LineSegment(int x1, int y1, int x2, int y2) {
    maxX = Math.max(x1, x2);
    minX = Math.min(x1, x2);
    maxY = Math.max(y1, y2);
    minY = Math.min(y1, y2);

    p1 = new PVector(x1, y1);
    p2 = new PVector(x2, y2);

    if (x1 == x2) {
      slope = Float.POSITIVE_INFINITY;
    } else {
      slope = (y1 - y2)/(x1 - x2);
    }
  }

  public LineSegment(PVector p1, PVector p2) {
    maxX = Math.max(p1.x, p2.x);
    minX = Math.min(p1.x, p2.x);
    maxY = Math.max(p1.y, p2.y);
    minY = Math.min(p1.y, p2.y);

    this.p1 = p1;
    this.p2 = p2;

    slope = (p1.y - p2.y)/(p1.x - p2.x);
  }

  public boolean intersects(LineSegment other) {
    if (slope == other.slope) {
      return false;
    } 

    float xi;
    float yi;

    if (slope == Float.POSITIVE_INFINITY || other.slope == Float.POSITIVE_INFINITY) {
      if (slope == Float.POSITIVE_INFINITY) {
        xi = maxX;
        yi = other.slope*(xi - other.p1.x) + other.p1.y;
      } else {
        xi = other.maxX;
        yi = slope*(xi - p1.x) + p1.y;
      }
    } else {
      xi = (slope*p1.x + other.p1.y - p1.y - other.slope*other.p1.x)/(slope - other.slope);
      yi = slope*(xi - p1.x) + p1.y;
    }

    if ((minX <= xi && xi <= maxX) && (minY <= yi && yi <= maxY)) {
      if ((other.minX <= xi && xi <= other.maxX) && (other.minY <= yi && yi <= other.maxY)) {
        return true;
      }
    }

    return false;
  }
  
  public String toString(){
    return "[" + p1 + ", " + p2 + "]"; 
  }
}
class MovingObject {
  protected PVector posn;
  protected PVector vel;
  protected PVector accel;
  protected float heading;

  public MovingObject(PVector initialPosn, PVector initialVel, PVector initialAccel, float initHeading) {
    posn = initialPosn;
    vel = initialVel;
    accel = initialAccel;
    heading = initHeading;
  }

  public void move() {
    posn.add(vel);
    vel.add(accel);
  }
  
 public PVector getLocation() {
    return posn;
  }

  public PVector getNextLocation() {
    PVector temp = posn.get();
    temp.add(vel);
    return temp;
  }

  public void setSpeed(float speed) {
    vel.normalize();
    vel.mult(speed);
  }

  public void setAccelMag(int accelMag) {
    accel.normalize();
    accel.mult(accelMag);
  }

  public void changeSpeed(int change) {
    float mag = vel.mag();
    mag += change;
    vel.normalize();
    vel.mult(mag);
  }

  public void changeAccelMag(float change) {
    float mag = accel.mag();
    mag += change;
    accel.normalize();
    accel.mult(mag);
  }

  public void changeVel(PVector newVel) {
    vel = newVel;
  }

  public void changeAccel(PVector newAccel) {
    accel = newAccel;
  }

  public void setVelDir(float angle) {
    float mag = vel.mag();
    vel = vel.fromAngle(angle);
    vel.mult(mag);
  }

  public void setAccelDir(float angle) {
    float mag = accel.mag();
    accel = accel.fromAngle(angle);
    accel.mult(mag);
  }

  public void changeDir(int angle) {
    vel.rotate(angle);
  }

  public void changeAccelDir(int angle) {
    accel.rotate(angle);
  }

  public float getVelDir() {
    return vel.heading();
  }

  public float getAccelDir() {
    return accel.heading();
  }

  public float getSpeed() {
    return vel.mag();
  }

  public float getAccelMag() {
    return accel.mag();
  }

  public void setDir(float angle) {
    heading = angle;
  }

  public float getDir() {
    return heading;
  }
}
class ScreenObject extends MovingObject {
  protected PShape shape;
  protected PImage overlay;
  protected float pHeight;
  protected float pWidth;
  protected float size;

  public ScreenObject(PVector initialPosn, PVector initialVel, PVector initialAccel, float initDir, PShape shape1, float size, PImage image1) { //change -> don't require PImage, leave that to lower classes
    super(initialPosn, initialVel, initialAccel, initDir);
    shape = shape1;
    overlay = image1;
    pWidth = shape.width;
    pHeight = shape.height;
    shape.rotate(initDir);
    shape.scale(size);
    this.size = size;
  }

  public void move() {
    super.move();
    if (true) {
      if (posn.x >= width)
        posn.x = 0; else if (posn.y >= height)
        posn.y = 0; else if (posn.y < 0)
        posn.y = height - getWidth(); else if (posn.x < 0)
        posn.x = width - getWidth();
    }
    
    //fill(0, 0);
    shapeMode(CORNERS);
    shape(shape, posn.x, posn.y);
  }

  public void rotate(float angle) {
    shape.rotate(-getDir());
    shape.rotate(angle);
    setDir(angle);
  }

  public ArrayList<LineSegment> getLines() {
    int vertCount = shape.getVertexCount();
    ArrayList<LineSegment> segments = new ArrayList<LineSegment>(vertCount);
    PVector temp = posn;
    
    for (int i = 0; i < vertCount - 1; i++) {
      PVector p1 = PVector.add(temp, PVector.mult(PVector.fromAngle(heading + (shape.getVertex(i).y > 0 ? -PVector.angleBetween(new PVector(1, 0), shape.getVertex(i)) : PVector.angleBetween(new PVector(1, 0), shape.getVertex(i)))), size*shape.getVertex(i).mag()));
      PVector p2 = PVector.add(temp, PVector.mult(PVector.fromAngle(heading + (shape.getVertex(i + 1).y > 0 ? -PVector.angleBetween(new PVector(1, 0), shape.getVertex(i+1)) : PVector.angleBetween(new PVector(1, 0), shape.getVertex(i+1)))), size*shape.getVertex(i+1).mag()));
      LineSegment seg = new LineSegment(p1, p2);
      segments.add(seg);
    }
    
    PVector p1 = PVector.add(temp, PVector.mult(PVector.fromAngle(heading + (shape.getVertex(vertCount - 1).y > 0 ? -PVector.angleBetween(new PVector(1, 0), shape.getVertex(vertCount - 1)) : PVector.angleBetween(new PVector(1, 0), shape.getVertex(vertCount - 1)))), size*shape.getVertex(vertCount - 1).mag()));
    PVector p2 = PVector.add(temp, PVector.mult(PVector.fromAngle(heading + (shape.getVertex(0).y > 0 ? -PVector.angleBetween(new PVector(1, 0), shape.getVertex(0)) : PVector.angleBetween(new PVector(1, 0), shape.getVertex(0)))), size*shape.getVertex(0).mag()));
    LineSegment seg = new LineSegment(p1, p2);
    segments.add(seg);

    return segments;
  }

  public boolean collision(ScreenObject other) {
    ArrayList<LineSegment> segs1 = getLines();
    ArrayList<LineSegment> segs2 = other.getLines();

    for (int i = 0; i < segs1.size(); i++) {
      for (int j = 0; j < segs2.size(); j++) {
        if (segs1.get(i).intersects(segs2.get(j))) {
          return true;
        }
      }
    }
    
    return false;

    //quickIntersect method does not work for rotated rectangles -> trying again later
    /*
    boolean quickIntersectX = (pWidth + other.pWidth) < (Math.max(other.posn.x + width/2, posn.x + width/2) - Math.min(other.posn.x - width/2, posn.x - width/2));
     boolean quickIntersectY = (pHeight + other.pHeight) < (Math.max(other.posn.y + height/2, posn.y + height/2) - Math.min(other.posn.y - height/2, posn.y - height/2));
     
     if(quickIntersectX && quickIntersectY){
     
     }
     else{
     return false;
     }
     */
  }

  public float getWidth() {
    return pHeight;
  }

  public float getHeight() {
    return pWidth;
  }
}
class Turret extends ScreenObject {
  private int health;
  private int points;
  private long time;

  public Turret(PVector initialPosn, PVector initialVel, PVector initialAccel, float initDir, int health, float size) {
    super(initialPosn, initialVel, initialAccel, initDir, (new PTurret()).getTurretShape(), size, null);
    shape.scale(size);
    this.health = health;
    points = 0;
    time = 0;
  }

  public void loseHealth(int lose) {
    health -= lose;
  }

  public int getHealth() {
    return health;
  }

  public int getPoints() {
    return points;
  }

  public ArrayList<Bullet> fireBullets() {
    int coolTime;
    if (points < 10) {
      coolTime = 500;
    } else if (points < 50) {
      coolTime = 250;
    } else {
      coolTime = 100;
    }

    if (time == 0) {
      time = millis();
      Bullet b1 = new Bullet(PVector.add(posn, PVector.mult(PVector.fromAngle(heading), pWidth/2)), PVector.mult(PVector.fromAngle(heading), 5), new PVector(0, 0), heading, 1, 1, color(0, 0, 0));
      ArrayList<Bullet> b = new ArrayList<Bullet>();
      b.add(b1);
      return b;
    }
    if (millis() - time < coolTime) {
      return null;
    }

    Bullet b1 = new Bullet(PVector.add(posn, PVector.mult(PVector.fromAngle(heading), pWidth/2)), PVector.mult(PVector.fromAngle(heading), 5), new PVector(0, 0), heading, 1, 1, color(0, 0, 0));
    ArrayList<Bullet> b = new ArrayList<Bullet>();
    b.add(b1);
    time = millis();
    return b;
  }

  public void addPoints(int addend) {
    points += addend;
  }

  public void losePoitns(int rickLoss) {
    points -= rickLoss;
  }

  public void move() {
    stroke(255);
    fill(255);
    super.move();
  }
}

private class PTurret {
  private PShape turret;

  public PTurret() {
    turret = createShape();
    turret.beginShape();
    turret.vertex(-10, 0);
    turret.vertex(10, 0);
    turret.vertex(10, 1);
    turret.vertex(-10, 1);
    turret.endShape(CLOSE);
  }

  public PShape getTurretShape() {
    return turret;
  }
}



