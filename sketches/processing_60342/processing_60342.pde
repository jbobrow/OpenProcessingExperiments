
/**Alcys_Attractor3D
  *
  *  jacques Maire
  * 2 mai 2012
  */


import remixlab.proscene.*;


Scene scene;
Fusee lanceur;
ArrayList lista;
Button2D button1, button2;
void setup() {
     size(890, 700, P3D);
     scene=new Scene(this); 
     scene.setGridIsDrawn(false);
     scene.setAxisIsDrawn(false);
     scene.camera().setPosition(new PVector(0, 0, 2200));
     lista=new ArrayList();
     lista.add(new Attracteur(new PVector(0, 0, 0)));
     lista.add(new Attracteur(new PVector(500, -400, 300)));
     lista.add(new Attracteur(new PVector(-700, -200, -700)));
     lanceur=new Fusee();
     button1 = new ClickButton(scene, new PVector(10, 10), "  attracteur +  ", 16, true);
     button2 = new ClickButton(scene, new PVector((10 + button1.myWidth + 5), 10), "  attractor -", 16, false);
}
void draw() {
     background(255);

     directionalLight(255, 255, 255, 2, -1, -1);
     directionalLight(255, 255, 255, 0, 1, -1);
     scene.drawGrid(2000, 20);
     fill(255, 255, 0);
     noStroke();
     for (int i=0;i<lista.size();i++) {
          pushMatrix();
          ((Attracteur)lista.get(i)).repere.applyTransformation();
          sphere(20);
          popMatrix();
     }
     lanceur.draw();
     button1.display();
     button2.display();
}
void addAttracteur() {
     Attracteur att = new Attracteur();  
     lista.add(att);
     lanceur.initialiser();
}

void removeAttracteur() {
     if (lista.size()>1) {
          scene.removeFromMouseGrabberPool(((Attracteur)lista.get(0)).repere);
          lista.remove(0);
          lanceur.initialiser();
     }
}

PVector comb(float t1, PVector v1, float t2, PVector v2) {
     PVector res=PVector.add(PVector.mult(v1, t1), PVector.mult(v2, t2));
     return res;
}

void ligne(PVector u, PVector v) { 
     line(u.x, u.y, u.z, v.x, v.y, v.z);
}


