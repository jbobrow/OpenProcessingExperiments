

//==========================================================
// sketch: PG_AlgebraicSurfaceViewer.pde - by Gerd Platl
//
// Surface Viewer using GLGraphics and Toxiclibs libraries.
//
// tested with:
//  processing v1.5.1:  http://processing.org/download/
//  GLGraphics v1.0.0:  http://glgraphics.sourceforge.net/
//  ToxicLibs v0020:    http://toxiclibs.org/
//                      https://bitbucket.org/postspectacular/toxiclibs/src
//
// v1.0  2011-12-15  inital release
// v1.1  2012-01-04  more surfaces
// v1.2  2012-02-10  more surfaces
// v1.3  2012-03-31  advanced color handling
//                   added mouse wheel handling
//
// note: because of using OpenGL it works only offline!
//
// See overview picture about surfaces realized in version 1.3... 
// http://farm8.staticflickr.com/7064/6885477688_a34ddaa46e_b_d.jpg
//==========================================================
/*
mouse input:
 left mouse button   rotate  
 right mouse button  rotation on/off 
       mouse wheel   zoom in/out
key commands:
 0 .. 99  select surface
 cursor left/right  scrolling speed
 cursor up/down     turn up/down
 F1 toggle help & frames per second
 F3,F4 +/-  zoom in/out
 blanc     show next surface
 backspace show previous surface
 b  random background color
 c  random material & light colors
 m  random material color
 l  random light 1 colors
 L  random light 2 colors
 e  toggle closed sides
 o  toggle rotate
 r  reset camera
 s  save picture file as Surface_<surfaceName>.png
 t  save surface mesh as binary STL file <surfaceName>.stl
 w  white material color
 
*/

import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.volume.*;
import codeanticode.glgraphics.*;
import processing.opengl.*;
import javax.media.opengl.*;   // import for renderer
import java.awt.event.*;        // import for mouse wheel event handling 

int displayMode = 0;
int numberInputTimeout = 800;   // milliSeconds
float shininess = 32;
boolean doRotate = true;
boolean closeSides = true;
boolean showHelp = false;
color bgColor = (128);

int dimX = 100;
int dimY = 100;
int dimZ = 100;

Vec3D volumeScale = new Vec3D(1, 1, 1).scaleSelf(320);

TriangleMesh mesh;

GLModel surfaceMesh;  // used to store mesh on GPU
int numV = 0;

//-----------------------------------
void setup()
{
  size(600, 600, GLConstants.GLGRAPHICS);
  background(bgColor);
  randomMaterialColors();
  surface = new PSurface(initSurface);
  frame.addMouseWheelListener(new MouseWheelInput());   // add mouse wheel listener
}
//-----------------------------------
void draw()
{
  background(bgColor);
  translate(width/2, height/2, 0);
  rotateX(mouseY*0.01);
  rotateY(mouseX*0.01);

  CheckSelectionInput();
  String msg = surface.index + ": " + surface.name;
  switch (displayMode)
  { case 0:                       // display calculating...
      println ("fc="+frameCount+ "  " +surface.name);
      msg += "         calculating...";
      displayMode++;
      HandleCamera();
      if (numV > 0) DoRendering();
      break;

    case 1:                       // calculate surface
      CalculateSurface();
      displayMode++;
      text(msg,10,20);
      break;

    case 2:                      // draw surface
      msg += "         " + numV + " vertices";
      HandleCamera();
      DoRendering();
  }
  fill(255);
  textMode(SCREEN);
  text (msg,10,20);
  if (showHelp)
    text("keys: cursor,blanc,bs,+,-,b,c,l,o,e,r,s,t,w,0.."+(surfaces-1)+"    fps=" + round(frameRate), 10, height-20);
}
//-----------------------------------
int selectionTime = 99999999;
int inputNumber = 0;
//-----------------------------------
void CheckSelectionInput()
{
  if (millis() > selectionTime)   // key input timeout?
  {
    println (">>> calculating surface " + inputNumber + ", please wait a moment ...");
    SelectSurface (inputNumber);   // 0..n: select surface function
    inputNumber = 0;
    selectionTime = 999999999;
  }
}
//-----------------------------------
void numberPressed()
{
  selectionTime = millis() + numberInputTimeout;  // end of key input = current time + 1000 msec
  inputNumber = inputNumber * 10 + keyCode-48;
}
//-----------------------------------
void keyPressed()
{
  //  if (debug) println (keyCode + " '" + key + "'    ");
  if      ((key     >=   '0')
        && (key     <=   '9')) numberPressed();     // 0..n: select function
  else if (keyCode ==  LEFT) speedX -= 0.1;         // <- auto scroll to left
  else if (keyCode == RIGHT) speedX += 0.1;         // -> auto scroll to right
  else if (keyCode ==    UP) rotY += 1.5;           // W: scroll up
  else if (keyCode ==  DOWN) rotY -= 1.5;           // S: scroll down
  else if (keyCode ==     8) ChangeSurface (-1);    // backspace
  else if (keyCode ==    32) ChangeSurface (+1);    // blanc
  else if ((keyCode ==   114)
        || (key     ==   '+')) zoomCamera (0.99);   // F3, +  zoom in
  else if ((keyCode ==   115)
        || (key     ==   '-')) zoomCamera (1.01);   // F4, -  zoom out
  else if (keyCode ==   112) showHelp = !showHelp;  // F1
  else if (key == 'b') randomBackground();
  else if (key == 'c') randomColors();
  else if (key == 'm') randomMaterialColors();
  else if (key == 'l') randomLight1Colors();
  else if (key == 'L') randomLight2Colors();
  else if (key == 'o') doRotate = !doRotate;
  else if (key == 'e') { closeSides = !closeSides;   displayMode = 0; }
  else if (key == 'r') ResetCamera();
  else if (key == 's') save("Surface_" + surface.name + ".png" );       // save picture file
  else if (key == 't') mesh.saveAsSTL(sketchPath("Surface_" + surface.name+".stl"));   // save mesh as STL file
  else if (key == 'w') whiteColors();
  else if (key == 'x') if (colorM2[3] == 1.0) colorM2[3] = 0.3; else colorM2[3] = 1.0;
  else if (key == 'y') shininess++;
  else if (key == 'z') shininess--;
}

