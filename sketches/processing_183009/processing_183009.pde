
import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

import processing.dxf.*;
import toxi.processing.*;
import toxi.volume.*;



import plethora.core.*;

import toxi.geom.*;
import toxi.geom.mesh.*;




Ple_Terrain pTer;
//------------------------------------------------DECLARE


ArrayList  leas_agents;
ArrayList  clea_agents;
ArrayList  work_agents;
ArrayList  infr_agents;

ArrayList <Vec3D> totTail;

//-------------------------------------------boolean switch

boolean futPrev = true;
boolean record;

//---------------------------------------

PointOctree octree;

// octree dimensions

float DIM = 800;
float DIM2 = DIM/2;

float [][] heights;

int DIMX = 1200;
int DIMY = 900;

// sphere clip radius

float clipRadius = 4;

PeasyCam cam;


//------------------------------------------------attractor + repell 

Vec3D seekTarget = new Vec3D(-50, -100, 50);
Vec3D seekTarget2 = new Vec3D(50, -30, 65);
Vec3D seekTarget3 = new Vec3D(10, 50, 50);
Vec3D seekTarget4 = new Vec3D(180, 0, 55);
Vec3D seekTarget5 = new Vec3D(180, 140, 40);
Vec3D seekTarget6 = new Vec3D(150, 190, 45);

Vec3D seekTarget11 = new Vec3D(-50, -100, 50);
Vec3D seekTarget12 = new Vec3D(150, -130, 65);
Vec3D seekTarget13 = new Vec3D(110, 150, 50);
Vec3D seekTarget14 = new Vec3D(280, 100, 55);
Vec3D seekTarget15 = new Vec3D(280, 240, 40);
Vec3D seekTarget16 = new Vec3D(250, 290, 45);


//----------------------------------------------behaviour variables

int work_population = 20;   // Bigger the party , Slower the fun!
int leas_population = 10; 
int clea_population = 20;
int infr_population = 15;


 float maxVel = 2;
float wandertheta = 10;

float futLocMag = 10;

float tailViewAngle = 60;

float tailCohMag = 0.2;
float tailCohViewRange = 20;
float tailSepMag = 3;
float tailSepViewRange = 5;

float att = 1;
float rep = 5;
float maxAttract = 0.15;

//-----------------------------volume

int VDIM=300;

PImage img;

float ISO_THRESHOLD = 0.8;
Vec3D SCALE=new Vec3D(1, 1, 1).scaleSelf(800);

VolumetricSpace volume;
VolumetricSpace volume1;
VolumetricSpace volume2;
VolumetricSpace volume3;
VolumetricBrush brush;
VolumetricBrush brush1;
VolumetricBrush brush2;
VolumetricBrush brush3;

IsoSurface surface;
WETriangleMesh mesh;
IsoSurface surface1;
WETriangleMesh mesh1;
IsoSurface surface2;
WETriangleMesh mesh2;
IsoSurface surface3;
WETriangleMesh mesh3;

ToxiclibsSupport gfx;


