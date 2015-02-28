
/*
 * Generic Vertebrate
 * rig test by Krystof & Jachym Pesek
 * 2013
 */

int num = 60;

float SPREAD = 0.033;
float SPEED = 150.0;
float ANGLE = 50.0;

int NUM_SEGMENTS = 16;

boolean APPLIED = true;

boolean NOISED = false;

int TRAIL_LENGTH = 200;
int TRAIL_ALPHA = 30;

float ALPHA = 80;

float W = 20;
float S = 10;
float L = 20;
float V = 50;

float SCALE = 0.45;

ArrayList bones;
PMatrix3D clean;

PVector target = new PVector(0, 0, L);

PImage texture;

void setup() {
  size(800, 600, P3D);
  noSmooth();

  texture = loadImage("texture.png");
  textureMode(NORMAL);

  clean = new PMatrix3D(
  1, 0, 0, 0, 
  0, 1, 0, 0, 
  0, 0, 1, 0, 
  0, 0, 0, 1
    );

  printMatrix();


  bones = new ArrayList();
  
  // root bone
  Rovina first = new Rovina(clean);
  bones.add(first);

  // let's fill the bones arrayList with dependent bones
  for (int i = 0 ; i < num; i ++) {
    Rovina previous = (Rovina)bones.get(bones.size()-1);
    bones.add(new Rovina(clean, previous));
  }

  strokeWeight(1);
}



void draw() {
  background(0);

  // set X,Y,Z rotation per bone
  for (int i = 0 ; i < bones.size();i++) {
    Rovina r = (Rovina)bones.get(i);
    r.rotate(
    (noise(i*SPREAD+frameCount/SPEED, 0, 0)-0.5)*ANGLE, 
    (noise(0, i*SPREAD+frameCount/SPEED, 0)-0.5)*ANGLE, 
    (noise(0, 0, i*SPREAD+frameCount/SPEED)-0.5)*ANGLE
      );
  }


  // set coordinates of the world 
  pushMatrix();
  translate(width/2, height/2, -200);
  scale(SCALE);
  rotateX(QUARTER_PI);
  rotateZ(QUARTER_PI+frameCount/300.0);

  // lights to see some shading
  lights();

  // apply vertices transformations here
  for (int i = 0 ; i < bones.size();i++) {
    Rovina r = (Rovina)bones.get(i);
    r.updateVertices();
  }

  noStroke();
  fill(127);

  // draw trails 
  for (int i = 0 ; i < bones.size();i++) {
    Rovina r = (Rovina)bones.get(i);
    r.drawTrail();
  }

  // for 3d geom use depth test to display properly
  hint(ENABLE_DEPTH_TEST);

  // now we have everything prepared lets construct the mesh
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

      for (int i = 1 ; i < vert1.length + 1; i += 1) {
        PVector v1 = vert1[i-1];
        PVector v2 = vert1[i%vert1.length];
        PVector v3 = vert2[i%vert1.length];
        PVector v4 = vert2[i-1];

        float Us = (float)(vert1.length);
        float Vs = (float)bones.size();


        // texture with basic mapping added.. beware of processing 2+
        // beginShape(QUADS) is obsolete
        noStroke();
        beginShape(QUADS);
        texture(texture);
        vertex(v1.x, v1.y, v1.z, (i-1)/Us, (b-1)/Vs);
        vertex(v2.x, v2.y, v2.z, (i)/Us, (b-1)/Vs);
        vertex(v3.x, v3.y, v3.z, (i)/Us, (b)/Vs);
        vertex(v4.x, v4.y, v4.z, (i-1)/Us, (b)/Vs);
        endShape();
      }
    }
  }




  // for geometry helpers disabling depth test to see through vertexes
  hint(DISABLE_DEPTH_TEST);

  // draw geom hits here 
  for (int i = 0 ; i < bones.size();i++) {
    Rovina r = (Rovina)bones.get(i);
    r.draw();
  }

  popMatrix(); // end world
}


// rovina == plane, general class to handle
// matrix manipulations and vertices construction
// some basic drawing included
class Rovina {
  // live matrix and the staring one
  PMatrix3D matrix, base;

  // parental bone
  Rovina parent;

