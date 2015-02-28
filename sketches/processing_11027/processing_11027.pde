
// import processing.opengl.*;

// Double Donut (with kaleidescopic tiling)
// acd 2010-07-28

private static int SEGMENTS1 = 18; // longitudinal, divisible by 3 (originally 24)
private static int RADIUS1 = 600;  // large
private static int SEGMENTS2 = 10; // latitudinal, divisible by 2 (originally 12)
private static int RADIUS2 = 280;  // small

static final int TEX_SIZE = 256;
float tangle, tdelta;
int back = 255, backd = 0;

PVector[][] points = new PVector[SEGMENTS1][SEGMENTS2];

float angle1, angle2, angle3, delta1, delta2, delta3;
//float langle1, langle2, langle3, ldelta1, ldelta2, ldelta3;  // unused
//float l1x, l1y, l1z, l2x, l2y, l2z, l3x, l3y, l3z;           // unused
float x0, y0, x1, y1, x2, y2;  // texture coords

PImage img1;
PImage img2;

void setup() {
  size(684, 384, P3D);      // better with OPENGL
  hint(ENABLE_DEPTH_SORT);  // not needed with OPENGL
  
  img1 = createTexture();
  img2 = createTexture();
  
  hint(ENABLE_OPENGL_4X_SMOOTH);
  for (int i = 0 ; i < SEGMENTS1 ; i++) {
    float a1;
    for (int j = 0 ; j < SEGMENTS2 ; j++) {
      if (j % 2 == 0) {        
        a1 = (TWO_PI * i) / SEGMENTS1;
      } else {
        // offset by 1/2
        a1 = (TWO_PI * (i + .5)) / SEGMENTS1;
      }
      float a2 = TWO_PI * j / SEGMENTS2;
      // small circle
      PVector v = new PVector(RADIUS1 + RADIUS2 * cos(a2), RADIUS2 * sin(a2), 0);
      // rotate around Y
      points[i][j] = rotateY(v, a1);
    }
  }
  angle1 = random(TWO_PI);
  angle2 = random(TWO_PI);
  angle3 = random(TWO_PI);
  delta1 = random(-.1, .1);
  delta2 = random(-.1, .1);
  delta3 = random(-.01, .01);
//  langle1 = random(360);  // degrees (for colour cycling)
//  langle2 = random(360);
//  langle3 = random(360);
//  ldelta1 = random(-3, 3);
//  ldelta2 = random(-3, 3);
//  ldelta3 = random(-3, 3);
  // texture angles (degrees)
  tangle = random(360);
  tdelta = random(-3, 3);
  frameRate(15);
//  noFill();
//  stroke(random(0, 255), random(0, 255), random(0, 255));
//  fill(random(192, 255), random(192, 255), random(192, 255));
//  fill(255, 255, 255);
  noStroke();
  background(random(192, 255), random(192, 255), random(192, 255));
  //smooth();
//  langle1 = random(0, TWO_PI);
//  langle2 = random(0, TWO_PI);
//  langle3 = random(0, TWO_PI);
  // light positions (unused)
//  l1x = random(1);
//  l1y = random(1);
//  l1z = random(1);
//  l2x = random(1);
//  l2y = random(1);
//  l2z = random(1);
//  l3x = random(1);
//  l3y = random(1);
//  l3z = random(1);
}

static final int RANDOM = 20;
PVector rotateY(PVector v, float angle) {
  float vx = cos(angle) * v.x - sin(angle) * v.z;
  float vy = v.y;
  float vz = sin(angle) * v.x + cos(angle) * v.z;
  return new PVector(vx, vy, vz);
//  return new PVector(vx + random(-RANDOM, RANDOM), vy + random(-RANDOM, RANDOM),  vz + random(-RANDOM, RANDOM));
}

