
/*--------------------------------------------------------------------------------------------
 *** VARIABILI GLOBALI ed IMPORTAZIONE LIBRERIE ***
 --------------------------------------------------------------------------------------------*/
//------------------------ TOXI.GEOM
import toxi.geom.*;
//------------------------ TOXI.PHYSICS
import toxi.physics.*;
//------------------------ CONTROLP5
import controlP5.*;

//------------------------ UV-GRID
UVgrid grid;

//------------------------ FLOCK
flock myFlock;

//------------------------ VORTEX
vortex myVortex;

//------------------------ CONTROLLER
ControlP5 controller;
public float falloff = 50;
public int divisions = 40;
public float strength = 0.1;
public boolean edges = true;

/*--------------------------------------------------------------------------------------------
 *** SETUP GLOBALE ***
 --------------------------------------------------------------------------------------------*/
void setup() {
  //----------------------- GENERALE
  size(600, 600);
  smooth();
  background(0);
  
  //create UV grid
  grid = new UVgrid();
  grid.generate();
  
  myFlock = new flock(10);
  
  myVortex = new vortex(width/2, height/2, 0.1);
  
  //----------------------------------controller settings
  controller = new ControlP5(this);
  controller.addSlider("falloff", 1, 200, falloff, 10, 10, 120, 10);
  controller.addSlider("divisions", 3, 100, divisions, 210, 10, 120, 10);
  controller.addSlider("strength", 0.001, 1, strength, 410, 10, 120, 10);
  controller.addToggle("edges", true, 10, 30, 30, 10).setMode(ControlP5.SWITCH);
}

/*--------------------------------------------------------------------------------------------
 *** CICLO GLOBALE DRAW ***
 --------------------------------------------------------------------------------------------*/
 
 
void draw() {

  //----------------------- GENERALE
  background(0);
  
  myVortex.update();
  
  myFlock.update();
  grid.update();
}

class UVgrid{
  
  VerletPhysics phys;
  VerletSpring[] spr;
  float[] sprLength;
  VerletParticle[] pts;
  
  
  int nU, nV, nUV, nSprings;
  float sizeU, sizeV;
  
  UVgrid(){
  }
  
  void generate(){
    
    nU = divisions;
    nV = divisions;
    nUV = ID(nU, nV);
    nSprings = (nU - 1)*nV + (nV-1)*nU;
    sizeU = (float)width/(nU-1);
    sizeV = (float)height/(nV-1);
    
    phys = new VerletPhysics();
    pts = new VerletParticle[nUV];
    spr = new VerletSpring[nSprings];
    sprLength = new float[nSprings];
    
    //------------------------------ generating particles
    generateParticles();
    
    //------------------------------ generating springs
    generateGrid();
  }
  
  void generateParticles(){    
    for (int i = 0; i < nU; i++){
      for (int j = 0; j < nV; j++){
        pts[ID(i,j)] = new VerletParticle( sizeU * i, sizeV * j, 0 );
        phys.addParticle(pts[ID(i,j)]);
      }
    }
  }
  
  void toggleLockEdges(){      
    for (int i = 0; i < nU; i++){
      for (int j = 0; j < nV; j++){
        if(i==0 || i==nU-1 || j==0 || j==nV-1){
          if(edges){
            pts[ID(i,j)].x = sizeU * i;
            pts[ID(i,j)].y = sizeV * j;           
            pts[ID(i,j)].lock();
          }
          else pts[ID(i,j)].unlock();
        }
      }
    }
  }
  
  void generateGrid(){
    int counter = -1;
    for (int i = 0; i < nU; i++){
      for (int j = 0; j < nV; j++){
        //------------------------------ horizontal springs
        if (i < nU-1){
          counter++;
          spr[counter] = new VerletSpring(pts[ID(i,j)], pts[ID(i+1,j)], sizeU, strength);
          sprLength[counter] = sizeU;
          phys.addSpring(spr[counter]);
        }
        //------------------------------ vertical springs
        if (j < nV-1){
          counter++;
          spr[counter] = new VerletSpring(pts[ID(i,j)], pts[ID(i,j+1)], sizeV, strength);
          sprLength[counter] = sizeV;
          phys.addSpring(spr[counter]);
        }
        //------------------------------ lock if necessary
        if(edges){
          if(i==0 || i==nU-1 || j==0 || j==nV-1){
            pts[ID(i,j)].lock();
          }
        }
      }
    }
  }
  
