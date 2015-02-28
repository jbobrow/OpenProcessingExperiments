
/**LA TORNADE de MOEBIUS
  *
  *par Jacques Maire
  *
  *fait le 21 mai 2012
**/
import remixlab.proscene.*;

Scene scene;
Bande bande;
void setup() {
  size(900, 800, P3D);
  scene=new Scene(this); 
  scene.setGridIsDrawn(false);
  scene.setAxisIsDrawn(false);
  scene.camera().setPosition(new PVector(0, 49000,14000)); scene.camera().setOrientation(new Quaternion(new PVector(1,0,0),-PI*0.34));
  bande=new Bande();
  frameRate(30);
}
void draw() {
   background(0);
  lights();
  bande.remplir();
}
class Bande {
  float rayon, plus;
  int nbnoeud=73;
  int nbdiv=18;
  float angle=TWO_PI/72;
  InteractiveFrame frame0, frame1;
  PVector[][] huits;

  Bande() {
    rayon=30400;
    plus=28000;
    frame0=new InteractiveFrame(scene);
    frame1=new InteractiveFrame(scene);
    frame1.setReferenceFrame(frame0);
    huits=new PVector[nbdiv][nbnoeud];
  }

  void remplir() { 
    for (int ic=0;ic<nbdiv;ic++) {
      float  inc=PI/8.0*ic;
      float inc1=PI/8.0+inc;
      for (int i=0;i<nbnoeud;i++) {
        frame0.setOrientation(new Quaternion(new PVector(0, 0, 1), angle*i+inc+millis()*0.0015));
        frame1.setTranslation(new PVector(rayon, 0, 0));
        frame1.setRotation(new Quaternion(new PVector(0, 1, 0), inc/18+angle*i));
        huits[ic][i]=frame1.inverseCoordinatesOf(new PVector(plus, 0, 0));
      }
    }
    noStroke();
    for (int ic=0;ic<nbdiv-1;ic++) {
      for (int i=0;i<nbnoeud-1;i++) {
        fill(255*(ic%2));
        beginShape(TRIANGLES);
        vertex( huits[ic][i].x, huits[ic][i].y, huits[ic][i].z);
        vertex( huits[ic][i+1].x, huits[ic][i+1].y, huits[ic][i+1].z);
        vertex( huits[ic+1][i+1].x, huits[ic+1][i+1].y, huits[ic+1][i+1].z);

        vertex( huits[ic][i].x, huits[ic][i].y, huits[ic][i].z);
        vertex( huits[ic+1][i+1].x, huits[ic+1][i+1].y, huits[ic+1][i+1].z);
        vertex( huits[ic+1][i].x, huits[ic+1][i].y, huits[ic+1][i].z);
        endShape();
      }
    }
  }
}

