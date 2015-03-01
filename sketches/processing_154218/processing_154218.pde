
/**Vanishing_Points
 *
 * fait par jacques maire, le mardi 8 juillet 2014
 *
 * http://www.xelyx.com
 *
 */
/* @pjs font=""ArialMT-24.vlw""; 
 */

PFont font;
Figure figure;
PVector or;
PVector[] points;
int nbpts=5;
float zplan, anglex, angley,conex,coney,rayon,tempo;

void setup() {
  size(700, 700, P3D);
 font=loadFont("ArialMT-24.vlw");
 textFont(font);
  float a=12.0;
  or=new PVector(0, 0, 0);
  points=new PVector[nbpts];
  points[0]=new PVector(0,0,0);
      points[1]=new PVector(a, a, 2*a);
      points[2]= new PVector(a, -a, 2*a);
       points[3]=new PVector(-a, -a, 2*a);
      points[4]= new PVector(-a, a, 2*a);
  zplan=70;
  figure=new Figure();
  rectMode(CENTER);
  rayon=700;
  anglex=angley=conex=coney=1;
}





void draw() {
  background(0,0,50);
  tempo=0.001*millis();
  lights();
  lights();
 pushMatrix(); 
  translate(width*0.5, height*0.5, -500);
  rotateX(anglex);
  rotateY(angley);
  
 
  
  noStroke();
  fill(255, 255, 0);   
  pushMatrix();
  rotateX(conex);
  rotateY(coney);
  rotateZ(tempo);
  figure.dessin();    
  popMatrix();
  
 
 figure.plan12.intersection();
  figure.plan23.intersection();
   figure.plan34.intersection();
   figure.plan41.intersection();
   lignedefuite();
    pushMatrix();
  translate(0, 0, zplan-2);
    rectangle(-600, -600, 600, 600);
  popMatrix(); 
   
   
  popMatrix();
  fill(255);
  text("The two mouse buttons are active",width*0.5-100,height-20);
 
}
void mouseDragged() {
  if (mousePressed){
  if (mouseButton == LEFT) {
     anglex+=-0.01*(mouseY-pmouseY);
    angley+=0.01*(mouseX-pmouseX);
  } 
  if (mouseButton == RIGHT) {
    conex+=-0.01*(mouseY-pmouseY);
    coney+=0.01*(mouseX-pmouseX);
  } 
  }
  }
  
  
  
  void lignedefuite(){  
    PVector fuite1=inter2Lines(figure.plan12.uu,figure.plan12.vv,figure.plan34.uu,figure.plan34.vv);
      PVector fuite2=inter2Lines(figure.plan23.uu,figure.plan23.vv,figure.plan41.uu,figure.plan41.vv);  
      stroke(255);
    ligneCer(fuite1,fuite2);
        pushMatrix();
    translate(fuite1.x, fuite1.y, fuite1.z);
    fill(0, 255,0 );noStroke();
    sphere(15);
    popMatrix();
    pushMatrix();
    translate(fuite2.x, fuite2.y, fuite2.z);
    sphere(15);
    popMatrix();
    
  }
 
  
 PVector coordRepere0(PVector nor){
  Quat qx=new Quat(cos(conex/2),sin(conex/2),0,0);
  Quat qy=new Quat(cos(coney/2),0,sin(coney/2),0);
  Quat qz=new Quat(cos(tempo/2.0),0,0,sin(tempo/2.0));
  Quat q=Quat.mul(Quat.mul(qx,qy),qz);
  return q.tourner(nor);
  
  }
  void ligneCer(PVector a, PVector b) {
  PVector di=PVector.sub(b,a);
  float af=PVector.dot(di,di);
  float bf=PVector.dot(a,di);
  float cf=PVector.dot(a,a)-rayon*rayon;
  float delta=sqrt(bf*bf-af*cf);
  float l1=(-bf-delta)/af;
   float l2=(-bf+delta)/af;
  
  PVector aa=PVector.add(a,PVector.mult(di,l1));
  PVector bb=PVector.add(a,PVector.mult(di,l2));
  line(aa.x, aa.y, aa.z, bb.x, bb.y, bb.z);
}


 PVector comb(float t1, PVector v1, float t2, PVector v2) {
  PVector res=PVector.add(PVector.mult(v1, t1), PVector.mult(v2, t2));
  return res;
} 


