
import remixlab.proscene.*;
PFont font;
Scene scene;
InteractiveFrame repere1, repere2, plan1, plan2, dragueur1, dragueur2, frameM, repere3;
WorldConstraint  rotx;
LocalConstraint pivot;
PVector or, n1, n2, n0, pointM, pointM1, pointM2, pointM3, intersec;
float lon;



void setup() {
     size(850, 850, P3D);
     scene=new Scene(this);
     scene.setGridIsDrawn(false);
     lon=400;
     or=new PVector(0, 0, 0);
     n1=new PVector();
     n2=new PVector();
     n0=new PVector();
     pointM=new PVector(-120, -120, 300);
     pointM1=new PVector();
     pointM2=new PVector();
     pointM3=new PVector();
     dragueur1=new InteractiveFrame(scene);
     dragueur2=new InteractiveFrame(scene);
     repere1=new InteractiveFrame(scene);
     repere2=new InteractiveFrame(scene);
     repere3=new InteractiveFrame(scene);
     plan1=new InteractiveFrame(scene);
     plan2=new InteractiveFrame(scene);
     frameM=new InteractiveFrame(scene);
     plan1.setReferenceFrame(repere1);
     plan2.setReferenceFrame(repere2);


     pivot=new LocalConstraint();
     pivot.setTranslationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0, 0, 0));
     pivot.setRotationConstraint(AxisPlaneConstraint.Type.AXIS, new PVector(0, 0, 1));

     rotx=new WorldConstraint();
     rotx.setTranslationConstraint(AxisPlaneConstraint.Type.FREE, new PVector(0, 0, 0));
     rotx.setRotationConstraint(AxisPlaneConstraint.Type.FREE, new PVector(0, 0, 0));



     //placements
     dragueur1.setPosition(new PVector(0, -200, 420));
     dragueur2.setPosition(new PVector(0, 200, 420));


     repere1.setOrientation(new Quaternion(new PVector(1, 0, 0), -PI/4));
     repere1.setPosition(new PVector(0, 0, 0));
     plan1.setRotation(new Quaternion(new PVector(0, 0, 1), -PI/5));
     plan1.setTranslation(new PVector(0, 0, 0));
     frameM.setPosition(pointM);
     repere2.setOrientation(new Quaternion(new PVector(1, 0, 0), PI/6.0));
     repere2.setPosition(new PVector(0, 0, 0));
     plan2.setRotation(new Quaternion(new PVector(0, 0, 1), PI/5));
     plan2.setTranslation(new PVector(0, 0, 0));
     plan1.setConstraint(pivot);
     plan2.setConstraint(pivot);
     font = loadFont("SansSerif.plain-48.vlw"); 
     scene.camera().setPosition(new PVector(0, 0, 900));
}





