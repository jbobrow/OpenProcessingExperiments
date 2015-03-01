
/* @pjs preload="louise.jpg"; 
 */




/** Kaleidoscope 3D
 *
 *  fait par Jacques Maire
 *
 *  Vendredi 20 juin 2014
 *
 *  http://www.xelyx.fr , http://www.alcys.com
 *
 *  Reprise en processing.js d'un sketch de http://www.alcys.com 
 *
 **/

Arcball arcball;
PImage acc;
PVector axe0, axe1;
Quat[] qua;
float tempo, temps, rotx, roty;
int nb, incr;


void setup() {
  size(600, 600, P3D); 
  arcball = new Arcball( 600);
  acc=loadImage("louise.jpg");
  tempo=0;
  nb=12;
  incr=2;
  temps=0;
  rotx=0;
  roty=0;
}

void draw() { 

 
  background(0,0,50);
 tempo+=0.005f;
  initier(tempo*0.05f);
  lights();
  lights();
 
  arcball.run(0, -800);

 


  int sens=1;
  noStroke();
  fill(255);
  for (int i=0; i<nb; i++) {
    pushMatrix();  

    float[] aa = qua[i].getValue();
    rotate(aa[0], aa[1], aa[2], aa[3]);
    translate(300, 0, 0);
    rotateX(tempo*sens);
    rotateY(tempo*sens);//translate(0,0,300*sin(tempo));
    rotateZ(2*tempo);//translate(0,0,300*cos(tempo));

    boite(180+50*sin(tempo), sens);
    sens*=-1;  
    popMatrix();
  }
}

void mouseReleased() {
  incremente();
  initier(temps/8000);
}



void mousePressed() {
  arcball.mousePressed();
}

void mouseDragged() {
  arcball.mouseDragged();
}
void incremente() {
  if (nb==18||nb==2) incr*=-1;
  nb=nb+incr;
}



void initier(float t) {
  qua=new Quat[nb];
  for (int i=0; i<nb; i++) {
    axe0=new PVector(1+cos(t), 1, 0) ;
    axe0.normalize();
    qua[i]=new Quat(cos(PI*i/nb), PVector.mult(axe0, sin(PI*i/nb)));
  }
}

void axeXYZ() {
  noStroke();
  pushMatrix();
  translate(150, 0, 0);
  fill(255, 0, 0);
  box(300, 25, 25);
  popMatrix();
  pushMatrix();
  translate(0, 150, 0);
  fill(0, 255, 0);
  box(25, 300, 25);
  popMatrix();
  pushMatrix();
  translate(0, 0, 150);
  fill(0, 0, 255);
  box(25, 25, 300);
  popMatrix();
}
void boite(float d, int sens) {
  if (sens>0) {  
    beginShape(QUADS);
    texture(acc);
    vertex(-d, -d, -d, 0, 0);
    vertex(d, -d, -d, acc.width, 0);
    vertex(d, d, -d, acc.width, acc.height);
    vertex(-d, d, -d, 0, acc.height);

    vertex(-d, d, d, 0, 0);
    vertex(d, d, d, acc.width, 0);
    vertex(d, -d, d, acc.width, acc.height);
    vertex(-d, -d, d, 0, acc.height);

    vertex(-d, -d, d, 0, 0);
    vertex(-d, -d, -d, acc.width, 0);
    vertex(-d, d, -d, acc.width, acc.height);
    vertex(-d, d, d, 0, acc.height);

    vertex(d, -d, -d, 0, 0);
    vertex(d, -d, d, acc.width, 0);
    vertex(d, d, d, acc.width, acc.height);
    vertex(d, d, -d, 0, acc.height);

    vertex(-d, -d, d, 0, 0);
    vertex(d, -d, d, acc.width, 0);
    vertex(d, -d, -d, acc.width, acc.height);
    vertex(-d, -d, -d, 0, acc.height);

    vertex(-d, d, -d, 0, 0);
    vertex(d, d, -d, acc.width, 0);
    vertex(d, d, d, acc.width, acc.height);
    vertex(-d, d, d, 0, acc.height);
    endShape();
  } else {

    beginShape(QUADS);
    texture(acc);
    vertex( -d, d, -d, 0, 0);
    vertex(d, d, -d, acc.width, 0);
    vertex(d, -d, -d, acc.width, acc.height);
    vertex( -d, -d, -d, 0, acc.height);

    vertex(-d, -d, d, 0, 0);
    vertex(d, -d, d, acc.width, 0);
    vertex(d, d, d, acc.width, acc.height);
    vertex(-d, d, d, 0, acc.height);

    vertex(-d, -d, -d, 0, 0);
    vertex(-d, -d, d, acc.width, 0);
    vertex(-d, d, d, acc.width, acc.height);
    vertex(-d, d, -d, 0, acc.height);

    vertex(d, d, -d, 0, 0);
    vertex(d, d, d, acc.width, 0);
    vertex(d, -d, d, acc.width, acc.height);
    vertex(d, -d, -d, 0, acc.height);

    vertex(-d, -d, -d, 0, 0);
    vertex(d, -d, -d, acc.width, 0);
    vertex(d, -d, d, acc.width, acc.height);
    vertex(-d, -d, d, 0, acc.height);

    vertex(-d, d, d, 0, 0);
    vertex(d, d, d, acc.width, 0);
    vertex(d, d, -d, acc.width, acc.height);
    vertex(-d, d, -d, 0, acc.height);
    endShape();
  }
}









void quad4(PVector a, PVector b, PVector c, PVector d, color c1, color c2) {

  beginShape();
  fill(c1);
  vertex( a.x, a.y, a.z);        
  vertex( b.x, b.y, b.z);
  fill(c2);
  vertex( c.x, c.y, c.z);
  vertex( d.x, d.y, d.z);
  endShape(CLOSE);
}




PVector comb(float t1, PVector v1, float t2, PVector v2) {
  PVector res=PVector.add(PVector.mult(v1, t1), PVector.mult(v2, t2));
  return res;
}
PVector comb3(float t1, PVector v1, float t2, PVector v2, float t3, PVector v3) {
  PVector res=PVector.add(PVector.add(PVector.mult(v1, t1), PVector.mult(v2, t2)), PVector.mult(v3, t3));
  return res;
}

PVector barycentre(float lamb, PVector u, PVector v) {
  return comb(1-lamb, u, lamb, v);
}

float determinant(PVector u, PVector v) {
  return u.x*v.y-u.y*v.x;
}





// Ariel and V3ga's arcball class with a couple tiny mods by Robert Hodgin
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

  Quat(float w, PVector v) {
    this.w = w;
    this.x = v.x;
    this.y = v.y;
    this.z =v.z;
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



