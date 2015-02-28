
/*Alcys_Arborescence
*fait par Jacques Maire
*le vendredi 15 juin 2012
*/
import remixlab.proscene.*;
Scene scene;
InteractiveFrame[] mobiles;
float bras, reducteur, rayon, angle, co;
int nb;
Quaternion q0, q1, q2;

void setup() {
  size(900, 900, P3D);
  scene= new Scene(this);
  scene.setGridIsDrawn(false);
  scene.setAxisIsDrawn(false);
  bras=150;
  rayon=16;
  reducteur=0.7;
  nb=7;
  mobiles=new InteractiveFrame[nb];
  for (int i=0;i<nb;i++) {
    mobiles[i]=new InteractiveFrame(scene);
    if (i>0)mobiles[i].setReferenceFrame(mobiles[i-1]);
  }
  frameRate(60);
  scene.camera().setPosition(new PVector(0, 0, 500));
}

void draw() {
  background(0, 0, 40);
  directionalLight(255, 255, 0, 2, -1, -1);
  directionalLight(55, 255, 255, 0, 0, -1);
  directionalLight(255, 255, 0, -1, 0, 1);
  angle=0.0007*millis();
  co=cos(angle*0.1);
  q0 =Quaternion.multiply(new Quaternion( new PVector(0, 0, 1), angle), new Quaternion(new PVector(1, 0, 0), PI/2+co));
  q1 =Quaternion.multiply(new Quaternion( new PVector(0, 0, 1), 2*PI/3+angle), new Quaternion(new PVector(1, 0, 0), PI/2+co));
  q2 =Quaternion.multiply( new Quaternion(new PVector(0, 0, 1), 4*PI/3+angle), new Quaternion(new PVector(1, 0, 0), PI/2+co)); 
  dessine(0, bras, rayon);
}


void dessine(int n, float bra, float rayon) {
  fill(#A0A0FF);
  noStroke();
  scene.cone(24, rayon, rayon*reducteur, bra);
  if (n<nb-1) {
    mobiles[n].setTranslation(0, 0, bra);//println("translation  "+n+ " avec "+bra);
    pushMatrix();  
    mobiles[n].applyTransformation();
    mobiles[n+1].setRotation(q0);
    dessine(n+1, bra*reducteur, rayon*reducteur);    
    mobiles[n+1].setRotation(q1);
    dessine(n+1, bra*reducteur, rayon*reducteur);  
    mobiles[n+1].setRotation(q2);
    dessine(n+1, bra*reducteur, rayon*reducteur);   
    popMatrix();
  }
  else {
    fill(255, 155, 0);  
    noStroke();
    pushMatrix();
    translate(0, 0, bra);
    box (4);
    popMatrix();
  }
}


