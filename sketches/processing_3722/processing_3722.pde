
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;
PImage[] surface = new PImage[7];
boolean lightsOn = false;
float d=127,f=0;
void setup()
{
  size(800, 600, P3D);
  smooth();
  cam = new PeasyCam(this, 12);
  cam.setMinimumDistance(10);
  cam.setMaximumDistance(50);
  strokeWeight(0.1f);
  for(int i = 0; i < surface.length; i++ )
  {
   surface[i] = loadImage("0"+(i+1)+".jpg");
  }
}

void draw()
{
  background(#ffffff);
  float e = cos(PI*(f+=1)/d);
  float em = map(e, -1, 1, -PI, PI);
  if(lightsOn) directionalLight(255, 255, 126, 1, 1, 0);
  
  textureMode(NORMALIZED);
  rotateX(-PI/12); 
  rotateY(e); 
  texturedCube();
  pane();
}

void texturedCube() { 
  beginShape(QUADS); 
    // +Z "front" face 
    texture(surface[0]);
    //vertex(x, y, z, u, v);
    vertex(-1, -1,  1, 0, 0); 
    vertex( 1, -1,  1, 1, 0); 
    vertex( 1,  1,  1, 1, 1); 
    vertex(-1,  1,  1, 0, 1); 
  endShape(); 
   
  beginShape(QUADS); 
    // -Z "back" face 
    texture(surface[1]);    
    vertex( 1, -1, -1, 0, 0); 
    vertex(-1, -1, -1, 1, 0); 
    vertex(-1,  1, -1, 1, 1); 
    vertex( 1,  1, -1, 0, 1); 
  endShape(); 
   
  beginShape(QUADS); 
    // +Y "bottom" face 
    texture(surface[2]);
    vertex(-1,  1,  1, 0, 0); 
    vertex( 1,  1,  1, 1, 0); 
    vertex( 1,  1, -1, 1, 1); 
    vertex(-1,  1, -1, 0, 1); 
  endShape(); 
   
  beginShape(QUADS); 
    // -Y "top" face 
    texture(surface[3]);
    vertex(-1, -1, -1, 0, 0); 
    vertex( 1, -1, -1, 1, 0); 
    vertex( 1, -1,  1, 1, 1); 
    vertex(-1, -1,  1, 0, 1); 
  endShape(); 
   
  beginShape(QUADS); 
    // +X "right" face 
    texture(surface[4]);
    vertex( 1, -1,  1, 0, 0); 
    vertex( 1, -1, -1, 1, 0); 
    vertex( 1,  1, -1, 1, 1); 
    vertex( 1,  1,  1, 0, 1); 
  endShape(); 
   
  beginShape(QUADS); 
    // -X "left" face 
    texture(surface[5]);
    vertex(-1, -1, -1, 0, 0); 
    vertex(-1, -1,  1, 1, 0); 
    vertex(-1,  1,  1, 1, 1); 
    vertex(-1,  1, -1, 0, 1); 
  endShape(); 
}

void pane()
{
  beginShape(QUADS);
  texture(surface[6]);
  vertex(-2,  1.01,  2, 0, 0); 
  vertex( 2,  1.01,  2, 1, 0); 
  vertex( 2,  1.01, -2, 1, 1); 
  vertex(-2,  1.01, -2, 0, 1); 
  endShape();
}

void keyPressed() {
  if (key=='l') {
    if(!lightsOn) lightsOn = true;
    else if(lightsOn) lightsOn = false;
    }
}


