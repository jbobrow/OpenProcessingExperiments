
/*
Controls
p1:
  turn: left/right
  item: ,./
p2:
  turn: a/d
  item: qwe

Combination of "Fly or Die" and "Snake"
Planes and items come from Fly or Die
Real-time action comes from Snake (Fly or Die is turn-based)

New features:
Speed item
Bomb
Different item selection system
Scoring system
*/
class Vector {
  private float magnitude;
  private float direction;
  public Vector(float r, float theta) {
    magnitude = r;
    direction = theta;
  }
  public Vector(Vector v) {
    magnitude = v.magnitude;
    direction = v.direction;
  }
  public float getX() {
    return magnitude*cos(direction);
  }
  public float getY() {
    return magnitude*sin(direction);
  }
  public void setDirection(float theta) {
    direction = theta;
  }
  public float getDirection() {
    return direction;
  }
  public void setMagnitude(float r) {
    magnitude = r;
  }
  public float magnitude() {
    return magnitude;
  }
}

class Stash {
  private long timer;
  private int startx;
  private int direction;
  private ArrayList<Integer> values;
  private color c;
  private color busyclr;
  private long del;
  private long time;
  public Stash(int xpos, color clr, long busytime) {
    startx = xpos;
    direction = 1;
    if (xpos > 400) {
      direction = -1;
    }
    timer = System.currentTimeMillis();
    values = new ArrayList<Integer>();
    for (int i = 0; i < 6; i++) {
      reset();
    }
    c = color(.9*red(clr), .9*green(clr), .9*blue(clr));
    busyclr = color(0, 0, 0);
    del = busytime;
  }
  public void draw() {
    rectMode(CENTER);
    stroke(0, 0, 0);
    strokeWeight(1);
    for (int i = 0; i < values.size(); i++) {
      switch (values.get(i)) {
      case 0:
        //fill(255, 255, 0);
        noFill();
        line(startx + i*40*direction, 20, startx + i*40*direction, 40);
        break;
      case 1:
        //fill(0, 255, 255);
        stroke(0, 0, 0, 0);
        fill(red(c), green(c), blue(c), 50);
        ellipseMode(CENTER);
        ellipse(startx + i*40*direction, 20, 20, 20);
        noFill();
        stroke(0, 0, 0);
        break;
      case 2:
        fill(0,255,0,50);
        stroke(0,0,0);
        strokeWeight(3);
        line(startx + i*40*direction - 15, 30, startx + i*40*direction, 15);
        line(startx + i*40*direction + 15, 30, startx + i*40*direction, 15);
        strokeWeight(1);
        break;
      case 3:
        fill(255,0,255,50);
        stroke(0,0,0);
        strokeWeight(3);
        line(startx + i*40*direction - 15, 30, startx + i*40*direction, 15);
        line(startx + i*40*direction + 15, 30, startx + i*40*direction, 15);
        strokeWeight(1);
        break;
      default:
        fill(0, 0, 0, 0);
        break;
      }
      rect(startx + i*40*direction, 20, 40, 40);
    }
    noFill();
    strokeWeight(3);
    if (busy()) {
      stroke(busyclr);
    } 
    else {
      stroke(c);
    }
    rect(startx+40*direction, 20, 120, 40);
    strokeWeight(1);
    rectMode(CORNER);
  }
  public int use(int i) {
    if (!busy()) {
      int ans = values.remove(i);
      reset();
      timer = System.currentTimeMillis();
      return ans;
    }
    return -1;
  }
  private void reset() {
    values.add((int) (.5 + random(0, 3)));
  }
  private boolean busy() {
    return System.currentTimeMillis() <= timer+del;
  }
}

interface Item {
  public void action();
  public void draw();
  public boolean collision(Plane p);
  public boolean done();
}

class Bullet implements Item {
  private float x;
  private float y;
  private float theta;
  private Vector v;
  private color c;
  public Bullet(float xcenter, float ycenter, float angle, color clr) {
    x = xcenter;
    y = ycenter;
    theta = angle;
    v = new Vector(25, theta);
    c = clr;
  }
  public void action() {
    x += v.getX();
    y += v.getY();
  }
  public void draw() {
    stroke(c);
    strokeWeight(3);
    line(x-10*cos(theta), 
    y-10*sin(theta), 
    x+10*cos(theta), 
    y+10*sin(theta));
    strokeWeight(1);
  }
  public boolean done() {
    return x < 0 || x > width || y < 0 || y > height-50;
  }
  public boolean collision(Plane p) {
    float xdist = x-p.getX();
    float ydist = y-p.getY();
    float tdist = sqrt(xdist*xdist+ydist*ydist);
    float thresh = 6+p.size();
    return tdist < thresh;
  }
}

