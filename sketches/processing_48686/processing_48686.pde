
import remixlab.proscene.*;

Scene scene;

PlanDouble plan;
//PlanProjetant planPro;
//PlanArrivee planProjection;
InteractiveFrame soleil;

WorldConstraint contraintePlan;
LocalConstraint   axial, waxial;

void setup() {
     size(850, 850, P3D);
     scene=new Scene(this);
     scene.setGridIsDrawn(false);
     scene.setAxisIsDrawn(true);
     scene.setRadius(300);
     soleil=new InteractiveFrame(scene);
     soleil.setPosition(new PVector(0, -600, 400));

     contraintePlan=new WorldConstraint();
     contraintePlan.setTranslationConstraint(AxisPlaneConstraint.Type.AXIS, new PVector(0.0f, 1.0f, 0.0f));
     contraintePlan.setRotationConstraint(AxisPlaneConstraint.Type.AXIS, new PVector(0, 0, 1));

     axial=new LocalConstraint();
     axial.setTranslationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0.0f, 0.0f, 0));
     axial.setRotationConstraint(AxisPlaneConstraint.Type.AXIS, new PVector(1.0f, 0.0f, 0.0f));

     waxial=new LocalConstraint();
     waxial.setTranslationConstraint(AxisPlaneConstraint.Type.AXIS, new PVector(1.0f, 0.0f, 0.0f));
     waxial.setRotationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0.0f, 0.0f, 0.0f));
     
     plan=new PlanDouble();

     scene.camera().setPosition(new PVector(-50, 0, 800));
    
}
void draw() {
     background(255);
     directionalLight(255, 155, 105, 0, 0.2, -1);
     directionalLight(255, 255, 205, 0, -1, -1);
          directionalLight(255, 155, 205,-1, -1, -0.2);
     soldraw();
     soleildraw();
     plan.draw();
}

void soleildraw() {
     pushMatrix();
     soleil.applyTransformation();
     balle(255, 255, 0);
     noStroke();
     fill(255, 255, 0);
     sphere(30);
     popMatrix();
}

void soldraw() {
    
 
     beginShape();
      fill(150,250, 250,250);
     vertex(-600,-600,0);
       vertex(-600,600,0);
        fill(250, 150, 150,250);
       vertex(600,600,0);
        fill(250, 150, 250,250);
     vertex(600,-600,0);
     endShape(CLOSE);
}


