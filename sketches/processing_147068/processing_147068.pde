
/**
 *  PRODUIT DE DEUX ROTATIONS
 *
 *  Jacques Maire.
 *  alcys@alcys.com.
 *  http://www.xelyx.fr.
 *
 *
 *
 * Un ancien code de www.alcys.com .
 *
 *
 * Les touches 'a' 'm' 'l' UP DOWN RIGHT LEFT modifie la figure et son comportement. 
 */



float angleY, angleX, rx, ry, phi, psi, temps,scalair;
PVector uu, vv, ww, uCw, vCw, aa, bb, uCa, vCb, inter, ptM;
PFont lafont;
boolean auto;
//Vector trajet0, trajet2, trajet3;
//-------------------------------------------------------
 
void setup() {
  size(800, 800, P3D);
  lafont=loadFont("ArialMT-48.vlw");
 
  auto=true;

 
scalair=500;
  angleX=0;
  rx=0;
  angleY=0;
  ry=0;
  phi=PI/3;//mesure en rd du1/2angle de la premiere rotation
  psi=PI/2.5;//mesure en rd du 1/2angle de la deuxieme rotation
  uu=new PVector(-3, 2, 5.5);
  uu.normalize();
  vv=new PVector(2, 2, 2.75);
  vv.normalize();
  ww=uu.cross(vv);//normale au plan (u,v)
  ww.normalize();
  uCw=uu.cross(ww);//troisieme PVector du repere orthonorme contenant uu et ww
  uCw.normalize();
  vCw=vv.cross(ww);//troisieme PVector du repere orthonorme contenant vv et ww
  vCw.normalize();
  aa=comb(cos(phi), uCw, sin(phi), ww);
  bb=comb(cos(psi), vCw, sin(psi), ww);
  uCa=uu.cross(aa);// normale au plan P1
  vCb=vv.cross(bb);//normale au plan P2
  inter=uCa.cross(vCb);//directeur de l'intersection
  ptM=new PVector(-230, 0, 260);
  frameRate(30);
}
//-------------------------------------------------------
void keyPressed() {
  if (key=='a') {
    auto=!auto;
  };
  if (!auto) {
    if (keyCode==UP) {   
      ptM.x+=4;
    };
    if (keyCode==DOWN) { 
      ptM.x-=4;
    };
    if (keyCode==RIGHT) {
      ptM.z+=4;
    };
    if (keyCode==LEFT) {
      ptM.z-=4;
    };
     if (key=='m') {
      ptM.y-=4;
    };
     if (key=='l') {
      ptM.y+=4;
    };
     
    println(ptM);
     
  }
}
//-------------------------------------------------------
void draw() {
  
  background(0);

 camera();

 lights();


  angleY=(mouseX-width*0.5f)/150.0f;
  angleX=-(mouseY-height*0.5f)/150.0f;
  
 
  if (auto) {
    temps+=0.01;
    ptM.x=-325+70*cos(3*temps)*cos(temps);
    ptM.y=140+70*cos(3*temps)*sin(temps);
    ptM.z=10+70*cos(3*temps);
  }
 
 
 
  pushMatrix(); 
    ambientLight(155,55,55,-500,-5000,10000);
     ambientLight(105,55,250,400,400,-5000);
    afficherplans();
  popMatrix();
}
 

//-------------------------------------------------------
 
void afficherL(String s, PVector v) {
 
  textFont(lafont, 48);
  fill(255,255,0);
  noStroke();
  pushMatrix();
    translate(v.x, v.y, v.z);
  sphere(10);
  fill(255,0,0);
  translate(v.x*0.06, v.y*0.06, v.z*0.06+50);
  text(s, 0, 0);
 
  popMatrix();
}
 

 
 
//-------------------------------------------------------
 