class Bomb implements Item {
  private float x;
  private float y;
  private long time;
  private long start;
  private float r;
  private color c;
  private boolean exploding;
  public Bomb(float xcenter, float ycenter, color clr) {
    x = xcenter;
    y = ycenter;
    c = clr;
    start = System.currentTimeMillis();
    time = 0;
    r = 5;
    exploding = false;
  }
  public void draw() {
    stroke(0, 0, 0, 0);
    fill(c);
    ellipseMode(CENTER);
    ellipse(x, y, 2*r, 2*r);
  }
  public void action() {
    if (exploding) {
      r+=5;
    }
    time = System.currentTimeMillis()-start;
    if (time > 2500) {
      exploding = true;
    }
  }
  public boolean done() {
    return time > 3000;
  }
  public boolean collision(Plane p) {
    if (exploding) {
      float xdist = x-p.getX();
      float ydist = y-p.getY();
      float tdist = sqrt(xdist*xdist+ydist*ydist);
      float thresh = r+p.size();
      return tdist < thresh;
    }
    return false;
  }
}

class Plane {
  private float WING_ANGLE = radians(105);
  private float x;
  private float y;
  private float r;
  private color c;
  private color halfc;
  private float theta;
  private Vector basev;
  private Vector v;
  private Stash stash;
  private ArrayList<Bullet> bullets;
  private ArrayList<Bomb> bombs;
  private long bulletTimer;
  private long timer;
  private boolean shooting;
  private float turnangle;
  private float bta;//base turn angle
  private long speedtimer;
  public Plane(float xcenter, float ycenter, float planeSize, float angle, int stashx, color clr) {
    x = xcenter;
    y = ycenter;
    r = planeSize/2;
    theta = angle;
    c = clr;
    halfc = color(.5*red(c), .5*green(c), .5*blue(c), 63);
    basev = new Vector(.1*r, radians(theta));
    v = new Vector(basev);
    stash = new Stash(stashx, c, 500);
    bullets = new ArrayList<Bullet>();
    bombs = new ArrayList<Bomb>();
    bulletTimer = System.currentTimeMillis();
    timer = System.currentTimeMillis();
    shooting = false;
    turnangle = r/8;
    bta = turnangle;
    speedtimer = System.currentTimeMillis();
  }
  public void setColor(color clr) {
    c = clr;
    halfc = color(.5*red(c), .5*green(c), .5*blue(c), 63);
  }
  public ArrayList<Bullet> bullets() {
    return bullets;
  }
  public ArrayList<Bomb> bombs() {
    return bombs;
  }
  public float getFrontX() {
    return x+r*cos(radians(theta));
  }
  public float getFrontY() {
    return y+r*sin(radians(theta));
  }
  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
  public float size() {
    return r;
  }
  public float angle() {
    return radians(theta);
  }
  public Vector velocity() {
    return new Vector(v);
  }
  public void rotate(boolean clockwise) {
    if (clockwise) {
      theta -= turnangle;
    } 
    else {
      theta += turnangle;
    }
    while (theta < 0) {
      theta += 360;
    }
    while (theta > 360) {
      theta -= 360;
    }
    basev.setDirection(radians(theta));
    v.setDirection(radians(theta));
  }
  public void draw() {
    //plane
    strokeWeight(2);
    float th = radians(theta);
    float a = WING_ANGLE-PI/2;
    float rmod = r*tan(a);
    stroke(c);
    line(x-(r-rmod)*cos(th), 
    y-(r-rmod)*sin(th), 
    x+r*cos(th), 
    y+r*sin(th));//body

    line(x+rmod*cos(th), 
    y+rmod*sin(th), 
    x+r*cos(th-PI/2), 
    y+r*sin(th-PI/2));//leftfrontwing

    line(x+rmod*cos(th), 
    y+rmod*sin(th), 
    x+r*cos(th+PI/2), 
    y+r*sin(th+PI/2));//rightfrontwing

    float p = r-rmod; 
    line(x-p*cos(th), 
    y-p*sin(th), 
    x-p*cos(th)+.5*r*cos(th-WING_ANGLE), 
    y-p*sin(th)+.5*r*sin(th-WING_ANGLE));//lefttailwing

    line(x-p*cos(th), 
    y-p*sin(th), 
    x-p*cos(th)+.5*r*cos(th+WING_ANGLE), 
    y-p*sin(th)+.5*r*sin(th+WING_ANGLE));//righttailwing
    //stroke(0,0,0,30);
    //noFill();
    //ellipse(x,y,2*r,2*r);//collision boundary
    strokeWeight(1);
    //stash
    stash.draw();
  }
  public void use(int i) {
    int s = stash.use(i);
    switch (s) {
    case 0:
      shooting = true;
      timer = System.currentTimeMillis();
      return;
    case 1:
      bomb();
      return;
    case 2:
      fast();
      return;
    case 3:
      slow();
      return;
    default:
      break;
    }
  }
  private void fast() {
    v = new Vector(basev.magnitude()*2, basev.getDirection());
    turnangle = bta*2;
    speedtimer = System.currentTimeMillis();
  }
  private void slow() {
    v = new Vector(basev.magnitude()/2, basev.getDirection());
    turnangle = bta/2;
    speedtimer = System.currentTimeMillis();
  }
  public void move() {
    //mvmt
    x += v.getX();
    if (x < r) {
      x = r;
    }
    if (x > width-r) {
      x = width-r;
    }
    y += v.getY();
    if (y < r+40) {
      y = r+40;
    }
    if (y > height-r-40) {
      y = height-r-40;
    }
    //item spawn
    if (bulletReady()) {
      bullet();
      if (System.currentTimeMillis() > timer + 1000) {
        shooting = false;
        timer = System.currentTimeMillis();
      }
    }
    //accelerate
    if (System.currentTimeMillis() > speedtimer + 2000) {
      v = new Vector(basev);
      turnangle = bta;
    }
  }//endmove
  private boolean bulletReady() {
    if (!shooting) {
      return false;
    }
    boolean ans = System.currentTimeMillis() > bulletTimer + 200;
    if (ans) {
      bulletTimer = System.currentTimeMillis();
    }
    return ans;
  }
  private void bomb() {
    bombs.add(new Bomb(x, y, color(.5*red(c), .5*green(c), .5*blue(c), 63)));
  }
  private void bullet() {
    bullets.add(new Bullet(x+r*cos(radians(theta)), y+r*sin(radians(theta)), v.getDirection(), halfc));
  }
}

