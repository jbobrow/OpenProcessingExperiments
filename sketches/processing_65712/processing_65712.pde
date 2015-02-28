
/**
*Alcys_Rotations
*fait le 25 juillet 2012
*par Jacques Maire
*/
import remixlab.proscene.*;


Scene scene;
//Rotation rotation;
Spire spire;
void setup() {
  size(900, 900, P3D);
  scene=new Scene(this);
  scene.setGridIsDrawn(false);
  scene.setAxisIsDrawn(false);
  scene.camera().setPosition(new PVector(0, 0, 4500));
 spire=new Spire();
  frameRate(30);
}
void draw() {
  float ang=0.0005*millis();
  background(0,0,  30);
 directionalLight(255, 255, 0, 0, -1,0);
  directionalLight(75*sq(1+sin(0.3*ang)),0,75*sq(1+sin(0.5*ang)),0 ,0.5, 0);
directionalLight( 0,125*sq(cos(2*ang)),155*sq(cos(2*ang)), -0.1, 0, 0.5);
 directionalLight( 255,230,200, 0.1, 1, -1);

spire.dessin(ang);

}



