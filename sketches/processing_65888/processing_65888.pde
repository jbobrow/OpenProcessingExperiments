
/**
 *Alcys_Turtle_Logo_3D
 *par Jacques Maire
 *fait le 28 juillet 2012
 *Une tortue qui deviendra interactive ?!
 */



import remixlab.proscene.*;
Scene scene;
Tortue tortue;
Programmes lesProgrammes;
int noProgramme, nbPrgm;
PFont tahoma;
Button2D button;




void setup() {
  size(900, 700, P3D);
  scene=new Scene(this);
  scene.setGridIsDrawn(true);
  scene.setAxisIsDrawn(true);
  scene.disableKeyboardHandling();
  scene.camera().setPosition(new PVector(0, 0, 12000));
  scene.camera().setOrientation(new Quaternion(new PVector(1, 0, 0), 0.10));
  frameRate(30);
  nbPrgm=11;
  noProgramme=0;
  lesProgrammes=new Programmes();
  tortue=new Tortue(lesProgrammes.programmes[noProgramme].liste);
  tahoma = loadFont("Tahoma-21.vlw");

  textFont(tahoma);
  button = new ClickButton(scene, new PVector(50, 50), "TURTLE "+noProgramme, 21);
}
void draw() {
  float ang=0.0005*millis();
  background(0, 0, 30);
  directionalLight(255, 255, 150, 0, -1, -1);
  directionalLight(0, 155, 250, -1, -1, -1); 
  directionalLight(75*sq(1+sin(0.3*ang)), 0, 75*sq(2+sin(0.5*ang)), 0, 0.5, 0);
  directionalLight( 0, 125*sq(cos(2*ang)), 100+155*sq(cos(2*ang)), -0.1, 0, 0.5);
  directionalLight( 255, 230, 200, 1, 1, -1);
  tortue.dessiner();
  tortue.moteur();
  fill(255);
  button.display();
}