void afficherplans() {
  pushMatrix();
  translate(400, 400, -400);
 
  ry+=(angleY-ry)/10;
  rx+=(angleX-rx)/10;
  rotateY(ry+PI/5); 
  rotateX(rx+PI/5);//
 
  stroke(255, 0, 0);          
 
  afficherPlan(uu, vv, 100, 85, 250);
 afficherRepere(PVector.mult(uu,scalair), uu, ww, uCw);
 afficherRepere(PVector.mult(vv,scalair), vv, ww, vCw);
  PVector uuu=coorabs(PVector.mult(uu,scalair));
  PVector vvv=coorabs(PVector.mult(vv,scalair));
 
  afficherPlan(uu, inter, 255, 85, 100);
  PVector interabs=coorabs(PVector.mult(inter,scalair));
  afficherPlan(vv, inter, 150, 255,100);
  PVector ptM1= afficherSym(ptM, uCa, uu, 255, 220);
  PVector ptM2=afficherSym(ptM1, vCb, vv, 255, 220);
  PVector ptM3=afficherSym(ptM1, ww, uu, 255, 220);
  PVector ptM4= afficherSym(ptM, uCa, inter, 255, 120);
  afficherSym(ptM4, vCb, inter, 155, 155);
  afficherSym(ptM1, ww, vv, 120, 255);
  PVector aM=coorabs(ptM);
 
  PVector aM1=coorabs(ptM1);
  PVector aM2=coorabs(ptM2);
  PVector aM3=coorabs(ptM3);

  PVector origine=coorabs( new PVector(0, 0, 0));
  afficherCercle(PVector.mult(uu,uu.dot(ptM)), (uu.cross(ptM)).mag(),255,0,0);
  afficherCercle(PVector.mult(vv,vv.dot(ptM3)), (vv.cross(ptM3)).mag(),255,255,0);
  afficherCercle(PVector.mult(inter,inter.dot(ptM)), (inter.cross(ptM)).mag(),0,0,255);
  popMatrix();
  afficherL("V", vvv);
  afficherL("U", uuu);
  afficherL("I", interabs);
  afficherL("M", aM);
  afficherL("M1", aM1);
  afficherL("M2", aM2);    
  afficherL("M3", aM3);
  afficherL("O", origine);
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
 
//-------------------------------------------------------
 
void afficherAxe(PVector v, float d) {
  v.normalize();
  line(0, 0, 0, v.x*d, v.y*d, v.z*d);
}
//-------------------------------------------------------
 
void afficherRepere(PVector o, PVector a, PVector b, PVector c) {
  float d=200;
  strokeWeight(10);
  stroke(255, 0, 0);
  line(o.x, o.y, o.z, o.x+d*a.x, o.y+d*a.y, o.z+d*a.z);    
  stroke(0, 255, 0);   
  line(o.x, o.y, o.z, o.x+d*b.x, o.y+d*b.y, o.z+d*b.z);     
  stroke(0, 0, 255);  
  line(o.x, o.y, o.z, o.x+d*c.x, o.y+d*c.y, o.z+d*c.z);
  strokeWeight(1);
} 
 
 
//-------------------------------------------------------
 
void afficherPlan(PVector a, PVector b, float coul1, float coul2, float coul3) {
  float d=500;
  a.normalize();
  b.normalize();
  noStroke();
  beginShape(TRIANGLES);
  fill(coul1, coul2, coul3);
  vertex(b.x*d, b.y*d, b.z*d);       
  vertex(a.x*d, a.y*d, a.z*d);
  fill(coul1/2.0, coul2/2.0, coul3/2.0);
  vertex(0, 0, 0);
  endShape();
}
 
//-------------------------------------------------------
PVector afficherSym(PVector m, PVector w1, PVector u, int coul1, int coul2) {
  PVector p=PVector.mult(w1,w1.dot(m));
  PVector pu=PVector.mult(u,u.dot(m));
  PVector sym=new PVector(m.x-p.x*2, m.y-p.y*2, m.z-p.z*2);
  fill(coul1, coul2, coul1/3+coul2/2);
  noStroke();    
  beginShape(TRIANGLES);
  vertex(sym.x, sym.y, sym.z);
 
  vertex(m.x, m.y, m.z);
  fill(coul1/1.5, coul2/1.5, 50);
  vertex(pu.x, pu.y, pu.z);   
  endShape();   
  return sym;
}
//-------------------------------------------------------
 
void afficherCercle(PVector c, float r,int rr,int g,int b) {
  pushMatrix();
  strokeWeight(10);
  stroke(0,50,255);
// fill(rr,g,b,150);
  ellipseMode(CENTER);
  translate(c.x*1.01, c.y*1.01, c.z*1.01);
  rotateZ(atan2(c.y, c.x));
  rotateY(atan2(sqrt(c.x*c.x+c.y*c.y), c.z));
 
  ellipse(0, 0, 2*r, 2*r);
  strokeWeight(1);
  popMatrix();
}


PVector comb(float a,PVector u,float b,PVector v){
return new PVector(a*u.x+b*v.x,a*u.y+b*v.y,a*u.z+b*v.z);
}


