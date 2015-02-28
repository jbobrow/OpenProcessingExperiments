
import remixlab.proscene.*;
PFont font;
Scene scene;
InteractiveFrame repere1, repere2, plan1, plan2, dragueur1, dragueur2, frameM, repere3;
WorldConstraint  rotx;
LocalConstraint pivot;
PVector or, n1, n2, n0, pointM, pointM1, pointM2, pointM3, intersec, axe1, axe2, axe3;
float lon, arc1, arc2, arc3,tempo;
Orienteur orient1, orient2, orient0;
boolean inmove;

void setup() {
     size(850, 850, P3D);

     scene=new Scene(this);
     scene.setGridIsDrawn(false);
     scene.setAxisIsDrawn(false);
     scene.disableKeyboardHandling();
     lon=400;
     
     inmove=false;
     
     or=new PVector(0, 0, 0);
     n1=new PVector();
     n2=new PVector();
     n0=new PVector();
     pointM=new PVector(-120, -120, 300);
     pointM1=new PVector();
     pointM2=new PVector();
     pointM3=new PVector();
     axe1=new PVector();
     axe2=new PVector();
     axe3=new PVector();
     orient1=new Orienteur();
     orient2=new Orienteur();
     orient0=new Orienteur();
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
     font = loadFont("Cambria.vlw"); 
     scene.camera().setPosition(new PVector(0, 0, 1000));
}