void draw() {
  if (backd != 0) {
    back = (back + backd + 255) % 255;
    colorMode(HSB);
    background(back, 128, 255);
    colorMode(RGB);
  } else {
    background(back);
  }
  // cycle light colours
//  langle1 = (langle1 + 360 + ldelta1) % 360;
//  langle2 = (langle2 + 360 + ldelta2) % 360;
//  langle3 = (langle3 + 360 + ldelta3) % 360;
  
  angle1 += delta1;
  angle2 += delta2;
  angle3 += delta3;
//  camera(1000, 0, 0, 0, 0, 0, 0, 1, 0);
  // cam follows major radius = rotates around y
  float camx = RADIUS1 * cos(angle1);
  float camz = RADIUS1 * sin(angle1);
  // look forwards (rotated more around y)
  float lookx = RADIUS1 * cos(angle1 + 20 * delta1);
  float lookz = RADIUS1 * sin(angle1 + 20 * delta1);
  // 'up' corkscrews around z axis
  PVector v1 = new PVector(0, 0, 1);
  PVector v2 = new PVector(lookx - camx, 0, lookz - camz);
  PVector tmpUp = new PVector(cos(angle2), sin(angle2), 0);
  PVector up = rotateY(tmpUp, angle1 + 20 * delta1);
  camera(
    camx * 3, 0, camz * 3,
    lookx, 0, lookz,
    up.x, up.y, up.z);
  rotateX(angle1);
  rotateY(angle2);
  rotateZ(angle3);

  //  U
  // V W
  tangle += tdelta;
  x0 = (TEX_SIZE / 2) + (TEX_SIZE / 2) * cos(radians(tangle));
  y0 = (TEX_SIZE / 2) + (TEX_SIZE / 2) * sin(radians(tangle));
  x1 = (TEX_SIZE / 2) + (TEX_SIZE / 2) * cos(radians(tangle + 120));
  y1 = (TEX_SIZE / 2) + (TEX_SIZE / 2) * sin(radians(tangle + 120));
  x2 = (TEX_SIZE / 2) + (TEX_SIZE / 2) * cos(radians(tangle + 240));
  y2 = (TEX_SIZE / 2) + (TEX_SIZE / 2) * sin(radians(tangle + 240));
  PVector u = new PVector(x0, y0);
  PVector v = new PVector(x1, y1);
  PVector w = new PVector(x2, y2);
  
  // acd - hacked in another loop for second donut
PImage img = img1;
for (int donut = 0 ; donut < 2 ; donut++) {
  // draw these as horizontal stripes
  for (int j = 0 ; j < SEGMENTS2 ; j += 2) {
    int j1 = (j + 1) % SEGMENTS2;
    int j2 = (j + 2) % SEGMENTS2;
    for (int i = 0 ; i < SEGMENTS1 ; i += 3) {
      int i1 = (i + 1) % SEGMENTS1;
      int i2 = (i + 2) % SEGMENTS1;
      int i3 = (i + 3) % SEGMENTS1;

      PVector a = points[i][j];
      PVector b = points[i1][j];
      PVector c = points[i2][j];
      PVector d = points[i3][j];
      
      PVector A = points[i][j1];
      PVector B = points[i1][j1];
      PVector C = points[i2][j1];
      PVector D = points[i3][j1];
      
      PVector e = points[i][j2];
      PVector f = points[i1][j2];
      PVector g = points[i2][j2];
      PVector h = points[i3][j2];

      beginShape(TRIANGLES);
      texture(img);
      
      // this, i think, is the smallest tileable area
  //j  a b c d       U V W U
  //j1  A B C D       W U V W
  //j2 e f g h       U V W U

      // aAb
      tri(a, A, b, u, w, v);
      // bAB
      tri(b, A, B, v, w, u);
      // bBc
      tri(b, B, c, v, u, w);
      // cBC
      tri(c, B, C, w, u, v);
      // cCd
      tri(c, C, d, w, v, u);
      // dCD
      tri(d, C, D, u, v, w);
      
      // Aef
      tri(A, e, f, w, u, v);
      // AfB
      tri(A, f, B, w, v, u);
      // Bfg
      tri(B, f, g, u, v, w);
      // BgC
      tri(B, g, C, u, w, v);
      // Cgh
      tri(C, g, h, v, w, u);
      // ChD
      tri(C, h, D, v, u, w);
      endShape();
    }
  }
  translate(RADIUS1, 0, 0);
  rotateX(HALF_PI);
  rotateY(angle2);
  img = img2;  
}
//  noLoop();
}

void keyPressed() {
  switch (key) {
  case 'b':
    back = 0;
    backd = 0;
    break;
  case 'w':
    back = 255;
    backd = 0;
    break;
  case 't':
    img1 = createTexture();
    img2 = createTexture();
    break;
  default:
    // colour cycle
    back = (int)random(255);
    backd = (int)random(-3, 3);
    break;
  }
//  saveFrame("toroid_###.png");
//  delay(5);
}

void point(PVector p) {
  point(p.x, p.y, p.z);
}

void vertex(PVector p, PVector t) {
  vertex(p.x, p.y, p.z, t.x, t.y);
}

void vertex(PVector p, float x, float y) {
  vertex(p.x, p.y, p.z, x, y);
}

void tri(PVector p0, PVector p1, PVector p2, PVector t0, PVector t1, PVector t2) {
  vertex(p0, t0);
  vertex(p1, t1);
  vertex(p2, t2);
}

