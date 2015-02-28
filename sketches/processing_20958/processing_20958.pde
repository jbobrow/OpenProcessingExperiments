
import processing.opengl.*;
import javax.media.opengl.*;
import javax.media.opengl.glu.*;
import java.nio.*;
import com.sun.opengl.util.*;

// main class global
public PGraphicsOpenGL pgl;
public GL    gl;
public GLU   glu;
public int   EnvMap;
public CAR   car;
public float xRot=15.0;
public float yRot;

// helper simple OpenGL texture loader RGB
int loadTexture(String name) {
  int[] id = new int[1];
  // create one new name (id)
  gl.glGenTextures(1, id, 0);
  // select the new name
  gl.glBindTexture(GL.GL_TEXTURE_2D,id[0]);
  // load image
  PImage pic = loadImage(name);
  // update pixel array
  pic.loadPixels();
  // create byte buffer for OpenGL
  ByteBuffer buf = BufferUtil.newByteBuffer(pic.width*pic.height*3);
  // convert integer pixels to RGB bytes
  for (int row = 0;row < pic.height;row++) {
    for (int col = 0; col < pic.width; col++) {
      int c = pic.pixels[(pic.height-1-row) * pic.width + col];
      buf.put((byte) ((c >> 16) & 0xFF));
      buf.put((byte) ((c >>  8) & 0xFF));
      buf.put((byte) ((c >>  0) & 0xFF));
    }
  }
  buf.flip();
  // upload RGB bytes to OpenGL gfx card
  gl.glTexImage2D(GL.GL_TEXTURE_2D, 0, GL.GL_RGB, pic.width, pic.height, 0, GL.GL_RGB, GL.GL_UNSIGNED_BYTE,buf);
  // set texture mode
  gl.glTexEnvf(GL.GL_TEXTURE_ENV, GL.GL_TEXTURE_ENV_MODE, GL.GL_MODULATE);
  gl.glTexParameteri(GL.GL_TEXTURE_2D, GL.GL_TEXTURE_MAG_FILTER, GL.GL_NEAREST);
  gl.glTexParameteri(GL.GL_TEXTURE_2D, GL.GL_TEXTURE_MIN_FILTER, GL.GL_NEAREST); 
  // trigger the gabage collector
  pic = null;
  buf = null;
  // return the new texture name (handle/id)
  return id[0];
}

class CAR_HEADER {
  float[]   Min;   // min
  float[]   Max;   // max 
  float[]   Pivot; // center
  int       nVertices;
  
  CAR_HEADER(){
    Min   = new float[3];
    Max   = new float[3];
    Pivot = new float[3];
  }
}

class CAR_PART {
  CAR_HEADER Hdr;
  boolean    Envmap;
  boolean    Transparent;
  int        TextureID;   // skin or wheel texture
  int        List;        // precompiled OpenGL display list  

  CAR_PART(){
    Hdr = new CAR_HEADER();
  }

  void draw() {
    if (TextureID>-1) {
      gl.glBindTexture(GL.GL_TEXTURE_2D,TextureID);
      gl.glEnable(GL.GL_TEXTURE_2D);
    } 
    else
      gl.glDisable(GL.GL_TEXTURE_2D);

    if (Transparent) {
      gl.glEnable(GL.GL_BLEND);
      gl.glColor3f(0f,0f,0f);
      gl.glCallList(List);
      gl.glDisable(GL.GL_BLEND);
    } 
    else {
      gl.glColor3f(.1f,.1f,.1f);
      gl.glCallList(List);
    }
    if (TextureID>-1)
      gl.glDisable(GL.GL_TEXTURE_2D);

    if (Envmap) {
      gl.glEnable(GL.GL_TEXTURE_GEN_S);
      gl.glEnable(GL.GL_TEXTURE_GEN_T);
      gl.glEnable(GL.GL_TEXTURE_2D);
      gl.glEnable(GL.GL_BLEND);
      gl.glBindTexture(GL.GL_TEXTURE_2D,EnvMap);
      gl.glColor3f(0f,0f,0f);
      gl.glCallList(List);
      gl.glDisable(GL.GL_BLEND);
      gl.glDisable(GL.GL_TEXTURE_2D);
      gl.glDisable(GL.GL_TEXTURE_GEN_S);
      gl.glDisable(GL.GL_TEXTURE_GEN_T);
    }
  }
}

