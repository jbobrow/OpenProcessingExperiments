
//claire gustavson, section A, copywrite 2012.
float tx, ty, td, tSpeed, tx2, ty2, ts2, txSpeed2, tySpeed2, tx2NEW, ty2NEW, txSpeed2NEW, tySpeed2NEW, count ;
PImage r, a, rab;


void setup() {
  size (400, 400);
  background (255, 255, 255);
  r = loadImage("raspberry.png");
  a = loadImage ("almonds-heart-pair-big.png");
  rab = loadImage ("bun.jpg");
  ty= random (0, height);
  td=60;
  tx = -(td/2);
  tSpeed=3;
  tx2 = random (0, width);
  ty2 =random (0, height);
  tx2NEW = random (0, width);
  ty2NEW =random (0, height);
  ts2 = 100;
  txSpeed2 = random (2, 6);
  tySpeed2 = random (2, 6);
  txSpeed2NEW  = random (2, 6);
  tySpeed2NEW  = random (2, 6);
  count =0;

  smooth();
}

void draw () {



  prepWindow();
  balls(tx, ty, td);
  moveBalls ();
  bounceball (tx2, ty2, td);
  bouceBounceball ();
  checkHit();
}

void balls (float x, float y, float s) {
  smooth (); 
  noStroke();
  image(r, x, y, s, s);
}

void moveBalls () {
  ty=ty+tSpeed;
  if (ty> height+ td/2) {
    ty=-(td/2);
  }
  if (tx > 400 + td/2) {
    tx = -(td/2);
  } 
  else {
    tx ++;
  }
  if (mousePressed) {
    tx=tx+td/2;
  }
}
void prepWindow () {
  smooth();
  fill (255, 5);
  rect (0, 0, width, height);
  fill (255, 200, 200);
  stroke(0);
  rect ((width/6)-2, (height/6)-15, 55, 19);

  rect ((width/6)-2, (height/4)-15, 55, 19);
  fill (0);
  text((int) count, (width/6), height/4);
  text(millis( )/1000, width/6, height/6);
}

void bounceball (float x, float y, float s) {

  smooth (); 
  noStroke();
  image(a, x, y, s, s);
}

void bouceBounceball () {
  tx2 = tx2 + txSpeed2;
  ty2 = ty2 + tySpeed2;
  if ((tx2 >= width - td/2 )) {
    txSpeed2 = -txSpeed2;
  }
  else if  
    ( tx2 <= 0 + td/2) {
    txSpeed2 = - txSpeed2;
  }

  if (ty2 >= height - td/2) {
    tySpeed2 = -tySpeed2;
  }
  else if (ty2 <= 0 - td/2) {
    tySpeed2 = -tySpeed2;
  }
}


void checkHit()
{
  if (dist(tx, ty, tx2, ty2) < td/2)
  {
    fill (255, 255, 255);
    rect (0, 0, width, height);
    println("hit!!!!");
    image(rab, width/4, height/8);
    tx2=tx2NEW;
    ty2=ty2NEW;
    txSpeed2 = txSpeed2NEW;
    tySpeed2 =  tySpeed2NEW;
    count++;
  }
}


