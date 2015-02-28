
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
     scene.camera().setPosition(new PVector(0, 0, 2000));
}

void draw() {
     background(255);
     
     directionalLight(255,0,255,2,-1,-1);
     scene.drawGrid(2000,50);
     chaine.draw();
}

void ligne(PVector u, PVector v) { 
     stroke(0, 0, 255);   
     strokeWeight(5);
     line(u.x, u.y, u.z, v.x, v.y, v.z);
     stroke(100, 100);
     line(u.x, u.y, 0, v.x, v.y, 0);
     stroke(0);   
     strokeWeight(1);
     line(u.x, u.y, u.z, u.x, u.y, 0);
     line(v.x, v.y, v.z, v.x, v.y, 0);
}

PVector comb(float t1, PVector v1, float t2, PVector v2) {
     PVector res=PVector.add(PVector.mult(v1, t1), PVector.mult(v2, t2));
     return res;
}
void mouseReleased() {
     enprise=-1;
}






