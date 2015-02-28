
//import superCAD.*;

//import wblut.hemesh.modifiers.*;
import wblut.geom.frame.*;
//import wblut.hemesh.composite.*;
import wblut.core.processing.*;
//import wblut.hemesh.tools.*;
//import wblut.hemesh.simplifiers.*;
import wblut.hemesh.subdividors.*;
//import wblut.geom.nurbs.*;
//import wblut.core.random.*;
//import wblut.geom.triangulate.*;
import wblut.hemesh.creators.*;
//import wblut.geom.tree.*;
import wblut.hemesh.core.*;
//import wblut.geom.grid.*;
//import wblut.core.structures.*;
//import wblut.core.math.*;
//import wblut.geom.core.*;

//import processing.core.*;
//import processing.opengl.*;
import javax.media.opengl.*;
import peasy.*;
import controlP5.*;
import superCAD.*;
//import processing.dxf.*;

ControlP5 controlP5;
PGraphics3D g3;
PMatrix3D currCameraMatrix;
PeasyCam cam;
//SuperCAD supcad;

PFont fontlg;
HE_Mesh mesh;
WB_Render render;
WB_Frame frame;
HES_CatmullClark subdividor=new HES_CatmullClark();
HEC_FromFrame creator=new HEC_FromFrame();

boolean smoothMesh = false;
boolean save3D = false;

Thing thing;
Structure structure;

int w = 800;
int h = 500;

int numx = 3;
int numy = 3;
int numz = 3;
float Thickness = 5;
float movedist = 50;
float minx = -1;
float maxx = (numx-1)*movedist + 1;
float maxy = (numy-1)*movedist + 1;
float maxz = (numz-1)*movedist + 1;
PVector startingPos = new PVector(0,0,(numz-1)*movedist);
ArrayList pts = new ArrayList();
float scayl = 10;

Slider s1, nx, ny, nz;
Radio r;
Button reset, exprt;

void setup(){
  size(800, 500, P3D);
  background(55);
  smooth();
  lights();
  g3 = (PGraphics3D)g;
  controlP5 = new ControlP5(this);
  perspective(PI/3, 1.6, 1, 1000);
  cam = new PeasyCam(this,maxx/2,maxy/2,maxz/2, maxx*2);
  //supcad = new SuperCAD(this);
  
  //textSize(2);
  fontlg = loadFont("Inconsolata-24.vlw");
  textFont(fontlg, 1*scayl);
  textAlign(CENTER);
  //cam = new PeasyCam(this,100);
  
  //cam.rotateX(-PI/6);
  structure = new Structure();
  structure.init(numx, numy, numz);
  render=new WB_Render(this);
  initgui();
}

void draw(){
  background(55);
  //lights();
  
  cam.beginHUD();
  gui();
  cam.endHUD();
  
  stroke(90);
  fill(150);
  for (int i=0; i<numx; i++){
    for (int j=0; j<numy; j++){
      for (int k=0; k<numz; k++){
        pushMatrix();
        translate(i*movedist, j*movedist, k*movedist);
        box(2);
        popMatrix();
      }
    }
  }
  //thing.update();
  thing.render();
  stroke(0);
  noFill();
//  beginShape();
//  for(int i=0; i<pts.size(); i++){
//    PVector p0 = (PVector) pts.get(i);
//    vertex(p0.x, p0.y, p0.z);
//  }
//  endShape();
  
  if(save3D == true) {
    String Dateobj = year() + "-" + month() + "-" + day() + "-" + hour() + "-" + minute() + "-" + second() + ".obj";
    //supcad.record("obj", Dateobj);
  }
  
  creator.setStrutRadius(Thickness);
  
  try{
    mesh=new HE_Mesh(creator);
    if (smoothMesh == true){
      mesh.subdivide(subdividor, 2);
      fill(230); noStroke();
      render.drawFaces(mesh);
      noFill(); stroke(215); strokeWeight(0.25);
      render.drawEdges(mesh);
    } else {
      fill(230, 150); noStroke();
      render.drawFaces(mesh);
      noFill(); stroke(200); strokeWeight(0.25);
      render.drawEdges(mesh);
    }
  }
  catch(IllegalArgumentException ie){
    println("nope");
  }
  
  if(save3D == true) {
    endRaw();
    save3D = false; 
  }
  
  //cam.setMouseControlled(true);
  if(r.isInside() || s1.isInside() || nx.isInside() || ny.isInside() || nz.isInside() || reset.isInside()) {
  //if (mouseX > 750){
    cam.setMouseControlled(false);
  } else {
    cam.setMouseControlled(true);
  }
  
}

