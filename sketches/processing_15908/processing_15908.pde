
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

import processing.opengl.*;
import javax.media.opengl.*  ;

import processing.video.*;

import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.volume.*;

//simulation size
int w=150;
int h=100;

GL gl;

MovieMaker mm;

//our chemical concentrations
float gridU[][] = new float[w][h];
float gridV[][] = new float[w][h];
//a temporary grid to hold values
float gridNext[][] = new float[w][h];
//how fast the reaction progresses
//you can use this to change the scale (larger = more detailed
float reactionRate = .5;

//All these different ways of storing the diffusion rates are redundant
//only one at a time is necessary
//diffusion rate for chemical U
float diffusionRateU = .04;
//separate diffusion rates for the x and y direction for chemical U
float diffusionRateUX = diffusionRateU;
float diffusionRateUY = diffusionRateU;
//an array to hold a variable Y diffusion rate that changes through space
float diffRateUYarr[][] = new float[w][h];
//an array to hold fully general anisotropic diffusion that varies in direction and rate
float diffRateAnisoU[][][] = new float[w][h][3];
//diffusion rate for V
float diffusionRateV = .01;

//controls the speed of the simulation
//higher is faster but can cause error
float deltaT = 1.0;
//the grid space
//changes how fast diffusion occurs. smaller = larger scale pattern
float deltaXSq = .6*.6;

//reaction parameters
float F = .04;
float k = .06;
//reaction parameters changing through space, which override the previous parameters
float[][] Farr = new float[w][h];
float[][] karr = new float[w][h];

//make a movie
boolean movieOn = false;

float minU, maxU;

//Toxi's volume stuff
VolumetricSpace volume;
IsoSurface surface;
TriangleMesh mesh = new TriangleMesh("meshy");
float threshold = .4;
//number of time steps in our 3D volume
int timeDepth = 100;
int stepsPerLevel = 3;

//toggle for 2d vs 3d view
boolean drawIn2D = true;

//our camera, works automatically after initializing
PeasyCam cam;

void setup() {
  size(500,500,OPENGL);
  cam = new PeasyCam(this, w/2,h/2,timeDepth/2,300);

  gl = ((PGraphicsOpenGL) this.g).beginGL();
  if(movieOn) mm = new MovieMaker(this,width,height,"reaction.mov",30, MovieMaker.H263, MovieMaker.HIGH);
  
  //initialize the chemicals, be creative
  for(int i=0;i<w;++i) {
    for(int j=0;j<h;++j) {
      gridU[i][j] = .5 + random(-.01,.01);
      gridV[i][j] = .25 + random(-.01,.01);
    }
  }
  for(int i=w/2-10-20;i<w/2+10-20;++i) {
    for(int j=h/2-10;j<h/2+10;++j) {
      gridU[i][j] = 1.0 + random(-.01,.01);
      gridV[i][j] = 0 + random(-.01,.01);
    }
  }
  for(int i=w/2-10+20;i<w/2+10+20;++i) {
    for(int j=h/2-10;j<h/2+10;++j) {
      gridU[i][j] = 1.0 + random(-.01,.01);
      gridV[i][j] = 0 + random(-.01,.01);
    }
  }


  //initialize volume and surface for volutils
  setupVolume();

  glSetup();

  //setup arrays for various parameters
  setupF();

  setupK();
  //setupDiffRates();
  setupAnisoDiffusionU();
}

void draw() {
  //simulation step
  //you can run ten steps without slowing down
  for(int i=0;i<10;++i) {
    diffusionU();
    diffusionV();
    reaction();
  }
  
  if(drawIn2D) {
    draw2D();
  } else {
    draw3D();
  }
  
  //add time step to volume
  if(frameCount%stepsPerLevel == 0 && frameCount/stepsPerLevel < timeDepth) {
    for(int i=0;i<w;++i) {
      for(int j=0;j<h;++j) {
        //only do this if below timeDepth
        volume.setVoxelAt(i,j,frameCount/stepsPerLevel,gridU[i][j]);
      }
    }
  }
  
  if(frameCount%stepsPerLevel == 0 && frameCount/stepsPerLevel == timeDepth) {
    saveSurface();
    if(movieOn) mm.finish();
  }
  if(movieOn) mm.addFrame();
}

//draw 2d reaction
void draw2D() {
  camera();
  loadPixels();
  for(int i=0;i<w;++i) {
    for(int j=0;j<h;++j) {
      pixels[j*width+i] = color((gridU[i][j]-minU)/(maxU-minU)*255);
    }
  }
  updatePixels();
}

//draw 3d extruded shape
void draw3D() {
  glStart();
  glSetLights();
  glSetMaterials();
  
  //creates mesh from the volume data
  buildSurface();
  
  //number of triangle
  int num=mesh.getNumFaces();
  Vertex v1, v2, v3;
  gl.glBegin(GL.GL_TRIANGLES);
  for(int i=0; i<num; i++) {
    //loop through all faces
    Face f = mesh.faces.get(i);
    //get triangle vertices
    v1 = f.a;
    v2 = f.b;
    v3 = f.c;
    //call normal direction and vertex position
    gl.glNormal3f(-v1.normal.x,-v1.normal.y,-v1.normal.z);
    gl.glVertex3f(v1.x,v1.y,v1.z);

    gl.glNormal3f(-v2.normal.x,-v2.normal.y,-v2.normal.z);
    gl.glVertex3f(v2.x,v2.y,v2.z);

    gl.glNormal3f(-v3.normal.x,-v3.normal.y,-v3.normal.z);
    gl.glVertex3f(v3.x,v3.y,v3.z);
  }
  gl.glEnd();
  ((PGraphicsOpenGL) g).endGL();
}

