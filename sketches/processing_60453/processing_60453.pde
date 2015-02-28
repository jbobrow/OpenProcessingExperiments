
/**Alcys_Planetes
 *
 *  jacques Maire
 * 5 mai 2012
 */


import remixlab.proscene.*;


Scene scene;
Fusee lanceur;
ArrayList lista;
PVector[] etoiles;
void setup() {
     size(890, 700, P3D);
     scene=new Scene(this); 
     scene.setGridIsDrawn(false);
     scene.setAxisIsDrawn(false);
     scene.camera().setOrientation(new Quaternion(new PVector(1, 0, 0), PI/2.0));
     lista=new ArrayList();
     lista.add(new Attracteur(new PVector(0, 0, 0)));
     lista.add(new Attracteur(new PVector(500, -400, 300)));
     lista.add(new Attracteur(new PVector(-700, -200, -700)));
     lista.add(new Attracteur(new PVector(-500, 400, 200)));
     lista.add(new Attracteur(new PVector(800, 700, 0)));
     lanceur=new Fusee();
     etoiles=new PVector[500];
     for (int i=0;i<100;i++){
     etoiles[i]=new PVector(random(-1, 1), random(-1,1), random(-1, 1));
    etoiles[i].normalize();
    etoiles[i].mult(2000);
}
}
void draw() {
     background(0, 0, 60);

     directionalLight(255, 255, 255, 2, -1, -1);
     directionalLight(255, 255, 255, 0, 1, -1);

     scene.camera().lookAt(lanceur.fusee.position());
     stroke(255,255,0);
          //fill(255, 255, 0);
        strokeWeight(10);  
   for (int i=0;i<100;i++) {
         
         // pushMatrix();
               //translate( etoiles[i].x, etoiles[i].y, etoiles[i].z);
               line(etoiles[i].x-5, etoiles[i].y-5, etoiles[i].z,etoiles[i].x+5, etoiles[i].y+5, etoiles[i].z);
                line(etoiles[i].x, etoiles[i].y, etoiles[i].z-5,etoiles[i].x, etoiles[i].y, etoiles[i].z+5);
               //sphere(10);
          //popMatrix();
     }

     fill(255, 255, 0);
     noStroke();
     for (int i=0;i<lista.size();i++) {
          pushMatrix();
          ((Attracteur)lista.get(i)).repere.applyTransformation();
          sphere(20);
          popMatrix();
     }
     lanceur.draw();
   
}


PVector comb(float t1, PVector v1, float t2, PVector v2) {
     PVector res=PVector.add(PVector.mult(v1, t1), PVector.mult(v2, t2));
     return res;
}

void ligne(PVector u, PVector v) { 
     line(u.x, u.y, u.z, v.x, v.y, v.z);
}