void keyPressed(){
  if (key == CODED && keyCode == LEFT){
    thing.dir = new PVector(-1,0,0);
    thing.moveforward();
  }
  if (key == CODED && keyCode == RIGHT){
    thing.dir = new PVector(1,0,0);
    thing.moveforward();
  }
  if (key == CODED && keyCode == UP){
    thing.dir = new PVector(0,-1,0);
    thing.moveforward();
  }
  if (key == CODED && keyCode == DOWN){
    thing.dir = new PVector(0,1,0);
    thing.moveforward();
  }
  if (key == 'a' || key == 'A'){
    thing.dir = new PVector(0,0,1);
    thing.moveforward();
  }
  if (key == 'z' || key == 'Z'){
    thing.dir = new PVector(0,0,-1);
    thing.moveforward();
  }
  if (key == '+'){
    if (Thickness<19.5){
      Thickness += 1;
    }
  }
  if (key == '-'){
    if (Thickness>1.5){
      Thickness -= 1;
    }
  }
  if (key == 'r' || key == 'R'){
    structure.init(numx, numy, numz);
    initgui();
  }
  if (key == 's' || key == 'S'){
    save3D = true;
  }
}

class Thing {
  PVector pos;
  PVector dir;
  int currpt;
  int lastpt;
  
  Thing(){
    pos = startingPos;
    dir = new PVector(1,0,0);
    lastpt = int(numx*numy*(numz-1));
  }
  
  void update(){
    
  }
  
  void moveforward(){
    PVector mf = new PVector(movedist*dir.x, movedist*dir.y, movedist*dir.z);
    PVector checkpos = new PVector(pos.x, pos.y, pos.z);
    checkpos.add(mf);
    //pos = checkpos;
    //pts.add(new PVector(pos.x, pos.y, pos.z));
    //checkpos.add(vertmf);
    //println("checkpos = " + checkpos);
    //println("pos1 = " + pos);
    
    if (checkpos.x>minx && checkpos.x<maxx && checkpos.y>minx && checkpos.y<maxy && checkpos.z>minx && checkpos.z<maxz){
      pos = checkpos;
      //println("pos2 = " + pos);
      pts.add(new PVector(pos.x, pos.y, pos.z));
      if (dir.x == 1){
        currpt = lastpt+1;
      } else if(dir.x == -1){
        currpt = lastpt-1;
      } else if(dir.y == 1){
        currpt = lastpt+int(numx);
      } else if(dir.y == -1){
        currpt = lastpt-int(numx);
      } else if(dir.z == 1){
        currpt = lastpt+int(numx*numy);
      } else if(dir.z == -1){
        currpt = lastpt-int(numx*numy);
      }
      println(lastpt + ", " + currpt);
      frame.addStrut(lastpt, currpt);
      lastpt = currpt;
    }
    
    //println(pos);
    
  }
  
  void render(){
    stroke(50);
    fill(150);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    box(1);
    stroke(255,0,0);
    line(0,0,0, 2*scayl,0,0);
    text("R", 2.5*scayl,0.33*scayl,0);
    line(0,0,0, -2*scayl,0,0);
    text("L", -2.5*scayl,0.33*scayl,0);
    stroke(0,255,0);
    line(0,0,0, 0,-2*scayl,0);
    text("Up", 0,-2.2*scayl,0);
    line(0,0,0, 0,2*scayl,0);
    text("Dn", 0,2.75*scayl,0);
    stroke(0,0,255);
    line(0,0,0, 0,0,2*scayl);
    text("A", 0,0.33*scayl,2*scayl);
    line(0,0,0, 0,0,-2*scayl);
    text("Z", 0,0.33*scayl,-2*scayl);
    popMatrix();
  }
}

