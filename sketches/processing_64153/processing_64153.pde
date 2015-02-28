
/*Alcys_Arborescence
 *fait par Jacques Maire
 *le dimanche 17 juin 2012
 */
import remixlab.proscene.*;
Scene scene;
InteractiveFrame[] mobiles;
float    angle, co, alph;
int nb;
Quaternion q0, q1, q2, q0i, q1i, q2i, q100;
PVector oz, or, dir;
void setup() {
  size(900, 900, P3D);
  scene= new Scene(this);
  scene.setGridIsDrawn(false);
  scene.setAxisIsDrawn(false);
  nb=5;
  mobiles=new InteractiveFrame[nb];
  for (int i=0;i<nb;i++) {
    mobiles[i]=new InteractiveFrame(scene);
    if (i>0)mobiles[i].setReferenceFrame(mobiles[i-1]);
  }
  frameRate(60);
  scene.setRadius(400);
  scene.camera().setPosition(new PVector(0, -300, 2300));
  scene.camera().setOrientation(new Quaternion(new PVector(1, 0, 0), 0.3));
  oz=new PVector(0, 0, 1);
  or=new PVector(0, 0, 0);
  q100=new Quaternion();
}

void draw() {
  background(30, 0, 60);
  directionalLight(255, 255,0, 0, -1, -1);
  directionalLight(0, 0,255, -1, 0, -1);
  directionalLight(0,0 , 255, -1, 0, 1);
  directionalLight(255, 0, 0, 1, 1, -1);
  angle=0.001*millis();
  co=0.6+PI/10*sq(cos(angle*0.1));
  alph=co+ 9*PI/10;
  q0 =Quaternion.multiply(new Quaternion( new PVector(0, 0, 1), angle), new Quaternion(new PVector(1, 0, 0), alph));
  q0i=Quaternion.multiply(new Quaternion( new PVector(0, 0, 1), angle), new Quaternion(new PVector(1, 0, 0), -alph));
  q1 =Quaternion.multiply(new Quaternion( new PVector(0, 0, 1), 2*PI/3+angle), new Quaternion(new PVector(1, 0, 0), alph));
  q1i=Quaternion.multiply(new Quaternion( new PVector(0, 0, 1), 2*PI/3+angle), new Quaternion(new PVector(1, 0, 0), -alph)); 
  q2 =Quaternion.multiply(  new Quaternion(new PVector(0, 0, 1), 4*PI/3+angle), new Quaternion(new PVector(1, 0, 0), alph)); 
  q2i=Quaternion.multiply( new Quaternion(new PVector(0, 0, 1), 4*PI/3+angle), new Quaternion(new PVector(1, 0, 0), -alph)); 
  fill(255);
  noStroke();
  dessine(0, 2000);
}
void dessine(int n, float bras) {
  float bra=bras*0.25/cos(alph);
  pushMatrix();
  mobiles[n].applyTransformation();
  if (n<nb-1) {
    mobiles[n+1].setTranslation(or);
    mobiles[n+1].setRotation(q0);
    dessine(n+1, bra); 
    mobiles[n+1].setTranslation(q0.rotate(PVector.mult(oz, bra)));
    mobiles[n+1].setRotation(q100);
    dessine(n+1, bras/2); 
    mobiles[n+1].setTranslation(PVector.add(q0.rotate(PVector.mult(oz, bra)), PVector.mult(oz, bras/2)));
    mobiles[n+1].setRotation(q0i);
    dessine(n+1, bra);
    //
    mobiles[n+1].setTranslation(or);
    mobiles[n+1].setRotation(q1);
    dessine(n+1, bra); 
    mobiles[n+1].setTranslation(q1.rotate(PVector.mult(oz, bra)));
    mobiles[n+1].setRotation(q100);
    dessine(n+1, bras/2); 
    mobiles[n+1].setTranslation(PVector.add(q1.rotate(PVector.mult(oz, bra)), PVector.mult(oz, bras/2)));  
    mobiles[n+1].setRotation(q1i);
    dessine(n+1, bra);
    //
    mobiles[n+1].setTranslation(or);
    mobiles[n+1].setRotation(q2);
    dessine(n+1, bra); 
    mobiles[n+1].setTranslation(q2.rotate(PVector.mult(oz, bra)));
    mobiles[n+1].setRotation(q100);
    dessine(n+1, bras/2); 
    mobiles[n+1].setTranslation(PVector.add(q2.rotate(PVector.mult(oz, bra)), PVector.mult(oz, bras/2)));  
    mobiles[n+1].setRotation(q2i);
    dessine(n+1, bra);
  }
  else {
   // scene.cone(6, 3, 3, bras);
   box(bras/5,bras/5,bras*1.2);
  }
  popMatrix();
}


