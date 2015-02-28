


//Import librarie
import fisica.*;
// create world
FWorld world;
// import picture
PImage CercleTex;
PImage CercleTex2;
void setup() {
  // basic stuff, framerate is 60 because fisica step is 60/sec
  size(640, 480);
  frameRate(60);
  smooth();
  // load pict
  CercleTex=loadImage("lolface.png");
  CercleTex2=loadImage("lolface2.png");
   CercleTex2.resize(50,50);
   // init motor
  Fisica.init(this);
  // setup the world
  world = new FWorld();
  world.setGravity(0, 300);
  // ask for border 
  world.setEdges();
  // remove some borders
  world.remove(world.top);
  world.remove(world.left); 
  world.remove(world.right);
 
}
void draw() {
  // create ball
  if (keyPressed&&key=='c') {
particule();
  }
  background(255);
  world.step();
  world.draw();
}
// function for create ball
void particule(){
// pict 1  or pict 2 ?
int choix = (int) random(0,2);
//create ball
    FCircle c1=new FCircle(50);
    c1.setPosition(width/2+(random(-100,100)),-100);
    // how i want ball jump
    c1.setRestitution(0.5);
 // attach one or other face
  if(choix==0){
    c1.attachImage(CercleTex);
  }else{
     c1.attachImage(CercleTex2);
  }
 // add ball to the world 
    world.add(c1);
}

