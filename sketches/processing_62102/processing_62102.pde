
import remixlab.proscene.*;


Scene scene;
Bande bande;
int compteur,pas;
void setup() {
  size(900, 700, P3D);
  scene=new Scene(this); 
  scene.setGridIsDrawn(false);
  scene.setAxisIsDrawn(false);
  scene.camera().setPosition(new PVector(0, 0,10000));
  bande=new Bande();
  compteur=0;
  pas=0;
  frameRate(30);
}
void draw() {
  compteur=(floor(millis()/50))%37; 
  background(127+127*cos(0.0005*millis()), 127+127*sin(0.002*millis()), 127-127*cos(0.001*millis()));
  lights();
  directionalLight(255, 0, 0, 1, cos(compteur/100), -1 );
  directionalLight(255, 255, 0, 0, 0, cos(compteur/200));
  pas=(pas+1)%72;
/*  println(pas+"    "+(floor(0.01*millis()+36)%72));
 bande.dessinerSphere(floor(0.01*millis())%72);
 bande.dessinerSphere(floor(0.01*millis()+36)%72);*/
  fill(55, 50, 255);
  noStroke();
  bande.remplir();
}


