

/**   PROJECTIONS
 *
 *   fait par Jacques Maire
 *
 *   mardi 27 mai 2014
 *
 *    http://www.xelyx.fr
 **/
Arcball arcball;
Mobile mobile;
float psi, largeur, profondeur, hauteur, cote;
PVector centre;
float temps;

void setup() {
  size(700, 700, P3D);
  arcball = new Arcball( 600);
  psi=7.0/12.0*PI;
  largeur=3000.0;
  profondeur=0;
  hauteur=2000;
  cote=900;
  centre=new PVector(0, -1200, 0);
  Quat qq=new Quat(0.5, 0.3, 0.4, 0.7);
  qq.normalize();
  Quat dd=new Quat(0.9, 1.3, -0.4, -0.7);
  dd.normalize();

  mobile=new Mobile(new PVector(0, 1300, 0), new PVector(200, 1800, 1500), dd, qq);
  rectMode(CENTER );
}

void draw() {
  background(200,255,255);
   
 // aie!
 //frustum(-width/2, width,  -height/2, height, -800, 800);
  //aie!
  
  lights();
  directionalLight(255, 255, 255, 0, -1, 1); 
   directionalLight(251, 240, 240, 1, -1, -1); 
  spotLight(255, 255, 255, 1000, -3000, 5000, 1, 1, 1, PI/2, 10000);  
 
  arcball.run(500, -3000);
  pushMatrix();
  translate(centre.x, centre.y, centre.z);
  fill(255, 255, 0); noStroke();
  sphere(25);
  popMatrix();

  //La figure
  mobile.dessiner();
  repere();
   stroke(255,0,0);
    fill(255,0,255,150);
    beginShape(QUADS);
    vertex(-1500,largeur, hauteur);
    vertex(-1500,0,hauteur);
    vertex(-1500,0,-hauteur);
    vertex(-1500,largeur, -hauteur);
    endShape(CLOSE);
       fill(0,255,255,150);
    beginShape(QUADS);
    vertex(largeur, 0, hauteur);
    vertex(-1500, 0,hauteur);
    vertex(-1500, 0,-hauteur);
    vertex(largeur, 0, -hauteur);
    endShape(CLOSE);
  fill(255,255,0,150);
    beginShape(QUADS);
    vertex(largeur, largeur, hauteur);
    vertex(-1500, largeur,hauteur);
    vertex(-1500, 0,hauteur);
    vertex(largeur, 0,hauteur);
    endShape(CLOSE);    
    
    
}

void mousePressed() {
  arcball.mousePressed();
}

void mouseDragged() {
  arcball.mouseDragged();
}



void repere() {
  pushMatrix();
  translate(cote*0.5, 0, 0);
  fill(255, 0, 0);
  box(cote, 20, 20);
  popMatrix();
  pushMatrix();
  translate(0, cote*0.5, 0);
  fill(0, 255, 0);
  box(20, cote, 20);
  popMatrix();
  pushMatrix();
  translate(0, 0, cote*0.5);
  fill(0, 0, 255);
  box(20, 20, cote);
  popMatrix();

}
void figure() {
  pushMatrix();
  translate(400, 0, 0);
  fill(255, 0, 0);
  box(800, 400, 50);
  popMatrix();
  pushMatrix();
  translate(0, 400, 0);
  fill(0, 255, 0);
  box(400, 800, 50);
  popMatrix();
  pushMatrix();
  translate(0, 0, 200);
  fill(0, 0, 255);
  box(20, 20, 400);
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
    float[] aa = q.getValue();
    rotate(aa[0], aa[1], aa[2], aa[3]);
  }
}

