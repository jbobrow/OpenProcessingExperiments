
/*
 * Creative Coding
 * Week 2, 03 - n squares
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This interpretation creates cube objects, which evolve themselves
 *
 * A simple drop shadow is also drawn to give the illusion of depth.
 * 
 */

float offsetX, offsetY, shadowOffset;
float radius;//howmuch the corners are rounded
float cellsize;
int color1;
int num = 0;
ArrayList<Cube> cubes;

void setup() {
  size(600, 600);
  rectMode(CORNER);
  cubes=new ArrayList<Cube>();
  noStroke();
  background(0xFF11EEAA); // clear the screen to light greenish
  num++;//when setup is called, number of cubes increases
  int gap =50/num;//gap between each square

  // calculate the size of each square for the given number of squares and gap between them
  cellsize = ( width-20 - (num + 1) * gap ) / (float)num;

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {   
      offsetX=random(-3*cellsize,3*cellsize);
      offsetY=random(-3*cellsize,3*cellsize);
      //a new cube is created and added to the collection of cubes
      cubes.add(new Cube(5+gap * (i+1.3) + cellsize * i , 5+gap * (j+1.3) + cellsize * j,cellsize, cellsize/4,offsetX,offsetY));
    }
  }
}


void draw() {

  background(0xFFBBDDCC);
  //not used:java.util.Collections.sort(cubes);
  //cubes have already been created, they just have to display themselves
  for(int i=0;i<cubes.size();i++){
    cubes.get(i).display();
  }
  //every 200 frames, setup is called (num increases and the cube collection is recreated) 
  if(frameCount%200==0)setup();
} //end of draw 


//here we define the cube object
class Cube  { //not used:implements Comparable<Cube>
  
  //these variables are used by each cube object
  float x, y,radius,offX,offY; // X-coordinate, y-coordinate, corner radius, offsets
  float tempoffX,tempoffY;//intermediate values for offset animation
  float side; // Side of the square
  int rythmn;//'speed' of the cube when it moves away
  int col;//color

  //This function is the Cube object constructor, it's called when the object is created
  Cube(float x, float y, float side,float radius,float offX,float offY) {
  
  //some variables are given at creation time, some others are defined here
    this.x=x;
    this.y=y;
    this.side=side;
    this.offX=offX;
    this.offY=offY;
    this.radius=radius;
    this.col=color(int(random(0x58,0xDD)),int(random(0x00,0x3F)),int(random(0x20,0x3D)));//col;
    rythmn=abs(random(20,50));
  }
  
  void display() {
  //inc will oscillate with time and be used for animation
    float inc=abs(sin((float)frameCount/rythmn));
    //when the cube is over its shadow, new offset values are calculated
    //and color is changed
    if(inc>.9999){
    offX=random(-3*side,3*side);
    offY=random(-3*side,3*side);
    col=color(int(random(0x58,0xDD)),int(random(0x00,0x3F)),int(random(0x20,0x3D)));
    }
    //at each frame, the intermediate values of offsets are calculated
    float tempoffX=lerp(offX,0,inc);
    float tempoffY=lerp(offY,0,inc);
    fill(0xAA110011); // shadow
    rect(x,y,side,side, radius);
    fill(col);//square
    rect(x-1-tempoffX/15,y-1-tempoffY/15,side,side,radius);

  }
//  not used here: //@ Override
//  public int compareTo(Cube c)
//  {
//    if (altitude < c.altitude)
//      return -1;
//    if (altitude > c.altitude)
//      return 1;
//    return 0;
//  }
}
