
import toxi.geom.*;
import controlP5.*;

ControlP5 controlP5;
ArrayList points=new ArrayList();

    float r=200;
    float angle=PI;
    
    float s1,s2;
    
    float m=16;
    float n1=0.5;
    float n2=0.5;
    float n3=16;
    
    float a1=1;
    float a2=1;
    
    float xx,yy,zz;
    float r1,r2;
    
    float step=0.05;

void setup(){
  size(800,800,P3D);
  
   controlP5 = new ControlP5(this);

  controlP5.addSlider("rvalue",0,340,100,20,40,200,10);
  controlP5.addSlider("n1value",0,20,0.5,20,60,200,10);
  controlP5.addSlider("n2value",0,20,0.5,20,80,200,10);
  controlP5.addSlider("n3value",0,20,16,20,100,200,10);
  controlP5.addSlider("mvalue",0,20,16,20,120,200,10);
  controlP5.setAutoDraw(false);
  
  draw_super_formula();
}

void draw(){
  //display the background for the draw option :)
  //background(255); 
  fill(255);
  controlP5.draw();
  
  translate(mouseX,mouseY,0);
  rotateX(mouseY * 0.01f);
  rotateY(mouseX * 0.01f);
  

  
  for(int i = 0; i< points.size();i++){
    Vec3D k = (Vec3D)points.get(i); 
    strokeWeight(3);
    stroke(color(k.x+100,k.y+100,k.z+100));
    point(k.x,k.y,k.z);
    

  }
}

void vertex(Vec3D v) {
  vertex(v.x,v.y,v.z);
}

void draw_super_formula(){
  for(int i = points.size()-1; i>0;i--){
    points.remove(i);
  }
  
  for(float i=-PI;i<PI;i+=step){
    for(float j=-HALF_PI;j<HALF_PI;j+=step){
      s1=pow(abs(1/a1*abs(cos(m*i/4))),n2)+pow(abs(1/a2*abs(sin(m*i/4))),n3);
      r1=pow(abs(s1),(-1/n1));
      s2=pow(abs(1/a1*abs(cos(m*j/4))),n2)+pow(abs(1/a2*abs(sin(m*j/4))),n3);
      r2=pow(abs(s2),(-1/n1));
      
    xx=r1*cos(i)*r2*cos(j)*r;
    yy=r1*sin(i)*r2*cos(j)*r;
    zz=r2*sin(j)*r;
    
    Vec3D test1 = new Vec3D(xx,yy,zz);
      points.add(test1);
    }
  }
}

void rvalue(float new_value){
  r = new_value;
  draw_super_formula();
}
void n1value(float new_value){
  n1 = new_value;
  draw_super_formula();
}
void n2value(float new_value){
  n2 = new_value;
  draw_super_formula();
}
void n3value(float new_value){
  n3 = new_value;
  draw_super_formula();
}
void mvalue(float new_value){
  m = new_value;
  draw_super_formula();
}

void keyPressed(){
  if (keyPressed) {
  if (key == ' ' || key == ' ') {
    background(255);
  }
} 
else {
}
}




