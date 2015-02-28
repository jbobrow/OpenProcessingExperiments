
/**Alcys_Moebius
*
*par Jacques Maire
*
*fait le 19 mai 2012
*/
import remixlab.proscene.*;

Scene scene;
Bande bande;
int compteur, pas;
Boolean suivreLaSphere;
void setup() {
  size(900, 700, P3D);
  scene=new Scene(this); 
  scene.setGridIsDrawn(false);
  scene.setAxisIsDrawn(false);
  scene.camera().setPosition(new PVector(0, 0, 10000));
  bande=new Bande();
  compteur=0;
  pas=0;
  suivreLaSphere=true;
  frameRate(20);
}
void draw() {
  compteur=(floor(millis()/50))%36; 
  background(127+127*cos(0.0005*millis()), 127+127*sin(0.002*millis()), 127-127*cos(0.001*millis()));
  lights();
  directionalLight(255, 0, 0, 1, cos(compteur/100), -1 );
  directionalLight(255, 255, 0, 0, 0, cos(compteur/200));
  pas=(pas+1)%72;
  if(suivreLaSphere){
  scene.camera().setPosition(bande.sposOeil);
  scene.camera().lookAt(bande.scentre);}
  else{ scene.camera().setPosition(bande.cposOeil);
  scene.camera().lookAt(bande.ccentre);}
  fill(55, 50, 255);
  noStroke();
  bande.remplir();
}
void mousePressed(){suivreLaSphere=!suivreLaSphere;}

