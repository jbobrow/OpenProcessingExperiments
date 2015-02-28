
import remixlab.proscene.*;
Scene scene;
WorldConstraint pivot, drag;
LocalConstraint planaire, rotative;
InteractiveFrame repere, alidade, alidade1, globeur, dragueur;
PFont arial;
PVector or;




void setup() {
     size(850, 850, P3D);
     scene = new Scene(this);
     scene.setAxisIsDrawn(false);
     scene.setGridIsDrawn(false);
     arial=createFont("Cambria-12.vlw", 20);
     globeur=new InteractiveFrame(scene);
     dragueur=new InteractiveFrame(scene);
     repere=new InteractiveFrame(scene);
     alidade=new InteractiveFrame(scene);
     alidade1=new InteractiveFrame(scene);

     drag=new WorldConstraint();
     pivot=new WorldConstraint();
     planaire=new LocalConstraint();
     rotative=new LocalConstraint();


     drag.setTranslationConstraint(AxisPlaneConstraint.Type.FREE, new PVector(0, 0, 0));
     drag.setRotationConstraint(AxisPlaneConstraint.Type.FREE, new PVector(0, 0, 0));

     rotative.setTranslationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0, 0, 0));
     rotative.setRotationConstraint(AxisPlaneConstraint.Type.FREE, new PVector(0, 0, 0));
     planaire.setRotationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0, 0, 0));
     planaire.setTranslationConstraint(AxisPlaneConstraint.Type.PLANE, new PVector(0, 0, 1));
     pivot.setRotationConstraint(AxisPlaneConstraint.Type.FREE, new PVector(0, 0, 0));
     pivot.setTranslationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0, 0, 0));

     globeur.setConstraint(pivot);
     repere.setConstraint(rotative);
     dragueur.setConstraint(drag);
     alidade.setConstraint(planaire);
     alidade1.setConstraint(planaire);

     repere.setReferenceFrame(globeur);
     alidade1.setReferenceFrame(repere);
     alidade.setReferenceFrame(globeur);



     alidade.setPosition(new PVector(100, 0, 0));
     alidade1.setPosition(new PVector(100*cos(PI/6), 100*sin(PI/6), 0));
     or=new PVector(0, 0, 0);
     dragueur.setPosition(new PVector(-8, -50, -2));
     globeur.setPosition(new PVector(0, 0, 0));
     repere.setTranslation(new PVector(0, 0, 0));
     scene.camera().setPosition(new PVector(0,0,300));
}



void draw() {
     background(210,210,210);
     textFont(arial, 4);
     lights();
     directionalLight(150, 150, 150, 0, 1, 0);
     stroke(0);
     scene.drawAxis(50);
     //dragueur
     ligne(dragueur.position(), or);
     PVector u=dragueur.position().get();
     u.normalize();
     PVector pro=PVector.mult(u, u.dot(dragueur.zAxis())); 
     PVector delt=comb(1, pro, -1, globeur.position());
     globeur.setZAxis(u);
     globeur.setXAxis(delt);
     globeur.setZAxis(u);          


     //globeur    
     pushMatrix();
     dragueur.applyTransformation();
     //scene.drawAxis(40);
     fill(0,255,0);
     noStroke();
     sphere(4);
     stroke(0,255,0);
     text("axe du quaternion", 5, 5);
     text("axe des z du repere mobile", 5, 15);
     popMatrix();

     //globeur
     pushMatrix();
     globeur.applyTransformation();

     repere.setXAxis(alidade.position());
     pushMatrix();
     repere.applyTransformation();
     alidade1.setTranslation(PVector.mult(alidade1.translation(), 100.0f/alidade1.translation().mag()));

     pushMatrix(); 
     PVector ald=alidade1.translation();
     float angleQ=calculAngle(ald);
     strokeWeight(5);
     stroke(255, 255, 0);
     line(ald.x, ald.y, ald.z, 0, ald.y, ald.z);
     line(ald.x, ald.y, ald.z, ald.x, 0, ald.z);
     strokeWeight(20);
     stroke(255, 0, 0);
     line(0, 0, 0, ald.x, 0, ald.z);
     line(0, 0, 0, 0, ald.y, ald.z);
     line(0, 0, 0, ald.x, ald.y, ald.z);
     strokeWeight(1);
     alidade1.applyTransformation();
     fill(70);
     text("Point B", 8, 5);
     text("angle du quaternion = "+angleQ, 8, 15);
     fill(255, 255, 0);
     box(6);
     popMatrix();
     scene.drawAxis(100);
     dessinerArc(angleQ);
     popMatrix(); 
     pushMatrix();
     PVector tran=PVector.mult(alidade.translation(), 100.0f/alidade.translation().mag());
     alidade.setTranslation(tran);
     alidade.applyTransformation();
     //scene.drawAxis(100);
     fill(0);
     text("Point A", 8, 5);
       fill(0,255,0);
     text("Axe des x du repere libre", 8, 10);
     pushMatrix();
     translate(-tran.x, -tran.y, -tran.z);
     rotateZ(HALF_PI);
     translate(tran.x, tran.y, tran.z);
     text("Axe des y du repere libre", 8, 5);
     popMatrix(); 

     popMatrix();

     popMatrix();
     textMode(SCREEN);
     textFont(arial);
     smooth();
     fill(150);
     text("Le quaternion unitaire q est entierement déterminé par son axe et son angle.", 10, 720);
     text("Cet angle est représenté par les vecteurs (OA,OB) dans un repère mobile orthonormé direct dont", 10, 750);
     text(" l' axe des Z est l'axe du quaternion. Donc q est caractérisé par dot(OA,OB) et par cross(OA,OB)",10, 780);
    
     noSmooth();
     textMode(MODEL);
}