Plane p1;
Plane p2;
boolean left1key;
boolean right1key;
boolean left2key;
boolean right2key;
boolean up1key;
boolean down1key;
boolean up2key;
boolean down2key;
ArrayList<Bullet> bullets;
ArrayList<Bomb> bombs;
long bullet1timer;
long bullet2timer;
long bulletdelay = 250;
long bomb1timer;
long bomb2timer;
long bombdelay = 1000;
int p1score;
int p2score;
boolean[] stash1;
boolean[] stash2;
PFont f;
void setup() {
  size(700, 600);
  bullets = new ArrayList<Bullet>();
  bombs = new ArrayList<Bomb>();
  color r = color(255, 0, 0);
  color b = color(0, 0, 255);
  p1 = new Plane(width/4, 3*height/4, 40, 0, width - 20, r);
  p2 = new Plane(3*width/4, height/4, 40, 180, 20, b);
  bullet1timer = System.currentTimeMillis();
  bullet2timer = System.currentTimeMillis();
  bomb1timer = System.currentTimeMillis();
  bomb2timer = System.currentTimeMillis();
  p1score = 0;
  p2score = 0;
  stash1 = new boolean[] {false, false, false};
  stash2 = new boolean[] {false, false, false};
  f = createFont("Arial", 24, true);
  p1.draw();
  p2.draw();
  noFill();
}
void draw() {
//  println(frameRate);
  if (left1key) {
    p1.rotate(true);
  }
  if (right1key) {
    p1.rotate(false);
  }
  if (left2key) {
    p2.rotate(true);
  }
  if (right2key) {
    p2.rotate(false);
  }
  background(220);
  for (int i = 0; i < bullets.size(); i++) {
    bullets.get(i).draw();
    bullets.get(i).action();
    if (bullets.get(i).done()) {
      bullets.remove(i);
      i--;
    } 
    else {
      if (bullets.get(i).collision(p1)) {
        bullets.remove(i);
        i--;
        p2score++;
      } 
      else {
        if (bullets.get(i).collision(p2)) {
          bullets.remove(i);
          i--;
          p1score++;
        }
      }
    }
  }
  for (int i = 0; i < bombs.size(); i++) {
    bombs.get(i).draw();
    bombs.get(i).action();
    if (bombs.get(i).done()) {
      bombs.remove(i);
      i--;
    } 
    else {
      if (bombs.get(i).collision(p1)) {
        //bombs.remove(i);
        //i--;
        p2score++;
      } 
      if (bombs.get(i).collision(p2)) {
        //bombs.remove(i);
        //i--;
        p1score++;
      }
    }
  }
//  if (stash1) {
//    p1.use((int) (.5+random(0, 2)));
//  }
  if (stash1[0]) {
    p1.use(0);
  }
  if (stash1[1]) {
    p1.use(1);
  }
  if (stash1[2]) {
    p1.use(2);
  }
  if (stash2[0]) {
    p2.use(0);
  }
  if (stash2[1]) {
    p2.use(1);
  }
  if (stash2[2]) {
    p2.use(2);
  }
  while (p1.bullets ().size() > 0) {
    bullets.add(p1.bullets().remove(0));
  }
  while (p2.bullets ().size() > 0) {
    bullets.add(p2.bullets().remove(0));
  }
  while (p1.bombs ().size() > 0) {
    bombs.add(p1.bombs().remove(0));
  }
  while (p2.bombs ().size() > 0) {
    bombs.add(p2.bombs().remove(0));
  }
  stroke(0, 0, 0, 0);
  fill(220);
  rect(0, height-40, width, height);
  rect(0, 0, width, 40);
  p1.move();
  p2.move();
  p1.draw();
  p2.draw();
  stroke(0);
  strokeWeight(1);
  line(0, height-40, width, height-40);
  line(0, 40, width, 40);
  textFont(f);
  fill(255, 0, 0);
  text("Player 1 score: "+p1score, 50, height-10);
  fill(0, 0, 255);
  text("Player 2 score: "+p2score, width-250, height-10);
}