void setup() {
  size(1920, 1200, P3D);  
  cam = new PeasyCam(this,200, 100, 100, 700);
  cam.setMinimumDistance(.001);
  cam.setMaximumDistance(1000);
  gfx=new ToxiclibsSupport(this);
 // img = loadImage ("map3.png");

  /*
  //declare a vector as the location
  Vec3D location = new Vec3D(-DIMX/2, -DIMY/2, 0);
  //initialize the terrain, specifying columns and rows and cell Size
  pTer = new Ple_Terrain(this, location, 120, 90, 10, 10);

  //build a float array buffer and then load as height (what I call a datamap)
  //this function matches the resolution of the image to the resulution of your terrain
  heights = pTer.loadImageToBuffer("zbuff2.jpg");

  //load that info into the height of the terrain
  pTer.loadBufferasHeight(heights, 0, 60);
 */
  infr_agents = new ArrayList();
  leas_agents = new ArrayList();
  work_agents = new ArrayList();
  clea_agents = new ArrayList();
  
  totTail = new ArrayList <Vec3D>();
 
  for (int i=0; i < infr_population; i++) {
    Vec3D origin = new Vec3D (random(0,300), random(-100,200), 25);
    Agent myAgent = new Agent (origin, 0);   
    infr_agents.add(myAgent);
  }
  
  
    for (int i=0; i < work_population; i++) {
    Vec3D origin = new Vec3D (random(0,300), random(-100,200), random(0,45));
    Agent myAgent = new Agent (origin, 1);   
    work_agents.add(myAgent);
  }
  
    for (int i=0; i < clea_population; i++) {
    Vec3D origin = new Vec3D (random(0,300), random(-100,200), random(0,45));
    Agent myAgent = new Agent (origin, 2);   
    clea_agents.add(myAgent);
  }

    for (int i=0; i < leas_population; i++) {
    Vec3D origin = new Vec3D (random(0,300), random(-100,200), random(0,45));
    Agent myAgent = new Agent (origin, 3);   
    leas_agents.add(myAgent);
  }
  


  //------------------volume

  gfx=new ToxiclibsSupport(this);
 
  volume=new VolumetricSpaceArray(SCALE, VDIM, VDIM, VDIM);
  volume1=new VolumetricSpaceArray(SCALE, VDIM, VDIM, VDIM);
  volume2=new VolumetricSpaceArray(SCALE, VDIM, VDIM, VDIM);
  volume3=new VolumetricSpaceArray(SCALE, VDIM, VDIM, VDIM);

  brush=new RoundBrush(volume, 4);//stroke is 10
  brush1=new RoundBrush(volume1, 4);//stroke is 10
  brush2=new RoundBrush(volume2, 4);//stroke is 10
  brush3=new RoundBrush(volume3, 4);//stroke is 10

  surface=new ArrayIsoSurface(volume);
  mesh=new WETriangleMesh();
  surface1=new ArrayIsoSurface(volume1);
  mesh1=new WETriangleMesh();
  surface2=new ArrayIsoSurface(volume2);
  mesh2=new WETriangleMesh();
  surface3=new ArrayIsoSurface(volume3);
  mesh3=new WETriangleMesh();


  smooth(8);
}

