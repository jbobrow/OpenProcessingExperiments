
//SkewBox by Corneel Cannaerts 2012
//Developped for the Generator.x 3.0 masterclas with Marius Watz at iMAL.

//This is a basic example of generating G-Code directly from Processing.
//A picture of the resulting 3D print can be found here: 
//http://www.flickr.com/photos/introspector/6921024593/
//This is being futher devlopped into a project called Encoded Matter 
//info and images can be found here: http://introspector.be/encoded-matter/

//The G-Code generation was done using an adjusted version of CodeThread library 
//by Diatom Studio(http://blog.diatom.cc/category/codethread)
//The He_Mesh library by W:Blut was used for handling meshes (http://hemesh.wblut.com/)

//import libraries:
import peasy.*;
//import processing.opengl.*;
import wblut.hemesh.modifiers.*;
import wblut.geom.frame.*;
import wblut.hemesh.composite.*;
import wblut.core.processing.*;
import wblut.hemesh.tools.*;
import wblut.hemesh.simplifiers.*;
import wblut.hemesh.subdividors.*;
import wblut.geom.nurbs.*;
import wblut.core.random.*;
import wblut.geom.triangulate.*;
import wblut.hemesh.creators.*;
import wblut.geom.tree.*;
import wblut.hemesh.core.*;
import wblut.geom.grid.*;
import wblut.core.structures.*;
import wblut.core.math.*;
import wblut.geom.core.*;

HE_Intersection intersect;
HE_Mesh mesh;
WB_Render render;
PeasyCam cam;

CodeThread codeThread = new CodeThread(this);

//some experimentation with each machine is required to find good values
float boxSize = 50;
float platformSize = 100;
float headSpeed = 1250.0f;
float zStep = 0.35f;
float zStart = 0.32f;
float zClear = 20;

void setup() {
  size(800, 800, P3D);
  smooth();
  cam = new PeasyCam(this, 200);
  colorMode(HSB);
  generateMesh();
  render = new WB_Render(this);
  intersect = new  HE_Intersection();
  generateGCode();
}

void draw() {
  background(82);

  //render the platform
  noStroke();
  fill(220);
  rect(-platformSize*0.5, -platformSize*0.5, platformSize, platformSize); 

  //render the tool paths
  //stroke(255, 0, 0);
  noFill();

  //render static G-Code
  //codeThread.render(); 

  //... or animated version
  codeThread.animate(frameCount); 

  //render bounding mesh
  strokeWeight(1);
  stroke(0);
  render.drawEdges(mesh);
}

//generate mesh
void generateMesh() {
  HEC_Box creator=new HEC_Box();
  intersect = new HE_Intersection();
  creator.setWidth(boxSize).setHeight(boxSize).setDepth(boxSize); 
  creator.setCenter(0, 0, boxSize*0.5);
  creator.setWidthSegments(1).setHeightSegments(1).setDepthSegments(1);
  mesh=new HE_Mesh(creator);
}


//generate gcode
void generateGCode() {

  // set units to mm
  codeThread.setUnitmm();

  //set coordinates to absolute (origin in center of build platform)
  codeThread.setAbsolutePositioning();

  //calculate number of layers
  //although we don't realy need the concept of layers when generating G-code, it helps in this example.
  int numLayers = int(boxSize/zStep);
  println(numLayers);

  //store last position of extruder
  WB_Point3d last =  new WB_Point3d();

  //set directions of hatch patterns
  WB_Vector3d  v1 = new WB_Vector3d(10, 7, 0);
  WB_Vector3d  v2 = new WB_Vector3d(-5, 8, 0);

  //distance between lines
  float d1 = 10.0;
  float d2 = 10.0;
  
  //offset pattern for each layer
  float o1 = 0.2;
  float o2 = 0.2;

  for (int k=0; k<numLayers ; k++) {
    //add layer tags    
    codeThread.beginLayer(zStep*k);

    //pattern for even layers
    if (k%2==0) {
      //generate enough rays so they intersect with whole box (could be done more intelligent ;) )
      for (int i=0; i<40; i++) {
        // we generate starting points outside the box
        WB_Point3d s = new WB_Point3d(i*d1-boxSize*3+k*o1, -boxSize, zStep*k+zStart);
        WB_Ray ray =  new WB_Ray(s, v1); 
        List<WB_Point3d> pts = intersect.getIntersection(mesh, ray);
        //generate G-Code only if the ray intersects with the box in two places
        //move to first point with extruder off, to the second with extruder on
        if (pts.size()==2) {
          WB_Point3d pt1 = (WB_Point3d) pts.get(0);   
          WB_Point3d pt2 = (WB_Point3d) pts.get(1);  
          codeThread.moveTo(pt1.xf(), pt1.yf(), pt1.zf(), headSpeed);
          codeThread.extruderOnFwd();
          codeThread.moveTo(pt2.xf(), pt2.yf(), pt2.zf(), headSpeed);
          codeThread.extruderOff();
          last = pt2;
        }
      }
    }
    //pattern for odd layers
    else {
      for (int i=0; i<40; i++) {
        WB_Point3d s = new WB_Point3d(i*d2-boxSize*3+k*0.2, -boxSize, zStep*k+zStart);
        WB_Ray ray =  new WB_Ray(s, v2); 
        List<WB_Point3d> pts = intersect.getIntersection(mesh, ray);
        if (pts.size()==2) {
          WB_Point3d pt1 = (WB_Point3d) pts.get(0);   
          WB_Point3d pt2 = (WB_Point3d) pts.get(1);  
          codeThread.moveTo(pt1.xf(), pt1.yf(), pt1.zf(), headSpeed);
          codeThread.extruderOnFwd();
          codeThread.moveTo(pt2.xf(), pt2.yf(), pt2.zf(), headSpeed);
          codeThread.extruderOff();
          last = pt2;
        }
      }
    }
      codeThread.endLayer();    
  }
  codeThread.extruderOff();
  codeThread.moveTo(last.xf(), last.yf(), last.zf()+zClear, headSpeed);
  codeThread.printToConsole(); // print to console
  //codeThread.writeToFile(sketchPath +"/skewBox.gcode");
}




