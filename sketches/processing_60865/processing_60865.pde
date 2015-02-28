
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/60518*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/**Alcys_Dauphin
 *
 * Jacques Maire
 * 5 mai 2012
 */
import remixlab.proscene.*;


Scene scene;
Dauphin cetacee;
ArrayList lista;
PVector[] etoiles;
void setup() {
     size(890, 700, P3D);
     scene=new Scene(this); 
     scene.setGridIsDrawn(false);
     scene.setAxisIsDrawn(false);
 
     lista=new ArrayList();
     lista.add(new Attracteur(new PVector(0, 0, 500)));
     lista.add(new Attracteur(new PVector(500, -400, -200)));
     lista.add(new Attracteur(new PVector(-700, -200, -200)));
     lista.add(new Attracteur(new PVector(-500, 400, 300)));
     lista.add(new Attracteur(new PVector(800, 700, 0)));
     cetacee=new Dauphin();
     etoiles=new PVector[50];
     for (int i=0;i<20;i++){
     etoiles[i]=new PVector(random(-10,10), random(-5,-10), random(1,5 ));
    etoiles[i].normalize();
    etoiles[i].mult(3000);
  rectMode(CENTER);
   scene.camera().setOrientation(new Quaternion(new PVector(1, 0, 0), -PI/3.5)); 
   scene.camera().setPosition(new PVector(0, 2000, 2500));
   frameRate(40);
}
}
void draw() {
     background(180, 180, 255);
      lights();
     directionalLight(255, 255, 255, 2, -1, -1);
     directionalLight(255, 255, 255, 0, 1, -1);
     fill(20,20,135);
      rect(0,0,12000,6000);
     // scene.drawAxis(1000);
     stroke(255);

        strokeWeight(10);  
   for (int i=0;i<20;i++) {
               line(etoiles[i].x-5, etoiles[i].y-5, etoiles[i].z,etoiles[i].x+5, etoiles[i].y+5, etoiles[i].z);
                line(etoiles[i].x, etoiles[i].y, etoiles[i].z-5,etoiles[i].x, etoiles[i].y, etoiles[i].z+5);
     }

     fill(255, 0, 0);
     noStroke();
     for (int i=0;i<lista.size();i++) {
          pushMatrix();
          ((Attracteur)lista.get(i)).repere.applyTransformation();
          sphere(40);
          popMatrix();
     }
     cetacee.draw();
   
}


PVector comb(float t1, PVector v1, float t2, PVector v2) {
     PVector res=PVector.add(PVector.mult(v1, t1), PVector.mult(v2, t2));
     return res;
}

void ligne(PVector u, PVector v) { 
     line(u.x, u.y, u.z, v.x, v.y, v.z);
}


