


import remixlab.proscene.*;
 
Scene scene;
Repere repere0, repere1;
PVector origine=new PVector(0, 0, 0);
float angl,cycl;
 
void setup() {
     size(890, 700, P3D);
     scene= new Scene(this);
     repere0=new Repere(new PVector( 3000, -500, 1000), new PVector(0, 0, 1), 0);
     repere1=new Repere(new PVector( -3500, 500, -500), new PVector(1, 0, 0), 0);
     scene.setGridIsDrawn(false);
     scene.setAxisIsDrawn(false);
     scene.camera().setPosition(new PVector(0,0,7500));
     cycl=10;
     frameRate(30);
}
 
void draw() {
     background(255);
       directionalLight(150+100*sin(angl),150+155*cos(2*angl),100+155*cos(angl),2,-2,-1);
           directionalLight(255,255,255,-3,-2,-1);  lights();
       angl=millis()/80000.0;
    repere0.frame.rotate(new Quaternion(new PVector(1+cos(angl),2+sin(angl),cos(2*angl)),0.05));
      repere1.frame.rotate(new Quaternion(new PVector(sin(angl),2+cos(angl*2),cos(3*angl)),0.03));
     repere0.draw();
     repere1.draw();
     positionsIntermediaires();
 
}
 
void ligne(PVector u, PVector v) {
     line(u.x, u.y, u.z, v.x, v.y, v.z);
}
 
void positionsIntermediaires() {
     PVector v, w;
 
     w=posTrajectoire(0.01);
     for (int i=1;i<1000;i++) {
          v=posTrajectoire(i*0.001);
          stroke(0);
          //ligne(origine, v);
          fill(255*sin(0.025*i),155*cos(0.025*i),255*cos(0.005*i));
          noStroke();
          beginShape();
          vertex(v.x, v.y, v.z-600);
          vertex(v.x, v.y, v.z+600);
          vertex(w.x, w.y, w.z+600);
          vertex(w.x, w.y, w.z-600);
          endShape(CLOSE);
          w=v.get();
      
     }
}
 
PVector posTrajectoire(float i) {
     PVector u, v;
     float ku, kv;
     ku=5400.0*i+20;
     kv=-4200*(1-i)+20;
     u=new PVector(ku*cos(TWO_PI*i*(cycl-4)), ku*sin(TWO_PI*i*(cycl-4)), 0);
     v=new PVector(kv*cos(TWO_PI*(1-i)*cycl), kv*sin(TWO_PI*(1-i)*cycl), 0);
     u=repere0.frame.inverseCoordinatesOf(u);
     v=repere1.frame.inverseCoordinatesOf(v);
     return comb((1-i), u, i, v);
}
 
PVector comb(float t1, PVector v1, float t2, PVector v2) {
     PVector res=PVector.add(PVector.mult(v1, t1), PVector.mult(v2, t2));
     return res;
}
void mousePressed(){
cycl+=1;if(cycl>15) cycl=-15;
}

