
final float goldRatio = 1.61803399;

Branch main;
Vector current;
int currentLevel;
Branch dragged;
int s, a;
float tang;
Branch[] all;
Branch temp;
Branch added;
Branch orly;

void setup() {
  size(500, 450);
  strokeCap(PROJECT);
  reset();
}

void reset() {
  currentLevel = 0;
  all = new Branch[0];
  stroke(0, 128);
  createMain();
  all = (Branch[])append(all, main);
  current = new Vector();
  current.add(main);
  smooth();
}

void draw() {
  background(255);
  if(dragged != null) {
    strokeWeight(dragged.thickness);
    stroke(0, 128);
    line(dragged.x, dragged.y, mouseX, mouseY);
  }
  main.runPropagated();
  noLoop();
}

void addBranch(Branch which, float offset, float redux) {
  added = new Branch(which, offset, redux);
  current.add(added);
  if(added.level < 6) all = (Branch[])append(all, added);
}

void mousePressed() {
  if(dragged == null) {
    for(a = 0; a < all.length; a++) {
      temp = all[a];
      if(abs(mouseX-temp.dx) < 10 & abs(mouseY-temp.dy) < 10) {
        if(mouseButton == LEFT) {
          dragged = temp;
        }
        else if(mouseButton == RIGHT) {
          addBranch(temp, random(-50, 50), goldRatio);
        }
        break;
      }
    }
  }
  if(dragged == null & mouseButton == RIGHT) {
    s = current.size();
    for(a = 0; a < s; a++) {
      temp = (Branch)current.get(a);
      addBranch(temp, random(-50, 50), goldRatio);
      //    if(random(1) < .15) addBranch(temp, random(-10, 10), 4.7);
    }
    for(a = 0; a < s-++currentLevel; a++) {
      current.remove(a);
    }
  }
  else if(mouseButton == CENTER) {
    reset();
  }
  loop();
}

void keyPressed() {
  if(key == 'r') {
    reset();
  }
}

void createMain() {
  main = new Branch(width/2, height, width/2, height-50, 25, 200, 0);
}

void mouseDragged() {
  if(dragged != null) {
    loop();
  }
}

void mouseReleased() {
  if(dragged != null) {
    if(dragged != main) {
      dragged.offset = atan2(mouseY-dragged.parent.dy, mouseX-dragged.parent.dx)-dragged.parent.angle();
    }
    else {
      dragged.dx = mouseX;
      dragged.dy = mouseY;
    }
    loop();
    dragged = null;
  }
}

float expFunc(float x) {
  return pow(x/14.0, 3);
}

float wrap(float a, float low, float high) {
  if(low < high) {
    while(a < low) a += (high-low);
    while(a > high) a -= (high-low);
  }
  return a;
}

int wrap(int a, int low, int high) {
  if(low < high) {
    while(a < low) a += (high-low);
    while(a > high) a -= (high-low);
  }
  return a;
}

int sign(float a) {
  if(a < 0) return -1;
  return 1;
}

float radInv(float a) {
  return wrap(a+PI, 0, TWO_PI);
}

float turnRad(float rad1, float rad2, float amount) {
  rad1 = wrap(rad1, 0, TWO_PI);
  rad2 = wrap(rad2, 0, TWO_PI);
  int dir = sign(rad2-rad1);
  if(dir == 1)
    if(radInv(rad1) < rad2)
      return radInv(turnRad(radInv(rad1), radInv(rad2), amount));

  if(dir == -1)
    if(radInv(rad1) > rad2)
      return radInv(turnRad(radInv(rad1), radInv(rad2), amount));
  return wrap(rad1+(rad2-rad1)*amount, 0, TWO_PI);
}

class Branch {
  float x, y, dx, dy;
  float thickness;
  float size;
  float offset;
  final Branch parent;
  Branch[] children;
  float ang;  
  float temp;
  int a;
  final int level;
  float redux;

  Branch(float x, float y, float dx, float dy, float thickness, float size, int level) {
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
    this.thickness = thickness;
    this.size = size;
    this.level = level;
    offset = 0;
    parent = null;
    children = new Branch[0];
  }

  Branch(Branch parent, float angleOffset, float redux) {
    this.parent = parent;
    this.redux = redux;
    offset = radians(angleOffset);
    ang = angleOffset();
    level = parent.level+1;
    realignWithParent();
    children = new Branch[0];
    parent.children = (Branch[])append(parent.children, this);
  }

  float angle() {
    return atan2(dy-y, dx-x);
  }

  float angleOffset() {
    return parent.angle()+offset;
  }

  void realignWithParent() {
    if(parent == null) return;
      ang = angleOffset();
      x = parent.dx;
      y = parent.dy;
      size = parent.size/redux;
      thickness = parent.thickness/redux;
      dx = x+cos(ang)*size;
      dy = y+sin(ang)*size;
  }

  void show() {
    strokeWeight(thickness);
    stroke(color(0, expFunc(level)*255, 0), 128);
    line(x, y, dx, dy);
  }

  void runIsolated() {
    realignWithParent();
    show();
    //    offset += radians(random(-level*level, level*level));
  }

  void runPropagated() {
    runIsolated();
      for(a = 0; a < children.length; a++)
        children[a].runPropagated();
  }
}

