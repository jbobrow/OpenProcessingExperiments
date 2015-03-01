
MetalBall testBall;
MetalBall[] ballz;
Magnet myMagnet;
boolean debug = true;
public int accuracy = 10;
public PVector[][] allPoints;
int ballCount = 300;
boolean gravityMode = false;
 
void setup() {
  size (1024, 720);
  frameRate(60);
  testBall = new MetalBall(200, 500, 25, color(0, 0, 255));
  ballz = new MetalBall[ballCount];
  myMagnet = new Magnet(100, 50);
  noCursor();
 
  for (int i=0; i < ballCount; i++) {
    ballz[i] = new MetalBall (random(width), random(height-100, height), 15, color(random(0, 100)));
  }
}
 
void draw() {
  background(0, 150, 200);
  myMagnet.display(mouseX, mouseY);
  testBall.display();
  testBall.rectCollision();
 
//  for (int i=0; i < ballCount; i++) {
//    ballz[i].display();
//   ballz[i].rectCollision();
//    testBall.ballCollision(ballz[i]);
//    for (int j=0; j < ballCount; j++) {
//      ballz[i].ballCollision(ballz[j]);
//    }
//    ballz[i].move();
//  }
  testBall.move();
  //println(gravityMode);
}
 
 
void keyPressed() {
  if (key == 'g' || key == 'G') {
    gravityMode = true;
  }
  if (key == 'h' || key == 'H') {
    gravityMode = false;
  }
}
 
class Magnet {
  float x, y, w, h;
  float[] pointx;
  float[] pointy;
 
 
  Magnet (float cw, float ch) {
    w = cw;
    h = ch;
    pointx = new float[accuracy + 1];
    pointy = new float[accuracy + 1];
    allPoints = new PVector[accuracy + 1][accuracy + 1];
  }
 
  void display(float cx, float cy) {
    x = cx;
    y = cy;
    rectMode(CENTER);
    fill(255);
    stroke(0);
    rect(x, y, w, h);
 
 
    for (int i=0; i <= accuracy; i++) {
      pointx[i] = int(x-w/2) + i*(w/accuracy);          //x value of points
      //println(pointx[i]);
    }
    for (int j=0; j <= accuracy; j++) {
      pointy[j] = int(y-h/2) + j*(h/accuracy);          //y value of points
      //println(pointy[j]);
    }
 
    for (int i=0; i <= accuracy; i++) {                  //Array of PVectors with each Checkpoint
      for (int j=0; j <= accuracy; j++) {
        allPoints[i][j] = new PVector(pointx[i], pointy[j]);
        if (debug == true) {
          stroke(255, 0, 0);
          point(allPoints[i][j].x, allPoints[i][j].y);        //draw points
          stroke(0);
        }
      }
    }
  }
}
 
class MetalBall {
  float x, y, d, r, xspeed, yspeed, xpull, ypull, z, right, left, top, bottom, oldx, oldy;
  boolean magnetized, movingRight, movingLeft, movingUp, movingDown, touching, collidedBall;
  color c;
  int touched;
 
  MetalBall (float cx, float cy, float cd, color cc) {
    x = cx;
    y = cy;
    d = cd;
    r = cd/2;
    c = cc;
  }
 
  void display() {
    ////////////draw//////////
    pushMatrix();
    translate(x, y);          //new layer plane with the translation of x and y; rotation of z
    z = degrees(atan2(-mouseX + x, mouseY - y));
    rotate(radians(z+90));
    //xspeed = ((dist(x, y, mouseX, mouseY) * cos(radians(z+90)))/100);
    //yspeed = ((dist(x, y, mouseX, mouseY) * sin(radians(z+90)))/100);
 
    if (dist(x, y, mouseX, mouseY) < 250) {      //check if being pulled
      magnetized = true;
    }
    else {
      magnetized = false;
    }
 
    if (magnetized == true) {
      xpull = (cos(radians(z+90)))/dist(x, y, mouseX, mouseY) * 40;
      ypull = (sin(radians(z+90)))/dist(x, y, mouseX, mouseY) * 40;
    }
    else {
      if (gravityMode == true) {
        if (movingRight == true) {
          xpull = -.075;
        }
        if (movingLeft == true) {
          xpull = .075;
        }
        ypull = .25;
      }
      if (gravityMode == false) {
        xpull = 0;
        ypull = 0;
      }
    }
    fill (c);
    noStroke();
    ellipse(0, 0, d, d);
    if (debug == true) {
      stroke(255, 0, 0);
      strokeWeight(2);          //line points in direction of acceleration/mouse
      line(r, 0, 75, 0);
    }
 
    ////////constraints//////
 
    //bottom//
    if (y + r > height) {
      y = height - r;
      yspeed = 0;
 
      ///top///
    }
    if (y - r < 0) {
      y = 0 + r;
    }
 
    //left//
    if (x + r > width) {
      x = width - r;
      xspeed = 0;
    }
 
    //right//
    if (x - r < 0) {
      x = 0 + r;
      xspeed = 0;
    }
 
    ////////update values///////
    right = x + r;
    left = x - r;
    top = y - r;
    bottom = y + r;
    popMatrix();
 
 
 
 
 
    ///////Gravity Version 1//////////
    //    translate(x, y);          //new layer plane with the translation of x and y; rotation of z
    //    z = degrees(atan2(-mouseX + x, mouseY - y));
    //    rotate(radians(z+90));
    //    xspeed = ((dist(x, y, mouseX, mouseY) * cos(radians(z+90)))/100) + xpull;
    //    yspeed = ((dist(x, y, mouseX, mouseY) * sin(radians(z+90)))/100) + ypull;
    //    xpull = (dist(x, y, mouseX, mouseY) * cos(radians(z+90)))/10;
    //    ypull = (dist(x, y, mouseX, mouseY) * sin(radians(z+90)))/10;
  }
 
  void move() {
    oldx = x;
    oldy = y;
    xspeed += xpull;
    yspeed += ypull;
    x += xspeed;
    y += yspeed;
    checkDirection();
  }
 
  void rectCollision() {
    touched = 0;
    for (int i=0; i <= accuracy; i++) {                
      for (int j=0; j <= accuracy; j++) {
        if (magnetized == true && dist(x, y, allPoints[i][j].x, allPoints[i][j].y) < r) {
          xspeed = 0;
          yspeed = 0;
          xpull = 0;
          ypull = 0;
          touched+=1;
        }
      }
    }
    if (touched >= 1) {
      touching = true;
    }
    else {
      touching = false;
    }
  }
 
  void ballCollision(MetalBall X) {
    if (X.touching == true && magnetized == true && dist(x, y, X.x, X.y) < r + X.r) {
      collidedBall = true;
      xspeed = 0;
      yspeed = 0;
      xpull = 0;
      ypull = 0;
    }
  }
 
 
  void checkDirection () {
    if (x > oldx) {
      movingRight = true;
      movingLeft = false;
    }
    if (x < oldx) {
      movingRight = false;
      movingLeft = true;
    }
    if (y > oldy) {
      movingDown = true;
      movingUp = false;
    }
    if (y < oldy) {
      movingDown = false;
      movingUp = true;
    }
  }
}
