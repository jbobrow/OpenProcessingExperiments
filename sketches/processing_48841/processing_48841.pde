
import remixlab.proscene.*;
Scene scene;
InteractiveFrame[] reperes;
int nb, maxi;
float tempo;
ArrayList trace, trac1;
void setup() {
     size(850, 850, P3D);
     scene=new Scene(this);
     nb=5;
     maxi=1500;
     trace=new ArrayList();
     trac1=new ArrayList();
     scene.setAxisIsDrawn(false);
     scene.setGridIsDrawn(false);
     reperes=new InteractiveFrame[nb];
     for (int i=0;i<nb;i++) {
          reperes[i]=new InteractiveFrame(scene);
          if (i>0) {
               reperes[i].setReferenceFrame(reperes[i-1]);
               reperes[i].setTranslation(new PVector(100, 50, 50));
          }
     }
     frameRate(20);
     scene.camera().setPosition(new PVector(0, 0, 2000));
}

void draw() {
     background(0);
     tempo=millis()/5000.0;
     directionalLight(255, 150, 150, cos(tempo), -1, sin(2*tempo));
     directionalLight(150, 150, 255, -cos(tempo), 1, sin(4*tempo));
     directionalLight(150, 150, 50, cos(tempo/40)/5, sin(tempo/40)/5, -0.21);
     shininess(5.0); 
     pushMatrix();
     tourneAutour(0, new Quaternion(new PVector(0, 0, 1), 0.007), new PVector(0, 1, 1));
     scene.drawAxis(50);
     stroke(0, 0, 255);
     noFill();
     ellipse(100, 50, 200, 200);
     PVector centreLocal=new PVector(100, 250, 300);
     Quaternion q1=new Quaternion(new PVector(0, 0, 1), 0.002);
     tourneAutour(1, q1, centreLocal);
     centreLocal=new PVector(100, 0, 400);
     Quaternion q2=new Quaternion(new PVector(0, 1, 0), 0.002f);
     tourneAutour(2, q2, centreLocal);
     centreLocal=new PVector(550, 200, 0);
     Quaternion q3=new Quaternion(new PVector(1, 0, 0), 0.02f);
     tourneAutour(3, q3, centreLocal);
     popMatrix();
     gereTrace();
}


void gereTrace() {
     trace.add(reperes[4].inverseCoordinatesOf(new PVector(0, 0, 0)));
     trac1.add(reperes[4].inverseCoordinatesOf(new PVector(0, 800, 0)));
     if (trace.size()>maxi) {
          trace.remove(0);
          trac1.remove(0);
     }
     if (trace.size()>1)dessineTrace();
}


void dessineTrace() {
     PVector v, vp;
     fill(255);
     noStroke();
     //QUAD
     beginShape(QUAD_STRIP);
     for (int i=0;i<trace.size();i++) {
          v= (PVector)trace.get(i) ;
          vp= (PVector)trac1.get(i) ;
          vertex(v.x, v.y, v.z);
          vertex(vp.x, vp.y, vp.z);
     }
     endShape();
}

void tourneAutour(int i, Quaternion qq, PVector v) {
     PVector CR=comb(-1, v, 1, reperes[i].translation());
     CR=qq.rotate(CR);
     reperes[i].setTranslation(PVector.add(CR, v));
     reperes[i].setRotation(Quaternion.multiply(reperes[i].rotation(), qq));
     reperes[i].applyTransformation();
     cube();
}
void cube() {
     scene.drawAxis(90);
     pushStyle();
     fill(255);
     noStroke();
     box(60);  
     popStyle();
}
PVector comb(float t1, PVector v1, float t2, PVector v2) {
     PVector res=PVector.add(PVector.mult(v1, t1), PVector.mult(v2, t2));
     return res;
}


