
// 3D Cohen-Sutherland
// acd (c)2010 

import peasy.*;

static int SIZE = 100;
PeasyCam cam;
PVector a, b;
PVector ca, cb;  // clipped points
int abits, bbits;

static int U = 0x0000001;  // up
static int D = 0x0000010;  // down
static int L = 0x0000100;  // left
static int R = 0x0001000;  // right
static int F = 0x0010000;  // front
static int B = 0x0100000;  // back

void setup() {
  size(400, 400, P3D);
  cam = new PeasyCam(this, 500);
  calc();
}

// whether this is outside and in which direction
int categorise(PVector p) {
  int v = 0;  // value
  if (p.x > SIZE) {
    v |= U;
  }
  if (p.x < -SIZE) {
    v |= D;
  }
  if (p.y > SIZE) {
    v |= L;
  }
  if (p.y < -SIZE) {
    v |= R;
  }
  if (p.z > SIZE) {
    v |= F;
  }
  if (p.z < -SIZE) {
    v |= B;
  }
  return v;
}

void calc() {
  // random line ends
  a = new PVector();
  a.x = random(-SIZE * 2, SIZE * 2);
  a.y = random(-SIZE * 2, SIZE * 2);
  a.z = random(-SIZE * 2, SIZE * 2);
  b = new PVector();
  b.x = random(-SIZE * 2, SIZE * 2);
  b.y = random(-SIZE * 2, SIZE * 2);
  b.z = random(-SIZE * 2, SIZE * 2);
  // categorise endpoints
  abits = categorise(a);
  bbits = categorise(b);
  println("A: " + binary(abits, 6));
  println("B: " + binary(bbits, 6));
  // clip
  ca = new PVector(a.x, a.y,  a.z);
  cb = new PVector(b.x, b.y,  b.z);
  while (true) {
    if (abits == 0 && bbits == 0) {
      // both inside - done
      println("Both inside");
      break;
    } else if ((abits & bbits) != 0) {
      // both outside (in same direction) - reject
      ca = null;
      cb = null;
      println("Both outside");
      break;
    } else {
      PVector t = new PVector();  // tmp
      float ratio;
      // something needs clipping
      // use a if it's a, b if it's b
      int codeout = (abits != 0) ? abits : bbits;
      if (codeout == abits) {
        println("Clipping Point A");
      } else {
        println("Clipping Point B");
      }
      if ((codeout & U) != 0) {
        println("Clipping U");
        ratio = (SIZE - ca.x) / (cb.x - ca.x);
        t.x = SIZE;
        t.y = lerp(ca.y, cb.y, ratio);
        t.z = lerp(ca.z, cb.z, ratio);
      } else if ((codeout & D) != 0) {
        println("Clipping D");
        ratio = (-SIZE - ca.x) / (cb.x - ca.x);
        t.x = -SIZE;
        t.y = lerp(ca.y, cb.y, ratio);
        t.z = lerp(ca.z, cb.z, ratio);
      } else if ((codeout & L) != 0) {
        println("Clipping L");
        ratio = (SIZE - ca.y) / (cb.y - ca.y);
        t.x = lerp(ca.x, cb.x, ratio);
        t.y = SIZE;
        t.z = lerp(ca.z, cb.z, ratio);
      } else if ((codeout & R) != 0) {
        println("Clipping R");
        ratio = (-SIZE - ca.y) / (cb.y - ca.y);
        t.x = lerp(ca.x, cb.x, ratio);
        t.y = -SIZE;
        t.z = lerp(ca.z, cb.z, ratio);
      } else if ((codeout & F) != 0) {
        println("Clipping F");
        ratio = (SIZE - ca.z) / (cb.z - ca.z);
        t.x = lerp(ca.x, cb.x, ratio);
        t.y = lerp(ca.y, cb.y, ratio);
        t.z = SIZE;
      } else if ((codeout & B) != 0) {
        println("Clipping B");
        ratio = (-SIZE - ca.z) / (cb.z - ca.z);
        t.x = lerp(ca.x, cb.x, ratio);
        t.y = lerp(ca.y, cb.y, ratio);
        t.z = -SIZE;
      }
      // do the other point, if necessary
      if (codeout == abits) {
        ca.x = t.x;
        ca.y = t.y;
        ca.z = t.z;
        abits = categorise(ca);
      } else {
        cb.x = t.x;
        cb.y = t.y;
        cb.z = t.z;
        bbits = categorise(cb);
      }
    }
  }
}

void draw() {
  background(255);
  // clipping box (black)
  stroke(0);
  fill(128, 128, 128, 128);
  box(SIZE * 2, SIZE * 2, SIZE * 2);

  // complete line (green)
  stroke(0, 255, 0);
  line(a.x, a.y, a.z, b.x, b.y, b.z);

  // endpoints (red and blue)
  noStroke();
  fill(255, 0, 0);
  pushMatrix();
  translate(a.x, a.y, a.z);
  sphere(5);
  popMatrix();
  fill(0, 0, 255);
  pushMatrix();
  translate(b.x, b.y, b.z);
  sphere(5);
  popMatrix();
  
  // clipped line (if exists) (thick black)
  if (ca != null) {
    strokeWeight(4);
    stroke(0);
    line(ca.x, ca.y, ca.z, cb.x, cb.y, cb.z);
    strokeWeight(1);
  }
}

void keyPressed() {
  calc();
}

