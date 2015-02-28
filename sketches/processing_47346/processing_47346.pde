
import remixlab.proscene.*;



Scene scene;
int nbdisques=5;
Systeme systeme;
InteractiveFrame[] frames;
WorldConstraint contrainteGuide, contraintePlan, immobile ;






void setup() {
     size(850, 850, P3D);
     scene=new Scene(this);
     scene.setAxisIsDrawn(false);
     scene.setGridIsDrawn(false);
   
    scene.camera().setPosition(new PVector(0, 0, 600));
 
     frames=new InteractiveFrame[nbdisques];
     //les contraintes
     contraintePlan= new WorldConstraint();
     contraintePlan.setTranslationConstraint(AxisPlaneConstraint.Type.PLANE, new PVector(0, 1, 0));
     contraintePlan.setRotationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0, 0, 0)); 
     //
     contrainteGuide= new WorldConstraint();
     contrainteGuide.setTranslationConstraint(AxisPlaneConstraint.Type.AXIS, new PVector(0, 0, 1));
     contrainteGuide.setRotationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0, 0, 0)); 
     //
     immobile= new WorldConstraint();
     immobile.setTranslationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0, 0, 0));
     immobile.setRotationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0, 0, 0));
     //
     for (int i=0;i<nbdisques;i++) {
          frames[i]=new InteractiveFrame(scene);
          frames[i].setConstraint(immobile);
          frames[i].setPosition(-150, 0, 14*(nbdisques-i-1));
          scene.setInteractiveFrame(frames[i]);
     }
     systeme=new Systeme();
}




void draw()
{
     background(50,50,130);
     directionalLight(251, 155, 250, -1, -1, -0.72);
     directionalLight(155, 155, 255, 0, 1, -0.1);
     directionalLight(255, 255, 255, -0.7, -0.7, -0.5);     
     pushMatrix();
     fill(205,205,240);
     translate(0, 0, -17);
     box(500, 200, 6);
     fill(155,155,255);
     scene.cone(3.0, 3.0, 130);
     translate(150, 0, 0);
     scene.cone(3.0, 3.0, 130);
     translate(-300, 0, 0);
     scene.cone(3.0, 3.0, 130);
     popMatrix();
     systeme.draw();
}


