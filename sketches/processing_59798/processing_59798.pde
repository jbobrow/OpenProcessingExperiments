

//Jacques Maire : la tapisserie de Bayeux
//mardi 24 avril 2012
import remixlab.proscene.*;

Scene scene;
Ruban ruban0, ruban1;
PImage photo;
PVector origine=new PVector(0, 0, 0);
float angl, cycl,h0,h1;

void setup() {
     size(890, 800, P3D);
     scene= new Scene(this);
     photo=loadImage("tapisserie.gif");//2935*421
     InteractiveFrame reper0=new InteractiveFrame(scene);
     reper0.setPosition(new PVector( 4500, 2000, 0));
     InteractiveFrame reper1=new InteractiveFrame(scene);
     reper1.setPosition(new PVector( -4500, 2000, 0));    
     ruban0=new Ruban(reper0, reper1,0);
     InteractiveFrame reper2=new InteractiveFrame(scene);
     reper2.setPosition(new PVector(3500, -2000, 2000));
     InteractiveFrame reper3=new InteractiveFrame(scene);
     reper3.setPosition(new PVector( -3500, -2000, 2500));  
     ruban1=new Ruban(reper2, reper3,1);
     scene.setGridIsDrawn(false);
     scene.setAxisIsDrawn(false);
     scene.camera().setPosition(new PVector(0, 0,10000));
     cycl=0;
     frameRate(30);
}

void draw() {
    background(248,249,240);  
     angl=millis()/20000.0;

    directionalLight(255, 255, 255, -1, 0, -5);  
        
  
     ruban0.repere0.rotate(new Quaternion(new PVector(1+cos(angl), 2+sin(angl), cos(2*angl)), 0.05));
    ruban0.repere1.rotate(new Quaternion(new PVector(sin(angl), 2+cos(angl*2), cos(3*angl)), 0.05));
     ruban1.repere0.rotate(new Quaternion(new PVector(1+cos(angl), 2+sin(angl), cos(2*angl)), 0.07));
    ruban1.repere1.rotate(new Quaternion(new PVector(sin(angl), 2+cos(angl*2), cos(3*angl)), 0.035));
    
 
     ruban0.draw();
     ruban1.draw();
     positionsIntermediaires();
}

void ligne(PVector u, PVector v) {
     line(u.x, u.y, u.z, v.x, v.y, v.z);
}

void positionsIntermediaires() {
     PVector v0, w0, cuv, v1, w1;

     w0=ruban0.posTrajectoire(0.0005);
     w1=ruban1.posTrajectoire(0.0005);
     for (int i=1;i<1000;i++) {
          v0=ruban0.posTrajectoire(i*0.001);
          v1=ruban1.posTrajectoire(i*0.001);
          h0=PVector.sub(v1,v0).mag();
           h1=PVector.sub(w1,w0).mag();
          noStroke(); 
  fill(255);
     
          beginShape(TRIANGLES);
            texture(photo);
          vertex(v1.x, v1.y, v1.z,2.935*i,0);
          vertex(w1.x, w1.y, w1.z,2.935*(i-1),0);
          vertex(v0.x,v0.y, v0.z,2.935*i,421);
        vertex(v0.x, v0.y, v0.z,2.935*i,421);
           vertex(w0.x, w0.y, w0.z,2.935*(i-1),421);
           vertex(w1.x, w1.y, w1.z,2.935*(i-1),0);
         
          
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
     cycl+=1;
     if (cycl>3) cycl=-3;
}


