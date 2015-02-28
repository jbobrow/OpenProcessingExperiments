
import processing.opengl.*;
import toxi.geom.*;

int count = 0;
int plantCount;
int flyCount;
int bugCount;
int plantAddition = 5;
int bugAddition = 5;
int flyAddition = 5;

//initialize plants array
ArrayList plants;

//initialize flies array
ArrayList flies;

//initialize bugs array
ArrayList bugs;


//=====================================================================//SETUP
void setup() {
  size(900, 600, OPENGL);
  colorMode(HSB);
  smooth();
  background(0);

  //-----------------------------------------------------------------------

  //initialize plants array
  plants = new ArrayList();

  //initialize flies array
  flies = new ArrayList();

  //initialize red flies array
  bugs = new ArrayList();


  //---------------------------------------------------GENERATE PLANTS
  for (int i = 0; i < 20; i++) {
    Vec3D origin = new Vec3D(random(width), random(height), 0);
    plant Fly = new plant(origin);
    plants.add(Fly);
  }
  //---------------------------------------------------GENERATE FLIES
  for (int j = 0; j < 750; j++) {
    Vec3D origin = new Vec3D(random(width), random(height), 0);
    fly flygy = new fly(origin);
    flies.add(flygy);
  }
  //---------------------------------------------------GENERATE BUGS
  for (int k = 0; k < 30; k++) {
    Vec3D origin = new Vec3D(random(width), random(height), 0);
    bug reddy = new bug(origin);
    bugs.add(reddy);
  }
}

//======================================================================//DRAW
void draw() {
  //background(0);
  fill(0, 5);
  noStroke();
  rect(0, 0, width, height);

 
  //-----------------------------------------------------Draw plants
  
  for (int i = 0; i < plants.size(); i++) {
    plant F = (plant) plants.get(i);
    F.run();
  }

  //-----------------------------------------------------Draw flies
  if(((frameCount/10)*10) == frameCount) flyCount = flyCount-flyAddition;
  if(flyCount == flies.size() || flyCount > flies.size()-1){
   flyAddition = flyAddition * (-1);
   flyCount = flies.size() - flyAddition;
  }
  if(flyCount == 0 || flyCount < 0){
   flyCount = flyAddition;
   flyAddition = flyAddition * (-1);
  }
  print("  /flyCount:  " + flyCount + "  /  ");
  for (int j = 0; j < flyCount; j++) {
    fly B = (fly) flies.get(j);
    B.run();
  }
  
  //-----------------------------------------------------Draw bugs
  for (int k = 0; k < bugs.size(); k++) {
    bug R = (bug) bugs.get(k);
    R.run();
  }
  
  print("  /frameCount:  " + frameCount + "  /  ");
}


