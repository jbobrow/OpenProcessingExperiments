
/**   POINTS DE FUITE
 *
 *   fait par Jacques Maire
 *
 *   samedi 23 mai 2014
 *
 *    http://www.xelyx.fr
 **/
Arcball arcball;
Droite droite0, droite1;
float psi, largeur;

void setup() {
  size(700, 700, P3D);
  arcball = new Arcball( 600);
  psi=7.0/12.0*PI;
  largeur=1200.0;
  droite0=new Droite(350, -300, color(255, 150, 100));
  droite1=new Droite(-450, 400, color(150, 100, 255));
   rectMode(CENTER );
}

void draw() {
  background(150);
  arcball.run(1200, -3000);
  repere();
  noStroke();
  directionalLight(51, 240, 240, 0, -0.8, 0);
  directionalLight(251, 240, 240, 0, -1, -1);
   
  spotLight(204, 153, 0, 360, 300, 600, 0, -1, 0.5, PI/2, 10000); 
  spotLight(102, 153, 204, 360, mouseX-width/2, 500, 0.5, -0.5, -1, PI/2, 10000); 
  //lights();
 
  droite0.draw();
  droite1.draw();
  
  pushMatrix();
  translate(0, -0.5*largeur, 0);
  fill(255, 0, 0);
  rect(0, 0, 1600, largeur);
  popMatrix();
  pushMatrix();
  translate(0, (-1+0.5*cos(psi))*largeur, 0.5*sin(psi)*largeur);
  rotateX(psi);
  fill(0, 0, 255);
  rect(0, 0, 1600, largeur);
  popMatrix();  
  pushMatrix();
  translate(0, (-1.5+cos(psi))*largeur, sin(psi)*largeur);
  fill(0, 255, 0);
  rect(0, 0, 1600, largeur);
  popMatrix();
}

void mousePressed() {
  arcball.mousePressed();
}

void mouseDragged() {
  arcball.mouseDragged();
}



//---------------------------------------------------
class Droite {
  float hautx, basx;
  PVector  bas, ptfuite, avantBas, omega, exces, exces1, exces2;
  color couleur;

  Droite(float hx, float bx, color cc) {

    hautx=hx;
    basx=bx;
    couleur=cc;
    exces=new PVector(340, 0, 0);
    exces1=new PVector(2*hautx, largeur, 0);
    exces2=new PVector(hautx-basx, largeur*cos(psi), largeur*sin(psi));
    actualiser(psi);
  }
  void  actualiser(float t) {

    ptfuite=new PVector(hautx, -largeur*(1-cos(t)), largeur*sin(t));
    bas=new PVector(basx, -largeur, 0);
    //point dans le plan horizontal
    avantBas=new PVector(basx+2*hautx, 0, 0);
    omega=new PVector( 0, -largeur*(1.5-cos(t)), largeur*sin(t));
  }

  void draw() {
    repere();
    actualiser(psi);
    fromTo(avantBas, bas, couleur);
    fromTo(ptfuite, bas, couleur);
    fromTo(ptfuite, omega, couleur);
    fromTo(PVector.add(avantBas, exces), PVector.add(bas, exces), couleur);
    fromTo(ptfuite, PVector.add(bas, exces), couleur);
    fromTo(ptfuite, PVector.add(ptfuite, exces1), couleur);
    fromTo(avantBas, PVector.add(avantBas, exces2), couleur);
    fromTo(PVector.add(avantBas, exces), PVector.add(avantBas, exces2), couleur);
  }




  void dessineQuad() {
    pushMatrix();
    noStroke();
    fill(255, 255, 255, 30);
    beginShape(QUADS);
    vertex(omega.x, omega.y, omega.z);
    vertex(omega.x+hautx, omega.y+largeur, omega.z);
    vertex(basx+2.0*hautx, largeur, 0);
    vertex(basx, -largeur, 0);
    endShape(CLOSE);
    popMatrix();
  }



  void fromTo(PVector u, PVector v, color col) {
    PVector m=PVector.add(PVector.mult(u, 0.5), PVector.mult(v, 0.5));
    PVector w=PVector.sub(v, u);
    float lon=w.mag();
    PVector n=new PVector(0, -w.z, w.y);
    n.normalize();
    w.normalize();
    pushMatrix();
    translate(m.x, m.y, m.z);
    rotate(acos(w.x), n.x, n.y, n.z);
    fill(col);
    box(lon, 20, 20);
    popMatrix();
  }
}


void repere() {
  pushMatrix();
  translate(200, 0, 0);
  fill(255, 0, 0);
  box(400, 20, 20);
  popMatrix();
  pushMatrix();
  translate(0, 200, 0);
  fill(0, 255, 0);
  box(20, 400, 20);
  popMatrix();
  pushMatrix();
  translate(0, 0, 200);
  fill(0, 0, 255);
  box(20, 20, 400);
  popMatrix();
}
/*
//---------------------------------------------------
 void actualis() {
 for (int i=0;i<nbdroites;i++) {
 droites[i].actualiser(temps);
 }
 
 }
 
 //-------------------------------------------------------
 
 void afficherL(String s, PVector v) {
 
 textFont(lafont, 48);
 
 pushMatrix();
 translate(v.x, v.y, v.z);
 fill(255, 255, 0);
 noStroke();
 sphere(10);
 fill(255, 0, 0);
 translate(v.x*0.1, v.y*0.1, v.z*0.1+50);
 text(s, 0, 0);
 
 popMatrix();
 }*/
//-------------------------------------------------------
PVector coorabs(PVector v) {
  pushMatrix();
  translate(v.x, v.y, v.z);
  float xa=modelX(0, 0, 0);
  float ya=modelY(0, 0, 0);
  float za=modelZ(0, 0, 0);
  popMatrix();
  return new PVector(xa, ya, za);
}
//---------------------------------------------------
PVector comb(float a1, PVector v1, float a2, PVector v2) {
  return PVector.add(PVector.mult(v1, a1), PVector.mult(v2, a2));
}



//---------------------------------------------------
void ligne(PVector u, PVector u1) {

  line(u.x, u.y, u.z, u1.x, u1.y, u1.z);
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



