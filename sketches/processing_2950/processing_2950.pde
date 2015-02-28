
// A simple z-buffer example
//
// Alasdair Turner 2009

PFont font;

void setup()
{
  size(400,400,P3D);
  font = loadFont("sans24.vlw");
  textFont(font); 
}

void draw()
{
  background(204);
  lights();
  noStroke();
  pushMatrix();
  translate(width/2.0,height/2.0,-height/2.0);
  // some geometry to test
  fill(255);
  box(width*2.0,height/2.0,1);
  sphere(width/2.0);
  popMatrix();
  
  // now find z-buffer at mouse:  
  PGraphics3D p3d = (PGraphics3D) g;
  float z = p3d.zbuffer[mouseX + width * mouseY];
 
  // if you want to do this using OPENGL, here's some code:
  /*
  // up top:
  // import java.nio.*; // for FloatBuffer
  // import javax.media.opengl.*; // for GL
  // and the code for here:
  PGraphicsOpenGL pogl = (PGraphicsOpenGL) g;
  FloatBuffer zbuff = FloatBuffer.allocate(1);
  pogl.gl.glReadPixels( mouseX, mouseY, 1, 1, GL.GL_DEPTH_COMPONENT, GL.GL_FLOAT, zbuff);
  float z = zbuff.get();
  */

  // now some code to convert this back to world coordinates:
  
  // for cameraZ, near and far
  // see http://processing.org/reference/perspective_.html
  float cameraZ = ((height/2.0) / tan(PI*60.0/360.0));
  float near= cameraZ/10.0;
  float far=cameraZ*10.0;
  // this is a standard conversion
  float worldZ = 2.0*far*near/(((z - 0.5) * 2.0)*(far-near)-(far+near));
  
  // if the mouse is over some geometry, display the
  // real world depth (worldZ + the distance to the camera)
  if (worldZ != 0.0) {
    fill(0, 102, 153, 51);
    text(nf(cameraZ + worldZ,0,1),mouseX,mouseY);
  }
}




