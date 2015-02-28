
import org.jbox2d.util.nonconvex.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.testbed.*;
import org.jbox2d.collision.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.p5.*;
import org.jbox2d.dynamics.*;


Physics physics;

void setup() {
  size(640,480,P3D); // Let's go with P3D from now on for greater speed
  frameRate(60);
  initScene();
}


void initScene() {
  
  float gravX = 4.0;                 
  float gravY = 5.0;
  float AABBWidth = 2*width;   
  float AABBHeight = 2*height;
  float borderBoxWidth = width;      
  float borderBoxHeight = height;
  float pixelsPerMeter = 30;
  physics = new Physics(this, width, height,
		              gravX, gravY,
			      AABBWidth, AABBHeight,
			      borderBoxWidth, borderBoxHeight,
			      pixelsPerMeter);
  physics.setDensity(1.0f);
}

void draw() {
  background(0);
  smooth();
  
 String name = "ME";
 String geo = "Geometry loves";
PFont monaco;
monaco=loadFont("Serif-48.vlw");
textFont(monaco,90);
fill(0,255,0);
text (name, 460,90);
textFont(monaco,35);
text (geo,220,90);
 

  if (mousePressed) {
    { float sz = random(10,20);
      physics.createCircle(mouseX, mouseY, random(5,10));
      physics.createPolygon(mouseX,      mouseY, 
                            mouseX+sz,   mouseY, 
                            mouseX+sz*.5,mouseY-sz);
                            int nVerts = floor(random(4,8));
      float rad = random(5,10);
      float[] vertices = new float[nVerts*2];
      for (int i=0; i < nVerts; ++i) {
        vertices[2*i] = mouseX + rad*sin(TWO_PI*i/nVerts);
        vertices[2*i+1] = mouseY + rad*cos(TWO_PI*i/nVerts);
      }
      physics.createPolygon(vertices);
    } 
    }
  }



