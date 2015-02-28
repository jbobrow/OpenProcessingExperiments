
//Syphon template for processing 1.5

// OpenGL
import javax.media.opengl.*;
import processing.opengl.*;
// JSyphon
import jsyphon.*;

//syphon + opengl objects
JSyphonServer mySyphon;
GL gl;

void setup() {
  size(800, 600, OPENGL);
  //set your variables here!


  //syphon sets
  mySyphon = new JSyphonServer();
  // mySyphon.test();
  mySyphon.initWithName("Syphon - Processing");
}

void draw() {
  // get an OpenGL handle
  PGraphicsOpenGL pgl = (PGraphicsOpenGL) g;
  gl = pgl.beginGL();

  //create your draw here!






  // copy to texture, to send to Syphon.
  int[] texID = new int[1];
  gl.glEnable(gl.GL_TEXTURE_RECTANGLE_EXT);
  gl.glGenTextures(1, texID, 0);
  gl.glBindTexture(gl.GL_TEXTURE_RECTANGLE_EXT, texID[0]);
  gl.glTexImage2D(gl.GL_TEXTURE_RECTANGLE_EXT, 0, gl.GL_RGBA8, width, height, 0, gl.GL_RGBA, gl.GL_UNSIGNED_BYTE, null);
  gl.glCopyTexSubImage2D(gl.GL_TEXTURE_RECTANGLE_EXT, 0, 0, 0, 0, 0, width, height);
  //syphon publisher
  mySyphon.publishFrameTexture(texID[0], gl.GL_TEXTURE_RECTANGLE_EXT, 0, 0, width, height, width, height, false);
  //clean textures
  gl.glDeleteTextures(1, texID, 0);
  //end GL
  pgl.endGL();
}
