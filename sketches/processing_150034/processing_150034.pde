
/**   FROM CEVA TO DUAL PAPPUS
 *
 *   fait par Jacques Maire
 *
 *   Vendredi  30 mai 2014
 *
 *    http://www.xelyx.fr
 **/
 PFont lafont;
Arcball arcball;
Droite droite0, droite1;
float psi, largeur, longueur,temps;
PVector[] points,projets;
PVector omega,normale;
int npts;

void setup() {
  size(600, 600, P3D);
  arcball = new Arcball( 600);
  lafont= loadFont ("ArialMT-12.vlw"); 
  psi=7.0/12.0*PI;
  largeur=300.0;
  longueur=600.0;
  npts=10;
  points=new PVector[npts];
  projets=new PVector[npts];
  droite0=new Droite(120, -180, 180, color(0,0, 255));
  droite1=new Droite(-185, 20, 380, color(0,0, 255));
  rectMode(CENTER );
}




void draw() {
  background(200,200,255);
  pushMatrix();
  arcball.run(220, 0);
  repere();
  noStroke();
  temps=0.5+0.35*cos(millis()*0.001);
psi=temps*2+1.3;
   omega=new PVector( 0, -largeur*(1.5-cos(psi)), largeur*sin(psi));
    normale=new PVector( 0,sin(psi) ,-cos(psi));
  droite0.draw();
  droite1.draw();



  points[0]=interD(droite0.bas, droite0.avantBas, droite1.bas, droite1.avantBas);
  points[1]=interD(droite0.basE, droite0.avantBasE, droite1.basE, droite1.avantBasE);
 


  points[2]=interD(points[0], points[1], new PVector(-0.5*longueur, -largeur, 0), new PVector(0.5*longueur, -largeur, 0));

  points[9]=new PVector(-0.5*longueur, -largeur, 0);
 
  points[3]=interD(droite0.bas, droite0.avantBas, droite1.basE, droite1.avantBasE);
  points[4]=interD(droite0.basE, droite0.avantBasE, droite1.bas, droite1.avantBas);
 
  points[5]=barycentre(temps, points[1], points[3]);

  points[6]=interD(points[3], points[0], points[5], points[2]); 
  points[7]=PVector.add( points[6], PVector.sub(points[1], points[3]));

  points[8]=PVector.add( points[5], PVector.sub(points[0], points[3]));

  

 projeter();

  dessin(0,1, color(0, 0, 255));
    dessin(1,2, color(0, 0, 255));
   dessin(2,9, color(0, 0, 255));
    dessin(2,5, color(0,0, 255));
    dessin(6,7, color(0, 0, 255));
      dessin(8,5, color(0, 0, 255)); 
  dessin(7,2, color(0, 0, 255));
  droite0.fromTo(droite0.ptfuite,projets[8],color(0,0,255));
    droite1.fromTo(droite1.ptfuite,projets[7],color(0,0,255));
     tri3(points[0], points[4],points[1],color(0, 255, 255,100),color( 100, 100,255,100));
 tri3(points[0], points[3],points[1],color(255, 255, 0,100),color(255, 0, 0,100));
 tri3(projets[0], projets[3],projets[1],color(255, 255, 0,100),color(255, 0, 0,100)); 
 tri3(projets[0], projets[4],projets[1],color(0, 150, 255,100),color(85, 255, 255,100));
les3Plans();

PVector posT0=coorabs( points[1]); 
PVector posT1=coorabs( projets[1]); 
popMatrix();
afficherL(" CEVA x 2",posT0);
afficherL(" DUAL PAPPUS",posT1);
}

void mousePressed() {
  arcball.mousePressed();
}

void mouseDragged() {
  arcball.mouseDragged();
}