class CAR_MODEL {
  CAR_HEADER Hdr;
  int        nParts;
  CAR_PART[] Parts;
  
  CAR_MODEL(){
    Hdr = new CAR_HEADER();
  }
  
  void draw() {
  }
}

class CAR {
  int         nModels;
  CAR_MODEL[] Models;
  float       Steering;
  float[]     WheelRotation;
  float[]     Rotation;
  float[]     Position;

  CAR(String name) 
  {
    String Skin    = name + "Skin.jpg";
    String Wheel   = name + "Wheel.jpg";
    String Model   = name + ".tga"; 
    int[] Textures = new int[2];
    Textures[0]    = loadTexture(Skin);
    Textures[1]    = loadTexture(Wheel);
    Steering       = 15.0;
    WheelRotation  = new float[4];
    Rotation       = new float[3];
    Position       = new float[3];
    PImage pic = loadImage(Model);
    int index  = 0;  
    pic.loadPixels();
    nModels = pic.pixels[index++];
    Models = new CAR_MODEL[nModels];
    for (int m=0;m<nModels;m++)
    {
      Models[m]           = new CAR_MODEL();
      index+=6; // ignore class, flags and name
      // read min,max and pivot
      for (int i=0;i<3;i++) Models[m].Hdr.Min[i]   = Float.intBitsToFloat(pic.pixels[index++]);
      for (int i=0;i<3;i++) Models[m].Hdr.Max[i]   = Float.intBitsToFloat(pic.pixels[index++]);
      for (int i=0;i<3;i++) Models[m].Hdr.Pivot[i] = Float.intBitsToFloat(pic.pixels[index++]);
      // number of vertieces from all parts
      Models[m].Hdr.nVertices = pic.pixels[index++];
      // number of parts
      Models[m].nParts = pic.pixels[index++];
      // create the parts
      Models[m].Parts = new CAR_PART[Models[m].nParts];

      for (int p=0; p<Models[m].nParts;p++) {
        Models[m].Parts[p]           = new CAR_PART();
        index+=6; // ignore class,flags,name
        // read min,max and pivot
        for (int i=0;i<3;i++) Models[m].Parts[p].Hdr.Min[i]   = Float.intBitsToFloat(pic.pixels[index++]);
        for (int i=0;i<3;i++) Models[m].Parts[p].Hdr.Max[i]   = Float.intBitsToFloat(pic.pixels[index++]);
        for (int i=0;i<3;i++) Models[m].Parts[p].Hdr.Pivot[i] = Float.intBitsToFloat(pic.pixels[index++]);
        // is it a wheel ?
        if (p<4) {
          for (int i=0;i<3;i++) {
            Models[m].Parts[p].Hdr.Min[i]-=Models[m].Parts[p].Hdr.Pivot[i];
            Models[m].Parts[p].Hdr.Max[i]-=Models[m].Parts[p].Hdr.Pivot[i];
          }
        }
        // part vertices
        Models[m].Parts[p].Hdr.nVertices = pic.pixels[index++];
        // part material      
        Models[m].Parts[p].Envmap      = (pic.pixels[index++]!=0) ? true : false;
        Models[m].Parts[p].Transparent = (pic.pixels[index++]!=0) ? true : false;
        Models[m].Parts[p].TextureID   =  pic.pixels[index++]-1;
        if (Models[m].Parts[p].TextureID==0) {
          Models[m].Parts[p].TextureID=Textures[0];
        } 
        else if (Models[m].Parts[p].TextureID==1) {
          Models[m].Parts[p].TextureID=Textures[1];
        }  
        // create a displaylist from part
        Models[m].Parts[p].List = gl.glGenLists(1);
        gl.glNewList(Models[m].Parts[p].List,GL.GL_COMPILE);
        gl.glBegin(GL.GL_TRIANGLE_STRIP);
        for (int v=0;v<Models[m].Parts[p].Hdr.nVertices;v++) { 
          // texture coords
          gl.glTexCoord2f(Float.intBitsToFloat(pic.pixels[index++]),
                          Float.intBitsToFloat(pic.pixels[index++]));
          // normale
          gl.glNormal3f(Float.intBitsToFloat(pic.pixels[index++]),
                        Float.intBitsToFloat(pic.pixels[index++]),
                        Float.intBitsToFloat(pic.pixels[index++]));
          // vertex
          if (p<4) {
            gl.glVertex3f(Float.intBitsToFloat(pic.pixels[index++]) 
                               - Models[m].Parts[p].Hdr.Pivot[0],
                          Float.intBitsToFloat(pic.pixels[index++]) 
                               - Models[m].Parts[p].Hdr.Pivot[1],
                          Float.intBitsToFloat(pic.pixels[index++]) 
                               - Models[m].Parts[p].Hdr.Pivot[2]);
          }
          else
            gl.glVertex3f(Float.intBitsToFloat(pic.pixels[index++]),
                          Float.intBitsToFloat(pic.pixels[index++]),
                          Float.intBitsToFloat(pic.pixels[index++]));
        } // next vertex
        gl.glEnd();
        gl.glEndList();
      } // next part
    } // next model
    pic = null;
  }
  void draw() {
    for(int p = 0;p<Models[0].nParts;p++) {
      if (p<4) {
        gl.glPushMatrix();
        gl.glTranslatef(Models[0].Parts[p].Hdr.Pivot[0],
        Models[0].Parts[p].Hdr.Pivot[1],
        Models[0].Parts[p].Hdr.Pivot[2]); 
        if (p<2) {
          gl.glRotatef(Steering,0.0,1.0,0.0);
        }
        gl.glRotatef(WheelRotation[p],-1.0, 0.0, 0.0);
      }  
      Models[0].Parts[p].draw();
      if (p<4) {
        gl.glPopMatrix();
      }
    } // next part
  }
}  
float[] vec4(float x,float y,float z,float w) {
  float[] v4 = {x,y,z,w}; return v4;
}