//-----------------------------------
void mousePressed()
{
  if (mouseButton == RIGHT) doRotate = !doRotate;
}

//===================================
//    handle camera
//===================================
float rotX = 0;        // vertical angle
float rotY = 100;      // horizontal angle
float fov = 1.1;       // vertical field-of-view angle (in radians)
float speedX = 0.2;    // rotation speed
//-----------------------------------
void ResetCamera()
{
  rotX = 0;            // vertical angle
  rotY = 100;          // horizontal angle
  fov = 1.1;           // vertical field-of-view angle (in radians)
  speedX = 0.2;        // rotation speed
  doRotate = true;
}
//-----------------------------------
void HandleCamera()
{
  beginCamera();
  if (fov < 0.1) fov = 0.1;
  if (fov > 1.5) fov = 1.5;
  perspective(fov, float(width)/height, 1, 800);

  if (mousePressed)
  {
    if (mouseButton == LEFT)
    {
      rotX -= 0.5 * (mouseX - pmouseX);
      rotY += 0.5 * (mouseY - pmouseY);
    }
  }
  camera (0, rotY, 400, // eyeX, eyeY, eyeZ
          0, 5, 0,      // centerX, centerY, centerZ
          0, -1, 0);    // upX, upY, upZ
  endCamera();
  rotateY (rotX / 100.0);    // left/right
  if (doRotate) rotX += speedX;
}
//-----------------------------------
int zoomFrame = 0;
void zoomCamera(float factor)
{
  fov *= factor;
  if (frameCount != zoomFrame)
    text ("zoom=" + nf(fov,0,2), 340,20);
  zoomFrame = frameCount;
}
//-----------------------------------
// listen for MouseWheelEvent
//-----------------------------------
class MouseWheelInput implements MouseWheelListener
{ void mouseWheelMoved(MouseWheelEvent e) 
  { fov *= 1.0 + 0.01 * e.getWheelRotation(); } 
}


//===================================
//    handle SURFACES
//===================================

PSurface surface;          // handle surface functions

//-----------------------------------
void SelectSurface (int sno)
{
  surface.SelectFunction(sno);
  displayMode = 0;
}
//-----------------------------------
void ChangeSurface (int delta)
{
  surface.SelectFunction(surface.index + delta);
  displayMode = 0;
}
//-----------------------------------
void CalculateSurface()
{
  PVector pos = new PVector ();
  float NS=4.2;

  VolumetricSpace volume = new VolumetricSpaceArray(volumeScale, dimX, dimY, dimZ);

  // fill volume with values
  for (int z=0; z<dimZ; z++)
  {
    pos.z = (z-dimZ/2)*NS;
    for (int y=0; y<dimY; y++)
    {
      pos.y = (y-dimY/2)*NS;
      for (int x=0; x<dimX; x++)
      {
        pos.x = (x-dimX/2)*NS;
        //---------------------------------------------
        volume.setVoxelAt(x, y, z, surface.Value(pos));
        //---------------------------------------------
      }
    }
  }
  if (closeSides) volume.closeSides();
  convertVolumeSpaceToMesh(volume);
}
//-----------------------------------
void convertVolumeSpaceToMesh(VolumetricSpace volume)
{
  float ISO_THRESHOLD = 0.01;

  // store in IsoSurface and compute surface mesh for the given threshold value
  mesh = new TriangleMesh("iso");
  IsoSurface surface = new HashIsoSurface(volume, 0.333333);
  surface.computeSurfaceMesh(mesh, ISO_THRESHOLD);

  // update lighting information
  mesh.computeVertexNormals();
  // get flattened vertex array
  float[] verts = mesh.getMeshAsVertexArray();
  // in the array each vertex has 4 entries (XYZ + 1 spacing)
  numV = verts.length / 4;
  float[] norms=mesh.getVertexNormalsAsArray();

  surfaceMesh = new GLModel(this, numV, TRIANGLES, GLModel.STATIC);
  surfaceMesh.beginUpdateVertices();
  for (int i = 0; i < numV; i++) 
    surfaceMesh.updateVertex(i, verts[4 * i], verts[4 * i + 1], verts[4 * i + 2]);
  surfaceMesh.endUpdateVertices();

  surfaceMesh.initNormals();
  surfaceMesh.beginUpdateNormals();
  for (int i = 0; i < numV; i++) 
    surfaceMesh.updateNormal(i, norms[4 * i], norms[4 * i + 1], norms[4 * i + 2]);
  surfaceMesh.endUpdateNormals();

  // Setting the color of all vertices to white, but not directly used, see comments in the draw() method.
  surfaceMesh.initColors();
  surfaceMesh.beginUpdateColors();
  for (int i = 0; i < numV; i++) 
    surfaceMesh.updateColor(i, 255, 255, 255);
  surfaceMesh.endUpdateColors();

  // Setting model shininess
  println (shininess);
  surfaceMesh.setShininess(shininess);
}