void dessin(int u, int v, color col) {
  PVector m=PVector.add(PVector.mult(points[u], 0.5), PVector.mult(points[v], 0.5));
  PVector w=PVector.sub(points[v], points[u]);
  float lon=w.mag();
  PVector n=new PVector(0, -w.z, w.y);
  n.normalize();
  w.normalize();
  pushMatrix();
  translate(m.x, m.y, m.z);
  rotate(acos(w.x), n.x, n.y, n.z);
  fill(col);
  box(lon, 2, 2);
  popMatrix();
  
  
   m=PVector.add(PVector.mult(projets[u], 0.5), PVector.mult(projets[v], 0.5));
   w=PVector.sub(projets[v], projets[u]);
   lon=w.mag();
   n=new PVector(0, -w.z, w.y);
  n.normalize();
  w.normalize();
 pushMatrix();
  translate(m.x, m.y, m.z);
  rotate(acos(w.x), n.x, n.y, n.z);
  fill(col);
  box(lon, 2, 2);
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


 
 //-------------------------------------------------------
 
 void afficherL(String s, PVector v) {
 
 textFont(lafont, 12);

 float xx= screenX(v.x,v.y,v.z);
  float yy= screenY(v.x,v.y,v.z);
 pushMatrix();
 translate(xx,yy,100);
 fill( 0);
 text(s, 0, 0);
 popMatrix();
 }
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
//---------------------------------------------------

PVector interD(PVector p1, PVector q1, PVector p2, PVector q2) {
  PVector p1p2=PVector.sub(p2, p1);
  PVector d1=PVector.sub(q1, p1);
  PVector d2=PVector.sub(q2, p2);  
  float lambda=detxy(p1p2, d2)/detxy(d1, d2);
  return barycentre(lambda, p1, q1);
} 
//---------------------------------------------------
PVector barycentre(float lamb, PVector u, PVector v) {
  return comb(1-lamb, u, lamb, v);
}
//---------------------------------------------------
float detxy(PVector u, PVector v) {
  return u.x*v.y-u.y*v.x;
}
//---------------------------------------------------
 void tri3(PVector a, PVector b, PVector c,  color c1, color c2) {
 noStroke();
    beginShape(TRIANGLES);
   fill(c2);
    vertex( a.x, a.y, a.z);        
    vertex( b.x, b.y, b.z);
  fill(c1);
    vertex( c.x, c.y, c.z);
  
    endShape(CLOSE);
  }
//---------------------------------------------------
PVector interTableau(PVector v){
  PVector dir=PVector.sub(omega,v);
  PVector ap=new PVector(v.x,v.y+largeur,v.z);
 
  float lambda=-(ap.dot(normale)/dir.dot(normale));
  
  return barycentre(lambda,v,omega);
}
//---------------------------------------------------

void projeter(){
  stroke(155,100,100);
for(int i=0;i<npts;i++){
projets[i]=interTableau(points[i]);
ligne(projets[i],points[i]);
}


}

 void quad4(float x,float y,float ez,color c1,color c2) {
    pushMatrix();
  noStroke();
    
    beginShape(QUADS);
    fill(c1);
    vertex(x,y,ez);
    vertex(x,-y,ez);
    fill(c2);
    vertex(-x,-y,ez);
   vertex(-x,y,ez);
    endShape();
    popMatrix();
  } 
  
void les3Plans(){ 
    pushMatrix();
  translate(0, -0.5*largeur, 0);
  quad4(longueur/2, largeur/2,-2,color(255,100,100,100),color(255,255,100,100));
  popMatrix();
  pushMatrix();
  translate(0, (-1+0.5*cos(psi))*largeur, 0.5*sin(psi)*largeur);
  rotateX(psi);
  quad4( longueur*0.5, largeur*0.5,2,color(255,200,0,150),color(255,255,0,150));
  popMatrix();  
  pushMatrix();
  translate(0, (-1.5+cos(psi))*largeur, sin(psi)*largeur);
    quad4(longueur/2, largeur/2,-2,color(255,255,200,100),color(255,255,0,100));
  popMatrix();}
  

 
  


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

//---------------------------------------------------
class Droite {
  float hautx, basx;
  PVector  bas, ptfuite, avantBas,  exces, exces1, exces2,basE,avantBasE;
  color couleur;

  Droite(float hx, float bx,float exc, color cc) {

    hautx=hx;
    basx=bx;
    couleur=cc;
    exces=new PVector(exc, 0, 0);
    
    exces1=new PVector(2*hautx, largeur, 0);
    exces2=new PVector(hautx-basx, largeur*cos(psi), largeur*sin(psi));
    actualiser(psi);
  }
  void  actualiser(float t) {

    ptfuite=new PVector(hautx, -largeur*(1-cos(t)), largeur*sin(t));
    bas=new PVector(basx, -largeur, 0);
    //point dans le plan horizontal
    avantBas=new PVector(basx+2*hautx, 0, 0);
   
    basE=PVector.add(bas, exces);
    avantBasE=PVector.add(avantBas, exces);
  }

  void draw() {
    repere();
    actualiser(psi);
    fromTo(avantBas, bas, couleur);
    fromTo(ptfuite, bas, couleur);
    fromTo(ptfuite, omega, couleur);
    fromTo(avantBasE,basE , couleur);
   fromTo(ptfuite, PVector.add(bas, exces), couleur);
    //fromTo(ptfuite, PVector.add(ptfuite, exces1), couleur);
    //fromTo(avantBas, PVector.add(avantBas, exces2), couleur);
    //fromTo(PVector.add(avantBas, exces), PVector.add(avantBas, exces2), couleur);
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
    box(lon, 2, 2);
    popMatrix();
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




