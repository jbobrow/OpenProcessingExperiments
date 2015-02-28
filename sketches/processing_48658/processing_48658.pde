
import processing.opengl.*;
import javax.media.opengl.*;
import javax.media.opengl.glu.gl2.*;
GLUgl2 gl2;
ArrayList linestarts;
ArrayList hues;
PGraphicsOpenGL pgl;
GL gl;

//for blur
float q;

void setup(){
  size(500, 500, OPENGL);
  linestarts = new ArrayList();
  hues = new ArrayList();
  //screenBlend(ADD);
  colorMode(HSB);
  smooth();
  gl2 = new GLUgl2();
}

void draw(){
  pgl = (PGraphicsOpenGL)g;
  gl = pgl.beginGL();
  gl.glClearColor(0, 0, 0, 0);
  gl.glClear(GL.GL_COLOR_BUFFER_BIT | GL.GL_DEPTH_BUFFER_BIT);
  gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE);

  if(mousePressed && linestarts.size() <=10000){
    //for(int i = 0; i < 100; i++){
    linestarts.add(new PVector(mouseX, mouseY));
    
    hues.add(new PVector(255*sq(sin(frameCount*.1)), 255, 255));
   // }
  }
  else if(mousePressed && linestarts.size() >10000){
    linestarts = new ArrayList();
    hues = new ArrayList();
    //System.gc();
  }
  stroke(120);
  
  for(int i = 0; i < linestarts.size(); i++){
    PVector temp = (PVector)hues.get(i);
    stroke(temp.x, temp.y, temp.z);
    color c = color(temp.x, temp.y, temp.z);
    gl2.getCurrentGL2().glColor3f(r(c)/255, gr(c)/255, b(c)/255);
    temp = (PVector)linestarts.get(i);
    gl2.getCurrentGL2().glBegin(gl2.getCurrentGL2().GL_LINES);
      gl2.getCurrentGL2().glVertex3f(temp.x, temp.y, 0);
      gl2.getCurrentGL2().glVertex3f(mouseX, mouseY, 0);
    gl2.getCurrentGL2().glEnd();
  }
  //frame.setTitle("Lines: "+linestarts.size());
  q = .9;
//  gl2.getCurrentGL2().glAccum(gl2.getCurrentGL2().GL_MULT, q);
//  gl2.getCurrentGL2().glAccum(gl2.getCurrentGL2().GL_ACCUM, 1-q);
//  gl2.getCurrentGL2().glAccum(gl2.getCurrentGL2().GL_RETURN, 1.5);
//  gl2.getCurrentGL2().glFlush();
  //gl2.glutSwapBuffers();
  pgl.endGL();
  //loadPixels();
  //blur(1);
//updatePixels();
}


int r(color c){return (c >> 16) & 255; }
int gr(color c){return (c >> 8) & 255; }
int b(color c){return c & 255;}
  