void draw() {
  background(0,0,0);
 // image(img,-1020,-580);
 //pushMatrix();
//translate(-200,-200,-20);
  cam.rotateY(0.005);
  cam.rotateX(0.001);
  if (record == true) {
    beginRaw(DXF, "slimeVolume_"+day()+"_"+hour()+"_"+minute()+".dxf");
  }
  for (int i=0; i<infr_agents.size (); i++) {
    Agent Ag=(Agent)infr_agents.get(i);
    Ag.run();
    totTail.addAll(Ag.tail);
    Ag.tailSeek(totTail);
  }
 // totTail.clear(); //if this is uncommented, there will be no interaction between two agents groups
  
    for (int i=0; i<work_agents.size (); i++) {
    Agent Ag=(Agent)work_agents.get(i);
    Ag.run();
    totTail.addAll(Ag.tail);
    Ag.tailSeek(totTail);
  }
  totTail.clear(); //if this is uncommented, there will be no interaction between two agents groups
  
    for (int i=0; i<clea_agents.size (); i++) {
    Agent Ag=(Agent)clea_agents.get(i);
    Ag.run();
    totTail.addAll(Ag.tail);
    Ag.tailSeek(totTail);
  }
  //totTail.clear(); //if this is uncommented, there will be no interaction between two agents groups
  
    for (int i=0; i<leas_agents.size (); i++) {
    Agent Ag=(Agent)leas_agents.get(i);
    Ag.run();
    totTail.addAll(Ag.tail);
    Ag.tailSeek(totTail);
  }
  totTail.clear();
  //popMatrix();
  /*
  stroke(0, 90);
  strokeWeight(1);
  noFill();
  rect(-DIMX/2, -DIMY/2, DIMX, DIMY);

  //call some of the functions of the terrain
  stroke(0, 90);
  strokeWeight(2);
  pTer.display();

  //draw lines (horizontal, vertical or diagonal... or all of them!) 
  stroke(0, 90);
  strokeWeight(1);
  pTer.drawLines(false,true,false);

  //display a float array (datamap) as grayScale  (polygons that can be exported)
  //might be a bit heavy depending on the resolution of your terrain:
  //inputs: datamap, with values that go from ---> to, displayed in colors from ---> to
  pTer.drawDataMap(heights, 0,255, 150,255);
*/ 
gfx.mesh(mesh);
gfx.mesh(mesh1);
gfx.mesh(mesh2);
gfx.mesh(mesh3);



  sphereDetail(4);
//if ((frameCount/100 & 1) == 0) {
  pushMatrix();
  fill(0);
  translate(seekTarget.x, seekTarget.y, seekTarget.z);
  sphere(3);
  popMatrix();

  pushMatrix();
  fill(0);
  translate(seekTarget2.x, seekTarget2.y, seekTarget2.z);
  sphere(3);
  popMatrix();

  pushMatrix();
  fill(0);
  translate(seekTarget3.x, seekTarget3.y, seekTarget3.z);
  sphere(3);
  popMatrix();
  
  pushMatrix();
  fill(0);
  translate(seekTarget4.x, seekTarget4.y, seekTarget4.z);
  sphere(3);
  popMatrix();
  
  pushMatrix();
  fill(0);
  translate(seekTarget5.x, seekTarget5.y, seekTarget5.z);
  sphere(3);
  popMatrix();
  
  pushMatrix();
  fill(0);
  translate(seekTarget6.x, seekTarget6.y, seekTarget6.z);
  sphere(3);
  popMatrix();




  if (record == true) {
    endRaw();
    record = false;
  }
  
if (frameCount % 500 == 0) {
  //countFrMesh();
  }
  
  if (frameCount % 3 == 0) {
   //saveFrame("ani8/anislime#####.png");
  }


  if (frameCount % 2000 == 0){
    
   infr_agents.clear(); 
    for (int i=0; i < infr_population; i++) {
    Vec3D origin = new Vec3D (random(0,300), random(-100,200), 25);
    Agent myAgent = new Agent (origin, 0);   
    infr_agents.add(myAgent);
  }
  
  work_agents.clear();
    for (int i=0; i < work_population; i++) {
    Vec3D origin = new Vec3D (random(0,300), random(-100,200), random(0,45));
    Agent myAgent = new Agent (origin, 1);   
    work_agents.add(myAgent);
  }
  
  clea_agents.clear();
    for (int i=0; i < clea_population; i++) {
    Vec3D origin = new Vec3D (random(0,300), random(-100,200), random(0,45));
    Agent myAgent = new Agent (origin, 2);   
    clea_agents.add(myAgent);
  }
  
  leas_agents.clear();
    for (int i=0; i < leas_population; i++) {
    Vec3D origin = new Vec3D (random(0,300), random(-100,200), random(0,45));
    Agent myAgent = new Agent (origin, 3);   
    leas_agents.add(myAgent);
  }
  
  }  
}

void keyPressed() {
 /* if (key=='v' || key == 'V')volumeWrap(); 
  if (key == 'l' || key == 'L') {
    new LaplacianSmooth().filter(mesh, 1);
  }
if (key == 'd' || key == 'D') {
  mesh.clear();
}
 
  if (key=='s' || key == 'S') {
    mesh.saveAsSTL(sketchPath("STL/slimeVolume_"+month()+""+day()+"_"+hour()+""+minute()+".stl"));
  }
  if (key == 'r' || key == 'R') {
    record = true;
    print ("recording done");
  }
  if (key == 'f' || key == 'F') {
    saveFrame("scr/spaceSlime05_#####.png");
  }
  if (key == 'n' || key == 'N') noLoop();
  if (key == 'm' || key == 'M') loop();
  */
  if (key==' ') {
    
       infr_agents.clear(); 
    for (int i=0; i < infr_population; i++) {
    Vec3D origin = new Vec3D (random(0,300), random(-100,200), 25);
    Agent myAgent = new Agent (origin, 0);   
    infr_agents.add(myAgent);
  }
  
  work_agents.clear();
    for (int i=0; i < work_population; i++) {
    Vec3D origin = new Vec3D (random(0,300), random(-100,200), random(0,45));
    Agent myAgent = new Agent (origin, 1);   
    work_agents.add(myAgent);
  }
  
  clea_agents.clear();
    for (int i=0; i < clea_population; i++) {
    Vec3D origin = new Vec3D (random(0,300), random(-100,200), random(0,45));
    Agent myAgent = new Agent (origin, 2);   
    clea_agents.add(myAgent);
  }
  
  leas_agents.clear();
    for (int i=0; i < leas_population; i++) {
    Vec3D origin = new Vec3D (random(0,300), random(-100,200), random(0,45));
    Agent myAgent = new Agent (origin, 3);   
    leas_agents.add(myAgent);
  }
  
  }
  
}

