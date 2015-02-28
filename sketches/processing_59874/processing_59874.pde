

//Jacques Maire : la tapisserie de Bayeux
//mardi 24 avril 2012
import remixlab.proscene.*;

Scene scene;
Ruban ruban0, ruban1;
Balle[] balles;
PVector origine=new PVector(0, 0, 0);
float angl, cycl;

void setup() {
     size(890, 800, P3D);
     scene= new Scene(this);
     balles=new Balle[10];
     for (int i=0;i<10;i++) {
          balles[i]=new Balle(random(0, 1), random(0, 1), random(0.002, 0.006), random(0.002, 0.006));
     }
     InteractiveFrame reper0=new InteractiveFrame(scene);
     reper0.setPosition(new PVector( 4500, 5000, 6000));
     InteractiveFrame reper1=new InteractiveFrame(scene);
     reper1.setPosition(new PVector( -8000, 7000, 0 ));    
     ruban0=new Ruban(reper0, reper1, 0);
     InteractiveFrame reper2=new InteractiveFrame(scene);
     reper2.setPosition(new PVector(6000, -9000, -5000));
     InteractiveFrame reper3=new InteractiveFrame(scene);
     reper3.setPosition(new PVector( -8500, -10000, -7000));  
     ruban1=new Ruban(reper2, reper3, 1);
     scene.setGridIsDrawn(false);
     scene.setAxisIsDrawn(false);
     scene.camera().setPosition(new PVector(0, 0, 20000));
     cycl=1.8;
     frameRate(36);
}

void draw() {
     background(0);  
     angl=millis()/200000.0;

     directionalLight(155, 255, 255, 1, -1, -1);  
     directionalLight(255, 105, 200, -1, -1, 1);      

     ruban0.repere0.rotate(new Quaternion(new PVector(1+2*cos(angl), 3*sin(angl), 0.2*cos(angl)), 0.015));
     ruban0.repere1.rotate(new Quaternion(new PVector(0.2*sin(angl), 0.3*cos(angl*0.5), 0.3*cos(angl)), 0.025));
     ruban1.repere0.rotate(new Quaternion(new PVector(1+2.1*cos(angl), 0.4*sin(angl), 1.3*cos(2*angl)), 0.037));
     ruban1.repere1.rotate(new Quaternion(new PVector(1+2*sin(angl), 0.3*cos(angl*0.5), 2.1*cos(3*angl)), 0.038));


     ruban0.draw();
     ruban1.draw();
     positionsIntermediaires();
     for (int i=0;i<10;i++) { 
          balles[i].draw();
     }
}

void ligne(PVector u, PVector v) { 
     line(u.x, u.y, u.z, v.x, v.y, v.z);
}

void positionsIntermediaires() {
     PVector v0, w0, cuv, v1, w1;
     w0=ruban0.posTrajectoire(0.005);
     w1=ruban1.posTrajectoire(0.005);
     for (int i=1;i<100;i++) {
          v0=ruban0.posTrajectoire(i*0.01);
          v1=ruban1.posTrajectoire(i*0.01);
          noStroke(); 
          beginShape(TRIANGLES);
          fill(50, 50, 200); 
          vertex(v1.x, v1.y, v1.z); 
          vertex(w1.x, w1.y, w1.z);
          vertex(v0.x, v0.y, v0.z);
          vertex(v0.x, v0.y, v0.z);
          vertex(w0.x, w0.y, w0.z);
          vertex(w1.x, w1.y, w1.z);
          endShape(CLOSE);        

          w1=v1.get();
          w0=v0.get();
     }
}



PVector comb(float t1, PVector v1, float t2, PVector v2) {
     PVector res=PVector.add(PVector.mult(v1, t1), PVector.mult(v2, t2));
     return res;
}
void mousePressed() {
 cycl+=0.5;
 if (cycl>4) cycl=0;
 }

