
import remixlab.proscene.*;
PFont font,font20;
Scene scene;
InteractiveFrame repere1, repere2, plan1, plan2, dragueur1, dragueur2, frameM, repere3;
WorldConstraint  rotx;
LocalConstraint pivot;
PVector or, n1, n2, n0, pointM, pointM1, pointM2, pointM3, intersec, axe1, axe2, axe3;
float lon, arc1, arc2, arc3, tempo;
boolean inmove;
Triverseur triverseur;
Quaternion q1,q2,q3;
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
     q1=new Quaternion();
         q2=new Quaternion();
         q3=new Quaternion();
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
         font20 = loadFont("Cambria-16.vlw");
     triverseur=new Triverseur();
     scene.camera().setPosition(new PVector(0, 0, 1100));
}





void draw() {
     background(0,0,0);
     // lights();
     // directionalLight(55, 100, 100, 0, -1, -1);
     directionalLight(255, 255, 235, -0.1, -0.2, -0.4);
     lights();
      
     pushMatrix();
     if (inmove) {
          tempo=millis() /4000.0;
          dragueur1.setPosition(new PVector(380*cos(tempo), 380*sin(tempo)-50, 380*sin(tempo/2)-50));
          dragueur2.setPosition(new PVector(380*sin(tempo/2)+50, 380*sin(tempo), 380*cos(tempo)));
     };
     fill(105,80);
     sphere(frameM.position().mag());
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
stroke(255);
     ligne(or, dragueur1.position());  
     ligne(or, dragueur2.position());

     pushMatrix();
     repere1.applyTransformation();
     pushMatrix();
     plan1.applyTransformation();
     fill(255, 255, 0);
     box(10);
     popMatrix(); 
     popMatrix();
     pushMatrix();
     repere2.applyTransformation();
     pushMatrix();
     plan2.applyTransformation();
     fill(255, 255, 0);
     box(10);

     popMatrix();
     popMatrix();  
     n1=plan1.inverseTransformOf(new PVector(0, lon, 0));
     n2=plan2.inverseTransformOf(new PVector(0, lon, 0));  
     intersec=  intersection();

     pointM=frameM.position();
     pointM1=calculSym(pointM, n1);
     pointM2=calculSym(pointM1, n0);
     pointM3=calculSym(pointM1, n2);

     PVector proj1=projectionSurDroite(pointM1, axe1);
     PVector proj2=projectionSurDroite(pointM1, axe2);
     PVector proj3=projectionSurDroite(pointM1, axe3);

     repere3.setPosition(proj3);

     triverseur.calculer();
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
     dessinerArc(arc1, color(255, 0, 0), ra, alph);
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
     dessinerArc(arc2, color(0, 0, 255), ra, alph);
     popMatrix();
     //cercle3----------------------------------------------------------------
     //tr=repere3.transformOf(comb(1, proj3, -1, repere3.position()));
     om=repere3.coordinatesOf(pointM);
     ra=((comb(1, proj3, -1, pointM)).mag());
     alph=acos(om.x/sqrt(om.x*om.x+om.y*om.y));
     if (om.y<0)alph=-alph;
     pushMatrix();

     repere3.applyTransformation();
     dessinerArc(arc3, color( 0, 255, 0), ra, alph);

     popMatrix();//--------------------------------------------------------------
     strokeWeight(1);    
     afficherLettres();
     //verification();
}


void dessinePlan(PVector a, PVector b, int c, int d, int e) {
     ligne(a, b);
     beginShape();
     fill(c, d, e);
     vertex(a.x, a.y, a.z);
     vertex(b.x, b.y, b.z);

     fill(c/2.7, d/2.7, e/2.7);
     vertex(0, 0, 0);
     endShape();
}


PVector intersection() {
     PVector iter=n1.cross(n2);
     iter.normalize();
     axe3=iter.get();
     repere3.setZAxis(iter);
     iter.mult(lon);
     line(0, 0, 0, iter.x, iter.y, iter.z);
     return iter;
}


void afficherLettres() {
     textFont(font, 20);
     fill(150, 150, 50);
     // textMode(SCREEN);
     afficherL("v0", frameM.position());
     afficherL("I", pointM1);
     afficherL("v2", pointM2);
     afficherL("v3", pointM3);
     afficherL("O", or);
     afficherL("quaternion q1", repere1.position());
     afficherL("quaternion q2", repere2.position());
     afficherL("q2*q1", intersec);
     theoreme();
}


void calculerLesArcs() {
     arc1=calculAngle(triverseur.vec1, triverseur.vec2, axe1);
     arc2=calculAngle(triverseur.vec2, triverseur.vec3, axe2);
     arc3=calculAngle(triverseur.vec1, triverseur.vec3, axe3);
}



void verification(){
q1.fromAxisAngle(axe1,arc1*2);
q2.fromAxisAngle(axe2,arc2*2);
q3= Quaternion.multiply(q2,q1);
afficher(q3);
Quaternion qq3=new Quaternion();
qq3.fromAxisAngle(axe3,arc3*2);
afficher(qq3);
println();

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


void keyPressed() {
     if (key == 'r' || key == 'R') {
          inmove=!inmove;
     }
}
void theoreme(){
    
textMode(SCREEN);
textFont(font20); 
text("Les angles inscrits de droites définissent deux angles de vecteurs. Si l'un est (u,v)=(-u,-v) l'autre est (-u,v)=(u,-v)",5,785);
text("Ces angles sont aussi les angles des quaternions défins par les arcs sous-tendus",5,800);
text("les arcs  rouge et bleu concaténés sont définis par deux angles de vecteurs inscrits,(v0, v2)(v2,v3)sur deux cercles",5,815);
text(".L'angle de vecteurs (v0,v3) inscrit dans le troisième cercle définit l'arc vert produit.",5, 830);
text("Les sphères bleues changent les angles de vecteurs (v0, v2) et (v2,v3) en (-v0, v2) (v2,-v3).",5,845);

textMode(MODEL);
}


