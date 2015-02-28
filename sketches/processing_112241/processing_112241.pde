
/*
Coded by Kof @ 
Fri Sep 27 15:59:27 CEST 2013
Impermanent.. as any other thorought, or state of matter



   ,dPYb,                  ,dPYb,
   IP'`Yb                  IP'`Yb
   I8  8I                  I8  8I
   I8  8bgg,               I8  8'
   I8 dP" "8    ,ggggg,    I8 dP
   I8d8bggP"   dP"  "Y8ggg I8dP
   I8P' "Yb,  i8'    ,8I   I8P
  ,d8    `Yb,,d8,   ,d8'  ,d8b,_
  88P      Y8P"Y8888P"    PI8"8888
                           I8 `8,
                           I8  `8,
                           I8   8I
                           I8   8I
                           I8, ,8'
                            "Y8P'
 
 */

int num = 60;

float SPREAD = 0.93;
float SPEED = 435.0;
float ANGLE = 160.0;

int NUM_SEGMENTS = 4;

boolean APPLIED = true;

boolean NOISED = false;

int TRAIL_LENGTH = 200;
int TRAIL_ALPHA = 30;

float ALPHA = 80;

PVector center;

float W = 20;
float S = 10;
float L = 30;
float V = 50;

float SCALE = 1;

ArrayList bones;
PMatrix3D clean;

PVector target = new PVector(0, 0, L);

PImage texture;

void setup() {
  size(800, 600, P3D);
  noSmooth();

  texture = loadImage("texture.png");
  textureMode(NORMAL);

  center = new PVector();

  clean = new PMatrix3D(
      1, 0, 0, 0, 
      0, 1, 0, 0, 
      0, 0, 1, 0, 
      0, 0, 0, 1
      );

  printMatrix();


  bones = new ArrayList();
  Rovina first = new Rovina(clean);
  bones.add(first);
  for (int i = 1 ; i < num; i ++) {
    Rovina previous = (Rovina)bones.get(i-1);//bones.size()-1);
    bones.add(new Rovina(clean, previous));
  }

  strokeWeight(1);
}

float snoise = 1.0;

void draw() {
  snoise += (noise(frameCount/10.0)*20-snoise)/100.0;
  background(0);
  for (int i = 0 ; i < bones.size();i++) {
    Rovina r = (Rovina)bones.get(i);
    r.rotate(
        (noise(i*SPREAD+frameCount/SPEED, 0, 0)-0.5)*ANGLE, 
        (noise(0, i*SPREAD+frameCount/SPEED, 0)-0.5)*ANGLE, 
        (noise(0, 0, i*SPREAD+frameCount/SPEED)-0.5)*ANGLE
        );
  }
  lights();
  pushMatrix();
  translate(width/2, height/2, -200);
  scale(SCALE);
  rotateX(QUARTER_PI);
  rotateY(QUARTER_PI+frameCount/200.0);
  rotateZ(QUARTER_PI+frameCount/300.0);
  for (int i = 0 ; i < bones.size();i++) {
    Rovina r = (Rovina)bones.get(i);
    r.updateVertices();
  }
  noStroke();
  fill(127);
  hint(DISABLE_DEPTH_TEST);
  for (int b = 1 ; b < bones.size();b++) {
    Rovina r1 = (Rovina)bones.get(b-1);
    ArrayList verts1 = r1.vertices;
    Rovina r2 = (Rovina)bones.get(b);
    ArrayList verts2 = r2.vertices;

    PVector vert1[] = new PVector[r1.vertices.size()];
    PVector vert2[] = new PVector[r2.vertices.size()];

    if (vert1.length==vert2.length) {
      for (int i = 0 ; i < vert1.length;i++) {
        vert1[i] = (PVector)r1.vertices.get(i);
        vert2[i] = (PVector)r2.vertices.get(i);
      }
    }
  }

  for (int i = 0 ; i < bones.size();i++) {
    Rovina r = (Rovina)bones.get(i);
    r.draw();
  }

  noStroke();
  Rovina first = (Rovina)bones.get(0);

  for (int q = 1 ; q < first.trail.size();q++) {
    for (int i = 1 ; i < bones.size();i++) {
      Rovina A = (Rovina)bones.get(i-1);
      Rovina B = (Rovina)bones.get(i);


      PVector a = (PVector)A.trail.get(q-1);
      PVector b = (PVector)A.trail.get(q%first.trail.size());
      PVector c = (PVector)B.trail.get(q%first.trail.size());
      PVector d = (PVector)B.trail.get(q-1);

      center.x += (a.x-center.x)/(TRAIL_LENGTH*bones.size());
      center.y += (a.y-center.y)/(TRAIL_LENGTH*bones.size());
      center.z += (a.z-center.z)/(TRAIL_LENGTH*bones.size());



      float Vs = (float)(first.trail.size());
      float Us = (float)bones.size();


      fill(255,map(q,0,first.trail.size(),0,255));
      beginShape(QUADS);
      texture(texture);
      vertex(a.x, a.y, a.z,(i-1)/Us,(q-1)/Vs);
      vertex(b.x, b.y, b.z,(i-1)/Us,(q)/Vs);
      vertex(c.x, c.y, c.z,i/Us , q/Vs);
      vertex(d.x, d.y, d.z,i/Us,(q-1)/Vs);
      endShape();

    }
  }
  popMatrix(); // end world
}