void initOpenGL() {
  // setup opengl
  gl.glClearColor(0.1, 0.1, 0.2, 0.0);
  gl.glShadeModel(GL.GL_SMOOTH);
  gl.glClearDepth(1.0);
  gl.glEnable    (GL.GL_DEPTH_TEST);
  gl.glBlendFunc (GL.GL_ONE, GL.GL_ONE);
  gl.glDepthFunc (GL.GL_LEQUAL);
  gl.glEnable    (GL.GL_TEXTURE_2D);
  gl.glAlphaFunc (GL.GL_GREATER, 0.01);
  //gl.glCullFace  (GL.GL_FRONT);
  //gl.glDisable   (GL.GL_CULL_FACE);
  gl.glDisable   (GL.GL_BLEND);

  // setup material and 2 lights
  gl.glEnable    (GL.GL_COLOR_MATERIAL);
  gl.glEnable    (GL.GL_LIGHTING);
  gl.glEnable    (GL.GL_LIGHT0);
  gl.glEnable    (GL.GL_LIGHT1);

  gl.glLightfv(GL.GL_LIGHT0, GL.GL_POSITION,vec4( 1.0,5.0,1.0,0.0),0);
  gl.glLightfv(GL.GL_LIGHT0, GL.GL_DIFFUSE, vec4( 1.0,1.0,1.0,1.0),0);
  gl.glLightfv(GL.GL_LIGHT1, GL.GL_POSITION,vec4(-2.0,2.0,0.0,0.0),0);
  gl.glLightfv(GL.GL_LIGHT1, GL.GL_DIFFUSE, vec4( 1.0,0.7,0.4,1.0),0);
  gl.glLightfv(GL.GL_LIGHT1, GL.GL_SPECULAR,vec4( 1.0,0.8,0.4,1.0),0);

  gl.glMaterialfv(GL.GL_FRONT_AND_BACK, GL.GL_DIFFUSE, vec4( 1.0,1.0,1.0,1.0),0);
  gl.glMaterialfv(GL.GL_FRONT_AND_BACK, GL.GL_SPECULAR,vec4( 1.0,1.0,1.0,1.0),0);
  gl.glMaterialf (GL.GL_FRONT_AND_BACK, GL.GL_SHININESS,50.0);
  //gl.glMateriali (GL.GL_FRONT_AND_BACK, GL.GL_COLOR_MATERIAL_PARAMETER, GL.GL_SPECULAR);

  gl.glTexGeni   (GL.GL_S,GL.GL_TEXTURE_GEN_MODE, GL.GL_SPHERE_MAP);
  gl.glTexGeni   (GL.GL_T,GL.GL_TEXTURE_GEN_MODE, GL.GL_SPHERE_MAP);
  //gl.glTexGeni   (GL.GL_S,GL.GL_SPHERE_MAP, 0);
  //gl.glTexGeni   (GL.GL_T,GL.GL_SPHERE_MAP, 0);
  gl.glDisable   (GL.GL_TEXTURE_GEN_S);
  gl.glDisable   (GL.GL_TEXTURE_GEN_T);
  gl.glHint      (GL.GL_PERSPECTIVE_CORRECTION_HINT, GL.GL_NICEST);
}

