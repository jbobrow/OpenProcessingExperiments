
/**
 * Basic Use (Offscreen version).
 * by Andres Colubri.
 * 
 * Off-screen rendering version of the BasicUse example using GLGraphics.
 *
 * This example requires the GLGraphics library:
 * http://glgraphics.sourceforge.net/
 * 
 * Press 'h' to display the global shortcuts in the console.
 * Press 'H' to display the current camera profile keyboard shortcuts
 * and mouse bindings in the console.
 */

import remixlab.proscene.*;
import processing.opengl.*;
import codeanticode.glgraphics.*;

Scene scene;
GLGraphicsOffScreen canvas;

void setup() {
  size(640, 360, GLConstants.GLGRAPHICS);
  
  canvas = new GLGraphicsOffScreen(this, width, height);
  // You can create an antialiased surface if the hardware
  // supports it:
  //canvas = new GLGraphicsOffScreen(this, width, height, true, 4);
  
  // Scene instantiation. Note that we also pass the 
  // offscreen surface (canvas) to the constructor of
  // the scene.
  scene = new Scene(this, canvas);  
}

void draw() {  
  // Offscreen rendering of the scene. The
  // beginDraw/endDraw calls are required. Note
  // the order: beginDraw of canvas first, then
  // beginDraw of scene.
  canvas.beginDraw();
  scene.beginDraw();
  background(0);
  canvas.fill(204, 102, 0);
  canvas.box(20, 30, 50);
  scene.endDraw();
  canvas.endDraw();
  
  // Now you can use the offscreen image
  // to do wherever you want.
  GLTexture tex = canvas.getTexture();
  image(tex, 0, 0, 320, 180);
  image(tex, 320, 0, 320, 180);
  image(tex, 0, 180, 320, 180);
  image(tex, 320, 180, 320, 180);  
}