//***********************************************
  class Mobile{    
        PVector depart,arrivee,posInstant,pointX,pointY,pointZ,pointO;
        PVector pTx,pTy,pTz,pTo,pXx,pXy,pXz,pZx,pZy,pZz;
        Quat qDepart,qArrivee,quatInstant;
       
      
Mobile(PVector from,PVector but,Quat qd,Quat qb){
      this.depart=from;
      qDepart=new Quat(qd.w,qd.x,qd.y,qd.z);
      posInstant=new PVector(0,0,0);
      arrivee=but;
      qArrivee=new Quat(qb.w,qb.x,qb.y,qb.z);
      pointX=new PVector();
       pointY=new PVector(); 
      pointZ=new PVector();
       pointO=new PVector();
    }
  
    void actualiser(){
      temps+=0.005;    
      if(temps<1){      
        posInstant=barycentre(temps,depart,arrivee); 
        quatInstant= Quat.slerp(qDepart,qArrivee,temps) ;     
      }else{
        temps=0;
        posInstant=arrivee.get();
        depart=arrivee.get();
        arrivee=new PVector(random(-200,2000),random(1100,1800),random(-2000,200));
        qDepart=qArrivee;
        qArrivee=new Quat(random(-2,2),random(-2,2),random(-2,2),random(-2,2));
        qArrivee.normalize();
      }  
    }

  
    void appliqueQuat(Quat q){
      q.normalize();
         float[] ro=q.getValue();
         rotate(ro[0],ro[1],ro[2],ro[3]);
       
      }

    void dessiner(){
    actualiser();
  pushMatrix();
        translate(posInstant.x,posInstant.y,posInstant.z);
        appliqueQuat(quatInstant);
        repere();
      popMatrix();
     
      pointX=coordRepereArc(new PVector(cote,0,0),quatInstant,posInstant);
       pointY=coordRepereArc(new PVector(0,cote,0),quatInstant,posInstant); 
      pointO=coordRepereArc(new PVector(0,0,0),quatInstant,posInstant);
       pointZ=coordRepereArc(new PVector(0,0,cote),quatInstant,posInstant); 
       
       pTx=tableau(pointX);
       pTy=tableau(pointY);
       pTz=tableau(pointZ);
       pTo=tableau(pointO);
       
       pXx=tablX(pointX);
       pXy=tablX(pointY);
       pXz=tablX(pointZ);
       pXo=tablX(pointO);
       
       pZx=tablZ(pointX);
       pZy=tablZ(pointY);
       pZz=tablZ(pointZ);
       pZo=tablZ(pointO);
       stroke(0);
       ligne(pTy,pTo);
       ligne(pTz,pTo);
       ligne(pTx,pTo);
       ligne(pTx,pTy);
       ligne(pTx,pTz);
       ligne(pTy,pTz);
       
       ligne(pXx,pXo);
       ligne(pXx,pXy);
       ligne(pXx,pXz);
       ligne(pXy,pXo);
       ligne(pXz,pXo);
       ligne(pXy,pXz);
       
       ligne(pZx,pZy);
       ligne(pZx,pZz);
       ligne(pZy,pZo);
       ligne(pZz,pZo);
       ligne(pZx,pZo);
       ligne(pZy,pZz);
       
       
       triangle(pointX,pointY,pointZ,color(255,255,255,150));
         triangle(pointX,pointY,pointO,color(255,0,0,150));
        triangle(pointX,pointO,pointZ,color(0,255,0,150));
          triangle(pointO,pointY,pointZ,color(0,0,255,150));
    }
   //------------------------------------------------------- 
     //On a deux reperes. R1 repere de reference , R2 repere image par
     //la transformation q, transl. Un point P lie au repere R1 (coord de v)
   //a pour image le point de R2 dont les coordonnees dans R1 sont pt.
  
   PVector coordRepereArc(PVector v,Quat q,PVector transl){
    PVector pt=q.tourner(v);
    pt=PVector.add(pt,transl);
     pushMatrix();  
      translate(pt.x,pt.y,pt.z); 
      fill(255,0,0);noStroke();
      sphere(120);
    popMatrix();
   
    fromTo(pt,centre,color(255,255,0));
    return pt;
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
 PVector tableau(PVector v){
 float lambda=(-profondeur-v.y)/(centre.y-v.y);
  PVector vt=barycentre(lambda,v,centre);
       pushMatrix();  
      translate(vt.x,vt.y,vt.z); 
      fill(255,255,0);noStroke();
      sphere(20);
    popMatrix();
    return vt;
 } 
//--------------------------------------------------- 
 PVector tablX(PVector v){
 
  PVector vx=new PVector(-1500,v.y,v.z);
       pushMatrix();  
      translate(vx.x,vx.y,vx.z); 
      fill(0,0,255);noStroke();
      sphere(30);
    popMatrix();
    stroke(255,0,0);
    ligne(vx,v);
    return vx;
 } 
//--------------------------------------------------- 
 PVector tablZ(PVector v){
 
  PVector vx=new PVector(v.x,v.y,hauteur);
       pushMatrix();  
      translate(vx.x,vx.y,vx.z); 
      fill(0,255,255);noStroke();
      sphere(30);
    popMatrix();
    stroke(255,0,0);
    ligne(vx,v);
    return vx;
 } 
//---------------------------------------------------  
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
    fill(col);noStroke();
    box(lon, 20, 20);
    popMatrix();
  }
  
  void triangle(PVector u,PVector v,PVector w,color c) {
    pushMatrix();
   stroke(255,0,0);
    fill(c);
    beginShape(TRIANGLES);
    vertex(u.x, u.y, u.z);
    vertex(v.x, v.y, v.z);
    vertex(w.x, w.y, w.z);
   
    endShape(CLOSE);
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
  
  public static Quat comb(Quat q1,float r1, Quat q2,float r2)
   {
     Quat res = new Quat();
     res.w = q1.w *r1 +  q2.w*r2;
     res.x = q1.x * r1+  q2.x * r2;
     res.y = q1.y * r1+  q2.y * r2;
     res.z = q1.z * r1+  q2.z * r2;
     return res;
   }
   public Quat ajouter(Quat q1,float r1)
     {
       Quat res = new Quat();
       res.w = q1.w *r1;
       res.x = q1.x * r1;
       res.y = q1.y * r1;
       res.z = q1.z * r1;
       return res;
     }  
    
  
  
  

  float[] getValue() {
    // transforming this quat into an angle and an axis vector.

    float[] res = new float[4];

    float sa = (float) Math.sqrt(1.0f - w * w);
    if (sa < EPSILON) {
      sa = 1.0f;
    }

    res[0] = ((float) Math.acos(w))*2.0 ;
    res[1] = x / sa;
    res[2] = y / sa;
    res[3] = z / sa;

    return res;
  }
  
  public float norme(){
  return (float)Math.sqrt(x * x + y * y + z * z + w * w);
}

 public  void normalize()
  {
    float square = x * x + y * y + z * z + w * w;
    float dist = (square > 0.0f) ? (1.0f / (float) Math.sqrt(square)) : 1.0f;

    x *= dist;
    y *= dist;
    z *= dist;
    w *= dist;
   
  }

  
   public   Quat conjugue(){
  return new Quat(w,-x,-y,-z);
}
public  Quat oppose(){
  return new Quat(-w,-x,-y,-z);
}
public Quat copie(){
  return new Quat(w,x,y,z);
  }
  
  
  
  public Quat copieNorme(){
    Quat res=new Quat(w,x,y,z);
    res.normalize();
    return res;
    } 
   
   
    
  public PVector tourner(PVector v){
  Quat qv=new Quat(0.0f,v.x,v.y,v.z);
  Quat qc=this.conjugue();
  Quat q1=Quat.mul(qv,qc);  
  Quat q= Quat.mul(this,q1);
  return new PVector(q.x,q.y,q.z);  
  
}
public static Quat slerp(Quat d, Quat a,float t){
  d.normalize();
  a.normalize();
  float angle=((float)Math.acos(d.x*a.x+d.y*a.y+d.z*a.z));
  float sina=(float)Math.sin(angle);
  float rd=(float)Math.sin(angle*(1-t))/sina;
  float ra=(float)Math.sin(angle*t)/sina;
  Quat res= Quat.comb(d,rd,a,ra);

  return res;

}

public PVector axe(){
return new PVector(x,y,z);  
}



public static Quat euler2quat(float psi,float theta,float phi){
  /* psi      :angle de la rotation autour de 0z    :precession
   * theta   :angle de la rotation autour de 0x1  :nutation
   * phi      :angle de la rotation autoue de 0z2  : rotation propre
   */
    float w,x,y,z,th,psiMphi,psiPphi;
    th=theta/2;
    psiMphi=(psi-phi)/2;
    psiPphi=(psi+phi)/2;    
    w=(float)Math.cos(th)*(float)Math.cos(psiPphi);
    x=(float)Math.sin(th)*(float)Math.cos(psiMphi);
    y=(float)Math.sin(th)*(float)Math.sin(psiMphi);
    z=(float)Math.cos(th)*(float)Math.sin(psiPphi);    
  return new Quat(w,x,y,z);
}

  
  
}


