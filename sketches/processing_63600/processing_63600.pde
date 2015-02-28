
import toxi.volume.*;
import codeanticode.glgraphics.*;

import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

import toxi.geom.*;
import toxi.geom.mesh.*;

import javax.media.opengl.*;
import processing.dxf.*;
boolean record = false;


ArrayList movers;

PeasyCam cam;

int amount=5;
boolean update=true;
boolean showVolume=false;
GLModel surf;

//float VB=4;

void setup() {
  size(900, 700, P3D);
  //GLConstants.GLGRAPHICS
  cam=new PeasyCam(this, 200);
  movers=new ArrayList();
  

 
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-130, 32, -100)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-110, 3, 150)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(125, 60, 95)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(65, 6, 57)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(58, 73, 56)));
  
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(270, 70, 6)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-25, -36, 109)));
  
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(326, 12, 253)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(550, -20, -127)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(260, 85, -210)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(250, -85, -90)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(110, 35, -535)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(265, 3, -135)));
  
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-113, -37, -80)));
   for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(63, -50, -10)));
  
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-108, -40, 1)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-25, -35, -35)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(233, 48, 75)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(400, 35, 105)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-150, 35, -235)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-20, 15, 42)));
  
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-100, -3, 70)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-215, 16, -201)));
  

  stroke(0);
  noFill();
  initVolume();
  //updateGL();
}

void draw() {
  background(100);
stroke(1);
   if (record == true) {
    beginRaw(DXF, "output.dxf"); // Start recording to the file
  }
  
  for (int i=0;i<movers.size();i++) {
    Mover m=(Mover)movers.get(i);
    if (update)m.update();
    m.display();
  }
  
   if (record == true) {
    endRaw();
    record = false; // Stop recording to the file

}
lights();
  if (showVolume)renderGL();
  //reference();
}

void reverseVoxels() {
  for (int posX=0;posX<+700;posX++) {
    for (int posY=0;posY<200;posY++) {
      for (int  posZ=0; posZ<700; posZ++) {
        volume.setVoxelAt((int)posX, (int)posY, (int)posZ, 1-volume.getVoxelAt((int)posX, (int)posY, (int)posZ));
      }
    }
  } 
  volume.closeSides();
  surface.computeSurfaceMesh(mesh, 0.1);
  updateGL();
}

void keyPressed() {
  if (key=='u')update=!update;  
  if (key==' ') {
    initVolume();
    updateVolume();
    updateGL();
    showVolume=true;
  }
    if (key=='l'){
    new LaplacianSmooth().filter(mesh, 1);//part of "toxi.geom.mesh.*" - smooth the mesh when "l" is pressed
    updateGL();
  }
  if (key=='s')mesh.saveAsSTL(sketchPath("shape"+frameCount+".stl"));//save the mesh as stl into the sketch folder
  if (key=='r')reverseVoxels();
  
    if (key == 'm' || key == 'M') { // Press R to save the file
    record = true;
  }
}


