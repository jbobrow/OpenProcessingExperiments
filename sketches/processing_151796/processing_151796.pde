


/**   OrthoCentre et Coniques
 *
 *   fait par Jacques Maire
 *
 *  Vendredi 13 juin 2014
 *
 *    http://www.xelyx.fr
 *  Un cercle est construit point par point .
 *   
 * 
 *  L'homographie est construite avec 3 points R,S,U qui sont les sommets d'un triangle
 *  rectangle isocele en U. Soit O le milieu de [RS].
 *  R et S sont les centres des faisceaux de depart et d'arrivee. Un faisceau intermediaire
 *  a pour direction OU.Les droites UR et US sont les axes respectifs des perspectives utilisees
 *
 *  Une droite du faisceau R coupe l'axe US en E.La droite du faisceau intermediaire passant
 *  par E coupe l'axe UR en F
 *   L'orthocentre du triangle RSF est E . Donc d=RE ,troisieme hauteur du triangle RSF,
 *  est orthogonale a SF 
 *
 *  Par projection sur le tableau on obtient une ellipse, et sa construction point par point.
 **/

Arcball arcball;
ArrayList<PVector[]> table,table0;
float psi, largeur, longueur, temps,angled,tho,rayon;
PVector[] points, projets;
PVector omega, normale,vectho,vectve,pdf;
int npts,sequence;

void setup() {
  size(800, 800, P3D);
  arcball = new Arcball( 600);
  psi=7.0/12.0*PI;
  largeur=1000.0;
  longueur=1800.0;
  npts=9;
  tho=-0.4;
  rayon=400;
  vectho=new PVector(rayon*cos(tho),rayon*sin(tho),0);
   vectve=new PVector(rayon*sin(tho),-rayon*cos(tho),0);
  points=new PVector[npts];
  projets=new PVector[npts];
  rectMode(CENTER );
  table=new ArrayList<PVector[]>();
 table0=new ArrayList<PVector[]>();
}