class Structure{
  
  Structure(){
    
  }
  
  void init(float inumx, float inumy, float inumz){
    startingPos = new PVector(0,0,(numz-1)*movedist);
    //cam = new PeasyCam(this,maxx/2,maxy/2,maxz/2, 250);
    //cam.rotateX(-PI/6);
    //cam = new PeasyCam(this,w/2,h/2,0, 500);
    cam.reset();
    float camdist = 2 * max(maxx, maxy);
    cam.lookAt(maxx/2, maxy/2, maxz/2, camdist);
    
    Thickness = 5;
    thing = new Thing();
    pts.add(new PVector(startingPos.x, startingPos.y, startingPos.z));
    frame = new WB_Frame();
    for (int k=0; k<inumz; k++){
      for (int j=0; j<inumy; j++){
        for (int i=0; i<inumx; i++){
          frame.addNode(i*movedist, j*movedist, k*movedist, 1);
        }
      }
    }
    
    creator.setFrame(frame); //alternatively you can specify a HE_Mesh instead of a WB_Frame.
    //creator.setStrutRadius(strutRad);// strut radius
    creator.setStrutFacets(4);// number of faces in the struts, min 3, max whatever blows up the CPU
    //creator.setMaximumStrutOffset(2/1.5);// limit the joint radius by decreasing the strut radius where necessary. Joint offset is added after this limitation.
    creator.setAngleOffset(HALF_PI);// rotate the struts by a fraction of a facet. 0 is no rotation, 1 is a rotation over a full facet. More noticeable for low number of facets.
    //creator.setMinimumBalljointAngle(0);//Threshold angle to include sphere in joint.
    //creator.setMaximumStrutLength(nodesize/2);//divide strut into equal parts if larger than maximum length.
    //creator.setMaximumStrutOffset(2);
    creator.setCap(true); //cap open endpoints of struts?
    //creator.setTaper(true);// allow struts to have different radii at each end?
    creator.setCreateIsolatedNodes(false);// create spheres for isolated points?
    creator.setUseNodeValues(false);// use the value of the WB_Node as scaling factor, only useful if the frame was created using addNode().
    
    smoothMesh = false;
    cam.rotateX(-PI/6);
  }
}

void initgui(){
  int bh = 20;
  int bw = 100;
  int buttonxstart = 630;
  s1 = controlP5.addSlider("Thickness", 2, 20, 5, buttonxstart, 50, bw, bh);
  //s1 = (Slider)controlP5.controller("Thickness");
  r = controlP5.addRadio("radio",buttonxstart,80);
  //r.deactivateAll();
  r.add("smooth off", 1);
  r.add("smooth on", 0);
  reset = controlP5.addButton("Reset", 0, buttonxstart, 400, bw, bh);
  nx = controlP5.addSlider("x Number", 1, 7, 3, buttonxstart, 290, bw, bh);
  nx.setNumberOfTickMarks(7);
  ny = controlP5.addSlider("y Number", 1, 7, 3, buttonxstart, 320, bw, bh);
  ny.setNumberOfTickMarks(7);
  nz = controlP5.addSlider("z Number", 1, 7, 3, buttonxstart, 350, bw, bh);
  nz.setNumberOfTickMarks(7);
  
  exprt = controlP5.addButton("export", 0, 30, 400, bw, bh);
}

void gui(){
  currCameraMatrix = new PMatrix3D(g3.camera);
  camera();
  lights();
  controlP5.draw();
  g3.camera = currCameraMatrix;
}

void radio(int theID){
  switch(theID){
    case(0):
      smoothMesh = true;
      break;
    case(1):
      smoothMesh = false;
      break;
  }
}

void Reset(){
  numx = int(nx.value());
  numy = int(ny.value());
  numz = int(nz.value());
  maxx = (numx-1)*movedist + 1;
  maxy = (numy-1)*movedist + 1;
  maxz = (numz-1)*movedist + 1;
  structure.init(numx, numy, numz);
  r.deactivateAll();
  //initgui();
}

void export(){
  //save3D = true;
}