void draw() {
     background(30, 0, 100);
     textFont(font, 12);  
     directionalLight(155, 125, 235, 1, 0.2, -1);
     directionalLight(185, 125, 235, 0, 0, -1);
     directionalLight(185, 225, 235, -1, 0, -1);
     pushMatrix();
     frameM.applyTransformation();
     fill(255, 255, 0);
     noStroke();
     sphere(8);
     fill(255);
     popMatrix();
     pushMatrix();
     dragueur1.applyTransformation();
     fill(255, 0, 0);
     noStroke();
     sphere(8);
     fill(255);
     popMatrix();
     pushMatrix();
     dragueur2.applyTransformation();
     fill(255, 0, 0);
     noStroke();
     sphere(8);
     fill(255);
     popMatrix();
     PVector w= dragueur1.position().get(); 
     w.normalize();
     w.mult(lon);
     repere1.setPosition(w);
     PVector w1= dragueur2.position().get(); 
     w1.normalize();
     w1.mult(lon);
     repere2.setPosition(w1);
     n0=w.cross(w1);
     n0.normalize();
     w.get().normalize();
     w1.get().normalize();
     repere1.setZAxis(w);
     repere1.setXAxis(n0);
     repere2.setZAxis(w1);
     repere2.setXAxis(n0);

     ligne(or, plan1.position());  
     ligne(or, plan2.position());

     pushMatrix();
     repere1.applyTransformation();
     // scene.drawAxis(50);
     pushMatrix();
     plan1.applyTransformation();
     fill(255, 255, 0);
     box(10);
     popMatrix(); 
     popMatrix();
     pushMatrix();
     repere2.applyTransformation();
     // scene.drawAxis(50); 
     pushMatrix();
     plan2.applyTransformation();
     fill(255, 255, 0);
     box(10);

     popMatrix();
     popMatrix();  
     n1=plan1.inverseTransformOf(new PVector(0, lon, 0));
     n2=plan2.inverseTransformOf(new PVector(0, lon, 0));        
     dessinePlan(repere1.inverseCoordinatesOf(new PVector(0, 0, 0)), repere2.inverseCoordinatesOf(new PVector(0, 0, 0)), 140, 100, 255);     

     intersec=  intersection();
     pointM=frameM.position();
     pointM1=calculSym(pointM, n1);
     pointM2=calculSym(pointM1, n0);
     pointM3=calculSym(pointM1, n2);

     PVector proj1=projectionSurDroite(pointM1, w);
     PVector proj2=projectionSurDroite(pointM1, w1);
     PVector proj3=projectionSurDroite(pointM1, intersec);

     repere3.setPosition(proj3);

     triangle3D(proj1, pointM1, pointM, 250, 190, 190);
     triangle3D(proj1, pointM1, pointM2, 255, 190, 195);

     triangle3D(proj2, pointM1, pointM2, 230, 255, 100);
     triangle3D(proj2, pointM1, pointM3, 245, 245, 100); 

     triangle3D(proj3, pointM1, pointM, 100, 100, 255);   
     triangle3D(proj3, pointM1, pointM3, 125, 125, 255);
     stroke(0, 255, 0);
     strokeWeight(2);

     //cercle1     
     PVector   tr=repere1.transformOf(comb(1, proj1, -1, repere1.position()));
     float ra=2.0*(comb(1, proj1, -1, pointM)).mag();
     pushMatrix();
     repere1.applyTransformation();
     translate(tr.x, tr.y, tr.z);

     fill(155, 0, 0, 30);
     ellipse(0, 0, ra, ra);
     popMatrix();
     //cercle2 
     tr=repere2.transformOf(comb(1, proj2, -1, repere2.position()));
     ra=2.0*(comb(1, proj2, -1, pointM1)).mag();
     pushMatrix();
     repere2.applyTransformation();
     translate(tr.x, tr.y, tr.z);

     fill(255, 30);
     ellipse(0, 0, ra, ra);
     popMatrix();
     //cercle3

     ra=2.0*((comb(1, proj3, -1, pointM1)).mag());

     pushMatrix();
     repere3.applyTransformation();

     fill(255, 50);
     ellipse(0, 0, ra, ra);
     popMatrix();
     strokeWeight(1);    
     afficherLettres();
}


void dessinePlan(PVector a, PVector b, int c, int d, int e) {
     ligne(a, b);
     beginShape();
     fill(255, 255, c);
     vertex(a.x, a.y, a.z);
     fill(255, 255, d);
     vertex(0, 0, 0);
     fill(255, 255, e);
     vertex(b.x, b.y, b.z);
     endShape();
}
PVector intersection() {

     PVector iter=n1.cross(n2);
     iter.normalize();
     repere3.setZAxis(iter);
     iter.mult(lon);
     line(0, 0, 0, iter.x, iter.y, iter.z);
     dessinePlan(iter, plan1.inverseCoordinatesOf(new PVector(0, 0, 0)), 140, 100, 255);
     dessinePlan(iter, plan2.inverseCoordinatesOf(new PVector(0, 0, 0)), 140, 100, 255);
     return iter;
}
void afficherLettres() {
     fill(255, 0, 0);
     // textMode(SCREEN);
     afficherL("M", frameM.position());
     afficherL("M1", pointM1);
     afficherL("M2", pointM2);
     afficherL("M3", pointM3);
     afficherL("O", or);
     afficherL(" Rotation R1", repere1.position());
     afficherL(" Rotation R2", repere2.position());
     afficherL(" Rotation R2 o R1", intersec);
}