  // geometry vertices
  ArrayList vertices;

  // zero point and directional
  // later on converted to world space
  PVector origin;  
  PVector relPoint;

  // trail points (PVector)
  ArrayList trail;

  // root bone construction
  Rovina(PMatrix3D _mat) {
    initialize(_mat);
    trail = new ArrayList();
  }

  // child construction
  Rovina(PMatrix3D _mat, Rovina _parent) {
    parent = _parent;
    
    //basic initialization of our matices
    initialize(_mat);
    trail = new ArrayList();

    // setting basic offset directly to matrix
    base.m03 = target.x;
    base.m13 = target.y;
    base.m23 = target.z;
    
    // let's construct our geometry
    updateVertices();
  }

  void initialize(PMatrix _mat) {
    matrix = new PMatrix3D(_mat);
    base = new PMatrix3D(_mat);

    origin = absolutePoint(0, 0, 0);
    relPoint = absolutePoint(target.x, target.y, target.z);
   }

  // function to refresh geometry based on current matrix position
  void updateVertices() {
    if (parent!=null)
      inherit();

    origin  = absolutePoint(0, 0, 0);
    relPoint = absolutePoint(target.x, target.y, target.z);

    vertices = new ArrayList();

    // compute number of sgmnts
    float step = radians(360.0/(NUM_SEGMENTS+0.0));

    for (float f = 0 ; f < radians(360) ; f += step) {
      // perlins noise for fun
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

  // this should retrieve world to local coordinate system point
  PVector relativePoint(float _x, float _y, float _z) {
    // processing 1.5.1 fix (???)
    PVector test = new PVector(_x+00001, _y, _z);
    PVector pt = new PVector(_x, _y, _z);
    
    PMatrix3D nn = new PMatrix3D(matrix);
    nn.invert();
    nn.mult(test, pt);

    return pt;
  }


  // PVector retrieving local to world coordinate system point
  PVector absolutePoint(float _x, float _y, float _z) {
    PVector pt = new PVector(_x, _y, _z);

    // 1.5.1 processing bugfix (???)
    PVector test = new PVector(pt.x+0.00001, pt.y, pt.z);

    PMatrix3D nn = new PMatrix3D(matrix);
    nn.mult(test, pt);

    return pt;
  }

  // this function recieves parent's matrix state to apply on itself
  void inherit() {
    matrix.preApply(parent.matrix);
  }

  // custom rotational function in arbitrary space
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
      // this is more for test.. applyMatrix called for each bone
      // should display same result as working with math only
      pushMatrix();
      origin = new PVector(0, 0, 0);
      relPoint = new PVector(target.x, target.y, target.z);
      applyMatrix(matrix);

      noFill();
      stroke(255, ALPHA);
      rectMode(CENTER);



      strokeWeight(1);

      rect(0, 0, W, W);
      
      // obligatory fancy space anchors

      stroke(#ff0000, ALPHA);
      line(0, 0, 0, W/2, 0, 0);

      stroke(#00ff00, ALPHA);
      line(0, 0, 0, 0, W/2, 0);

      stroke(#0000ff, ALPHA);
      line(0, 0, 0, 0, 0, W/2);

      popMatrix();
      // here visual test ends

      // get the actual origin (0,0,0) and target real-world coordinates
      origin = absolutePoint(0, 0, 0);
      relPoint = absolutePoint(target.x, target.y, target.z);
      
      //these are just helpers to check validity of matrices transformations
      strokeWeight(2);
      stroke(#ff0000, ALPHA);
      line(relPoint.x-S, relPoint.y, relPoint.z, relPoint.x+S, relPoint.y, relPoint.z);
      stroke(#00ff00, ALPHA);
      line(relPoint.x, relPoint.y-S, relPoint.z, relPoint.x, relPoint.y+S, relPoint.z);
      stroke(#0000ff, ALPHA);
      line(relPoint.x, relPoint.y, relPoint.z-S, relPoint.x, relPoint.y, relPoint.z+S);

      strokeWeight(10);
      stroke(#ffff00, ALPHA);
      line(origin.x, origin.y, origin.z, relPoint.x, relPoint.y, relPoint.z);

      // trail-grow routine
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



