
import ddf.minim.*;

Minim minim;
AudioInput in;

import msafluid.*;


import processing.opengl.*;
import javax.media.opengl.*;

final float FLUID_WIDTH = 120;

float invWidth, invHeight;    // inverse of screen dimensions
float aspectRatio, aspectRatio2;

MSAFluidSolver2D fluidSolver;

ParticleSystem particleSystem;

PImage imgFluid;

boolean drawFluid = true;

void setup() {

  minim = new Minim(this);
  minim.debugOn();

  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 512);

  size(960, 640, OPENGL);    // use OPENGL rendering for bilinear filtering on texture
  //    size(screen.width * 49/50, screen.height * 49/50, OPENGL);
  hint( ENABLE_OPENGL_4X_SMOOTH );    // Turn on 4X antialiasing

  invWidth = 1.0f/width;
  invHeight = 1.0f/height;
  aspectRatio = width * invHeight;
  aspectRatio2 = aspectRatio * aspectRatio;

  // create fluid and set options
  fluidSolver = new MSAFluidSolver2D((int)(FLUID_WIDTH), (int)(FLUID_WIDTH * height/width));
  fluidSolver.enableRGB(true).setFadeSpeed(0.003).setDeltaT(0.5).setVisc(0.0001);

  // create image to hold fluid picture
  imgFluid = createImage(fluidSolver.getWidth(), fluidSolver.getHeight(), RGB);

  // create particle system
  particleSystem = new ParticleSystem();

  // init TUIO
  initTUIO();

  minim = new Minim(this);
  minim.debugOn();
}


/*void mouseMoved() {
 float mouseNormX = mouseX * invWidth;
 float mouseNormY = mouseY * invHeight;
 float mouseVelX = (mouseX - pmouseX) * invWidth;
 float mouseVelY = (mouseY - pmouseY) * invHeight;
 
 addForce(mouseNormX, mouseNormY, mouseVelX, mouseVelY);
 }*/

void draw() {



  //  addForce(mouseNormX, mouseNormY, mouseVelX, mouseVelY);

  int valNormX= 5;
  int valNormY= 1;
  float valVel= 0.05;
  for (int i = 1; i < in.bufferSize() - 1; i++)
  {
    float mouseNormX = 1+in.left.get(i)*valNormX ;
    float mouseNormY = 1+in.right.get(i)*valNormY ;
    //float mouseNormX = mouseX * invWidth;
    //float mouseNormY = mouseY * invHeight;
    float mouseVelX = (1+in.left.get(i)*valVel - 1+in.left.get(i-1)*valVel) ;
    float mouseVelY = (1+in.right.get(i)*valVel - 1+in.right.get(i-1)*valVel) ;
    println(in.left.get(i));
    //line(i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50);
    //line(i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50);
    addForce(mouseNormX, mouseNormY, mouseVelX, mouseVelY);
  }

  updateTUIO();
  fluidSolver.update();

  if (drawFluid) {
    for (int i=0; i<fluidSolver.getNumCells(); i++) {
      int d = 2;
      imgFluid.pixels[i] = color(fluidSolver.r[i] * d, fluidSolver.g[i] * d, fluidSolver.b[i] * d);
    }  
    imgFluid.updatePixels();//  fastblur(imgFluid, 2);
    image(imgFluid, 0, 0, width, height);
  } 

  particleSystem.updateAndDraw();
}

void mousePressed() {
  drawFluid ^= true;
}

void keyPressed() {
  switch(key) {
  case 'r': 
    renderUsingVA ^= true; 
    println("renderUsingVA: " + renderUsingVA);
    break;
  }
  println(frameRate);
}



// add force and dye to fluid, and create particles
void addForce(float x, float y, float dx, float dy) {
  float speed = dx * dx  + dy * dy * aspectRatio2;    // balance the x and y components of speed with the screen aspect ratio

  if (speed > 0) {
    if (x<0) x = 0; 
    else if (x>1) x = 1;
    if (y<0) y = 0; 
    else if (y>1) y = 1;

    float colorMult = 5;
    float velocityMult = 30.0f;

    int index = fluidSolver.getIndexForNormalizedPosition(x, y);

    color drawColor;

    colorMode(HSB, 360, 1, 1);
    float hue = ((x + y) * 180 + frameCount) % 360;
    drawColor = color(hue, 1, 1);
    colorMode(RGB, 1);  

    fluidSolver.rOld[index]  += red(drawColor) * colorMult;
    fluidSolver.gOld[index]  += green(drawColor) * colorMult;
    fluidSolver.bOld[index]  += blue(drawColor) * colorMult;

    particleSystem.addParticles(x * width, y * height, 10);
    fluidSolver.uOld[index] += dx * velocityMult;
    fluidSolver.vOld[index] += dy * velocityMult;
  }
}

void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();

  super.stop();
}


