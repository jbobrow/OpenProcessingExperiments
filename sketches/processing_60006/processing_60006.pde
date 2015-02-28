

//Jacques Maire : tondeuse
//mardi 27 avril 2012
import remixlab.proscene.*;

Scene scene;
Ruban ruban0, ruban1;
Balle[] balles;
PVector origine=new PVector(0, 0, 0);
float angl, cycl;
int nbb,nlignes,ncolonnes;
float[][] hauteurs;
void setup() {
     size(890, 800, P3D);
     scene= new Scene(this);
      nbb=2;nlignes=80; ncolonnes=100;
      hauteurs=new float[ncolonnes][nlignes];
      for(int i=0;i<ncolonnes;i++){for(int j=0;j<nlignes;j++){ hauteurs[i][j]=700;}}

     balles=new Balle[nbb];
     for (int i=0;i<nbb;i++) {
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
     background(230);  
     angl=millis()/20000.0;

     directionalLight(255, 255, 255, -1, 1, -1);  
     //directionalLight(255, 155, 255, -1, -1, 1);      

     ruban0.repere0.rotate(new Quaternion(new PVector(1+2*cos(angl), 3*sin(angl), 0.2*cos(angl)), 0.05));
     ruban0.repere1.rotate(new Quaternion(new PVector(0.2*sin(angl), 0.3*cos(angl*0.5), 0.3*cos(angl)), 0.05));
     ruban1.repere0.rotate(new Quaternion(new PVector(1+2.1*cos(angl), 0.4*sin(angl), 1.3*cos(2*angl)), 0.1));
     ruban1.repere1.rotate(new Quaternion(new PVector(1+2*sin(angl), 0.3*cos(angl*0.5), 2.1*cos(3*angl)), 0.12));


     ruban0.draw();
     ruban1.draw();
     positionsIntermediaires();
    for (int i=0;i<nbb;i++) { 
          balles[i].draw();
     }
}

void ligne(PVector u, PVector v) { 
     line(u.x, u.y, u.z, v.x, v.y, v.z);
}

void positionsIntermediaires() {
    strokeWeight(3);
     PVector v0, w0, wj,pwj, v1, w1;
     w0=ruban0.posTrajectoire(0.002);
     w1=ruban1.posTrajectoire(0.002);
     for (int i=1;i<ncolonnes;i++) {
          v0=ruban0.posTrajectoire((float)i/ncolonnes);
          v1=ruban1.posTrajectoire((float)i/ncolonnes);
         for(int j=0;j<nlignes;j++){
              float jj=(float)j/nlignes;
          
          wj=comb(jj,v0,1-jj,v1);
          pwj=comb(jj,w0,1-jj,w1);
          PVector orth=PVector.sub(wj,pwj).cross(PVector.sub(v0,v1));
          orth.normalize();
       
          stroke(30,30,90); 
     ligne(comb(1,wj,hauteurs[i][j],orth),comb(1,wj,-hauteurs[i][j],orth));
   
         } 
          
     
        noStroke(); 
          beginShape(TRIANGLES);
          fill(240, 240, 250); 
          vertex(v1.x, v1.y, v1.z); 
          vertex(w1.x, w1.y, w1.z);
          vertex(v0.x, v0.y, v0.z);
          vertex(w1.x, w1.y, w1.z);
          vertex(v0.x, v0.y,v0.z);
          vertex(w0.x, w0.y, w0.z);
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

