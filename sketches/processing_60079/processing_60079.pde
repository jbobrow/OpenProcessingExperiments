
import remixlab.proscene.*;

Scene scene;
Chaine chaine;
int enprise;
int nb=12;
void setup() {
     size(890, 650, P3D);
     scene=new Scene(this);
     enprise=-1;
     chaine=new Chaine(nb);
     scene.setGridIsDrawn(false);
     scene.setAxisIsDrawn(true);
     scene.camera().setPosition(new PVector(0, 0,3500));
}

void draw() {
     background(255);

     directionalLight(255, 255, 255, 2, -1, -1);
      directionalLight(255, 255, 255, 0, 0, -1);
     damier();
    // scene.drawGrid(2000, 50);
     chaine.draw();
}

void ligne(PVector u, PVector v,int i) { 
     stroke(0, 0, 255);   
     strokeWeight(5);
     line(u.x, u.y, u.z, v.x, v.y, v.z);
     strokeWeight(1);
     stroke(0); 
     fill(100+155*(i%2), 100+ 155*((i+1)%2),100, 100);
     beginShape();
     vertex(u.x, u.y, u.z);
     vertex(u.x, u.y, 0);
     vertex(v.x, v.y, 0);
     vertex(v.x, v.y, v.z);
     endShape();
     stroke(255,0 ,0);  strokeWeight(10);
     line(u.x, u.y, 0, v.x, v.y, 0);
}

PVector comb(float t1, PVector v1, float t2, PVector v2) {
     PVector res=PVector.add(PVector.mult(v1, t1), PVector.mult(v2, t2));
     return res;
}
void damier() {stroke(0);strokeWeight(1);
     for (int i=-5;i<=5;i++) {
          for (int j=-5;j<=5;j++) {
              int k=((i+j+20)%2)*255;
               fill(k,k,k);
               rect(i*300,j*300,300,300);
               
          }
     }
}


