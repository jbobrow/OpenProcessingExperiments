

// import packages
import toxi.geom.mesh.*;
import controlP5.*;
import toxi.physics.*;
import toxi.physics.constraints.*;
import toxi.physics.behaviors.*;
import toxi.physics2d.*;
import peasy.*;
import toxi.geom.*;
import processing.opengl.*;

// Bar Controller
ControlP5 conP5;
ControlWindow conWin;

// Define Camera movable
PeasyCam cam;

// Define world with physics
VerletPhysics physics;

VerletParticle selected = null;
float snapDist = 10*10;

boolean running = false;
boolean Reset = false;

// Define screen and box size
int boxSize = 600;
int scrWidth = 600;
int scrHeight = 600;

// Define physics constants
// float gravity = 3;
float drag = 0.01;
// initial spring paremeter
float stren = 0.001;

// set spring's strength
//
// sW : spring weight
// rl : rest length
// ideal : stretched length
// res : spring strength
float sW = 1;
float rl = 1;
float ideal = 0;
float res = 1;

// check between length
float blen=0;

//Vec3D cen;
Vec3D newLoc;

// Define first element
Constructor unit;

// Whole elements except first one
ArrayList geoCollection;

//create a list to store our special agent particles
// ArrayList<Agent> agents = new ArrayList<Agent>();

// Initialise
void setup(){
  smooth();
  size(scrWidth,scrHeight,OPENGL);
  
  geoCollection = new ArrayList();

// Initialize whole elements
/*  
  for (int i = 0; i<10; i++){
    Vec3D origin = new Vec3D(random(-100,100),random(-100,100),random(-100,100));
    Constructor units = new Constructor(origin);
    geoCollection.add(units);
  }
*/

//  initialise world  
  physics = new VerletPhysics();
//  Define 0,0,0 as center  
//  Vec3D cent = new Vec3D(0,0,0);
  Vec3D newLoc = new Vec3D(50,50,50);

//  PeasyCam(processing.core.PApplet parent, double distance)   
  cam = new PeasyCam(this,0,0,0,200);

//  turn on Panel
  setupP5();


// Initialize First Element
  unit = new Constructor(newLoc);
  unit.addStructure();
 
}



void draw(){
    
  background(0);   
// draw first element
  unit.drawMeshes();
  unit.standSprings();
// draw whole element except first one
  for (int i=0; i< geoCollection.size();i++){
    Constructor ut = (Constructor) geoCollection.get(i);
    ut.drawMeshes();
    ut.standSprings();

  }

// run world while 'running' parameter is on
  if (running) {
// apply physics
    unit.physics.update();
    for (int i=0; i< geoCollection.size();i++){
      Constructor ut = (Constructor) geoCollection.get(i);
      ut.physics.update();
    }
    
// apply agent of first element
    for (Agent a:unit.agents){
      a.updateAgent();
    }
    

// apply agent of whole elements except first one    
    for (int i=0; i< geoCollection.size();i++){
      Constructor ut = (Constructor) geoCollection.get(i);
      for (Agent a3:ut.agents){
        a3.updateAgent();
        
      }
      
    }    
}

// reset to start
  if (Reset){
    
    Vec3D newLoc = new Vec3D(50,50,50);
    
    unit = new Constructor(newLoc);
    unit.addStructure();
    geoCollection.clear();
    
    Reset = false;
  }
  

// define big box
  stroke(100);
  strokeWeight(0.4);
  noFill();
  box(2*boxSize);

}

