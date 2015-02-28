
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/60538*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/45783*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */


/** Courbe 3D de Bezier et recursion
 * Alcys_Flower : utilisation récursive d'une courbe de Bezier
 * pat Jacques Maire
 * fait le 22 juin 2012
 */
import remixlab.proscene.*;
float  lambda;
Scene scene;
InteractiveFrame[] frame, reperes;
PVector pos3, dir3, diff;
PVector[] bary;
int nbPas, nbIteration;
PVector[] positions;
Quaternion[] orientations;
Quaternion qq, qq1, qq2;
float reduc0, angl;

void setup() {        
  size(900, 900, P3D);
  nbPas=40;
  nbIteration=60;
  scene = new Scene(this);
  scene.setRadius(1000);
  scene.showAll();
  scene.setGridIsDrawn(false);
  scene.setAxisIsDrawn(false);
 
  frame= new InteractiveFrame[5];
  reperes=new InteractiveFrame[ nbIteration];
  for (int i=0;i<5;i++) { 
    frame[i] = new InteractiveFrame(scene);
  }
  for (int i=0;i< nbIteration;i++) {    
    reperes[i] = new InteractiveFrame(scene);
  }

  positions = new PVector[nbPas+1];
  orientations=new Quaternion[nbPas+1];
  reduc0=0.85;
   scene.camera().setPosition(new PVector(0,0,10000));
}
void modifierLesControles(float t) {
  frame[1].setPosition(new PVector(1200+200*cos(2.2*t-0.6), 1200+ 300*sin(t-2),700+400*sin(0.4*t+4)));
  frame[3].setPosition(new PVector(200+800*cos(t*0.8+0.3), 700+ 300*sin(1.15*t+0.8), 1000+200*sin(t*1.2+0.4)));
  frame[2].setPosition(new PVector(1000-200*cos(-1.2*t+1),600-300*sin(t*0.7+2), 1000+ 300*sin(t*0.6)));
  //frame[0].setPosition(new PVector(-300*cos(2*t), 100*sin(t*1.8), -400*sin(0.5*t)));
}




void draw() {
  angl=0.001*millis();
  modifierLesControles(angl*0.5);
  background(130+50*cos(angl*0.5), 130+50*cos(angl*0.5),  110+  20*cos(angl*0.4));
  directionalLight(255, 125+125*cos(angl*1.5), 125+125*cos(angl*1.22), 0, -1, -1);
  directionalLight(255, 55, 255*sin(angl), -1, -1, -1);
  directionalLight(  0, 255, 255*sin(angl), -1, 0, 1);
  directionalLight(125+125*cos(angl), 0, 255, 1, 1, -1);
  fill(255);

  for (int i=0;i<4;i++) {
    pushMatrix();
    frame[i].applyTransformation(); 
    noStroke();
    fill(255, 0, 0);
    sphere(100);
    popMatrix();
  }
  calculCourbe(); 
  fill(255, 255, 0);
  Quaternion qqq=Quaternion.multiply(orientations[nbPas-1], orientations[0].inverse());
  PVector axe=orientations[nbPas-1].rotate(new PVector(0, 0, 1)); 
  qq=Quaternion.multiply(new Quaternion(axe, 0), qqq);
  qq1=Quaternion.multiply(new Quaternion(axe, 2.0*PI/3.0), qqq);
  qq2=Quaternion.multiply(new Quaternion(axe, 4.0*PI/3.0), qqq);
  pushMatrix();
  dessinRec(0);
  popMatrix();
}

void dessinRec(int niv) {
  if (niv<6) {
    fill(255);
    float reduc=pow(reduc0, niv);
    reperes[0].applyTransformation();
    dessinCourbe(niv, reduc);
    pushMatrix();
    reperes[1].setTranslation(PVector.mult(positions[nbPas], reduc));
    reperes[1].setOrientation(qq); 
    reperes[1].applyTransformation(); 
    dessinRec(niv+1);
    popMatrix();         
    pushMatrix();       
    reperes[2].setTranslation(PVector.mult(positions[nbPas], reduc));
    reperes[2].setOrientation(qq1);
    reperes[2].applyTransformation(); 
    dessinRec(niv+1);
    popMatrix();
    pushMatrix();
    reperes[3].setTranslation(PVector.mult(positions[nbPas], reduc));
    reperes[3].setOrientation(qq2);
    reperes[3].applyTransformation(); 
    dessinRec(niv+1);
    popMatrix();
  }
}







void ligne(PVector u, PVector v, float e, int c) {
  stroke(c);
  strokeWeight(e);
  line(v.x, v.y, v.z, u.x, u.y, u.z);
}

PVector vlerp(PVector uu, PVector u, float r) {
  return (new PVector(r*u.x+(1-r)*uu.x, r*u.y+(1-r)*uu.y, r*u.z+(1-r)*uu.z));
}


void dessinCourbe(int n, float r) {
  noStroke();
  fill(0, 255, 0);
  if (n<5) {
    for (int i=0;i<nbPas;i++) {
      frame[4].setPosition(PVector.mult(positions[i], r));
      frame[4].setOrientation(orientations[i]);
      float dif=(PVector.sub(positions[i], positions[i+1])).mag()*r;
      pushMatrix();
      frame[4].applyTransformation();
      translate(0, 0, dif/2);
      box(84-18*n, 84-18*n, dif);
      popMatrix();
    }
  }
  else {
    fill(255, 255, 0);
    pushMatrix();
    scale(0.6,0.2,1);
    scene.cone(18, 5, 150+100*sq(cos(angl*2)), 200);
    popMatrix();
  }
}

void calculCourbe() {
  PVector u0, u1, u2, u3, u4, u5, u6, d1, d2;
  PVector au=frame[0].position().get();


  for (int i=1;i<=nbPas;i++) {
    float t=(float)i/nbPas;

    u0=vlerp(frame[0].position(), frame[1].position(), t);
    u1=vlerp(frame[1].position(), frame[2].position(), t);
    u2=vlerp(frame[2].position(), frame[3].position(), t);
    u3=vlerp(u0, u1, t);
    u4=vlerp(u1, u2, t);
    positions[i]=vlerp(u3, u4, t);
    d1=PVector.sub( u4, u3);
    d2=PVector.sub(u1, u0);
    frame[4].setPosition( positions[i]);
    d1.normalize();
    frame[4].setOrientation(new Quaternion(new PVector(0, 0, 1), d1.get()));
    frame[4].setXAxis(d1.cross(d2));
    orientations[i]=frame[4].orientation();
  }
  orientations[0]= orientations[1];
  positions[0]=frame[0].position();
}


