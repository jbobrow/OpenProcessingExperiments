
import remixlab.proscene.*;
Scene scene;

float rayon,zplan;
LocalConstraint planaire;
WorldConstraint drag;

Arcad arc1;
Boule boule;
PVector or,nord;


void setup() {
     size(700, 700, P3D);
       rayon=600;
       zplan=-1000;
      nord=new PVector(0, 0, rayon); 
     or=new PVector(0, 0, 0);
     scene=new Scene(this);
     scene.setAxisIsDrawn(false);
     scene.setGridIsDrawn(false);
   
     planaire=new LocalConstraint();
     planaire.setTranslationConstraint(AxisPlaneConstraint.Type.PLANE, new PVector(0, 0, 1));
     planaire.setRotationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0, 0, 0));
     drag=new WorldConstraint();
     drag.setTranslationConstraint(AxisPlaneConstraint.Type.FREE, new PVector(0, 0, 0));
     drag.setRotationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0, 0, 0));
    rectMode(CENTER);
     arc1=new Arcad(new PVector(50, 200, -200));
     boule=new Boule(rayon);
     scene.camera().setPosition(new PVector(0, 4500, 3000));
          scene.camera().setOrientation(new Quaternion(new PVector(1, 0, 0),-0.9));
}
void draw() {
     background(0);
     float cr=200+55*cos(millis()/2000.0);println(cr);
     
      directionalLight(cr,cr,255,-0.5,0,-2);
     scene.  drawAxis(200);

     pushMatrix();
     translate(0  ,0  ,zplan);
     fill(255);
    rect(0,0,3000,3000);
     popMatrix();
     boule.draw();
     arc1.draw(); 
     
}