class Agent {

  //------------------------------------------------------- GLOBAL VARIABLES
  int type;


  Vec3D loc = new Vec3D(0, 0, 0);
  Vec3D speed = new Vec3D(random(-200, 200), random(-200, 200), random(-10, 10));
  Vec3D acc = new Vec3D();

  ArrayList <Vec3D> tail = new ArrayList <Vec3D> ();
  int Tcount = 0;
  int TLen = 5000;
  int TStep = 1;
  int t=0;
  //---------------------------angle detection flocking

  float angle;
  float VAngle;
  Vec3D perip = new Vec3D();

  //---------------------------angle detection 

  float tailAngle;
  float tailVAngle;
  Vec3D tailPerip = new Vec3D();

  //---------------------------future location

  Vec3D FutVec;
  Vec3D FutLoc;

  //-------------------------------------------------------CONSTRUCTOR

  Agent(Vec3D _loc,int _type) {
    loc = _loc;
    type=_type;
  }

  

  //-------------------------------------------------------FUNCTIONS

  void run() {
    t++;
    display();
    move();
    drawTail();
    FutLoc();
    tailVAngle = radians(tailViewAngle);

    //Additional behaviour 
    switch(type){
      
    case 0:
     // wander();
      //if (t%replCycle==0)branch();
      //if (appWander) wander();
      if (((frameCount - 1)/100) % 2 == 0) {
      seek(seekTarget);
      seek(seekTarget2);
      seek(seekTarget3);
      }
      else {
        wander();
       // seek(seekTarget11);
      //  seek(seekTarget12);
       // seek(seekTarget13);
      }
      //if (t>lifeSpan)infr_agents.remove(this);
    break;
    
   case 1:
    
     if ((frameCount/100 & 1) == 0) {
        wander();
      }
      else {
        seek(seekTarget11);
        seek(seekTarget12);
        seek(seekTarget13);
      }
    break; 
    
   case 2:
      if ((frameCount/100 & 1) == 0) {
      seek(seekTarget4);
      seek(seekTarget5);
      seek(seekTarget6);
      }
      else {
        wander();

      } 
   
   break;
   
   default:
      if ((frameCount/100 & 1) == 0) {
        wander();
      }
      else {
        seek(seekTarget14);
        seek(seekTarget15);
        seek(seekTarget16);
      }        
    break;
    }
  }

  /*void branch() {
    switch(type){
    case 0:
      Agent myAgent = new Agent (new Vec3D(this.loc.x, this.loc.y, this.loc.z), 0);   
      infr_agents.add(myAgent);
    break;
   case 1:
       myAgent = new Agent (new Vec3D(this.loc.x, this.loc.y, this.loc.z), 1);   
      work_agents.add(myAgent);
    break;
    case 2:
       myAgent = new Agent (new Vec3D(this.loc.x, this.loc.y, this.loc.z),2);   
      clea_agents.add(myAgent);
   break;
  }
  }*/


  //--------------------------------------------------------TAIL SEEK

  void tailSeek(ArrayList<Vec3D> field) {

    tailSeparate(tailSepMag, tailSepViewRange, field);
    tailCohesion(tailCohMag, tailCohViewRange, field);
  }

