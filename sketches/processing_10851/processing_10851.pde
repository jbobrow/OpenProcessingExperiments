
import java.awt.event.*;

int zbuf=0;

color cols[] = {color(255,0,0),
                  color(0,255,0),
                  color(0,0,255),
                  color(255,0,255)};


void setup(){
  size(400,400,P3D);
  background(0);
  
  this.addMouseWheelListener(new MouseWheel());
  
  rectMode(CENTER);
  noStroke();
  //noCursor();
}

void draw(){
  background(0);
  lights();
  translate(width/2, height/2, zbuf-200);
  rotateX(map(mouseY,0,width,0,TWO_PI));
  rotateZ(map(mouseX,0,height,0,TWO_PI));
  
  translate(0,-2000,0);
  
  for(int i=0; i<200; i++){
    pushMatrix();
    rotateY(i/5.0);
    translate(sin(i/5.0)*200,i*20,0);
    fill(cols[i%4]);
    pillar(20,5,5);
    popMatrix();
  }
}

class MouseWheel implements MouseWheelListener{
  void mouseWheelMoved(MouseWheelEvent e){
    zbuf -= e.getWheelRotation();
  }
}

void pillar(float length, float radius1 , float radius2){
  float x,y,z;
  pushMatrix();
  beginShape(TRIANGLE_FAN);
  y = -length / 2;
  vertex(0, y, 0);
  for(int deg = 0; deg <= 360; deg = deg + 10){
    x = cos(radians(deg)) * radius1;
    z = sin(radians(deg)) * radius1;
    vertex(x, y, z);
  }
  endShape();
  
  beginShape(TRIANGLE_FAN);
  y = length / 2;
  vertex(0, y, 0);
  for(int deg = 0; deg <= 360; deg = deg + 10){
    x = cos(radians(deg)) * radius2;
    z = sin(radians(deg)) * radius2;
    vertex(x, y, z);
  }
  endShape();
  
  beginShape(TRIANGLE_STRIP);
  for(int deg =0; deg <= 360; deg = deg + 5){
    x = cos(radians(deg)) * radius1;
    y = -length / 2;
    z = sin(radians(deg)) * radius1;
    vertex(x, y, z);
    x = cos(radians(deg)) * radius2;
    y = length / 2;
    z = sin(radians(deg)) * radius2;
    vertex(x, y, z);
  }
  endShape();
  popMatrix();
}