  int ID(int x, int y){
    return x+y*nU;
  }
  
  float divisions0;
  float strength0;
  boolean edges0;
  
  void update(){
    
    if(divisions0 != divisions) generate();
    if(edges0 != edges) toggleLockEdges();
    if (strength0 != strength) for(int i = 0; i < nSprings; i++) spr[i].setStrength(strength);    
    interact();
    phys.update();
    render();
    divisions0 = divisions;
    strength0 = strength;
    edges0 = edges;
  }
  
  void render(){
    pushStyle();
    stroke(50,100,255,100);
    strokeWeight(1);
    for (int i = 0; i < nU; i++){
      for (int j = 0; j < nV; j++){
        //horizontal lines
        if(i < nU - 1) line(pts[ID(i,j)].x, pts[ID(i,j)].y, pts[ID(i+1,j)].x, pts[ID(i+1,j)].y);
        //vertical lines
        if(j < nV - 1) line(pts[ID(i,j)].x, pts[ID(i,j)].y, pts[ID(i,j+1)].x, pts[ID(i,j+1)].y);
      }
    }
    popStyle();
    
  }
      
  void interact(){
    Vec3D dis = new Vec3D();
    float lengthSpr;
    float lengthM = (sizeU + sizeV)/2;
    float lengthT = (width + height)/2;
    
    for(int i = 0; i < nSprings; i++){
      lengthSpr = sprLength[i];//spr[i].getStrength();
      for(int j = 0; j < myFlock.n; j++){        
        dis.x = myFlock.ag[j].pos.x - (spr[i].b.x + spr[i].a.x)/2;
        dis.y = myFlock.ag[j].pos.y - (spr[i].b.y + spr[i].a.y)/2;
        if (dis.magnitude() < falloff) lengthSpr *= pow(dis.magnitude()/falloff,2);
      }
      spr[i].setRestLength(lengthSpr);
    }    
  }
  
  
  
  

}

class agent{
  
  Vec3D pos, rot;
  
  agent(float x, float y){
    pos = new Vec3D(x,y,0);
  }
  
  void update(){
    envForces();
    moving();
    render();
  }
  
  void render(){
    int res = 10;  
    pushStyle();
    for(int i = 1; i <= res; i++){
      
      fill(0,0);
      stroke(0,255,0,255/i);
      ellipse(pos.x, pos.y, falloff/res*i, falloff/res*i);      
    }
    //stroke(150,255,150,255);
    //strokeWeight(1);
    noStroke();
    fill(0,255,0,255);
    ellipse(pos.x, pos.y, 5, 5);
    //fill(0,255,0,10);
    //ellipse(pos.x, pos.y, grid.lim, grid.lim);
    popStyle();
  }
  
  void envForces(){
    rot = pos.sub(myVortex.pos.x, myVortex.pos.y, 0).cross(myVortex.intensity);
    rot.normalize().scale(10);
  }
  
  void moving(){
    pos.addSelf(rot);
  }
  
}

class flock{
  
  int n;
  agent[] ag;
  
  flock(int agentsNumber){
    n = agentsNumber;
    ag = new agent[n];
    for (int i = 0; i < n; i++){
      ag[i] = new agent(random(0, width), random(0, height));
    }
  }
  
  void update(){
    for (int i = 0; i < n; i++){
      ag[i].update();
    }
  }
  
}

class vortex{
  
  Vec3D pos;
  Vec3D intensity;
  
  vortex(float x, float y, float z){
    pos = new Vec3D(x,y,z);
    intensity = new Vec3D(0,0,z);
  }
  
  void update(){
    render();
  }
  
  void render(){
    float cSize = 20;  
    pushStyle();
    stroke(200,200,255,200);
    strokeWeight(1);
    line(pos.x-cSize, pos.y, pos.x+cSize, pos.y);
    line(pos.x, pos.y-cSize, pos.x, pos.y+cSize);
    popStyle();
    
  }
  
}


