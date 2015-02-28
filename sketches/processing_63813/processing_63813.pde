
/**
  *Interactive Chaine 3D
  *fait par Jacques Maire
  *le 10 juin 2012
  */

import remixlab.proscene.*;
Scene scene;

int nb, contraint, enpousse;
float ressort, tempo, amorti, pas;
Balle[] balles;
PVector gravite;
InteractiveFrame pousseur;

void setup() {
  size(900, 1024, P3D);
  scene= new Scene(this);
  scene.setRadius(400);
  scene.showAll();  
  scene.setGridIsDrawn(true);
  scene.setAxisIsDrawn(true);		
  scene.disableKeyboardHandling();
  ressort=300.0;
  tempo= 0.05f;
  amorti= 0.90f;
  gravite=new PVector(0, 0, -8.0);
  pas= 6.0f;
  nb= 40;
  balles= new Balle[nb];
  contraint=-1;
  pousseur=new InteractiveFrame(scene);
  pousseur.setPosition(new PVector(25, 40, 40)); 
  for (int i= 0; i < nb; i++) {
    balles[i]=new Balle(new PVector(-50, -80, 350), i);
  }
}

void draw() {
  background(255);
  directionalLight(255, 255, 255, -1, -1, -1);
  pushMatrix();
  pousseur.applyTransformation();
  fill(255, 255, 0);
  noStroke();
  sphere(10);
  popMatrix();
  //testerdrag();
  // contraint=plusPresDe();
  calculsforces();
  calculspositions();
  dessiner();
 plusPresDe();
}

public void calculsforces() {
  PVector dif;
  for (int i= 1; i < nb; i++) {
    dif=PVector.sub( balles[i - 1].pos, balles[i].pos);
    balles[i].force=PVector.mult(dif, ressort*(1-pas/dif.mag()));			
    if (i<nb-1) {
      dif=PVector.sub( balles[i + 1].pos, balles[i].pos);
      balles[i].force=PVector.add( balles[i].force, PVector.mult(dif, ressort*(1-pas/dif.mag())));
    }
  }
}

void calculspositions() {
  int  debut;
  if (contraint==-1) {
    debut=0;
  }
  else {
    debut=contraint;
    balles[debut].pos=comb(5.0/6.0, balles[debut].pos, 1.0/6.0, pousseur.position());
  }

  for (int i= debut+1; i < this.nb; i++) {
    balles[i].vit=comb(amorti, balles[i].vit, tempo, balles[i].force);
    balles[i].vit=comb(1, balles[i].vit, 1, gravite);
    balles[i].pos=comb(1, balles[i].pos, tempo, balles[i].vit);
  }
  for (int i= debut-1; i >0; i--) {			
    balles[i].vit=comb(amorti, balles[i].vit, tempo, balles[i].force);
    balles[i].vit=comb(1, balles[i].vit, 1, gravite);
    balles[i].pos=comb(1, balles[i].pos, tempo, balles[i].vit);
  }
}




void dessiner() {
  fill(255, 255, 0);
  stroke(0, 0, 255);
  strokeWeight(3);
  for (int i= 1; i < nb; i++) {		
    line(balles[i-1].pos.x, balles[i-1].pos.y, balles[i-1].pos.z, balles[i].pos.x, balles[i].pos.y, balles[i].pos.z);
  }
  noStroke();  
  strokeWeight(1);
  fill(255, 0, 0);
  for (int i= 0; i < nb; i++) {
    pushMatrix();
    translate(balles[i].pos.x, balles[i].pos.y, balles[i].pos.z);
    sphere(4);
    popMatrix();
  }
}
void mouseReleased() {
  contraint=-1;
}
void keyPressed() {
  contraint=(contraint==-1)?  plusPresDe(): -1;
}



PVector comb(float a, PVector u, float b, PVector v) {
  return new PVector(a*u.x+b*v.x, a*u.y+b*v.y, a*u.z+b*v.z);
}

int plusPresDe() {
  float dis=PVector.sub( balles[0].pos, pousseur.position()).mag();
  float d;
  int sol=0;
  for (int i=1;i<nb;i++) {
    d=PVector.sub( balles[i].pos, pousseur.position()).mag();
    if (d<dis) {
      dis=d; 
      sol=i;
    }
  }
  stroke(0);
  ligne(pousseur.position(), balles[sol].pos);
  return sol;
}
void ligne(PVector u, PVector v) {
  line(u.x, u.y, u.z, v.x, v.y, v.z);
}


