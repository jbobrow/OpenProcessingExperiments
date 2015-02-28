

Cat sCat;
Cat mCat;

void setup() {
  size(800, 600); 
  smooth();

  sCat = new Cat("s");
  mCat = new Cat("m");
}

void draw() {
  background(255);

  sCat.buildCat();
  sCat.jiggle();

  mCat.buildCat();  
  mCat.jiggle();

  mCat.hold(sCat);
  sCat.hold(mCat);
}

void mousePressed() {
  mCat.clickCat();
  sCat.clickCat();
  if (mCat.over == true) {
    mCat.lockCat();
  } 
  else if (sCat.over == true) {
    sCat.lockCat();
  } 
  else {
  }
}

void mouseDragged() {
  if (mCat.lock == true) {
    mCat.dragCat();
  } 
  else if (sCat.lock == true) {
    sCat.dragCat();
  } 
  else {
  }
}

void mouseReleased() {
  mCat.dropCat();
  sCat.dropCat();
}

class Cat {

  float x;
  float y;
  String n;

  float prevX;
  float prevY;

  boolean over = false;
  boolean lock = false;

  float xdif, ydif;

  PImage torso;
  PImage head;
  PImage rleg;
  PImage lleg;
  PImage rarm1;
  PImage larm1;
  PImage rarm2;
  PImage larm2;

  Cat(String tempN) {
    x = width/2;
    y = height/2;

    prevX = x;
    prevY = y;

    n = tempN;

    torso = loadImage(n + "-torso.png");
    head = loadImage(n + "-head.png");
    rleg = loadImage(n + "-rleg1.png");
    lleg = loadImage(n +"-lleg1.png");
    rarm1 = loadImage(n + "-rarm1.png");
    rarm2 = loadImage(n + "-rarm2.png");
    larm1 = loadImage(n + "-larm1.png");
    larm2 = loadImage(n + "-larm2.png");
  }

  void buildCat() {
    //add torso & head
    image(torso, x, y);
    image(head, x+(torso.width/2-head.width/2), y-head.height-head.height/8);
    legs();
  }

  void jiggle() {

    //for legs angles moving  
    prevX = x;
    prevY = y;

    x = x + random(-1, 1);
    y = y + random(-1, 1);

    //    x = x + random(-5, 5);
    //    y = y + random(-5, 5);
  }



  //arms hold other cat torso
  void hold(Cat otherCat) {

    float r = random(-.01, .01);

    //right arm
    float tx = x-rarm1.width/2;
    float ty = y+rarm1.height;

    float cx = otherCat.x + otherCat.torso.width/2;
    float cy = otherCat.y + otherCat.torso.height/2;

    float dx = cx - tx;
    float dy = cy - ty;
    float a = atan2(dy, dx);

    tx = cx - cos(a) * rarm2.height;
    ty = cy - sin(a) * rarm2.height;
    dx = tx - (x-rarm1.width/2);
    dy = ty - y;
    float a2 = atan2(dy, dx);
    float nx = (x-rarm1.width/2) + cos(a2) * rarm1.height;
    float ny = y + sin(a2) * rarm1.height;

    pushMatrix();
    translate(nx, ny);
    rotate(a - PI/2 + r);
    stroke(255, 0, 0);
    //    line(0, 0, 0, rarm2.height);
    image(rarm2, -rarm2.width/2, 0);
    popMatrix();

    pushMatrix();
    translate(x-rarm1.width/2, y);
    rotate(a2 - PI/2);
    stroke(0);
    //    line(0, 0, 0, rarm1.height);
    image(rarm1, -rarm1.width/2, 0);
    popMatrix();


    //left arm
    //this is where rarm2 sits
    tx = x+torso.width+larm1.width/2;
    ty = y+larm1.height;

    cx = otherCat.x + otherCat.torso.width/2;
    cy = otherCat.y + otherCat.torso.height/2;

    dx = cx - tx;
    dy = cy - ty;
    a = atan2(dy, dx);

    tx = cx - cos(a) * larm2.height;
    ty = cy - sin(a) * larm2.height;
    dx = tx - (x + torso.width + rarm1.width/2);
    dy = ty - y;
    a2 = atan2(dy, dx);
    nx = (x + torso.width + larm1.width/2) + cos(a2) * larm1.height;
    ny = y + sin(a2) * larm1.height;

    pushMatrix();
    translate(nx, ny);
    rotate(a - PI/2 + r);
    stroke(255, 0, 0);
    //    line(0, 0, 0, larm2.height);
    image(larm2, - larm2.width/2, 0);
    popMatrix();

    pushMatrix();
    translate(x+torso.width + larm1.width/2, y);
    rotate(a2 - PI/2);
    stroke(0);
    //    line(0, 0, 0, larm1.height);
    image(larm1, - larm1.width/2, 0);
    popMatrix();

    //left arm
  }

  void legs() {
    //    image(rleg, x, y+torso.height);
    //    image(lleg, x+torso.width - lleg.width/2, y+torso.height);

    float a = 0;
    //angle of the legs
    float dx = prevX - x;
    float dy = torso.height/8;
    if (abs(dx) > .5) {
      a = atan2(dx, dy);
    } 
    else {
      a = 0;
    } 

    pushMatrix();
    translate(x, y+torso.height);
    rotate(-a);
    image(rleg, 0, 0);
    popMatrix();

    pushMatrix();
    translate(x + torso.width - lleg.width/2, y+torso.height);
    rotate(-a);
    image(lleg, 0, 0);
    //    line(0,0,rleg.height,0);
    popMatrix();
  }

  void clickCat() {
    if (mouseX > x && mouseX < x+torso.width &&
      mouseY > y && mouseY < y+torso.height) {
      over = true;
    } 
    else {
      over = false;
    }
    xdif = mouseX - x;
    ydif = mouseY - y;
  }

  void lockCat() {
    lock = true;
  }

  void dropCat() {
    lock = false;
  }

  void dragCat() {
    x = mouseX - xdif;
    y = mouseY - ydif;
  }
}



