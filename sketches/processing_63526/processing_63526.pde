
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
  size(1920, 1080, GLConstants.GLGRAPHICS);
  cam=new PeasyCam(this, 200);
  movers=new ArrayList();
  

  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(490, 35, 50)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(371, 105, 62)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(490, 87, 115)));
  //for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(40, -5, 175)));
  //for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-40, -15, 190)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-200, 13, 31)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-46, 50, -165)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(150, -20, -320)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-172, 15, 100)));
  
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-20,-22, 260)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-31, 50, 127)));
  
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
  
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-40, -15, 190)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(105, -40, 80)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(115, -40, -45)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(108, -17, 150)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-232, 2, -106)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-163, -14, -67)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-52, -30, -115)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(31, -42, 90)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(260, -1, -45)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(40, -5, 165)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(130, -23, -220)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-350, 3, 160)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(48, -10, -120)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(300, 10, 50)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(180, 3, 12)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(230, 7, -237)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-163, -35, -161)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(362, 30, -30)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(53, 0, -250)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(348, 73, -250)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(365, 27, -415)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(200, 16, 330)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(200, 80, 307)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-315, 7, 294)));
  //for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-315, 65, 295)));
  for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(525, 2, 151)));
  
  //ref
 //for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(-317, 385, 295)));
 //for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(540, 385, -20)));
 // for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(540, 385, -285)));
  
 
 
 
  //for (int i=0;i<amount;i++)movers.add(new Mover(new Vec3D(random(-30,30),random(-30,30),random(-30,30))));
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
  reference();
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


