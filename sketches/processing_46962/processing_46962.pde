
import remixlab.proscene.*;


Scene scene;
Manivelle manivelle;
Tige tige;
Ecrou ecrou;
InteractiveFrame vis, manette;
WorldConstraint cPlane, cMain;
float angleVis, angle, delta;
PVector prevdif;
void setup() {

     size(800, 800, P3D);
     scene=new Scene(this);
     scene.setAxisIsDrawn(false);
     scene.setGridIsDrawn(false);
     scene.camera().setPosition(new PVector(0, 0, 600));
     vis=new InteractiveFrame(scene);
     manette=new InteractiveFrame(scene);
     // manette.setReferenceFrame(vis);
     vis.setTranslation(0, 0, 170);
     manette.setTranslation(100, 0, 170);

     cPlane=new WorldConstraint();
     cPlane.setTranslationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0, 0, 1));
     cPlane.setRotationConstraint(AxisPlaneConstraint.Type.AXIS, new PVector(0, 0, 1));

     cMain=new WorldConstraint();
     cMain.setTranslationConstraint(AxisPlaneConstraint.Type.PLANE, new PVector(0, 0, 1));
     cMain.setRotationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0, 0, 0));

     manette.setConstraint(cMain);
     vis.setConstraint(cPlane);
     prevdif=new PVector(1, 0, 0);
     manivelle=new Manivelle();
     tige=new Tige();
     ecrou=new Ecrou();
}

void draw() {
     background(40);
     lights();
     directionalLight(255,100,55,-1,-1,-1);
     pushMatrix();
     fill(150);
box(100,100,20);
     vis.applyTransformation();
  // scene.drawAxis(100);
     stroke(0, 0, 255);
    noFill();
     ellipse(0, 0, 200, 200);
      translate(0,0,-170);
        manivelle.draw();
        translate(0,0,-200);
        tige.draw();
     popMatrix();

     pushMatrix();
     manette.applyTransformation();
    // scene.drawAxis(100);
     if (manette.isInInteraction()&&(mouseButton == RIGHT)) {
          PVector dif=comb(1.0, manette.position(), -1.0, vis.position());
          dif.normalize();
          delta = angleEntre(prevdif, dif);
          prevdif=dif;
          angleVis+=delta;
     }
     println("angleVis   "+angleVis);

     noStroke();
     fill(255, 0, 0);
     sphere(5);

     popMatrix();
     vis.setRotation(new Quaternion(0, 0, sin(angleVis/2), cos(angleVis/2)));
     ecrou.draw();
     //contrainte circulaire pour la sphere rouge
     float ray=sqrt(sq(manette.position().x)+sq(manette.position().y));
     float nx=manette.position().x*100/ray;
     float ny=manette.position().y*100/ray;
     manette.setPosition(new PVector(nx,ny,manette.position().z));
 
}
//
//
//

PVector comb(float t1, PVector v1, float t2, PVector v2) {
     PVector res=PVector.add(PVector.mult(v1, t1), PVector.mult(v2, t2));
     return res;
}

float angleEntre(PVector u, PVector v) {
     u.normalize();
     v.normalize();
     float sinus=u.x*v.y-u.y*v.x;
     return asin(sinus);
}     //
//