  //------------------------------------------------------------TAIL COHESION

  void tailCohesion(float magnitude, float range, ArrayList <Vec3D> field) {

    Vec3D sum = new Vec3D();
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int i = 0; i < field.size (); i++) {
      float distance = FutLoc.distanceTo(field.get(i));
      if (distance > 0 && distance < range) {
        tailPerip = (field.get(i)).sub(loc);
        tailAngle = tailPerip.angleBetween(speed, true);
        if (tailAngle < 0) tailAngle += 1.5;
        if (abs(tailAngle) < tailVAngle ) {
          sum.addSelf(field.get(i));
          count++;
        }
      }
    }
    if (count>0) {
      sum.scaleSelf(1.0/count);
      steer = sum.sub(loc);
      // steer.normalize();
      steer.scaleSelf(magnitude);
      acc.addSelf(steer);
    }
  }

  //------------------------------------------------------TAIL SEPARATE

  void tailSeparate(float magnitude, float range, ArrayList <Vec3D> field) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int i = 0; i < field.size (); i++) {
      float distance = FutLoc.distanceTo(field.get(i));
      if (distance > 0 && distance < range) {
        tailPerip = (field.get(i)).sub(loc);
        tailAngle = tailPerip.angleBetween(speed, true);
        if (tailAngle < 0) tailAngle += PI;
        if (abs(tailAngle) < tailVAngle ) {
          Vec3D diff = loc.sub(field.get(i));
          diff.normalizeTo(1.0/distance);
          steer.addSelf(diff);
          count++;
        }
      }
    }
    if (count > 0) {
      steer.scaleSelf(1.0/count);
    }
    //steer.normalize();
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }



  //-----------------------------------------------------------------MOVE

  void move() {

    speed.addSelf(acc);
    speed.limit(maxVel);
    loc.addSelf(speed);
    acc.clear();
  }

  //-----------------------------------------------------------------DISPLAY

  void display() {
    strokeWeight(3);
    stroke(0);
    point(loc.x, loc.y, loc.z);
  }

  //------------------------------------------------------------DRAW TAIL

  void drawTail() {
    Tcount++;
    if (Tcount > TStep) {
      tail.add(loc.copy());
      Tcount = 30;
    }
    if (tail.size() > TLen) {
      tail.remove(0);
    }

    for ( int i = 1; i < tail.size (); i++ ) {    

      Vec3D a = tail.get(i-1);
      Vec3D b = tail.get(i);
      if (a.distanceTo(b) < 30) {
        switch(type){
       case 0:
          stroke(255,218,185, map(i, 0, tail.size(), 0, 255));
          strokeWeight(map(i, 0, tail.size(), 0.5, random(2,6)));
        break;
        case 1:
          stroke(205,102,0, map(i, 0, tail.size(), 0, 255));
          strokeWeight(map(i, 0, tail.size(), 0.5, random(2,5)));
        break;
        case 2:
          stroke(50,13,0, map(i, 0, tail.size(), 0, 255));
          strokeWeight(map(i, 0, tail.size(), 0.5, random(2,7)));
        break;
       default:
          stroke(139,69,0, map(i, 0, tail.size(), 0, 255));
          strokeWeight(map(i, 0, tail.size(), 0.5, random(3,8)));
        break;
        
      }
      line(a.x, a.y, a.z, b.x, b.y, b.z);
    }
  }
  }

  //--------------------------------------------------------PREDICT FUT LOC / magician
  void FutLoc() {

    FutVec = speed.copy();
    FutVec.normalize();
    FutVec.scaleSelf(futLocMag);
    FutLoc = FutVec.addSelf(loc);
    stroke(50, 100);
    strokeWeight(0.5);
    if (futPrev) line(loc.x, loc.y, loc.z, FutLoc.x, FutLoc.y, FutLoc.z);
  }

  //-----------------------------------------------------------WANDER / drunkenness

  void wander() {
    float wanderR = 50;
    float wanderD = 5;
    float change = 5;
    wandertheta += random(-change, change);
    Vec3D circleLoc = speed.copy();
    circleLoc.normalize();
    circleLoc.scaleSelf(wanderD);
    circleLoc.addSelf(loc); 
    Vec3D circleOffSet = new Vec3D(wanderR*cos(wandertheta), wanderR*sin(wandertheta), 0);
    Vec3D target = circleLoc.addSelf(circleOffSet);
    Vec3D steer = target.sub(loc);
    steer.normalize();
    steer.scaleSelf(1);
    acc.addSelf(steer);
  }

  //-----------------------------------SEEK TARGET

  void seek(Vec3D target) {

    float distanceT = target.distanceTo(loc);

    if (distanceT > 0 && distanceT < 800) {

      Vec3D desired = target.sub(loc);       
      desired.normalize();
      desired.scaleSelf(att);
      Vec3D steerTarget = desired.sub(speed);
      steerTarget.limit(maxAttract);
      acc.addSelf(steerTarget);
    }
  }

}

