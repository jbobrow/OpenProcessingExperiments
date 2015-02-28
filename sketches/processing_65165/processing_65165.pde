
/*Alcys_RouteDeNuit
 *fait le 7 juillet 2012
 *par Jacques Maire
 */


import remixlab.proscene.*;
Scene scene;
InteractiveFrame repere, crepere, frame;
float tempo, rayoncylindre, angleRoue;
PVector[] route1, route2;
int nbpas;
float[] matrice;
//************************************************************************
void setup() {
  size(900, 900, P3D);
  scene=new Scene(this);
  repere=new InteractiveFrame(scene);
  crepere=new InteractiveFrame(scene);
  frame=new InteractiveFrame(scene);
  rayoncylindre=5000;//1750.0f
  nbpas=100;
  calculerRoute();
  frameRate(50);
}
//***************************************************************************
void draw() {
  background(10, 10, 55);
  lights();
  lights();
  directionalLight(255, 255, 0, -2, -1, 0);
  directionalLight(255, 255, 0, -2, -1, -1);
  tempo+=0.012f;
  placerCamera();
  pushMatrix();
  repere.applyTransformation();
  dessinerLaVoiture();
  popMatrix();
  pushMatrix();
  tracerRoute();
  popMatrix();
}
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
PVector trajectoire(float t, float r) {
  return new PVector(r*sin(2*t), r*sin(t)*cos(2*t), -6*r*cos(t)+r*4*cos(2*t));
}
PVector vitesse(float t) {
  return new PVector(2*cos(2*t), cos(t)*cos(2*t)-2*sin(t)*sin(2*t), 6*sin(t)-2*4*sin(2*t));
}
PVector acceleration(float t) {
  return new PVector(-4*sin(2*t), -2*cos(t)*sin(2*t)-sin(t)*cos(2*t)-2*(2*sin(t)*cos(2*t)+cos(t)*sin(2*t)), 6*cos(t)-4*4*cos(2*t));
}
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++

void placerCamera() {
  PVector vit, acc, normale, cvit, cacc, cnormale, v;
  //le mobile est sur par repere
  vit= vitesse(tempo);
  vit.normalize();
  acc=acceleration(tempo);  
  acc.normalize();
  normale=vit.cross(acc);
  normale.normalize();
  repere.setZAxis(vit);
  repere.setYAxis(normale);
  repere.setPosition(trajectoire(tempo, rayoncylindre));  
  //la camera est sur crepere      
  float temp1=tempo-0.3;
  cvit=vitesse(temp1);
  cvit.normalize();
  cacc=acceleration(temp1);  
  cacc.normalize();
  cnormale=cvit.cross(cacc);
  crepere.setZAxis(cvit);
  crepere.setYAxis(cnormale);
  v=PVector.add( trajectoire(temp1, rayoncylindre), PVector.mult(crepere.yAxis(), 600));
  scene.camera().frame().setPosition(v);
  normale.mult(-1);
  scene.camera().setUpVector(normale);
  //la camera regarde le mobile 
  scene.camera().setViewDirection(PVector.sub(repere.position(), v));
}
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
void calculerRoute() {
  int j, k, n;
  float t;
  route1=new PVector[nbpas];
  route2=new PVector[nbpas];
  for (int i=0;i<nbpas;i++) {
    t=TWO_PI/nbpas*i;
    route1[i]=trajectoire(t, rayoncylindre);
  }
  for (int i=0;i<nbpas;i++) {
    j=i+1;
    k=i+2;
    if (j==nbpas-1)k=0;
    if (j==nbpas) {
      j=0;
      k=1;
    }		
    PVector v1=PVector.sub(route1[j], route1[i]);
    PVector v2=PVector.sub(route1[k], route1[j]);		
    PVector v3=PVector.sub(v2, v1);
    v3=v1.cross(v3);
    route2[i]=(v3.cross(v1));
    route2[i].normalize();
    route2[i].mult(600);
  }
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
void tracerRoute() {
  PVector v, w;
  noStroke();
  fill(255, 100, 255);
  beginShape(TRIANGLE_STRIP);
  for (int s=0;s<nbpas+1;s++) {
    int i=(s==nbpas)? 0:s;
    v=PVector.sub(route1[i], route2[i]);
    vertex(v.x, v.y, v.z);
    fill(155, 0, 0);
    w=PVector.add(route1[i], route2[i]);
    vertex(w.x, w.y, w.z);
    fill(255, 100, 255);
  }	
  endShape();
  PVector vit, acc, normale;
  for (int i=0;i<nbpas;i++) {
    float t=TWO_PI/nbpas*i;
    vit=vitesse(t);  
    vit.normalize();
    acc=acceleration(t);  
    acc.normalize();
    normale=vit.cross(acc);
    frame.setYAxis(vit);
    frame.setZAxis(normale);
    frame.setPosition(PVector.add(route1[i], route2[i]));
    pushMatrix();
    frame.applyTransformation();
    fill(100);
    scene.cone(6, 50, 20, 700);
    translate(0, 0, 700); 
    for (int u=0;u<3;u++) {
      rotateZ(TWO_PI/3);
      rotateX(PI/3);  
      fill(100);
      scene.cone(6, 20, 10, 400);
    }
    popMatrix();
    frame.setPosition(PVector.sub(route1[i], route2[i]));
    pushMatrix();
    frame.applyTransformation();
    fill(100);
    scene.cone(6, 50, 20, 700);
    translate(0, 0, 700);  
    for (int u=0;u<3;u++) {
      rotateZ(TWO_PI/3);
      rotateX(PI/3);  
      fill(100);
      scene.cone(6, 20, 10, 400);
    }
    popMatrix();
  }
}
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
void dessinerLaVoiture() {
  pushMatrix();
  fill(105, 90, 255);
  translate(0, 100, 0);
  scale(1, 0.6, 1);
  scene.cone(18, 150, 100, 400); 
  scene.cone(18, 150, 130, -400);
  translate(0, 0, -400); 
  scene.cone(18, 130, 0, -30);
  popMatrix();
  pushMatrix(); 
  translate(0, 200, -380);
  rotateX(0.4);
  box(300, 10, 200); 
  popMatrix(); 
  pushMatrix();
  rotateY(PI/2); 
  translate(-400, 80, -250);
  fill(0);
  scene.cone(24, 80, 80, 80);
  ;  
  translate(700, 0, 0);
  scene.cone(24, 80, 80, 80);
  popMatrix();
  pushMatrix(); 
  rotateY(-PI/2); 
  translate(-400, 80, -250);
  fill(0);
  scene.cone(24, 80, 80, 80);
  ;  
  translate(700, 0, 0);
  scene.cone(24, 80, 80, 80);
  popMatrix();
  pushMatrix(); 
  fill(0, 255, 0, 250); 
  translate(50, 5, 50); 
  box(700, 4, 850);
  popMatrix();
  pushMatrix(); 
  fill(0);
  translate(0, 185, -150);
  sphere(50);

  popMatrix();
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++  


