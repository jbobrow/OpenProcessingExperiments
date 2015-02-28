
/*Alcys_Fractale_Constructive
 *fait par Jacques Maire
 *le lundi 18 juin 2012
 * modification le mardi 19 juin 2012
 */
import remixlab.proscene.*;
Scene scene;
InteractiveFrame[] mobiles;
InteractiveFrame repere0;
float  reducteur, rayon, angle, co, alph;
int nb;
Quaternion q0, q1, q2, q0i, q1i, q2i, q100;
PVector oz, or;
ArrayList alist;
void setup() {
  size(900, 900, P3D);
  scene= new Scene(this);
  scene.setGridIsDrawn(false);
  scene.setAxisIsDrawn(true);

  alist=new ArrayList();

  nb=4;
  repere0=new InteractiveFrame(scene);
  mobiles=new InteractiveFrame[nb];
  for (int i=0;i<nb;i++) {
    mobiles[i]=new InteractiveFrame(scene);
    if (i>0) mobiles[i].setReferenceFrame(mobiles[i-1]);
  }
  frameRate(60);
  scene.camera().setPosition(new PVector(0, 0, 8800));
  initialise();



  dessine(0, 3000);
}

void draw() {
  background(30, 0, 60);
  directionalLight(255, 255, 0, 0, -1, -1);
  directionalLight(0, 0, 255, -1, 0, -1);
  directionalLight(0, 0, 255, -1, 0, 1);
  directionalLight(255, 0, 0, 1, 1, -1);
  fill(255);
  envoiDesPierres();
}

void initialise() {
  oz=new PVector(0, 0, 1);
  or=new PVector(0, 0, 0);
  q100=new Quaternion();
  alph=2*PI/3;
  q0 =Quaternion.multiply(new Quaternion( new PVector(0, 0, 1), 0), new Quaternion(new PVector(1, 0, 0), alph));
  q0i=Quaternion.multiply(new Quaternion( new PVector(0, 0, 1), 0), new Quaternion(new PVector(1, 0, 0), -alph));
  q1 =Quaternion.multiply(new Quaternion( new PVector(0, 0, 1), 2*PI/3), new Quaternion(new PVector(1, 0, 0), alph));
  q1i=Quaternion.multiply(new Quaternion( new PVector(0, 0, 1), 2*PI/3), new Quaternion(new PVector(1, 0, 0), -alph));
  q2 =Quaternion.multiply(  new Quaternion(new PVector(0, 0, 1), 4*PI/3), new Quaternion(new PVector(1, 0, 0), alph));
  q2i=Quaternion.multiply( new Quaternion(new PVector(0, 0, 1), 4*PI/3), new Quaternion(new PVector(1, 0, 0), -alph));
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
    PVector pv=mobiles[nb-1].position();
    Quaternion qv=mobiles[nb-1].orientation();
    alist.add(new Pierre(this, pv, qv, bras));
  }
  popMatrix();
}
void envoiDesPierres() {
  float aa=0.0005*millis();
  float bb=aa/3.0;
  repere0.setOrientation(new Quaternion(new PVector(cos(aa), sin(aa)*cos(bb), sin(aa)*sin(bb)), aa));
  pushMatrix();
  repere0.applyTransformation();
  float temps=min(alist.size(), millis()/400.0);
  for (int i=0;i<temps;i++) {
    Pierre pierr=(Pierre)alist.get(i);
    pierr.actualiser();
  }
  popMatrix();
}