void draw() {
  background(0);
 
  pushMatrix();
  arcball.run(300, -400);
  rotateX(1.57);
  repere();
 // translate(0,-200,-200);
  angled=millis()*0.0001;
  noStroke();
  temps=0.5+0.35*cos(millis()*0.001);

  omega=new PVector( 0, -largeur*(1.5-cos(psi)), largeur*sin(psi));
  normale=new PVector( 0, sin(psi), -cos(psi));
 



  points[0]=new PVector(0,-0.5*largeur,0);//centre du cercle
  points[1]=PVector.sub(points[0],vectho);//point R
  points[2]=PVector.add(points[0],vectho);//point S
  points[3]=PVector.sub(points[0],vectve);//point U
  points[4]=PVector.add(points[1],new PVector(100*cos(angled),100*sin(angled),0));//point tournant de p=(p1,p4)
  points[5]=interD(points[1],points[4],points[2],points[3]);//le point D1,l'orthocentre
  points[6]=interD(points[1],points[3],points[5],PVector.add(points[5],vectve));//le point D2
  points[7]=interD(points[1],points[4],points[2],points[6]);//le point D3
   points[8]=interD(points[1],points[2],points[5],PVector.add(points[5],vectve));//le pied de la hauteur
 
 
  projeter();
  ajouterTable();
  strokeWeight(3);
  ligne(1,7,#ff0000);
  ligne(1,5,#ff0000);
  
    ligne(1,6,#00ff00);
  ligneplus(points[1],points[3],#00ff00);
   ligneplus(points[2],points[3],#ffffff);
  ligne(2,7,#00ff00);
  ligne(2,6,#00ff00);
  
  
   
  ligne(2,5,#ffffff);
    ligne(1,2,#ffff00);
  ligne(0,2,#ffff00);
  ligne(1,0,#ffff00);
   ligneplus(points[1],PVector.add(points[1],vectve),#00ffff);
  ligneplus(points[2],PVector.add(points[2],vectve),#00ffff);
 /* 
  ligne(5,6,#00ffff);
 
  ligne(5,8,#00ffff);
 
 
  
  
   
 
    
  */ 
 strokeWeight(1);
  
   balle(7,#ffff00);
   balle(5,#0000ff);
  pointdefuite();
   
   
ajouterTable();
cycle();
// tri3(points[6], points[1], points[2], #005566, #009933, #000022);
 // tri3(projets[6],projets[1],projets[2], #009933, #005500, #000090);
  les3Plans();
  popMatrix();
}
//----------------------------------------------
void cycle(){
 
  for(int i=0;i<table0.size();i++){
  PVector[] ta=table0.get(i);
 stroke(255,100,100,155);
    lignev(points[1],ta[0]);
    lignev(ta[0],ta[1]);
   lignev(ta[1],ta[2]);
   stroke(0,0,255,155);
   lignev(points[2],ta[2]);
   
  }
 for(int i=0;i<table.size();i++){
  PVector[] ta=table.get(i);
 stroke(255,100,100,150);
    lignev(projets[1],ta[0]);
    lignev(ta[0],ta[1]);
   lignev(ta[1],ta[2]);
   stroke(0,0,255,155);
   lignev(projets[2],ta[2]);
   
  }
}


void ajouterTable(){
   sequence++;
   sequence=sequence%24;

  if(table.size()>70){
    table.remove(0);
    table0.remove(0);
    }
     if( sequence==0){
     PVector[] tp=new PVector[]{projets[5],projets[6] ,projets[7]}; 
    table.add(tp);
     PVector[] tb=new PVector[]{points[5],points[6] ,points[7]}; 
  table0.add(tb);
}
    
 if(table.size()>0){  
   for(int i=0;i<table.size() ;i++){
   PVector[] tv=table.get(i);
   PVector v=tv[2];
   pushMatrix();
  translate(v.x,v.y,v.z);
  fill(255);
  noStroke();
  sphere(4);
popMatrix();
 PVector[] tv0=table0.get(i);
   PVector v0=tv0[2];
   pushMatrix();
  translate(v0.x,v0.y,v0.z);
  fill(255);
  noStroke();
  sphere(4);
popMatrix();
   }

   }
   

}


void balle(int n,color c){
  noStroke(); fill(c);
pushMatrix();
  translate(points[n].x,points[n].y,points[n].z);
  sphere(14);
popMatrix(); 
pushMatrix();
  translate(projets[n].x,projets[n].y,projets[n].z);
  sphere(14);
popMatrix(); 

}



//---------------------------------------------------
void ligneplus(PVector u, PVector v, color c) {
  stroke(c);
  PVector uu=barycentre(2.3 ,u,v);
   PVector vv=barycentre(-2.3 ,u,v);
  line(uu.x, uu.y, uu.z,vv.x, vv.y,vv.z);
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
  box(lon, 4, 4);
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
  box(lon, 3, 3);
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



//---------------------------------------------------
PVector comb(float a1, PVector v1, float a2, PVector v2) {
  return PVector.add(PVector.mult(v1, a1), PVector.mult(v2, a2));
}

void lignev(PVector u,PVector u1){
  line(u.x, u.y, u.z, u1.x, u1.y, u1.z);
}

//---------------------------------------------------
void ligne(int n, int n1,color c) {
  stroke(c);
  PVector u=points[n];
   PVector u1=points[n1];
  line(u.x, u.y, u.z, u1.x, u1.y, u1.z);
    u=projets[n];
    u1=projets[n1];
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



void pointdefuite() {
  
 // PVector v=PVector.add(omega,vectve);
 
  float lamb=(-largeur*(1-cos(psi))-omega.y)/vectve.y;
 pdf=  comb(1,omega,lamb,vectve);
 lamb=(-largeur-points[1].y)/vectve.y;
 PVector fuit1=comb(1,points[1],lamb,vectve);
 ligneplus(pdf,fuit1,#00ffff);
 lamb=(-largeur-points[2].y)/vectve.y;
 PVector fuit2=comb(1,points[2],lamb,vectve);
 ligneplus(pdf,fuit2,#00ffff); 
}

//---------------------------------------------------
PVector interTableau(PVector v) {
  PVector dir=PVector.sub(omega, v);
  PVector ap=new PVector(v.x, v.y+largeur, v.z);
  float lambda=-(ap.dot(normale)/dir.dot(normale));
  return barycentre(lambda, v, omega);
}
//---------------------------------------------------

void projeter() {
  stroke(155, 100, 100);
  for (int i=0; i<npts; i++) {
    projets[i]=interTableau(points[i]);
    lignev(projets[i], points[i]);
    
  }
}

void quad4(float x, float y, float ez, color c1, color c2) {
  pushMatrix();
  noStroke();

  beginShape(QUADS);
  fill(c1);
  vertex(x, y, ez);
  vertex(x, -y, ez);
  fill(c2);
  vertex(-x, -y, ez);
  vertex(-x, y, ez);
  endShape();
  popMatrix();
} 

void les3Plans() { 
  pushMatrix();

  translate(0, -0.5*largeur, 0);
  quad4(longueur/2, largeur/2, -2, color(85, 40, 40), color(0, 85, 40));

  popMatrix();
  pushMatrix();
  translate(0, (-1+0.5*cos(psi))*largeur, 0.5*sin(psi)*largeur);
  rotateX(psi);
  quad4( longueur*0.5, largeur*0.5, 2, color(20, 75,75), color(0, 50, 55));

  popMatrix();  
  pushMatrix();
  translate(0, (-1.5+cos(psi))*largeur, sin(psi)*largeur);
  quad4(longueur/2, largeur/2, -2, color(255, 255,100), color(255, 255, 255));
 
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


