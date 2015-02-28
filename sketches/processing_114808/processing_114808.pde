
// the sierpinskinator by jas@asspa.in no rights reserved whatsoever.

// space bar to get a new random higher-dimensional sierpinski volume
// c to toggle per-frame clearing
// drag/scroll to move the camera
// requires PeasyCam library from http://mrfeinberg.com/peasycam/


import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;


int[] vertex_x;
int[] vertex_y;
int[] vertex_z;

boolean clearFlag = true;

PeasyCam cam;

int vertices;

int p_x;
int p_y;
int p_z;

color c;
color d;
int r;

void resetParameters() {
  vertices = 3 + int(random(8));
  println("Plotting with "+vertices+" vertices.");
  
  vertex_x = new int[vertices];
  vertex_y = new int[vertices];
  vertex_z = new int[vertices];
  
 for (int i=0; i<vertices; i++) {
  
  vertex_x[i] = int(random(width));
  vertex_y[i] = int(random(height));
  vertex_z[i] = int(random(width));
 }
  
  p_x = width/2;
  p_y = height/2;
  p_z = width/2;
 
}

void keyPressed() {
 if (key == ' ')
    resetParameters(); 
 if (key == 'c')
   clearFlag = !clearFlag;
}

void setup() {
  size(800,800, P3D);
  colorMode(HSB, 255);
  background(0);
  stroke(255);
  noSmooth();
  
  cam = new PeasyCam(this, 1000);
  cam.setMinimumDistance(-5000);
  cam.setMaximumDistance(5000);
  resetParameters();
  
}

void draw() {
 if (clearFlag)
    background(0);
 for (int i=0; i<30000; i++) {
 r = int(random(vertices));
 
 p_x = (p_x + vertex_x[r]) / 2;
 p_y = (p_y + vertex_y[r]) / 2;
 p_z = (p_z + vertex_z[r]) / 2; 
 
 //c = get(p_x, p_y);
 d = color(map(p_x, 0, width, 0, 255), map(p_y, 0, height, 50, 255), map(p_z, 0, width, 50, 255));
 stroke(d);
 
 point(p_x, p_y, p_z);
 }
}
