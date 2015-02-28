
import remixlab.proscene.*;
InteractiveFrame mobile;
ArrayList table0, table, table1;
float tempo;
Scene scene;
float r=800;
float h=100;
void setup() {
     size(850, 850, P3D);
     scene=new Scene(this);
     scene.setGridIsDrawn(false);
     scene.setAxisIsDrawn(false);
     mobile=new InteractiveFrame(scene);
     table=new ArrayList();
     table0=new ArrayList();
     table1=new ArrayList();    
     scene.camera().setPosition(new PVector(0, 0, 4500)); 
     frameRate(20);
}

void draw() {  
     tempo=millis()/1000.0;
     background(55.0f*abs(cos(tempo/20.0)), 75.0f*abs(cos(tempo/20.0f)), 70);
     rotateY(tempo/20);
     shininess(15.0);  
     lightSpecular(150, 0, 50); 
     directionalLight(250, 0, 0, -1, 0, 0);
     directionalLight(0, 0, 250, -1+cos(tempo/10), -1, 0);
     directionalLight(155, 255, 0, 1-cos(tempo), 1, 0);
     directionalLight(150, 50, 250, 1, sin(tempo/40)/5, 0);
     shininess(100.0);
     specular(055, 055, 250); 
     stroke(255);
     remplirTables0();
     trace();
}


void trace() {
     fill(150);
     noStroke();
     beginShape(QUAD_STRIP);
     for (int i=0;i<table.size();i++) {
          PVector u=(PVector)table0.get(i);   
          PVector v=(PVector)table.get(i);  
          vertex(u.x, u.y, u.z);
          vertex(v.x, v.y, v.z);
     }
     endShape();
     beginShape(QUAD_STRIP);
     for (int i=0;i<table.size();i++) {
          PVector u=(PVector)table.get(i);   
          PVector v=(PVector)table1.get(i);  
          vertex(u.x, u.y, u.z);
          vertex(v.x, v.y, v.z);
     }
     endShape();
}



void remplirTables() {
     for (float i=0;i<=TWO_PI;i+=0.02) {
          table0.add(pos(i));
          mobile.setPosition(pos(i));
          mobile.setXAxis(vit(i));
          mobile.setYAxis(accel(i));
          pushMatrix();
          mobile.applyTransformation();
          table.add(comb(1, pos(i), 1, mobile.transformOf(new PVector(1400, 300*cos(tempo), 300*sin(tempo)))));
          popMatrix();
     }
}
void remplirTables0() {
     table.clear();
     table0.clear();
     for (float i=0;i<=TWO_PI;i+=0.02) {

          mobile.setPosition(pos(i));
          mobile.setXAxis(vit(i));
          mobile.setYAxis(accel(i));
          pushMatrix();
          mobile.applyTransformation();
          table0.add(comb(1, pos(i), 1, mobile.transformOf(new PVector(1700, 300*cos(tempo), 300*sin(tempo)))));
          table.add(comb(1, pos(i), 1, mobile.transformOf(new PVector(-1700, -300*cos(tempo), -300*sin(tempo)))));
          table1.add(comb(1, pos(i), 1, mobile.transformOf(new PVector(300*cos(tempo), 300*sin(tempo), 1700))));
          popMatrix();
     }
}






PVector pos(float t) {
     return new PVector(r*cos(t), r*sin(t), h*sin(4*t));
}
PVector vit(float t) {
     PVector res=new PVector(-r*sin(t), r*cos(t), h*cos(4*t)*4);
     res.normalize();
     return res;
}
PVector accel(float t) {
     PVector res= new PVector(-r*cos(t), -r*sin(t), -h*sin(4*t)*16);
     res.normalize();
     return res;
}
PVector nor(float t) {
     PVector res=vit(t).cross(accel(t));
     res.normalize();
     return res;
}
PVector comb(float t1, PVector v1, float t2, PVector v2) {
     PVector res=PVector.add(PVector.mult(v1, t1), PVector.mult(v2, t2));
     return res;
}


