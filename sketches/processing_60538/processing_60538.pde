
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/45783*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */


/** Courbe 3D de Bezier avec 4 points de controle
  * Alcys_Bezier3D
  * pat Jacques Maire
  * fait le 6 mai 2012
  */
import remixlab.proscene.*;
float r, lambda;
Scene scene;
InteractiveFrame[] frame;

int[] couleur = { 
  color(0, 0, 255), color(255, 0, 0), color(255, 0, 0), color(255, 0, 0)};
AxisPlaneConstraint  contrainte3;
PVector pos3, dir3, diff;
PVector[] bary;
Rail segment;
void setup() {        
  size(890, 890, P3D);
  r=8;
  scene = new Scene(this);
  scene.setRadius(450);
  scene.showAll();
  scene.setCameraType(Camera.Type.PERSPECTIVE);
  scene.setGridIsDrawn(false);
   scene.setAxisIsDrawn(false);
  frame= new InteractiveFrame[5];
  for (int i=0;i<5;i++) { 
    frame[i] = new InteractiveFrame(scene);
  }
  frame[0].setPosition(new PVector(-150, 160, 60));
  frame[1].setPosition(new PVector(-70, -180, 90));
  frame[2].setPosition(new PVector(130, -150, 130));
  frame[3].setPosition(new PVector(100, 0, -100));
  segment=new Rail();
  bary=new PVector[5];
}





void draw() {
  background(0,0,100);
  lights();
  scene.drawAxis(300);
  stroke(255);fill(205,0,200,60);box(600);
  for (int i=0;i<4;i++) {
    pushMatrix();
    frame[i].applyTransformation(); 
    noStroke();
    fill(couleur[i]);
    sphere(r);
    popMatrix();
  }
  //le point blanc
  segment.actualiser();
  float rho=segment.lambda;
  for (int i=0;i<3;i++) {
    ligne(frame[i].position(), frame[i+1].position(), 5,color(255,255,0));
  }

  bary[0]=vlerp(frame[1].position(), frame[2].position(), rho);
  bary[1]=vlerp(frame[2].position(), frame[3].position(), rho);
  bary[2]=vlerp(segment.repere.position(), bary[0], rho);
  bary[3]=vlerp(bary[0], bary[1], rho);
  bary[4]=vlerp(bary[2], bary[3], rho);
  ligne(segment.repere.position(), bary[0], 1,color(255,255,0));
  dessineBary();
  PVector d1=PVector.sub( bary[4], bary[3]);
  PVector d2=PVector.sub( bary[4], bary[0]);
  frame[4].setPosition( bary[4]);
   frame[4].setOrientation( new Quaternion(new Quaternion(new PVector(0,0,1),d1.cross(d2))));
   pushMatrix();
   frame[4].applyTransformation();
   fill(255,0,0);noStroke();
   translate(0,0,-100);
   scene.drawArrow(100,10);
   popMatrix();
}

void ligne(PVector u, PVector v, float e,int c) {
  stroke(c);
  strokeWeight(e);
  line(v.x, v.y, v.z, u.x, u.y, u.z);
}

PVector vlerp(PVector uu,PVector u,  float r) {
  return (new PVector(r*u.x+(1-r)*uu.x, r*u.y+(1-r)*uu.y, r*u.z+(1-r)*uu.z));
}


void dessineBary() {
  noStroke();
  fill(255);
  for (int i=0;i<5;i++) {
    pushMatrix();
    translate(bary[i].x, bary[i].y, bary[i].z);
    box(6);
    popMatrix();
    if ((i<4)&&(i!=1))ligne(bary[i], bary[i+1], 1,color(255,255,0));
  }
  courbe();
}
void courbe() {
  PVector u0,u1,u2, u3,u4,u5,u6;
  PVector au=frame[0].position().get();
  for (float t=0.05;t<1;t+=0.05) {
    u0=vlerp(frame[0].position(), frame[1].position(), t);
    u1=vlerp(frame[1].position(), frame[2].position(), t);
    u2=vlerp(frame[2].position(), frame[3].position(), t);
    u3=vlerp(u0, u1, t);
    u4=vlerp(u1, u2, t);
    u5=vlerp(u3, u4, t);
    ligne(au,u5, 1,color(255));
    au=u5.get();
  }
}