class Rovina {
  PMatrix3D matrix, base;
  Rovina parent;
  ArrayList vertices;
  PVector origin;  
  PVector relPoint;
  ArrayList trail;
  Rovina(PMatrix3D _mat) {
    initialize(_mat);
    trail = new ArrayList();
  }
  Rovina(PMatrix3D _mat, Rovina _parent) {
    parent = _parent;
    initialize(_mat);
    trail = new ArrayList();
    base.m03 = target.x;
    base.m13 = target.y;
    base.m23 = target.z;
    updateVertices();
  }

  void initialize(PMatrix _mat) {
    matrix = new PMatrix3D(_mat);
    base = new PMatrix3D(_mat);
    origin = absolutePoint(0, 0, 0);
    relPoint = absolutePoint(target.x, target.y, target.z);
  }

  void updateVertices() {
    if (parent!=null)
      inherit();

    origin  = absolutePoint(0, 0, 0);
    relPoint = absolutePoint(target.x, target.y, target.z);

    vertices = new ArrayList();
    float step = radians(360.0/(NUM_SEGMENTS+0.0));

    for (float f = 0 ; f < radians(360) ; f += step) {
      if (NOISED) {
        float shiftX = (noise(f/radians(360), bones.indexOf(this)/10.0+frameCount/80.0))*4.0;
        float shiftY = (noise(bones.indexOf(this)/10.0+frameCount/80.0, f/radians(360)))*4.0;
        vertices.add(absolutePoint(
              cos(f)*V*shiftX, 
              sin(f)*V*shiftY, 
              0));
      }
      else {
        vertices.add(absolutePoint(
              cos(f)*V, 
              sin(f)*V, 
              0));
      }
    }
  }
  PVector relativePoint(float _x, float _y, float _z) {
    PVector test = new PVector(_x+0000.1, _y, _z);
    PVector pt = new PVector(_x, _y, _z);
    PMatrix3D nn = new PMatrix3D(matrix);
    nn.invert();
    nn.mult(test, pt);
    return pt;
  }

  PVector absolutePoint(float _x, float _y, float _z) {
    PVector pt = new PVector(_x, _y, _z);
    PVector test = new PVector(pt.x+0.00001, pt.y, pt.z);
    PMatrix3D nn = new PMatrix3D(matrix);
    nn.mult(test, pt);
    return pt;
  }

  void inherit() {
    matrix.preApply(parent.matrix);
  }

  void rotate(float _x, float _y, float _z) {
    float radx = radians(_x);
    float rady = radians(_y);
    float radz = radians(_z);

    float ca = cos(radx);
    float sa = sin(radx);

    float cb = cos(rady);
    float sb = sin(rady);

    float cg = cos(radz);
    float sg = sin(radz);

    float[] mat = new float[16];
    matrix = new PMatrix3D(base);
    matrix.get(mat);


    // working pure hell matrix solution for rotation in X,Y,Z
    matrix = new PMatrix3D(
        cb*cg, cg*sa*sb-ca*sg, ca*cg*sb+sa*sg, mat[3], 
        cb*sg, ca*cg+sa*sb*sg, -cg*sa+ca*sb*sg, mat[7], 
        -sb, cb*sa, ca*cb, mat[11], 
        mat[12], mat[13], mat[14], mat[15]
        );
  }

  void draw() {
    if (APPLIED) {
      pushMatrix();
      origin = new PVector(0, 0, 0);
      relPoint = new PVector(target.x, target.y, target.z);
      applyMatrix(matrix);

      noFill();
      stroke(255, ALPHA);
      rectMode(CENTER);
      popMatrix();
      origin = absolutePoint(0, 0, 0);
      relPoint = absolutePoint(target.x, target.y, target.z);
      addTrail();
    }
  }

  void addTrail() {
    trail.add(new PVector(relPoint.x, relPoint.y, relPoint.z));
    if (trail.size()>TRAIL_LENGTH)
      trail.remove(0);
  }

  void drawTrail() {
    strokeWeight(1);
    if (trail.size()>=1)
      for (int i = 1 ; i < trail.size();i+=1) {
        PVector t1 = (PVector)trail.get(i-1);
        PVector t2 = (PVector)trail.get(i);
        stroke(255, map(i, 0, trail.size(), 0, TRAIL_ALPHA));
        line(t1.x, t1.y, t1.z, t2.x, t2.y, t2.z);
      }
  }
}



