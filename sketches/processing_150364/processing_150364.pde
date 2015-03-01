
/*
 * Creative Coding
 * Week 2, 03 - n squares
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * In the next iteration of the square drawing sketch, this version selects a random number of squares
 * and a random gap between them. From this it calculates the width of each square then draws the squares
 * using two nested for loops.
 *
 * A simple drop shadow is also drawn to give the illusion of depth.
 * 
 */
float offsetX, offsetY, shadowOffset, altitude, radius,cellsize;
int color1,color2,col;
ArrayList<Cube> cubes;

void setup() {
  size(600, 600);
  rectMode(CORNER);
  cubes=new ArrayList<Cube>();
  noStroke();
  //frameRate(8);  // set the frame rate to 1 draw() call per second
  background(0xFF11EEAA); // clear the screen to grey//int(random(256)),int(random(256)),int(random(256)),255);//
  int num = 5;   // select a random number of squares each frame
  int gap =10;//3+int(random(10)); // select a r::andom gap between each square
  color1=0xFF580032;//color(int(random(256)),int(random(256)),int(random(256)),255);//
  color2=0xFFDD3F20;//color(int(random(256)),int(random(256)),int(random(256)),255);//

  // calculate the size of each square for the given number of squares and gap between them
  cellsize = ( width-20 - (num + 1) * gap ) / (float)num;

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {   
      altitude=random(3*cellsize);
      col=(random(1)>.1)?color1:color2;
      //cubes.add(new Cube(gap * (i+1) + cellsize * i , gap * (j+1) + cellsize * j,cellsize, radius,altitude,col));
      cubes.add(new Cube(5+gap * (i+1.3) + cellsize * i , 5+gap * (j+1.3) + cellsize * j,cellsize, cellsize/4,altitude,col));
    }
  }
  
}


void draw() {

  background(0xFF11EEAA);
  //cubes.get(int(random(cubes.size()))).altitude=random(2*cellsize);
  //java.util.Collections.sort(cubes);
  for(int i=0;i<cubes.size();i++){
    cubes.get(i).display();
  }
  if(frameCount%500==0)setup();
} //end of draw 

class Cube  { //implements Comparable<Cube>
  
  float x, y,radius,altitude; // X-coordinate, y-coordinate
  float tempAltitude;
  float side; // Side of the square
  int rythmn;
  int col;

  Cube(float x, float y, float side,float radius,float altitude,color col) {
  
    this.x=x;
    this.y=y;
    this.side=side;
    this.altitude=altitude;
    this.radius=radius;
    this.col=col;
    rythmn=abs(random(20,50));
  }
  
  void display() {
    float inc=abs(sin((float)frameCount/rythmn));
    if(inc>.99)altitude=random(3*side);
    float tempAltitude=lerp(altitude,0,inc);
    fill(0x88110011); // shadow
    rect(x,y,side,side, radius);
    fill(col);
    rect(x-1-tempAltitude/15,y-1-tempAltitude/15,side,side,radius);

  }
//   //@ Override
//  public int compareTo(Cube c)
//  {
//    if (altitude < c.altitude)
//      return -1;
//    if (altitude > c.altitude)
//      return 1;
//    return 0;
//  }
}
