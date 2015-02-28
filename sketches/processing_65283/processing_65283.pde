
/**Alcys_Amonite_Color
 * Fait le mardi 10 juillet 2012
 * par Jacques Maire
 */
import remixlab.proscene.*;
Scene scene;
InteractiveFrame[] reperes;
Quaternion qua, qcam, qc;
float theta;
int nb;
void setup() {
  size(800, 800, P3D);
  scene=new Scene(this); 
  scene.setGridIsDrawn(false);
  scene.setAxisIsDrawn(false);
  nb=220;
  reperes=new InteractiveFrame[nb];
  reperes[0]=new InteractiveFrame(scene);
  for (int i=1;i<nb;i++) {
    reperes[i]=new InteractiveFrame(scene);
    reperes[i].setReferenceFrame(reperes[i-1]);
  }
  qua=new Quaternion(new PVector(1, 0, 0), 0.90);
  qcam=Quaternion.multiply(new Quaternion(new PVector(0, 0, 1), PI/2), new Quaternion(new PVector(1, 0, 0), PI/2));
  qcam.normalize();
  scene.camera().setPosition(new PVector(0, 0, 10000));
}
void draw() {
  reperes[0].setOrientation(qcam); 
  theta=millis()*0.0005;
  qc=Quaternion.multiply(new Quaternion(new PVector(-0.2, 10, 0), theta), qcam);
  qua=new Quaternion(new PVector(2*sin(theta), 3*cos(-0.04*theta), 9*sin(0.25*theta)), 0.10+0.02*cos(-0.6*theta));
  reperes[0].setOrientation(qc);
  background(160+30*cos(theta), 160, 150+30*cos(theta));
  directionalLight(100, 100, 130, 0, 0, -1);
  directionalLight(60, 60,0, -1, 1, -1);
  directionalLight(0, 0, 95, -1, 0, 1);
  directionalLight( 255, 255, 255, 1, 1, -1);
  pushMatrix();
  reperes[0].applyTransformation();
  dessine(1);
  popMatrix();
}
void dessine(int n) {
  float p=50*pow(1.025, n);
  reperes[n].setTranslation(qua.rotate(new PVector(0, 0, 10*cos(-0.6*theta))));
  reperes[n].setRotation(qua);
  PVector v1, v0;
  noStroke();
  if (n%2==0) {
    fill(255);
    beginShape(TRIANGLE_STRIP);
    for (int i=0;i<=24;i++) {
      v1= reperes[n].inverseCoordinatesOf(new PVector(p*cos(i*TWO_PI/24), p*sin(i*TWO_PI/24)-1.54*p, 0));
      v0= reperes[n-1].inverseCoordinatesOf(new PVector(p/1.025*cos(i*TWO_PI/24), p/1.025*sin(i*TWO_PI/24)-1.54*p/1.025, 0));
      vertex(v0.x, v0.y, v0.z);
      vertex(v1.x, v1.y, v1.z);
    }
    endShape();
  } 
  if (n<nb-1)dessine(n+1);
}


