
import remixlab.proscene.*;


Scene scene;
WorldConstraint contrainteX, libreTR;
LocalConstraint  libreT, axial, fixe;
Plan plan1;
PlanArrivee planProjection;

InteractiveFrame soleil;

void setup() {
     size(850, 850, P3D);
     scene=new Scene(this);
     scene.setGridIsDrawn(false);
     scene.setAxisIsDrawn(false);
     scene.setRadius(80);
     soleil=new InteractiveFrame(scene);
     soleil.setPosition(new PVector(600,-220, 500));
     contrainteX=new WorldConstraint();
     contrainteX.setTranslationConstraint(AxisPlaneConstraint.Type.FREE, new PVector(0.0f, 0.0f, 0.0f));
     contrainteX.setRotationConstraint(AxisPlaneConstraint.Type.AXIS, new PVector(0.1f, 0.0f, 0.0f));
     libreT=new LocalConstraint();
     libreT.setTranslationConstraint(AxisPlaneConstraint.Type.PLANE, new PVector(0.0f, 0.0f, 0.1f));
     libreT.setRotationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0.0f, 0.0f, 0.0f));
     axial=new LocalConstraint();
     axial.setTranslationConstraint(AxisPlaneConstraint.Type.AXIS, new PVector(0.0f, 0.0f, 0.1f));
     axial.setRotationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0.0f, 0.0f, 0.0f));
     fixe=new LocalConstraint();
     fixe.setTranslationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0.0f, 0.0f, 0.0f));
     fixe.setRotationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0.0f, 0.0f, 0.0f));   
     libreTR=new WorldConstraint();
     libreTR.setTranslationConstraint(AxisPlaneConstraint.Type.FREE, new PVector(0.0f, 0.0f, 0.0f));
     libreTR.setRotationConstraint(AxisPlaneConstraint.Type.FREE, new PVector(0.0f, 0.0f, 0.0f));

     plan1=new Plan(200.0, 2.16);

     planProjection=new PlanArrivee(-400, 0.0);
     planProjection.repere.setPosition(-300, -300, -300);

     plan1.setLongueur(800);
     scene.camera().setOrientation(new Quaternion( sin(-PI/10), 0, 0, cos(-PI/10)));
     scene.camera().setPosition(new PVector(300, 1000, 1500));
}

void draw() {
     background( 0);
     lights();
     directionalLight(55, 55, 255, -0.2, -0.3, 0.7);
     placeSoleil();
     planProjection.draw();
     plan1.draw();
}
void placeSoleil(){
pushMatrix();
soleil.applyTransformation();
noStroke();
fill(255,0,0);
sphere(5);
fill(255,255,0,200);
sphere(20);
popMatrix();
}


