
/**Cone In Water
 *
 * fait par jacques maire, le mercredi 16 juillet 2014
 *
 * http://www.xelyx.com
 *
 */
/* @pjs font=""ArialMT-24.vlw""; 
 */

PFont font;
Figure figure;
PVector or;
PVector[] points,inters;
int nbpts=48;
float zplan, anglex, angley,conex,coney,rayon,tempo;

void setup() {
  size(700, 700, P3D);
 font=loadFont("ArialMT-24.vlw");
 textFont(font);
  float a=12.0;
  or=new PVector(0, 0, 0);
  points=new PVector[nbpts];
  inters=new PVector[nbpts];
  float p24=TWO_PI/24;
  for( int i=0;i<nbpts;i++){
      points[i]=new PVector(a*cos(p24*i), a*sin(p24*i), 2*a);
}
  zplan=80;
  figure=new Figure();
  rectMode(CENTER);
  rayon=700;
  anglex=angley=conex=coney=1;
}





void draw() {
  background(0,0,80);

  
  tempo=0.001*millis();
 pushMatrix(); 
  translate(width*0.5, height*0.5, -800);
  rotateX(anglex);
  rotateY(angley);
 spotLight(255,255,255,0, 0, 100,0,-1,0,3.14,10000);
  lights();lights();
  noStroke();
  fill(255, 255, 0);   
pushMatrix();
  rotateX(conex);
  rotateY(coney);
  rotateZ(tempo);
  figure.dessin(); 
popMatrix(); 
pushMatrix();
  translate(0, 0, zplan);
    rectangle(-600, -600, 600, 600);
popMatrix();
  pointsInter();
  popMatrix(); 
  fill(255);
  smooth();
  text("The two mouse buttons are active",width*0.5-120,height-20);
 noSmooth();
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
  
  
 
  void pointsInter(){ 
   for(int i=0;i<nbpts;i++ ){
    inters[i]=interLinePlan(points[i]);
   }
      stroke(255);
     for(int i=0;i<nbpts;i++ ){
      int j= (i+1)%nbpts;
    ligneCer(inters[i],inters[j]);
    pushMatrix();
    translate(inters[i].x, inters[i].y, inters[i].z);
    fill(0,100,0 );noStroke();
    sphere(12);
    popMatrix();
    
     }
 
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
  fill(155,150,255,180);
  beginShape(QUADS);
  vertex(dx, dy, 0);
  vertex(ax, dy, 0);
  fill(150,250,255,180);
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
   PVector  interLinePlan(PVector v){ 
    PVector v0=coordRepere0(v);
    float lambda=zplan/v0.z;
    return PVector.mult(v0,lambda);
  }  
 class Figure {
    PVector pt1, pt2, pt3, pt4;
    Plan[] plans;

    Figure() {
      plans=new Plan[nbpts];
      for( int i=0;i<nbpts;i++){
      plans[i]=new Plan(i,(i+1)%nbpts);
}
    }

    void dessin() {
     
      for( int i=0;i<nbpts;i++){
      plans[i].dessin(#ff0000, #ffff00); 
    }
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