void beginGLFrame() {
  gl.glBlendFunc (GL.GL_ONE, GL.GL_ONE);
  gl.glDisable   (GL.GL_BLEND);
  gl.glEnable    (GL.GL_COLOR_MATERIAL);
  gl.glEnable    (GL.GL_LIGHTING);
  gl.glEnable    (GL.GL_LIGHT0);
  gl.glEnable    (GL.GL_LIGHT1);
  gl.glMaterialfv(GL.GL_FRONT_AND_BACK, GL.GL_DIFFUSE, vec4( 1.0,1.0,1.0,1.0),0);
  gl.glMaterialfv(GL.GL_FRONT_AND_BACK, GL.GL_SPECULAR,vec4( 1.0,1.0,1.0,1.0),0);
  gl.glMaterialf (GL.GL_FRONT_AND_BACK, GL.GL_SHININESS,50.0);
  gl.glPushMatrix(); // model
  gl.glMatrixMode(GL.GL_PROJECTION);
  gl.glPushMatrix(); // project
  gl.glLoadIdentity();
  gl.glViewport(0,0,width,height);
  glu.gluPerspective(45.0,(float)width / (float)height,0.1,1000.0);
  gl.glMatrixMode(gl.GL_MODELVIEW);
  gl.glLoadIdentity();
  gl.glClear(GL.GL_COLOR_BUFFER_BIT | GL.GL_DEPTH_BUFFER_BIT);
}

void endGLFrame() {
  gl.glMatrixMode(GL.GL_PROJECTION);
  gl.glPopMatrix(); // projection
  gl.glMatrixMode(GL.GL_MODELVIEW);  
  gl.glPopMatrix(); // model
}

void setup() {
  size(508, 400, OPENGL);
  // get interfaces
  pgl    = (PGraphicsOpenGL) g;
  gl     = pgl.gl;
  glu    = pgl.glu;
  // setup OpenGL
  initOpenGL();  
  // load texture
  EnvMap = loadTexture("Env.jpg");
  // load car
  car    = new CAR("AudiR8");
}

void draw() {
  // get current context
  gl = pgl.beginGL();
  
  // reset many OpenGL params 
  beginGLFrame();
  // move observer
  gl.glTranslatef(0.0,0.0,-4.0);
  // rotate the car
  gl.glRotatef(xRot, 1.0, 0.0, 0.0);
  gl.glRotatef(yRot, 0.0, 1.0, 0.0);

  // draw the car
  if (car!=null)
    car.draw();

  endGLFrame();
  pgl.endGL();

  // car rotation 
  yRot+=0.5;
  if (yRot>=360.0) yRot-=360;
  // rotate the wheels
  for (int wheel=0;wheel<4;wheel++) {
    car.WheelRotation[wheel]+=4;
  }
}