void draw() {
     background(255);
     lights();
    directionalLight(55,100,100,0,-1,-1);
     directionalLight(195, 195, 135,-0.1, -0.2, -0.4);
        lights();
       textFont(font, 20); 
     pushMatrix();
     if(inmove){
     tempo=millis() /1000.0;
dragueur1.setPosition(new PVector(380*cos(tempo),380*sin(tempo)-50,380*sin(tempo/2)-50));
dragueur2.setPosition(new PVector(380*sin(tempo/2)+50,380*sin(tempo),380*cos(tempo)));
};
     frameM.applyTransformation();
     fill(255, 255, 0);
     noStroke();
     sphere(8);
    
     popMatrix();
     pushMatrix();
     dragueur1.applyTransformation();
     fill(255, 0, 0);
     noStroke();
     sphere(8);

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
     axe1=w.get();
     w.mult(lon);
     repere1.setPosition(w);
     PVector w1= dragueur2.position().get(); 
     w1.normalize();
     axe2=w1.get();
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
     //DESSINER LES 3 PLANS 
     dessinePlan(repere1.position(), repere2.position(), 200, 255, 195);     
     intersec=  intersection();
     dessinePlan(intersec, repere1.position(), 95, 80, 80);
     dessinePlan(intersec, repere2.position(), 80, 95, 80);

     pointM=frameM.position();
     pointM1=calculSym(pointM, n1);
     pointM2=calculSym(pointM1, n0);
     pointM3=calculSym(pointM1, n2);

     PVector proj1=projectionSurDroite(pointM1, axe1);
     PVector proj2=projectionSurDroite(pointM1, axe2);
     PVector proj3=projectionSurDroite(pointM1, axe3);

     repere3.setPosition(proj3);

   /*  triangle3D(proj1, pointM1, pointM, 130, 170, 100);
     triangle3D(proj1, pointM1, pointM2, 115, 160, 100);

     triangle3D(proj2, pointM1, pointM2, 180, 185, 80);
     triangle3D(proj2, pointM1, pointM3, 185, 180, 80); 

     triangle3D(proj3, pointM1, pointM, 70, 90, 135);   
     triangle3D(proj3, pointM1, pointM3, 75, 85, 135);*/
     orient1.place( repere1.position(), intersec, n1);
     orient2.place( repere2.position(), intersec, n2);  
     orient0.place( repere2.position(), repere1.position(), n0);  
     orient1.draw();
     orient2.draw();
     orient0.draw();
     stroke(0, 255, 0);
     strokeWeight(2);
     calculerLesArcs();
     //cercle1 --------------------------------------------------------------    
     PVector   tr=repere1.transformOf(comb(1, proj1, -1, repere1.position()));
     PVector om=repere1.coordinatesOf(pointM);
     float alph=acos(om.x/sqrt(om.x*om.x+om.y*om.y));
     if (om.y<0)alph=-alph;
     float ra=(comb(1, proj1, -1, pointM)).mag();
     pushMatrix();
     repere1.applyTransformation();

     translate(tr.x, tr.y, tr.z);
     stroke(255,0,0);
      noFill();//fill(140, 130, 130);
     ellipse(0, 0, 2.0*ra, 2.0*ra);
       translate(0,0,23);
      ellipse(0, 0, 2.1*ra, 2.1*ra);
      translate(0,0,-23); 

     rotateZ(alph);
     dessinerArc(arc1, color(255, 0, 0), ra);
      cylindre(#FF0000);
     popMatrix();

     //cercle2---------------------------------------------------------------- 
     tr=repere2.transformOf(comb(1, proj2, -1, repere2.position()));
     om=repere2.coordinatesOf(pointM2);
     ra=(comb(1, proj2, -1, pointM1)).mag();
     alph=acos(om.x/sqrt(om.x*om.x+om.y*om.y));
     if (om.y<0)alph=-alph;
     pushMatrix();
     repere2.applyTransformation();
     translate(tr.x, tr.y, tr.z);
      stroke(0, 0, 255);
     noFill();//fill(150, 150, 180, 250);
     ellipse(0, 0, 2.0*ra, 2.0*ra);
       translate(0,0,23);
      ellipse(0, 0, 2.1*ra, 2.1*ra);
      translate(0,0,-23); 
     rotateZ(alph);
     dessinerArc(arc2, color(0, 0, 255), ra);
          cylindre(#0000FF);
     popMatrix();
     //cercle3----------------------------------------------------------------
     tr=repere3.transformOf(comb(1, proj3, -1, repere3.position()));
     om=repere3.coordinatesOf(pointM);
     ra=((comb(1, proj3, -1, pointM)).mag());
     alph=acos(om.x/sqrt(om.x*om.x+om.y*om.y));
     if (om.y<0)alph=-alph;
     pushMatrix();

     repere3.applyTransformation();
     stroke(0, 255, 0);
      noFill();//fill(130, 180, 130, 250);
     ellipse(0, 0, 2.0*ra, 2.0*ra);
     translate(0,0,23);
      ellipse(0, 0, 2.1*ra, 2.1*ra);
      translate(0,0,-23); 
     rotateZ(alph);
     dessinerArc(arc3, color( 0, 255, 0), ra);
       cylindre(#00FF00);
     popMatrix();//--------------------------------------------------------------
     strokeWeight(1);    
     afficherLettres();
}


void dessinePlan(PVector a, PVector b, int c, int d, int e) {
     ligne(a, b);
     beginShape();
    fill(d, d, c*0.3);
     vertex(a.x, a.y, a.z);
     fill(c*0.8, d, c*0.9);
     vertex(0, 0, 0);
     fill(d, c*0.8,d);
     vertex(b.x, b.y, b.z);
     endShape();
     beginShape();
    fill(d, d, c*0.3);
     vertex(-a.x, -a.y, -a.z);
     fill(c*0.8, d, c*0.9);
     vertex(0, 0, 0);
     fill(d, c*0.8,d);
     vertex(-b.x, -b.y, -b.z);
     endShape(); 
     
}
PVector intersection() {

     PVector iter=n1.cross(n2);
     iter.normalize();
     axe3=iter.get();
     repere3.setZAxis(iter);
     iter.mult(lon);
     line(0, 0, 0, iter.x, iter.y, iter.z);
     dessinePlan(iter, plan1.inverseCoordinatesOf(new PVector(0, 0, 0)), 185, 180, 200);
     dessinePlan(iter, plan2.inverseCoordinatesOf(new PVector(0, 0, 0)), 170, 255, 255);
     return iter;
}
void afficherLettres() {
     fill(70, 50, 50);
     // textMode(SCREEN);
     afficherL("M0", frameM.position());
     afficherL("M1", pointM1);
     afficherL("M2", pointM2);
     afficherL("M3", pointM3);
     afficherL("O", or);
     afficherL(" quaternion q1", repere1.position());
     afficherL(" quaternion q2", repere2.position());
     afficherL(" quaternion q2*q1", intersec);
}
void calculerLesArcs() {

     arc1=calculAngle(orient1.vorient, orient0.vorient, axe1);
     arc2=calculAngle(orient0.vorient, orient2.vorient, axe2);
     arc3=calculAngle(orient1.vorient, orient2.vorient, axe3);
}
float calculAngle(PVector uu, PVector vv, PVector nor) {
     PVector u=uu.get();
     u.normalize();  
     PVector v=vv.get();
     v.normalize();
     float rep=acos(u.dot(v));  
     float si=nor.dot(uu.cross(vv));
     if (si<0) rep=-rep;
     return rep;
}
void cylindre(int c){ pushMatrix();
         translate(0,0,-700);
         fill(c);
          scene.cylinder(4,1400);
     popMatrix();}
void keyPressed(){
  if (key == 'r' || key == 'R') {
      inmove=!inmove;
    }
}