void ligne(PVector acv, PVector bcv) {
  line(acv.x, acv.y, acv.z, bcv.x, bcv.y, bcv.z);
  
}
void rectangle( float dx, float dy, float ax, float ay)
{
  stroke(150);
  fill(255,0,0,200);
  beginShape(QUADS);
  vertex(dx, dy, 0);
  vertex(ax, dy, 0);
  fill(150,0,150,200);
  vertex(ax, ay, 0);
  vertex(dx, ay, 0);
  endShape(CLOSE);
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

PVector inter2Lines(PVector p1, PVector q1, PVector p2, PVector q2) {
  PVector p1p2=PVector.sub(p2, p1);
  PVector d1=PVector.sub(q1, p1);
  PVector d2=PVector.sub(q2, p2);  
  float lambda=detxy(p1p2, d2)/detxy(d1, d2);
  return barycentre(lambda, p1, q1);
} 
//--------------------------------------------------- 
    
 class Figure {
    PVector pt1, pt2, pt3, pt4;
    Plan plan12, plan23, plan34, plan41;
    color c1=color(255, 255, 255, 254);
    color c2=color(255, 255, 0, 254);
    color c3=color(250, 250, 255, 254);
    color c4=color(55, 255, 50, 254);
    color c5=color(155, 100, 250, 254);
    Figure() {
      
      plan12=new Plan(1,2);
      plan23=new Plan(2,3);
      plan34=new Plan(3,4);
      plan41=new Plan(4,1);
    }

    void dessin() {
      fill(100, 100, 255, 150);
      plan12.dessin(c1, c5);      
      plan23.dessin(c3, c2);
      plan34.dessin(c3, c4);
      plan41.dessin(c4, c5);
  
    }

  }
class Plan {
  PVector normale, uu, vv;
  int indice1, indice2;
  Plan(int n1, int n2) {
    indice1=n1;
    indice2=n2;     
    normale=points[indice1].cross(points[indice2]);
    normale.normalize();
    uu=new PVector(0, 0, 0);
    vv=new PVector(0, 0, 0);
  }

  void dessin(color r1, color r2 ) {
    PVector d1=PVector.mult(points[indice1], 20);
    PVector d2=PVector.mult(points[indice2], 20);

    beginShape(TRIANGLES);
    fill(r1);
    vertex(0, 0, 0);
    fill(r2);
    vertex(d1.x, d1.y, d1.z);
    vertex(d2.x, d2.y, d2.z);
    endShape();

    beginShape(TRIANGLES);
    fill(r2);
    vertex(0, 0, 0);
    fill(r1);
    vertex(-d1.x, -d1.y, -d1.z);
    vertex(-d2.x, -d2.y, -d2.z);
    endShape();

    stroke(255,255,0);
    uu=comb(4, d1, -3, d2);
    vv=comb(4, d2, -3, d1); 
    ligneCer(uu,vv);
    noStroke();
  }
  PVector comb(float t1, PVector v1, float t2, PVector v2) {
    PVector res=PVector.add(PVector.mult(v1, t1), PVector.mult(v2, t2));
    return res;
  }  
  void intersection() {

    float skl=100;
    PVector n=coordRepere0(normale);
    if (n.y!=0) {
      uu=new PVector(skl, (-n.x*skl-n.z*zplan)/n.y, zplan);
      vv=new PVector(-skl, (n.x*skl-n.z*zplan)/n.y, zplan);
    } else {
      uu=new PVector(-n.z*zplan/n.x, skl, zplan);
      vv=new PVector(-n.z*zplan/n.x, -skl, zplan);
    } 
    stroke(180, 180, 255); 
    ligneCer(uu, vv);
    noStroke();
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
   public  Quat normalize()
    {
    float square = x * x + y * y + z * z + w * w;
    float dist = (square > 0.0f) ? (1.0f / (float) Math.sqrt(square)) : 1.0f;

    x *= dist;
    y *= dist;
    z *= dist;
    w *= dist;
    return this;
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
  
  
}
