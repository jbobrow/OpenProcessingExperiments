

import remixlab.proscene.*;
Scene scene;
Figure figure;
PVector or;
  PFont myFont;
InteractiveFrame repere, dragueur, rotateur;
WorldConstraint pivot, drag;
LocalConstraint planaire;
float zplan;
void setup() {
     size(850, 850, P3D);
     scene = new Scene(this);
    myFont = createFont("FFScala", 48);
    textFont(myFont);
     float a=70.0;
     or=new PVector(0, 0, 0);
     zplan=300;
     pivot=new WorldConstraint();
     pivot.setRotationConstraint(AxisPlaneConstraint.Type.FREE, new PVector(0, 0, 0));
     pivot.setTranslationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0, 0, 0));
     planaire=new LocalConstraint();
     planaire.setTranslationConstraint(AxisPlaneConstraint.Type.PLANE, new PVector(0, 0, 1));
     planaire.setRotationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0, 0, 0));
     drag=new WorldConstraint();
     drag.setTranslationConstraint(AxisPlaneConstraint.Type.FREE, new PVector(0, 0, 0));
     drag.setRotationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0, 0, 0));


     dragueur = new InteractiveFrame(scene);
     rotateur=new InteractiveFrame(scene);
     repere = new InteractiveFrame(scene);
     rotateur.setReferenceFrame(dragueur);
     repere.setConstraint(pivot);  
     dragueur.setConstraint(drag);    
     rotateur.setConstraint(planaire);
  
     dragueur.setPosition(new PVector(0, 0, 1000));
     rotateur.setTranslation(new PVector(100, 0, 0));
     
     
      figure=new Figure(new PVector(a, a, 2*a), new PVector(a, -a, 2*a), new PVector(-a, -a, 2*a), new PVector(-a, a, 2*a));
     scene.camera().setPosition(new PVector(0, 0, 3200));
   scene.setGridIsDrawn(false);
     scene.setAxisIsDrawn(false);
     rectMode(CENTER);
}


void draw() {
     background(0);
       scene.drawGrid(1000,20);
     rotateur.setTranslation(normaliser(rotateur.translation(), 200));
     pushMatrix();
     dragueur.applyTransformation();
      pushMatrix();
     rotateur.applyTransformation();
     fill(255, 0, 0); 
     noStroke();  
     sphere(20);
     popMatrix();    
     noStroke();
     fill(255, 255, 0);
     sphere(20);
     popMatrix();
     ligne(or, dragueur.position());
     repere.setZAxis(dragueur.position());
     PVector vv=comb(1,dragueur.position(),-1,rotateur.position());
       repere.setXAxis(vv);
       repere.setZAxis(dragueur.position());
     pushMatrix();
     repere.applyTransformation();
     scene.drawAxis(1000);
     figure.draw();
     popMatrix();
     pushMatrix();
     translate(0, 0, zplan-2);
     fill(50, 50, 250, 240);
     rect(0, 0, 3000, 3000);
     popMatrix();
     intersection(figure.plan12);
     intersection(figure.plan23);
     intersection(figure.plan34);
     intersection(figure.plan41);
     ligne(dragueur.position(),rotateur.position());
      ligne(or,dragueur.position());
      ligneDeFuite();
}
void intersection(Plan plan) {
     PVector d1, d2;
     float skl=2000;
     PVector n=repere.inverseTransformOf(plan.normale);
     if (n.y!=0) {
          d1=new PVector(skl, (-n.x*skl-n.z*zplan)/n.y, zplan);
          d2=new PVector(-skl, (n.x*skl-n.z*zplan)/n.y, zplan);
     }
     else {
          d1=new PVector(-n.z*zplan/n.x, skl, zplan);
          d2=new PVector(-n.z*zplan/n.x, -skl, zplan);
     }
     ligne(d1, d2);
}
void ligneDeFuite(){
    
     PVector n=repere.inverseTransformOf(new PVector(0,0,1));
   PVector d1, d2;
     float skl=3200;
    
     if (n.y!=0) {
          d1=new PVector(skl, (-n.x*skl-n.z*zplan)/n.y, zplan);
          d2=new PVector(-skl, (n.x*skl-n.z*zplan)/n.y, zplan);
     }
     else {
          d1=new PVector(-n.z*zplan/n.x, skl, zplan);
          d2=new PVector(-n.z*zplan/n.x, -skl, zplan);
     }
     stroke(255,255,0);
     strokeWeight(6);
     ligne(d1, d2);
         fill(255);
     pushMatrix();
     d1=comb(2.0/3.0,d1,1.0/3.0,d2);
      translate(d1.x,d1.y,d1.z  );  
    text("droite à l'infini", 0,0);
      strokeWeight(1); 
      popMatrix();
           pushMatrix();
     dragueur.applyTransformation();   
       text("modifier l'homographie", 20,80);
     popMatrix();  
}


