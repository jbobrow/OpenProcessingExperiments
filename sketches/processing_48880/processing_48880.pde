
import remixlab.proscene.*;
InteractiveFrame mobile;
ArrayList table0, table;
float tempo;
Scene scene;
float r=2400;
float h=200;
void setup() {
     size(850, 850, P3D);
     scene=new Scene(this);
     scene.setGridIsDrawn(false);
     scene.setAxisIsDrawn(false);
     mobile=new InteractiveFrame(scene);
      
     table=new ArrayList();
     table0=new ArrayList();
    // table1=new ArrayList();    
     scene.camera().setPosition(new PVector(0, 0, 10000)); 
     frameRate(20);
    
}

void draw() {  
     tempo=millis()/4000.0;// background(40,60,40);
    background(75.0f*abs(cos(tempo/5.0)), 50.0f*abs(cos(tempo/5.0f)),70);
     remplirTables(tempo);
     shininess(15.0);  
     lightSpecular(150, 150, 100+70*cos(tempo)); 
     directionalLight(255, 255, 180, 1, 0, 0);
     directionalLight(155, 150, 120, 1-cos(tempo/10), 1, 0);
     directionalLight(205,205 , 255, -1+cos(tempo), -1, 0);
     directionalLight(150, 150, 55, -1, -sin(tempo/40)/5, 0);
     shininess(100.0);
     specular(150,150,150*(1+cos(tempo*5))); 
     stroke(255);
    rotateZ(tempo/2);
      rotateX(tempo/2);
     trace(); 
     dessineMobile(tempo);
     dessineMobile(tempo+HALF_PI);
     dessineMobile(tempo+PI);
     dessineMobile(tempo+PI+HALF_PI);
      dessineSphere(tempo+PI/4.0);
     dessineSphere(tempo+HALF_PI+PI/4.0);
     dessineSphere(tempo+PI+PI/4.0);
     dessineSphere(tempo+PI+HALF_PI+PI/4.0);
     
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
      PVector u=(PVector)table0.get(0);   
          PVector v=(PVector)table.get(0);
             vertex(u.x, u.y, u.z);
          vertex(v.x, v.y, v.z);
     endShape(CLOSE);
    
}


void dessineSphere(float a) {
          mobile.setPosition(pos(a));
          mobile.setXAxis(vit(a));
          mobile.setYAxis(accel(a));
          pushMatrix();
          mobile.applyTransformation();
          sphere(1200);
           popMatrix();
}



void dessineMobile(float a) {
          mobile.setPosition(pos(a));
          mobile.setXAxis(vit(a));
          mobile.setYAxis(accel(a));
          pushMatrix();
          mobile.applyTransformation();
          sphere(200);
           pushMatrix();
        noStroke();
          pushMatrix();
        rotateZ(tempo*6);
       scene.cone(36,10,1400,500);
      popMatrix();
        rotateX(-PI);
        rotateZ(-tempo*6);
       scene.cone(36,10,1400,500);
        popMatrix();
          popMatrix();
      
}
void remplirTables(float angl) {
     table.clear();
     table0.clear();
     for (float i=0;i<=TWO_PI;i+=TWO_PI/128) {
          table0.add(pos(i));
          mobile.setPosition(pos(i));
          mobile.setXAxis(vit(i));
          mobile.setYAxis(accel(i));
          pushMatrix();
          mobile.applyTransformation();
          table.add(comb(1, pos(i), 1,varier(i,angl))); 
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


PVector normaliser(PVector v,float f){
v.normalize();
return new PVector(f*v.x ,f*v.y ,f*v.z);
}


PVector varier(float i,float angl){
PVector u=normaliser(accel(i),2000);
PVector v=normaliser(nor(i),2000);

return comb(cos(angl),u,sin(angl),v);
}




