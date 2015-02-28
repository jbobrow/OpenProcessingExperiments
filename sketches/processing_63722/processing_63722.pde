
/**
 * Alcys_Tree3D
 *fait le vendredi 8 juin 2012
 *par Jacques Maire
 */
import remixlab.proscene.*;
Scene scene;
InteractiveFrame[] reperes;
InteractiveFrame mobile;
PVector[] trans;
boolean enCalcul;
Quaternion[] quat, qu;
float bras, reducteur;
void setup() {
  size(900, 900, P3D);
  scene=new Scene(this); 
  scene.setGridIsDrawn(false);
  scene.setAxisIsDrawn(false);
  scene.disableKeyboardHandling();
  enCalcul=true;
  reperes=new InteractiveFrame[5];
  trans=new PVector[5];
  quat=new Quaternion[5];
  qu=new Quaternion[5];
  reperes[0]=new InteractiveFrame(scene);
  mobile=new InteractiveFrame(scene);
  bras=2000;
  reducteur=0.77;
  for (int j=0;j<4;j++) {
    int i=j+1;
    reperes[i]=new InteractiveFrame(scene);
    reperes[i].setReferenceFrame(reperes[0]);
    reperes[i].setRotation(new Quaternion(cos(QUARTER_PI*j), sin(QUARTER_PI*j), cos(QUARTER_PI), PI/3));
    reperes[i].setTranslation(10*bras*cos(QUARTER_PI*j), 10* bras*sin(QUARTER_PI*j), 10*bras*cos(PI/3));
    trans[i]=reperes[i].translation();
    if (i>1) { 
      qu[i]=new Quaternion(new PVector(random(0, 1), random(0, 1), random(1, 2)), pow(-1,i)*random(0.04, 0.12));
    }
  }
  reperes[0].setRotation(new Quaternion(new PVector(1,0,0), 0.5));
  reperes[1].setTranslation(5000,-1000, 25000);
  qu[1]=new Quaternion(new PVector(random(-0.01, 0.01), random(-0.01, 0.01), 1), 0.005+random(-0.005, 0.005));
  scene.camera().setPosition(new PVector(0, 60000,120000));
  scene.camera().setOrientation(new Quaternion(new PVector(1, 0, 0), -0.7));

  noStroke();
}
void draw() {
  background(0,30,0);//
  directionalLight(255,255, 0, 2, -1, -1);
  directionalLight(55, 255, 255, 0, 0, -1);
  directionalLight(255, 255, 0, -1, 0, 1);
  recharge();
  pushMatrix();mobile=reperes[0].clone();
  reperes[0].applyTransformation();
  for (int i=1;i<5;i++) {
    pushMatrix();
    reperes[i].applyTransformation();
    fill(255, 0, 0);
    sphere(bras*1.5);
    popMatrix();
  }
  dessine(0, trans[1], quat[1],bras);
  popMatrix();
}
void dessine(int niv, PVector v, Quaternion qrot, float r) {
  if (niv<6) {  
  
    float reduit=pow(reducteur, niv);
    v=PVector.mult(v, reduit);
    pushMatrix();
       fill(#A0A0FF);
      mobile.setZAxis(v);
      mobile.applyTransformation();
      scene.cone(r,r*reduit,v.mag());
   // scene.drawAxis(5000);
    popMatrix();
    r=r*reduit;
   pushMatrix();
    translate(v.x, v.y, v.z);
    rotate(qrot.w, qrot.x, qrot.y, qrot.z);

    dessine(niv+1, trans[1], quat[1], r);
    dessine(niv+1, trans[2], quat[2], r);
    dessine(niv+1, trans[3], quat[3], r);
    dessine(niv+1, trans[4], quat[4], r);
    popMatrix();
  }
  else {  
    fill(255,255,0);
    box(900);
  }
}
void recharge() {
  if (enCalcul) mouvement();
  for (int i=1;i<5;i++) {
    trans[i]=reperes[i].translation();
    quat[i]=reperes[i].rotation();
  }
}
void mouvement() {
  float an=millis()*0.001;
  for (int i=1;i<5;i++) {
    reperes[i].setTranslation(qu[i].rotate(reperes[i].translation()));
  }
}

void keyPressed() {
  enCalcul=!enCalcul;
} 


