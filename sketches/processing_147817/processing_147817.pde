

//==========================================================
//
// sketch: TestSTL.pde - by Gerd Platl
//
// Testframe of STLWriter (Standard Triangulation Language). 
//  
// You can save a colored 3-dimensional triangle mesh as a STL file
// by using the STLWriter class.
//
// v1.0  2014-04-29  initial release
// v1.1  2014-08-06  more infos
//       2014-08-06  working on...
//
// tags:  STL, writer, 3d, triangle, triangulation, shape, file format,
//        StereoLithography, Surface Tesselation Language,  
//
// http://en.wikipedia.org/wiki/STL_%28file_format%29 
// http://de.wikipedia.org/wiki/STL-Schnittstelle
//
// toxiclibs.org/docs/core/toxi/geom/mesh/WETriangleMesh.html#rebuildIndex() 
//
// STL file viewer:  Freeware 'VisCAM View 5.2' 
//        download:  http://viscam-view.software.informer.com/5.2/
//==========================================================

String title = ">>> TestSTL  v1.1  2014-08-06 <<<";

//----------------------------------------------
void setup()
{
  size(880, 170);
  fill(0);
  println (title);
  textSize(18);
  saveSTL();
}
//----------------------------------------------
void draw() 
{
  if (frameCount > 5000)
  exit();                 // quit program
}
//----------------------------------------------
void keyPressed()
{
  exit();
}
//----------------------------------------------
void mousePressed()
{
  exit();
}
//----------------------------------------------
//  save current mesh as STL 3d data file
//----------------------------------------------
void saveSTL()
{
  String shapeName = "TESTSHAPE.stl";
  String fileName = sketchPath(shapeName);
  println ("saving 3d shape as file '" + shapeName + "'...");  
  
  STLWriter stl = new STLWriter();
  int faces = 6;

  String date = "" + year() + "-" + month() + "-" + day() + " " + hour() + ":" + nfs(minute(),2);
  String stsTitle = "STL-Binary-Data 3D-Shape, from OpenProcessing, " +faces + " triangles, " + date;
  text ("Test frame for saving a colored 3-dimensional triangle mesh as STL file.",20,30);
  text ("saving 3d shape as file '" + shapeName + "'...",20,70);
  text ("title: " + stsTitle,20,110);

  stl.beginSave (fileName, faces, stsTitle);
  
  // set pyramide vertices  
  float s = 100;
  float h = 400;
  PVector a = new PVector( s, s, 0.0);
  PVector b = new PVector( s,-s, 0.0);
  PVector c = new PVector(-s,-s, 0.0);
  PVector d = new PVector(-s, s, 0.0);
  PVector e = new PVector(0.0, 0.0, h);
  // add pyramide faces
  stl.addTriangle (a,b,c, color(88));    
  stl.addTriangle (a,c,d, color(88)); 
  stl.addTriangle (b,a,e, color(200, 255,   0));    
  stl.addTriangle (c,b,e, color(200, 155,  64));
  stl.addTriangle (d,c,e, color(100, 155, 128));
  stl.addTriangle (a,d,e, color(200,  55, 111)); 

  stl.endSave();
  
  text ("use 'VisCAM View' or 'MeshLab' to view STL file with colored triangle faces!",20,150);
}