void volumeWrap(){
  
  for(int i=0;i<infr_agents.size();i++){
   Agent a=(Agent)infr_agents.get(i);   
   for(Vec3D v:a.tail){   
     brush.drawAtAbsolutePos(v,1);     
   }    
  }   
   
    volume.closeSides();  
    surface.reset();
    surface.computeSurfaceMesh(mesh,ISO_THRESHOLD);
}

void volumeWrap1(){
   
   for(int i=0;i<work_agents.size();i++){
   Agent a=(Agent)work_agents.get(i);   
   for(Vec3D v1:a.tail){   
     brush1.drawAtAbsolutePos(v1,1);     
   }    
  }  
  
    volume1.closeSides();  
    surface1.reset();
    surface1.computeSurfaceMesh(mesh1,ISO_THRESHOLD);
    
}
void volumeWrap2(){
    
   for(int i=0;i<leas_agents.size();i++){
   Agent a=(Agent)leas_agents.get(i);   
   for(Vec3D v2:a.tail){   
     brush2.drawAtAbsolutePos(v2,1);     
   }    
  }  
  
    volume2.closeSides();  
    surface2.reset();
    surface2.computeSurfaceMesh(mesh2,ISO_THRESHOLD);
    
}
void volumeWrap3(){
    
   for(int i=0;i<clea_agents.size();i++){
   Agent a=(Agent)clea_agents.get(i);   
   for(Vec3D v3:a.tail){   
     brush3.drawAtAbsolutePos(v3,1);     
   }    
  }  
   
    volume3.closeSides();  
    surface3.reset();
    surface3.computeSurfaceMesh(mesh3,ISO_THRESHOLD);   

  
}

void countFrMesh() {

  int smLap = 10;
  
  volumeWrap();
  for (int i = 0; i < smLap; i++) {
  new LaplacianSmooth().filter(mesh, 1);
  }
  mesh.saveAsSTL(sketchPath("STL2/"+month()+""+day()+"_"+hour()+"_"+minute()+"_"+second()+"mesh.stl"));
  mesh.clear();

  volumeWrap1();
  for (int i = 0; i < smLap; i++) {
  new LaplacianSmooth().filter(mesh1, 1);
  }
  mesh1.saveAsSTL(sketchPath("STL2/"+month()+""+day()+"_"+hour()+"_"+minute()+"_"+second()+"mesh1.stl"));
  mesh1.clear();

  volumeWrap2();
  for (int i = 0; i < smLap; i++) {
  new LaplacianSmooth().filter(mesh2, 1);
  }
  mesh2.saveAsSTL(sketchPath("STL2/"+month()+""+day()+"_"+hour()+"_"+minute()+"_"+second()+"mesh2.stl"));
  mesh2.clear();
  
  volumeWrap3();
  for (int i = 0; i < smLap; i++) {
  new LaplacianSmooth().filter(mesh3, 1);
  }
  mesh3.saveAsSTL(sketchPath("STL2/"+month()+""+day()+"_"+hour()+"_"+minute()+"_"+second()+"mesh3.stl"));
  mesh3.clear();
  
}



