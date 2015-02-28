
import ddf.minim.*;
Minim minim;
AudioInput in;

import processing.opengl.*;
import codeanticode.glgraphics.*;

GLModel model;
GLTexture tex;
float[] coords;
float[] colors;

int numPoints = 100;

void setup() {
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, numPoints);
  
  
  size(640, 480, GLConstants.GLGRAPHICS);  
    
  model = new GLModel(this, numPoints, GLModel.POINT_SPRITES, GLModel.DYNAMIC);
  model.initColors();
  tex = new GLTexture(this, "particle.png");    
    
  coords = new float[4 * numPoints];
  colors = new float[4 * numPoints];
    
  for (int i = 0; i < numPoints; i++) {
    for (int j = 0; j < 3; j++) coords[4 * i + j] = 50.0 * random(-1, 1);
    coords[4 * i + 3] = 0.4; 
    
    for (int j = 0; j < 3; j++) colors[4 * i + j] = random(0,1);
    colors[4 * i + 3] = 9.0;
  }

  model.updateVertices(coords);
  model.updateColors(colors);

   float pmax = model.getMaxPointSize();
   println("Maximum sprite size supported by the video card: " + pmax + " pixels.");   
   model.initTextures(1);
   model.setTexture(0, tex);  
   model.setMaxSpriteSize(3.0 * pmax);
   model.setSpriteSize(200, 100);
   model.setBlendMode(BLEND);
}

void draw() {    
  GLGraphics renderer = (GLGraphics)g;
  renderer.beginGL();  
    
  background(0);
        
  for (int i = 0; i < numPoints; i++) {    
    for (int j = 0; j < 3; j++) {
      coords[4 * i + j] += random(-0.5, 0.5);
    }
  }
    
  model.updateVertices(coords);
  
    
  translate(width/2, height/2, 0);        
  rotateX(frameCount * in.left.get(1)/500);  
  rotateY(frameCount * in.right.get(0)/500);
  scale(2+frameCount * in.right.get(0)/500);
  println(in.left.get(1));   
  println(in.right.get(0));
    
   renderer.setDepthMask(false);
  model.render();
  renderer.setDepthMask(false);
    
  renderer.endGL();
}


