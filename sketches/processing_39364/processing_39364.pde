
/*
-Infinite Square-
 By Roy V.
 */
float gravity = 1;
float force = -1;
boolean magicstart = false;
boolean showtext=false;
int strokeR = 0;
int strokeG = 255;
int strokeR2 = 0;
int strokeG2 = 255;
Squares a, b, c, d, e, f, g, h, i, j;

void setup() {
  size(700, 500);
  smooth();
  noStroke();

  a = new Squares();
  a.x = 100;
  a.y = 100;
  a.size1 = 50;
  a.cr =random(100, 255);
  a.cg =random(100, 255);
  a.cb =random(100, 255);
  a.r=a.size1/2;

  b = new Squares();
  b.x = random(10, 690);
  b.y = random(50, 400);
  b.size1 = random(20, 100);
  b.cr =random(100, 255);
  b.cg =random(100, 255);
  b.cb =random(100, 255);
  b.r=b.size1/2;

  c = new Squares();
  c.x = random(10, 690);
  c.y = random(50, 400);
  c.size1 = random(20, 100);
  c.cr =random(100, 255);
  c.cg =random(100, 255);
  c.cb =random(100, 255);
  c.r=c.size1/2;

  d = new Squares();
  d.x = random(10, 690);
  d.y = random(50, 400);
  d.size1 = random(20, 100);
  d.cr =random(100, 255);
  d.cg =random(100, 255);
  d.cb =random(100, 255);
  d.r=d.size1/2;

  e = new Squares();
  e.x = random(10, 690);
  e.y = random(50, 400);
  e.size1 = random(20, 100);
  e.cr =random(100, 255);
  e.cg =random(100, 255);
  e.cb =random(100, 255);
  e.r=e.size1/2;

  f = new Squares();
  f.x = random(10, 690);
  f.y = random(50, 400);
  f.size1 = random(20, 100);
  f.cr =random(100, 255);
  f.cg =random(100, 255);
  f.cb =random(100, 255);
  f.r=f.size1/2;

  g = new Squares();
  g.x = random(10, 690);
  g.y = random(50, 400);
  g.size1 = random(20, 100);
  g.cr =random(100, 255);
  g.cg =random(100, 255);
  g.cb =random(100, 255);
  g.r=g.size1/2;

  h = new Squares();
  h.x = random(10, 690);
  h.y = random(50, 400);
  h.size1 = random(20, 100);
  h.cr =random(100, 255);
  h.cg =random(100, 255);
  h.cb =random(100, 255);
  h.r=h.size1/2;

  i = new Squares();
  i.x = random(10, 690);
  i.y = random(50, 400);
  i.size1 = random(20, 100);
  i.cr =random(100, 255);
  i.cg =random(100, 255);
  i.cb =random(100, 255);
  i.r=i.size1/2;

  j = new Squares();
  j.x = random(10, 690);
  j.y = random(50, 400);
  j.size1 = random(20, 100);
  j.cr =random(100, 255);
  j.cg =random(100, 255);
  j.cb =random(100, 255);
  j.r=j.size1/2;
}

void draw() {
  fill(0, 3);
  rect(0, 0, 700, 500);

  a.mouseDown();
  a.show();

  b.mouseDown();
  b.show();

  c.mouseDown();
  c.show();

  d.mouseDown();
  d.show();

  e.mouseDown();
  e.show();

  f.mouseDown();
  f.show();

  g.mouseDown();
  g.show();

  h.mouseDown();
  h.show();

  i.mouseDown();
  i.show();

  j.mouseDown();
  j.show();

  if (showtext) {
    textSize(20);
    fill(255);
    text("Y Axis Force:", 15, 20);
    fill(strokeR, strokeG, 0);
    text(force, 155, 20);
    fill(255);
    textSize(12);
    text("Up Arrow - Increase Force", 15, 35);
    text("Down Arrow - Decrease Force", 15, 47);
    textSize(20);
    fill(255);
    text("Gravity:", 400, 20);
    fill(strokeR2, strokeG2, 0);
    text(gravity, 485, 20);
    fill(255);
    textSize(12);
    text("Right Arrow - Increase Gravity", 400, 35);
    text("Left Arrow - Decrease Gravity", 400, 47);
    textSize(15);
    fill(0, 100, 255);
  }
  textSize(15);
  text("Press ENTER for menu.", 30, 490);
  text("-Roy V.", 630, 490);
}
//
void mDownF() {
  a.mDown=false;
  b.mDown=false;
  c.mDown=false;
  d.mDown=false;
  e.mDown=false;
  f.mDown=false;
  g.mDown=false;
  h.mDown=false;
  i.mDown=false;
  j.mDown=false;
}

