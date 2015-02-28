
import processing.opengl.*;

ground new_ground = new ground();

sea new_sea = new sea();

rock[] new_rock;
int how_many_instances = 8;
float t;
float r = 700;
float h = 500;
void setup(){
  size(300,300,P3D);    
  frameRate(30);
  new_rock = new rock[how_many_instances];
  for (int i = 0; i < how_many_instances; ++i) {
    new_rock[i] = new rock();
  }
}
 
void draw(){
  lights();
  smooth();
  background(127,255,212);
  //  background(0);
  background(236,0,140);


  new_ground.run();
  show_rocks();
  new_sea.run();
  camera_define();
}

void show_rocks(){
  for (int i = 0; i < how_many_instances; ++i) {
    new_rock[i].run();
  }  
}

void camera_define(){
  camera(0+(new_ground.h_m_x*new_ground.d)/2 + (r+200)*cos(t),h,(new_ground.h_m_x*new_ground.d+new_ground.d)/2+r*sin(t),(new_ground.h_m_x*new_ground.d)/2,0,(new_ground.h_m_x*new_ground.d+new_ground.d)/2,0,-1,0);
  t = t + 0.005;
}


