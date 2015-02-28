
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/62177*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/**LES FILS de MOEBIUS
 *
 *par Jacques Maire
 *
 *fait le 23 mai 2012
 **/
import remixlab.proscene.*;

Scene scene;
Bande bande,band1;
int pas;
void setup() {
  size(900, 900, P3D);
  scene=new Scene(this); 
  scene.setGridIsDrawn(false);
  scene.setAxisIsDrawn(false);
  scene.camera().setPosition(new PVector(0, 8000, 8000)); 
  scene.camera().setOrientation(new Quaternion(new PVector(1, 0, 0), -PI*0.25));
  bande=new Bande(1600,3000);
  band1=new Bande(1600,3000);
  frameRate(30);

}
void draw() {
  background(0);
  if(!mousePressed){
bande.rayon=1600+6*mouseX;
bande.plus=3000+8*mouseY;
band1.rayon=1600+6*mouseX;
band1.plus=3000+8*mouseY;}
 bande.remplir();
rotateY(HALF_PI);
 band1.remplir();
}


void ligne(PVector u, PVector v) { 
 
  line(u.x, u.y,u.z, v.x, v.y,v.z);
}

  public PVector comb(float t1, PVector v1, float t2, PVector v2) {
    PVector res=PVector.add(PVector.mult(v1, t1), PVector.mult(v2, t2));
    return res;
  } 