void fxrandom() {
  a.fx =random(-15, 15);
  b.fx =random(-15, 15);
  c.fx =random(-15, 15);
  d.fx =random(-15, 15);
  e.fx =random(-15, 15);
  f.fx =random(-15, 15);
  g.fx =random(-15, 15);
  h.fx =random(-15, 15);
  i.fx =random(-15, 15);
  j.fx =random(-15, 15);
}

void resetfy() {
  a.fy=0;
  b.fy=0;
  j.fy=0;
  c.fy=0;
  d.fy=0;
  e.fy=0;
  f.fy=0;
  g.fy=0;
  h.fy=0;
  i.fy=0;
}

void resetfx() {
  a.fx =0;
  b.fx =0;
  c.fx =0;
  d.fx =0;
  e.fx =0;
  f.fx =0;
  g.fx =0;
  h.fx =0;
  i.fx =0;
  j.fx =0;
}

void mouseDragged() {
  if (a.mDown && b.mDown && c.mDown &&
    d.mDown && e.mDown && f.mDown &&
    g.mDown && h.mDown && i.mDown && j.mDown) {
    magicstart = true;
  }
}
//
class Squares {
  float x;
  float y;
  float size1;
  float fx = 0;
  float fy = 0;
  boolean mDown=false;
  float cr;
  float cb;
  float cg;
  float r;

  void mouseDown() {
    if (mDown==true) {          
      y=mouseY-size1/2;
      x=mouseX-size1/2;
    }
    if (mousePressed ==true && 
      abs(mouseX-size1/2-x) < r &&
      abs(mouseY-size1/2-y) < r ) {
      mDown=true;
    } 
    else {
      fy+=gravity;
      x+=fx;
      y+=fy;
      if (x+size1 > 700) {
        x = 700 - size1;
        fx*= force;
      }
      if (x < 0) {
        x=0;
        fx*= force;
      }
      if (y+size1 > 500) {
        y = 500 - size1;
        fy*= force;
      } 
      if (y < 0) {
        y=0;
        fy*= force;
      }
      magicstart=false;
    }
  }

  void show() {
    fill(cr, cg, cb, 25);
    rect(x, y, size1, size1);
  }
}

void keyPressed() {

  if (keyCode==LEFT && gravity>-1 && showtext) {
    gravity-=0.1;
    strokeR2+=30;
    strokeG2-=30;
    resetfy();
  }


  if (keyCode==RIGHT && gravity<1 && showtext) {
    gravity+=0.1;
    strokeR2-=30;
    strokeG2+=30;
    resetfy();
  }


  if (keyCode==DOWN && force<0&& showtext) {
    force+=0.1;
    strokeR+=30;
    strokeG-=30;
  }
  if (keyCode==DOWN && force==-1&& showtext) {
    resetfy();
  }

  if (keyCode==UP && force>-1.1&& showtext) {
    force-=0.1;
    strokeR-=30;
    strokeG+=30;
  }
  if (keyCode==UP && force==-1&& showtext) {
    resetfy();
  }
  if (keyCode==ENTER && showtext==false) {
    showtext=true;
  } 
  else if (keyCode==ENTER && showtext ==true) {
    showtext=false;
  }
}

void mouseReleased() {
  mDownF();
  if (magicstart) {
    fxrandom();
  }
  if (magicstart==false) {
    resetfx();
  }
}

