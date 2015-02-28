
import peasy.*;
import javax.media.opengl.*;
import processing.opengl.*;
import mri.*;

PeasyCam cam;
V3dsScene mouse;

void setup() {
  size( 800, 600, OPENGL);
  hint( ENABLE_OPENGL_4X_SMOOTH );
  smooth();

  cam = new PeasyCam(this,100);
  cam.setMinimumDistance(115);
  cam.setMaximumDistance(500);
  mouse = new V3dsScene( this, "mouse.3ds" );
}



void draw() {
  background(100);
  scale( -1, -1, 1 );

  GL _gl = ((PGraphicsOpenGL)g).beginGL();
  setupLight( _gl, new float[]{0, -5, 0}, 0 );
  ((PGraphicsOpenGL)g).endGL();
  
  mouse.draw();
}



// val is 0 or 1. 0 = directional light, 1 = point light
void setupLight( GL g, float[] pos, float val )
{
  float[] light_ambient = { 1.0f, 1.0f, 1.0f, 1 };
  float[] light_diffuse = { 1.0f, 1.0f, 1.0f, 1.0f };
  float[] light_specular = { 1.0f, 1.0f, 1.0f, 1.0f };  
  float[] light_position = { pos[0], pos[1], pos[2], val };  

  g.glLightfv ( GL.GL_LIGHT1, GL.GL_AMBIENT, light_ambient, 0 );
  g.glLightfv ( GL.GL_LIGHT1, GL.GL_DIFFUSE, light_diffuse, 0 );
  g.glLightfv ( GL.GL_LIGHT1, GL.GL_SPECULAR, light_specular, 0 );
  g.glLightfv ( GL.GL_LIGHT1, GL.GL_POSITION, light_position, 0 );  
  g.glEnable( GL.GL_LIGHT1 );
  g.glEnable( GL.GL_LIGHTING );
  g.glEnable( GL.GL_COLOR_MATERIAL );
}  

