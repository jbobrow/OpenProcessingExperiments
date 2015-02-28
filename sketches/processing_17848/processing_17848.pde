
/*  
Cube fractal by Dr. Goulu (www.drgoulu.com)

uses camera lib PEasycam from Jonathan Feinberg
(http://mrfeinberg.com/peasycam/)

cube rendering from "CrystalCubes" by Stinging Eyes, 2008 
(http://www.openprocessing.org/visuals/?visualID=1440 )
looks better under OpenGL (enable OPENGL comments)
  
*/
 
import processing.opengl.*;
import peasy.*;

PeasyCam cam;
 
void setup() {
  size(600,600,P3D);
  // size(600,600,OPENGL);
  // hint(ENABLE_OPENGL_2X_SMOOTH);
  stroke(102,51,204);
  
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}

void Fractal(float x,float y,float z,float s, float f, int l){
  translate(x,y,z);
  box(s);
  l--;
  if (l>0) {
    float ox=-s/2;
    float oy=-s/2;
    float oz=-s/2;
    pushMatrix(); Fractal(ox,oy,oz,s*f,f,l); popMatrix();
     pushMatrix(); Fractal(ox+s,oy,oz,s*f,f,l); popMatrix();
     pushMatrix(); Fractal(ox,oy+s,oz,s*f,f,l); popMatrix();
     pushMatrix(); Fractal(ox+s,oy+s,oz,s*f,f,l); popMatrix();
     pushMatrix(); Fractal(ox,oy,oz+s,s*f,f,l); popMatrix();
     pushMatrix(); Fractal(ox+s,oy,oz+s,s*f,f,l); popMatrix();
     pushMatrix(); Fractal(ox,oy+s,oz+s,s*f,f,l); popMatrix();
     pushMatrix(); Fractal(ox+s,oy+s,oz+s,s*f,f,l); popMatrix();
  }
}
 
void draw() {
  background(0);
  shininess(5.0);
  lightSpecular(200,200,200);
  directionalLight(153,153,255,-1,0,0);
  pointLight(50,50,200,65,60,100);
  ambientLight(102,51,204);
  specular(255,255,255);
  Fractal(0,0,0,40,0.4,5);
}