//diffusion for chemical U
//currently uses the general anisotropic diffusion (stored in diffRateAnisoU)
void diffusionU() {
  float[] anisotropic;
  for(int i=0;i<w;++i) {
    for(int j=0;j<h;++j) {
      anisotropic = diffRateAnisoU[i][j];
      gridNext[i][j] = gridU[i][j]+deltaT/deltaXSq*(
      anisotropic[0]*(gridU[(i-1+w)%w][j]+gridU[(i+1)%w][j])+ //X direction
      anisotropic[2]*(gridU[i][(j-1+h)%h]+gridU[i][(j+1)%h])+ //Y direction
      anisotropic[1]*(gridU[(i+1)%w][(j-1+h)%h]+gridU[(i-1+w)%w][(j+1)%h] //diagonals
      -gridU[(i-1+w)%w][(j-1+h)%h]-gridU[(i+1)%w][(j+1)%h])- //diagonals
      2*gridU[i][j]*(anisotropic[0]+anisotropic[2]));
    }
  }
  float temp[][] = gridU;
  gridU = gridNext;
  gridNext = temp;
}

//diffusion for chemical V
//uses a constant rate diffusionRateV
void diffusionV() {
  for(int i=0;i<w;++i) {
    for(int j=0;j<h;++j) {

      gridNext[i][j] = gridV[i][j]+diffusionRateV*deltaT/deltaXSq*
        (gridV[(i-1+w)%w][j]
        +gridV[(i+1)%w][j]
        +gridV[i][(j-1+h)%h]
        +gridV[i][(j+1)%h]
        -4*gridV[i][j]
        );
    }
  }
  float temp[][] = gridV;
  gridV = gridNext;
  gridNext = temp;
}

//our reaction step
void reaction() {
  minU = 999;
  maxU = -999;
  for(int i=0;i<w;++i) {
    for(int j=0;j<h;++j) {
      float  uVal = gridU[i][j];
      gridU[i][j] = gridU[i][j] + deltaT*(reactionU(gridU[i][j],gridV[i][j], Farr[i][j], karr[i][j]));
      gridV[i][j] = gridV[i][j] + deltaT*(reactionV(uVal,gridV[i][j], Farr[i][j], karr[i][j]));
      if(gridU[i][j] > maxU) maxU = gridU[i][j];
      if(gridU[i][j] < minU) minU = gridU[i][j];
    }
  }
}

//Grey-Scott
float reactionU(float aVal, float bVal, float FVal, float kVal) {
  return reactionRate*(-aVal*bVal*bVal+F*(1-aVal));
}

float reactionV(float aVal, float bVal, float FVal, float kVal) {
  return reactionRate*(aVal*bVal*bVal-(F+k)*bVal);
}

//setup parameters varying in space
void setupF() {
  for(int i=0;i<w;++i) {
    for(int j=0;j<h;++j) {
      Farr[i][j] = 10;
    }
  }
}

void setupK() {
  for(int i=0;i<w;++i) {
    for(int j=0;j<h;++j) {
      karr[i][j] = -.05;
    }
  }
}

//not being used
void setupDiffRates() {
  for(int i=0;i<w;++i) {
    for(int j=0;j<h;++j) {
      diffRateUYarr[i][j] = diffusionRateUY;
    }
  }
}

//changing diffusion through space
void setupAnisoDiffusionU() {
  for(int i=0;i<w;++i) {
    for(int j=0;j<h;++j) {
      //angle changes from left to right.
      float angle = PI*i/w;
      float diffusionRate1 = diffusionRateU;
      float diffusionRate2 = diffusionRateU;
      diffRateAnisoU[i][j] = anisotropy(angle,diffusionRate1,diffusionRate2);
    }
  }
}

float[] anisotropy(float angle, float r1, float r2) {
  float cosA = cos(angle);
  float sinA = sin(angle);
  float out[] = new float[3];
  out[0] = r1*cosA*cosA+r2*sinA*sinA;
  out[1] = (r2-r1)*cosA*sinA;
  out[2] =  r2*cosA*cosA+r1*sinA*sinA;
  return out;
}

void setArrayByImage(PImage im, float[][] arr, float minVal, float maxVal) {
  for(int i=0;i<w;++i) {
    for(int j=0;j<h;++j) {
      arr[i][j] = brightness(im.pixels[j*w+i])/255.0*(maxVal-minVal)+minVal;
    }
  }
}

//standard toxiclibs volume setup
void setupVolume() {
  volume = new VolumetricSpaceArray(new Vec3D(w,h,timeDepth),w,h,timeDepth);
  surface = new ArrayIsoSurface(volume);
}

//save our mesh surface to STL
void saveSurface() {
  surface.reset();
  surface.computeSurfaceMesh(mesh,threshold);
  mesh.saveAsSTL(sketchPath("reaction_"+day()+"_"+hour()+"_"+minute()+".stl"));
}

//build the mesh and compute the normals
void buildSurface() {
  surface.reset();
  //create mesh
  surface.computeSurfaceMesh(mesh,threshold);
  //compute normals
  mesh.computeFaceNormals();
  mesh.computeVertexNormals();
}

void keyPressed() {
  if(key == 'f' && movieOn) {
    mm.finish();
  } 
  else if(key == 's') {
    saveSurface();
    mm.finish();
  } else if(key == '3') {
    drawIn2D = !drawIn2D;
    if(!drawIn2D) {
      buildSurface();
    }
  }
}