class Agent extends VerletParticle {
  
// location, speed, acceleration
  Vec3D loc = new Vec3D(0,0,0);
  Vec3D speed;
  Vec3D acc = new Vec3D();
// flocking parameters  
  float separate = 1;
  float cohesion = 10;
  float align = 10;
  
// initial speed
  float ispeed = 1;

  
  //inherit verlet particle constructor
  Agent(Vec3D _v){
    super(_v);
    speed = new Vec3D(random(-ispeed,ispeed),random(-ispeed,ispeed),random(-ispeed,ispeed));
    
  }
  
//run function
  void updateAgent(){
    agentMove();
  }

// locate  
  void updateLoc(){
    loc = new Vec3D(super.x,super.y,super.z);
  }
// make move  
  void agentMove(){
    
    speed.add(acc);
//    addForce(acc);
    addVelocity(speed);
    flock();
    bounce();
    updateLoc();
  }

// limit movements of elements  
  void bounce(){

   if (super.x > boxSize){
     super.x = boxSize;
     speed.x = speed.x * -1;
//     acc.x = acc.x * -1;
   }
   if (super.x < -boxSize){
     super.x = -boxSize;
     speed.x = speed.x * -1;
//     acc.x = acc.x * -1;
   }

   if (super.y > boxSize){
     super.y = boxSize;
     speed.y = speed.y * -1;
//     acc.y = acc.y * -1;
   }
   if (super.y < -boxSize){
     super.y = -boxSize;
     speed.y = speed.y * -1;
//     acc.y = acc.y * -1;
   }

   if (super.z > boxSize){
     super.z = boxSize;
     speed.z = speed.z * -1;
//     acc.z = acc.z * -1;
   }
   if (super.z < -boxSize){
     super.z = -boxSize;
     speed.z = speed.z * -1;
//     acc.z = acc.z * -1;
   }
   
  }
    


// flock movement
  void flock(){
   
   separate(separate);
   cohesion(cohesion);
   align(align);
    
  }

// alignment - Steer in the same direction (apply only to boxes and toruses)
  void align(float magnitude){
    
    Vec3D steer = new Vec3D();
  // count the number of elements
    int count = 0;
    
    for(int i = 0; i< geoCollection.size();i++){
      Constructor other = (Constructor) geoCollection.get(i);
      float distance = super.distanceTo(other.location);
      
      if (distance >0 && distance < 200){
 
 // give property only to boxes and toruses
        if(other.geoType == 1 || other.geoType == 2){
          steer.addSelf(speed);
        }
  // count the number of elements <1:boxes> and <2:toruses> within distance         
        count++;
      }
    }
  // divide with the number of applied elements
    if(count>0){
      steer.scaleSelf(1.0/count);
    }
//    steer.scaleSelf(1.0/geoCollection.size());
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);   
    
  }

 
// cohesion - steer towards the center of elements (apply only to boxes and toruses)
  void cohesion(float magnitude){
    
    Vec3D sum = new Vec3D();
  // count the number of elements
    int count = 0;
    
    for(int i = 0; i< geoCollection.size();i++){
      Constructor other = (Constructor) geoCollection.get(i);
      float distance = super.distanceTo(other.location);
      
  // give cohesion property only to boxes and toruses      
      if (distance >0 && distance < 200){
        if (other.geoType == 1 || other.geoType == 2){
          sum.addSelf(other.location);
        }
   // count the number of elements within distance
        count++;
               
      }
    }    
    
// make average vector by division

    if(count>0){
      sum.scaleSelf(1.0/count);
    }
//    sum.scaleSelf(1.0/geoCollection.size());
    Vec3D steer = sum.sub(loc);
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  
  }
  

// separate - steer to avoid colliding (apply to all elements)
  void separate(float magnitude){
    
    Vec3D steer = new Vec3D();
    int count = 0;
    
    for(int i = 0; i< geoCollection.size();i++){
      Constructor other = (Constructor) geoCollection.get(i);
      float distance = loc.distanceTo(other.location);
      
      if (distance >0 && distance < 50){
        
        Vec3D diff = loc.sub(other.location);
        diff.normalizeTo(1.0/distance);
        
        steer.addSelf(diff);
        count++;

      }
    }

    if(count>0){
      steer.scaleSelf(1.0/count);
    }
//    steer.scaleSelf(1.0/geoCollection.size());  
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);  
    
  }  
}

// shape Builder

class Constructor {
 
// origin of element
  Vec3D cen;
// location of element
  Vec3D location = new Vec3D(0,0,0);
// define meshes
  TriangleMesh m;
  WETriangleMesh meshes;
// agent array
  ArrayList<Agent> agents = new ArrayList<Agent>();
  
