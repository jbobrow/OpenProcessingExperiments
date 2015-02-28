



/**Alcys_Vagues
 *fait le mardi 3 juillet 2012
 *par Jacques Maire
 */
import remixlab.proscene.*;
Scene scene;
InteractiveFrame souris;
AxisPlaneConstraint planaire;
float compteur;
float nscal=2.2;
float decalage = PI; 
float pente=100;
int dheight, dwidth;


void setup() {
  size(900, 900, P3D);
  dheight=512;
  dwidth=512;
  scene=new Scene(this);
  scene.setGridIsDrawn(false);
  scene.setAxisIsDrawn(false);
  souris=new InteractiveFrame(scene);
  planaire =  new WorldConstraint();
  planaire.setRotationConstraintType(AxisPlaneConstraint.Type.FORBIDDEN);
  planaire.setTranslationConstraintType(AxisPlaneConstraint.Type.PLANE);
  planaire.setTranslationConstraintDirection(new PVector(0, 0, 1));   
  souris.setConstraint(planaire);
  souris.setPosition(180, 180, 500);
  scene.camera().setPosition(new PVector(0, 700, 1100));
    scene.camera().setOrientation(new Quaternion(new PVector(1, 0,0),-0.8));
  noStroke();
}


void draw() {
  if (!(souris.grabsMouse() && mousePressed))compteur+=0.01;
  background(0);
  directionalLight(155, 100, 255, -0.2, -0.2, -1);
  lights();
  noiseDetail(3);
  for (int y = -dheight; y < dheight; y+=5) {
    for (int x =-dwidth; x <dwidth; x+=5) {
      float npx= map(souris.position().x, 0, width, 0, 1);
      float nx= map(x, -dwidth, dwidth, 0, 1);
      float npy= map(souris.position().y, 0, height, 0, 1);
      float ny= map(y, -dheight, dheight, 0, 1);
      float xfil = noise(compteur+(npx+nx) * nscal+ decalage, compteur*3+(npy+ny) * nscal+ decalage);
      float yfil=noise(compteur+(npx+nx) * nscal- decalage, compteur*0.5+(npy+ny) * nscal- decalage);


      Quaternion q=new Quaternion(new PVector(xfil, -yfil, 0), lerp(-3, 3, (yfil*xfil)*1.8));
      PVector vq=q.rotate(new PVector(lerp(-pente, pente, xfil), lerp(-pente, pente, yfil), lerp(-200, 200, (yfil*xfil)*5)));
      pushMatrix();
      translate(x+vq.x, y+ vq.y, vq.z);
      fill(lerp(0, 255, vq.z/300.0));
      rect(0, 0, 4, 4);
      popMatrix();
    }
  }
  pushMatrix();
  souris.applyTransformation();
  noStroke();
  fill(255, 250, 0);
  sphere(20);
  popMatrix();
}


