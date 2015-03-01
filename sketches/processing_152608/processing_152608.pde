


/**   Hyperboloide
 *
 *   fait par Jacques Maire
 *
 *  mardi 24 juin 2014
 *
 *    http://www.xelyx.fr
 *
 *   
 *   Un hyperboloide  comme  enveloppe de droites.
 **/

Arcball arcball;

float  temps, angled, rayon;
PVector[] points;
PVector centreBas, centreHaut;
//int npts, sequence;

void setup() {
  size(600, 600, P3D);
  arcball = new Arcball( 600);


  rayon=700;
  centreBas=new PVector(0, -200, 0);
  centreHaut=new PVector(0, -200, 1000);
}

void draw() {
  background(0);
  noStroke();
 
  directionalLight(255, 0, 0, 1, 1, 1);
  directionalLight(0, 0, 255, -1, 0, -1);
  directionalLight(255, 255, 0, 0, -1, -1);
  directionalLight(255, 0, 255, -1, 0, -1);
  directionalLight(0, 255, 255, -1, -2, -1);

  pushMatrix();
  arcball.run(300, -400);
  rotateX(-0.27);
  repere();
  angled=millis()*0.0005;

  temps=0.5+0.35*cos(millis()*0.001);
  int nbdroites=50;
  for (int i=0; i<nbdroites; i++) {
    float the1=TWO_PI*i/nbdroites+angled;
    float the2=the1+PI*(0.8+0.35*temps);
    PVector v1=PVector.add(centreBas, new PVector( rayon*cos(the1), rayon*sin(the1)));
    PVector v2=PVector.add(centreHaut, new PVector( rayon*cos(the2), rayon*sin(the2)));
    placerBox(v1, v2, 15, #888888);
    v1=PVector.add(centreBas, new PVector( rayon*cos(-the1), rayon*sin(-the1)));
    v2=PVector.add(centreHaut, new PVector( rayon*cos(-the2), rayon*sin(-the2)));
    placerBox(v1, v2, 15, #999999);
  }
  fill(100, 0, 150);
  sphere(1200);
  popMatrix();
}

void mousePressed() {
  arcball.mousePressed();
}

void mouseDragged() {
  arcball.mouseDragged();
}

void placerBox(PVector vh, PVector vb, float cot, color col) {
  PVector m=PVector.add(PVector.mult(vh, 0.5), PVector.mult(vb, 0.5));
  PVector w=PVector.sub(vh, vb);
  float lon=w.mag();
  PVector n=new PVector(0, -w.z, w.y);
  n.normalize();
  w.normalize();
  pushMatrix();
  translate(m.x, m.y, m.z);
  rotate(acos(w.x), n.x, n.y, n.z);
  fill(col);
  box(lon, cot, cot);
  popMatrix();
}


void repere() {
  pushMatrix();
  translate(20, 0, 0);
  fill(255, 0, 0);
  box(40, 2, 2);
  popMatrix();
  pushMatrix();
  translate(0, 20, 0);
  fill(0, 255, 0);
  box(2, 40, 2);
  popMatrix();
  pushMatrix();
  translate(0, 0, 20);
  fill(0, 0, 255);
  box(2, 2, 40);
  popMatrix();
}


//Ken Shoemake :http://www.tecgraf.puc-rio.br/~mgattass/fcg/material/old/shoemake92.pdf



class Arcball {

  float center_x, center_y, radius;
  PVector v_down, v_drag;
  Quat q_now, q_down, q_drag;
  PVector[] axisSet;
  int axis;
  float mxv, myv;
  float x, y;

  Arcball( float radius) {

    this.radius = radius;

    v_down = new PVector();
    v_drag = new PVector();

    q_now = new Quat();
    q_down = new Quat();
    q_drag = new Quat();

    axisSet = new PVector[] {
      new PVector(1.0f, 0.0f, 0.0f), new PVector(0.0f, 1.0f, 0.0f), new PVector(0.0f, 0.0f, 1.0f)
      };
      axis = -1;
  }

  void mousePressed() {
    v_down = mouse_to_sphere(mouseX, mouseY);
    q_down.set(q_now);
    q_drag.reset();
  }

  void mouseDragged() {
    v_drag = mouse_to_sphere(mouseX, mouseY);
    q_drag.set(v_down.dot( v_drag), v_down.cross( v_drag));
  }

  void run(float dy, float dz) {
    center_x = width/2.0;
    center_y = height/2.0;

    q_now = Quat.mul(q_drag, q_down);
    translate(center_x, center_y+dy, dz);
    applyQuat2Matrix(q_now);

    x += mxv;
    y += myv;
    mxv -= mxv * .01;
    myv -= myv * .01;
  }

  PVector mouse_to_sphere(float x, float y) {
    PVector v = new PVector();
    v.x = (x - center_x) / radius;
    v.y = (y - center_y) / radius;

    float mag = v.x * v.x + v.y * v.y;
    if (mag > 1.0f) {
      v.normalize();
    } else {
      v.z = sqrt(1.0f - mag);
    }

    return (axis == -1) ? v : constrain_vector(v, axisSet[axis]);
  }

  PVector constrain_vector(PVector vector, PVector axis) {

    PVector res =PVector.sub(vector, PVector.mult(axis, axis.dot(vector)));
    res.normalize();
    return res;
  }

  void applyQuat2Matrix(Quat q) {
    // instead of transforming q into a matrix and applying it...

    float[] aa = q.getValue();
    rotate(aa[0], aa[1], aa[2], aa[3]);
  }
}



static class Quat {
  float w, x, y, z;

  Quat() {
    reset();
  }

  Quat(float w, float x, float y, float z) {
    this.w = w;
    this.x = x;
    this.y = y;
    this.z = z;
  }

  void reset() {
    w = 1.0f;
    x = 0.0f;
    y = 0.0f;
    z = 0.0f;
  }

  void set(float w, PVector v) {
    this.w = w;
    x = v.x;
    y = v.y;
    z = v.z;
  }

  void set(Quat q) {
    w = q.w;
    x = q.x;
    y = q.y;
    z = q.z;
  }

  static Quat mul(Quat q1, Quat q2) {
    Quat res = new Quat();
    res.w = q1.w * q2.w - q1.x * q2.x - q1.y * q2.y - q1.z * q2.z;
    res.x = q1.w * q2.x + q1.x * q2.w + q1.y * q2.z - q1.z * q2.y;
    res.y = q1.w * q2.y + q1.y * q2.w + q1.z * q2.x - q1.x * q2.z;
    res.z = q1.w * q2.z + q1.z * q2.w + q1.x * q2.y - q1.y * q2.x;
    return res;
  }

  float[] getValue() {
    // transforming this quat into an angle and an axis vector...

    float[] res = new float[4];

    float sa = (float) Math.sqrt(1.0f - w * w);
    if (sa < EPSILON) {
      sa = 1.0f;
    }

    res[0] = (float) Math.acos(w) * 2.0f;
    res[1] = x / sa;
    res[2] = y / sa;
    res[3] = z / sa;

    return res;
  }
}