//===================================
//    handle color
//===================================
float alpha = 1.0;  // 0..1 transparency, 1.0 = opaque
float[] colorM1 = new float[] {0.3, 0.3, 0.3, alpha};
float[] colorM2 = new float[] {0.5, 0.8, 0.6, alpha};
float[] colorL0d = new float[] {1.0, 1.0, 1.0, 0.1};
float[] colorL0s = new float[] {1.0, 1.0, 1.0, 0.1};
float[] colorL1d = new float[] {0.9, 0.3, 0.5, 0.1};
float[] colorL1s = new float[] {0.8, 0.8, 0.6, 0.1};
float[] light1pos = new float[] {-100, 600, 2000, 0};
float[] light2pos = new float[] {1000, -600, -2000, 0};
//-----------------------------------
void randomBackground()
{
  bgColor = color(100+random(55), 100+random(55), 100+random(55)); 
}
//-----------------------------------
void randomColor(float[] rColor)
{
  rColor[0] = random(1.0);  // R
  rColor[1] = random(1.0);  // G
  rColor[2] = random(1.0);  // B
//  rColor[3] = random(1.0);  // alpha
  println (nf(rColor[0],0,2) + " " + nf(rColor[1],0,2) + " " + nf(rColor[2],0,2));
}
//-----------------------------------
void whiteColors()
{
  colorM2 = new float[] {1, 1, 1, alpha};
}
//-----------------------------------
void randomMaterialColors()
{
  println ("random material colors");
  randomColor (colorM1);
  randomColor (colorM2);
}
//-----------------------------------
void randomLight1Colors()
{
  println ("random light-1 colors");
  randomColor (colorL0d);
  randomColor (colorL0s);
}
//-----------------------------------
void randomLight2Colors()
{
  println ("random light-2 colors");
  randomColor (colorL1d);
  randomColor (colorL1s);
}
//-----------------------------------
void randomColors()
{
  randomMaterialColors();
  randomLight1Colors();
  randomLight2Colors();
}
//===================================
//    do rendering
//===================================
void DoRendering()
{
  // need to switch to pure OpenGL mode first
  GLGraphics renderer = (GLGraphics)g;
  renderer.beginGL();

  renderer.gl.glEnable(GL.GL_LIGHTING);

  // Disabling color tracking, so the lighting is determined using the colors
  // set only with glMaterialfv()
 // renderer.gl.glDisable(GL.GL_COLOR_MATERIAL);

  // Enabling color tracking for the specular component, this means that the
  // specular component to calculate lighting will obtained from the colors of the model.
  // This tutorial is quite good to clarify issues regarding lighting in OpenGL:
  // http://www.sjbaker.org/steve/omniv/opengl_lighting.html
  renderer.gl.glEnable(GL.GL_COLOR_MATERIAL);
//  renderer.gl.glColorMaterial(GL.GL_FRONT_AND_BACK, GL.GL_SPECULAR);
  renderer.gl.glMaterialfv(GL.GL_FRONT_AND_BACK, GL.GL_AMBIENT, colorM1, 0);
  renderer.gl.glMaterialfv(GL.GL_FRONT_AND_BACK, GL.GL_DIFFUSE, colorM2, 0);

  renderer.gl.glEnable(GL.GL_LIGHT0);
  renderer.gl.glLightfv(GL.GL_LIGHT0, GL.GL_POSITION, light1pos, 0);
  renderer.gl.glLightfv(GL.GL_LIGHT0, GL.GL_DIFFUSE,  colorL0d, 0);
  renderer.gl.glLightfv(GL.GL_LIGHT0, GL.GL_SPECULAR, colorL0s, 0);

  renderer.gl.glEnable(GL.GL_LIGHT1);
  renderer.gl.glLightfv(GL.GL_LIGHT1, GL.GL_POSITION, light2pos, 0);
  renderer.gl.glLightfv(GL.GL_LIGHT1, GL.GL_DIFFUSE,  colorL1d, 0);
  renderer.gl.glLightfv(GL.GL_LIGHT1, GL.GL_SPECULAR, colorL1s, 0);

  renderer.model(surfaceMesh);   // render surface triangle mesh

  renderer.endGL();      // back to processing
}