void keyPressed() {
  if (keyCode == LEFT) {
    left1key = true;
  }
  if (keyCode == RIGHT) {
    right1key = true;
  }
  if (key == 'a' || key == 'A') {
    left2key = true;
  }
  if (key == 'd' || key == 'D') {
    right2key = true;
  }

  if (keyCode == UP) {
    up1key = true;
  }
  if (keyCode == DOWN) {
    down1key = true;
  }
  if (key == 'w' || key == 'W') {
    up2key = true;
  }
  if (key == 's' || key == 'S') {
    down2key = true;
  }
  if (key == ',') {
    stash1[2] = true;
  }
  if (key == '.') {
    stash1[1] = true;
  }
  if (key == '/') {
    stash1[0] = true;
  }
  if (key == 'q' || key == 'Q') {
    stash2[0] = true;
  }
  if (key == 'w' || key == 'W') {
    stash2[1] = true;
  }
  if (key == 'e' || key == 'E') {
    stash2[2] = true;
  }
}
void keyReleased() {
  if (keyCode == LEFT) {
    left1key = false;
  }
  if (keyCode == RIGHT) {
    right1key = false;
  }
  if (key == 'a' || key == 'A') {
    left2key = false;
  }
  if (key == 'd' || key == 'D') {
    right2key = false;
  }

  if (keyCode == UP) {
    up1key = false;
  }
  if (keyCode == DOWN) {
    down1key = false;
  }
  if (key == 'w' || key == 'W') {
    up2key = false;
  }
  if (key == 's' || key == 'S') {
    down2key = false;
  }
  if (key == ',') {
    stash1[2] = false;
  }
  if (key == '.') {
    stash1[1] = false;
  }
  if (key == '/') {
    stash1[0] = false;
  }
  if (key == 'q' || key == 'Q') {
    stash2[0] = false;
  }
  if (key == 'w' || key == 'W') {
    stash2[1] = false;
  }
  if (key == 'e' || key == 'E') {
    stash2[2] = false;
  }
}


