

import remixlab.proscene.*;

Scene scene;
InteractiveFrame repere0, repereTournant;
InteractiveFrame point0, point1, manivelle, repereObjet, repereAbsolu;
boolean enRotation, passeOglobal, passeOlocal;
Quaternion orientAbsolue, orientLocal;
WorldConstraint libreT, fixe;
LocalConstraint libreAxe, planZContrainte;
float angle, lambda;
PVector adir3, dir3, manivelleYZ, pmanivelleYZ, coordAbsoluesObjet, coordLocalesObjet;
PImage limage;
CylindrePhoto beauty;
void setup() {
     size(850, 850, P3D);
     limage=loadImage("2face3.jpg");
     beauty=new CylindrePhoto();
     scene=new Scene(this);
     scene.setAxisIsDrawn(false);
     scene.setGridIsDrawn(false);
     scene.disableKeyboardHandling();
      scene.setRadius(300);
  scene.showAll();
     enRotation=true;
     passeOlocal=false;
     repere0=new InteractiveFrame(scene);
     repereObjet=new InteractiveFrame(scene);
     repereTournant=new InteractiveFrame(scene);
     point0=new InteractiveFrame(scene);
     point1=new InteractiveFrame(scene);
     manivelle=new InteractiveFrame(scene);
     repereAbsolu=new InteractiveFrame(scene);

     manivelle.setReferenceFrame(repere0);
     repereTournant.setReferenceFrame(repere0);
     repereObjet.setReferenceFrame(repereTournant);

     libreT=new WorldConstraint();
     libreT.setTranslationConstraint(AxisPlaneConstraint.Type.FREE, new PVector(0, 0, 0));
     libreAxe=new LocalConstraint();
     libreAxe.setTranslationConstraint(AxisPlaneConstraint.Type.AXIS, new PVector(1, 0, 0));
     libreAxe.setRotationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0, 0, 0));
     planZContrainte=new LocalConstraint();
     planZContrainte.setTranslationConstraint(AxisPlaneConstraint.Type.PLANE, new PVector(1, 0, 0));
     planZContrainte.setRotationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0, 0, 0));
     fixe=new  WorldConstraint();
     fixe.setRotationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0, 0, 0));
     fixe.setTranslationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0, 0, 0));
     point0.setConstraint(libreT);
     point1.setConstraint(libreT);
     // manivelle.setConstraint(planZContrainte);
     repereTournant.setConstraint(libreAxe);


     point0.setPosition(new PVector(20, -70, 100));
     point1.setPosition(new PVector(-20, -50, 0));
     repere0.setPosition(new PVector(0, 0, 0));
     repereTournant.setTranslation(new PVector(0, 0, 0));
     manivelle.setTranslation(new PVector(150, 200,200));
     manivelleYZ=new PVector(0, 100, 0);
     pmanivelleYZ=new PVector(0, 100, 0);
     lambda=0.5;
     dir3=PVector.sub(point0.position(), point1.position());
     adir3=dir3.get();
     repereObjet.setPosition(-150.0, -50.0, 250.0);
     repereObjet.setRotation(new Quaternion(new PVector(1, 2, 0), 1.5));
}
void draw() {
     background(255);
     lights();

     pushMatrix();
     point0.applyTransformation();
     balle(color(255, 255, 0));
     popMatrix();


     pushMatrix();
     point1.applyTransformation();
     balle(color(255, 255, 0));
     popMatrix();

     pushMatrix();
     adir3=dir3.get();
     dir3=PVector.sub(point0.position(), point1.position());
     repere0.setXAxis(dir3);
     actualiserRepere0();
     repere0.applyTransformation();
     //cene.drawAxis(80);
     //alle(color(0, 0, 255));
     dessinManivelle();
     calculAngle();

     pushMatrix();//dans le repere de la boite tournante
     repereTournant.setRotation(new Quaternion(new PVector(1, 0, 0), angle));
     repereTournant.applyTransformation();
     dessinAxe();

     if (enRotation) {
          passeOglobal=true;//fixé à "vrai" pour un unique transfert ultérieur
          if (passeOlocal) {
               coordLocalesObjet=repereTournant.coordinatesOf(repereAbsolu.translation());
               orientLocal=repereAbsolu.orientation();
               repereObjet.setTranslation(coordLocalesObjet);
               repereObjet.setOrientation(orientLocal);
               passeOlocal=false;
          }
          pushMatrix();//entree dans repere0>>repereTournant>>repereObjet
          repereObjet.applyTransformation();
          //fill(255, 0, 0, 200);
          //box(100, 20, 10);
          beauty.dessiner();
          popMatrix();
     }
     popMatrix();

     pushMatrix();//dans le repere de la manivelle
     manivelle.applyTransformation();
     balle(color(0, 0, 255));
     //scene.drawAxis(80);
     popMatrix();

     popMatrix();
     if (!enRotation) {
          passeOlocal=true;//fixé à "vrai" pour un unique transfert ultérieur
          if (passeOglobal) {
               coordAbsoluesObjet=repereTournant.inverseCoordinatesOf(repereObjet.translation());
               orientAbsolue= repereObjet.orientation() ;
          }
          repereAbsolu.setPosition(coordAbsoluesObjet);
          repereAbsolu.setOrientation(orientAbsolue);
          passeOglobal=false;
          pushMatrix();
          repereAbsolu.applyTransformation();
          //fill(255, 0, 0, 200);
          //box(100, 20, 10);
          beauty.dessiner();
          popMatrix();
     }
     //ligne(point0.position(), point1.position());
     calculerLambda();
     //repereObjet.setOrientation(new Quaternion(dir3, angle));
}
void keyPressed() {

     enRotation=!enRotation;
}

void calculerLambda() {
     PVector f1f3=PVector.sub(repere0.position(), point0.position());
     PVector  f1f2=PVector.sub(point1.position(), point0.position());
     lambda=(f1f2.dot(f1f3))/(f1f2.dot(f1f2));
}      

void actualiserRepere0() {   

     PVector diff=PVector.sub(dir3, adir3);
     if (diff.mag()>0) {    
          repere0.setPosition(PVector.add(PVector.mult(point1.position(), lambda), PVector.mult(point0.position(), 1.0-lambda)));
     }  
     dir3.normalize();
}


void dessinManivelle() {
     //le repere dereference est repere0
     stroke(0);
     noFill();
     pushMatrix();
     rotateY(HALF_PI );
     scene.cylinder(10, manivelle.translation().x);
     popMatrix();
     pushMatrix();
     translate(manivelle.translation().x, 0, 0);
     rotateX(-HALF_PI );
     scene.cylinder(10, manivelle.translation().y);
     popMatrix();
     pushMatrix();
     translate(manivelle.translation().x, manivelle.translation().y, 0);
     scene.cylinder(10, manivelle.translation().z);
     popMatrix();
}    

void calculAngle() { 
     PVector manivelleYZ=new PVector(0, manivelle.translation().y, manivelle.translation().z );
     manivelleYZ.normalize();
     angle=angle+angleEntre(pmanivelleYZ, manivelleYZ);
     pmanivelleYZ=manivelleYZ;
     manivelleYZ.mult(100);
  
}   

void dessinAxe() {
     noFill();
     stroke(0);
     PVector pv0=repere0.coordinatesOf(point0.position());
     PVector pv1=repere0.coordinatesOf(point1.position());
     pushMatrix();
     translate((pv0.x+pv1.x)/2, 0, 0);
     box(abs(pv0.x-pv1.x), 5, 5);
     popMatrix();
}