  VerletPhysics physics;
// selection shape 
  int casenum;
  int geoType;

 

// constructor of class with origin
  Constructor (Vec3D _cen){
    
    cen = _cen;
//    location = _cen;
    physics = new VerletPhysics();

// randomly select type out of 4 shapes  
    casenum = int(random(0,4));
   
    switch(casenum){
  // diamonds
      case 0:      
        m = (TriangleMesh) new STLReader().loadBinary(sketchPath("seg6.stl"),STLReader.TRIANGLEMESH);
        geoType = casenum;
        break;
  // boxes
      case 1:
        m = (TriangleMesh) new STLReader().loadBinary(sketchPath("box.stl"),STLReader.TRIANGLEMESH);
        geoType = casenum;
        break;
  // toruses
      case 2:
        m = (TriangleMesh) new STLReader().loadBinary(sketchPath("torus.stl"),STLReader.TRIANGLEMESH);
        geoType = casenum;
        break;
  // pyramids
      case 3:
        m = (TriangleMesh) new STLReader().loadBinary(sketchPath("pyramid.stl"),STLReader.TRIANGLEMESH);
        geoType = casenum;
        break;
    } 
    meshes = m.toWEMesh();
    
  }

 
// construct particles and springs with physics
  void addStructure(){

    physics = new VerletPhysics();
  //physics.addBehavior(new GravityBehavior(new Vec3D(0,gravity,0)));
    physics.setDrag(drag);

  //add a counter to check if we are using the first vertex
    int count =0;

  // add particles    
    for(Vertex v : meshes.vertices.values()){
      v.addSelf(cen);
  // add two agents to element
      if (count < 2){
        Agent a = new Agent(v); //make a special agent particle
        agents.add(a); //add it to our list of agents
        physics.addParticle(a); //add to the physics engine
      }else{
        physics.addParticle(new VerletParticle(v));
      }
      count++;
    }
  
//  add springs
    for (WingedEdge e : meshes.edges.values()){
      
      VerletParticle a = physics.particles.get(((Vertex) e.a).id);
      VerletParticle b = physics.particles.get(((Vertex) e.b).id);
      float sprLength = a.distanceTo(b);
      physics.addSpring(new VerletSpring(a,b,sprLength,stren));
    }
  }

// draw objects (VerletSpring)
  void drawMeshes(){
  // draw joints
    int count = 0;
    
    for (VerletSpring e : physics.springs){
      VerletParticle a = new VerletParticle(e.a);
      stroke(0,0,255);
//      if (a.isLocked() == true){
//        strokeWeight(20);
//      } else{
        strokeWeight(3);
//      }
      point(a.x,a.y,a.z);    
      
  // draw frames
      VerletParticle b = new VerletParticle(e.b);
  // apply different color to <0:diamond> and <3:pyramids>
      if (geoType == 0 || geoType == 3){
        stroke(150);
      } else {
        stroke(255,0,0);
      }
      strokeWeight(1);
      beginShape();
      vertex(a.x,a.y,a.z);
      vertex(b.x,b.y,b.z);
      endShape();

  // locate element      
      if (count < 1){
        location = new Vec3D(a.x,a.y,a.z);
      }
      count++;     
    }    
  
  }
// set spring's strength
  // sW : spring weight
  // rl : rest length
  // ideal : stretched length
  // res : spring strength
  void standSprings(){
    for (VerletSpring e : physics.springs) {
       e.a.setWeight(sW);
       e.b.setWeight(sW);
       e.setRestLength((e.getRestLength()*rl)+(ideal*(1-rl)));
       e.setStrength(res);
    }
// draw lines between each elements  
  lineBetween();  
  }
  
// show the relations of elements

  void lineBetween(){
        
    for(int i = 0; i< geoCollection.size();i++){
      Constructor allCon = (Constructor) geoCollection.get(i);
      float distance = this.location.distanceTo(allCon.location);
  // connect elements with red line within distance <blen>    
      if (distance >0 && distance <blen ){
  // apply different color to <0:diamond> and <3:pyramids>
      if (geoType == 0 || geoType == 3){
        stroke(100);
      } else {
        stroke(255,0,255);
      }
  //     stroke(255,0,255);
        strokeWeight(0.2);
  // line between objects
        line(location.x,location.y,location.z, allCon.location.x, allCon.location.y,allCon.location.z);
      }
    }
  }
  
}
// Keys

void keyPressed() {

// add an element with mouse position by pressing 'a'
  if (key =='a' || key =='A'){
    
    Vec2D mousePos = new Vec2D(mouseX,mouseY);
    println("Key A pressed"+str(mouseX)+" "+str(mouseY));
    println("number of box ="+geoCollection.size());
    
    geoCollection.add(new Constructor(new Vec3D(map(mousePos.x,0,scrWidth,-boxSize,boxSize),map(mousePos.y,0,scrHeight,-boxSize,boxSize),random(-boxSize,boxSize))));

    Constructor gc = (Constructor) geoCollection.get(geoCollection.size()-1);
    gc.addStructure();

  }

// add group of elements (20) by pressing 'g'
   if (key =='g' || key =='G'){
    
    Vec2D mousePos = new Vec2D(mouseX,mouseY);

    for (int i=0; i<20; i++){    
      geoCollection.add(new Constructor(new Vec3D(map(mousePos.x,0,scrWidth,-boxSize,boxSize),map(mousePos.y,0,scrHeight,-boxSize,boxSize),random(-boxSize,boxSize))));

      Constructor gc = (Constructor) geoCollection.get(geoCollection.size()-1);
      gc.addStructure();
    }
  }
 
// press 'space bar' to toggle movements  
  if (keyCode==' ') {
    running=!running;
  }
// press 'r' to reset
  if (key=='r') {
      Reset=true;
  }

}

/*
void mousePressed(){
  
   if (mousePressed && mouseButton == LEFT){
    
    Vec2D mousePos = new Vec2D(mouseX,mouseY);

    for (int i=0; i<30; i++){    
      geoCollection.add(new Constructor(new Vec3D(map(mousePos.x,0,scrWidth,-boxSize,boxSize),map(mousePos.y,0,scrHeight,-boxSize,boxSize),random(-boxSize,boxSize))));

      Constructor gc = (Constructor) geoCollection.get(geoCollection.size()-1);
      gc.addStructure();
    }
   }
}
*/
// Setting up Sliders

void setupP5(){


// initialize a panel and set property
  conP5 = new ControlP5(this);
  conP5.setAutoDraw(false);
  conWin = conP5.addControlWindow("contP5win",100,100,400,250);
  conWin.hideCoordinates();
  

// adjust parameters

  // control springs
  Controller mSlider1 = conP5.addSlider("rl",0,1).linebreak();
  mSlider1.setWindow(conWin);
  
  Controller mSlider2 = conP5.addSlider("stren",0,0.5).linebreak();
  mSlider2.setWindow(conWin);

  Controller mSlider3 = conP5.addSlider("blen",0,300).linebreak();
  mSlider3.setWindow(conWin);  
  
  Controller mSlider4 = conP5.addSlider("ideal",0,10).linebreak();
  mSlider4.setWindow(conWin);

  // control movements
  Controller mSlider5 = conP5.addSlider("separate",0,10).linebreak();
  mSlider5.setWindow(conWin);
  
  Controller mSlider6 = conP5.addSlider("cohesion",0,10).linebreak();
  mSlider6.setWindow(conWin);
  
  Controller mSlider7 = conP5.addSlider("align",0,10).linebreak();
  mSlider7.setWindow(conWin);

  // key references  
  Textlabel field1 = conP5.addTextlabel("a","Press 'A' to add an element",20,180);
  field1.setWindow(conWin);

  Textlabel field2 = conP5.addTextlabel("b","Press 'G' to add group elements",20,190);
  field2.setWindow(conWin);

  Textlabel field3 = conP5.addTextlabel("c","Press 'SPACE' to toggle movements",20,200);
  field3.setWindow(conWin);

  Textlabel field4 = conP5.addTextlabel("d","Press 'R' to RESET",20,210);
  field4.setWindow(conWin);



  
  Toggle Redraw = conP5.addToggle("Reset",false,20,220,10,10);
  Redraw.setWindow(conWin);
  
  conWin.setTitle("Adjust Parameters");
    
}


