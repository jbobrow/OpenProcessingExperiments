
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
float offsetX, offsetY, shadowOffset, altitude, radius;
int []colors;
int col;
ArrayList<Cube> cubes;

void setup() {
  size(600, 600);
  colors= new int[3];
  rectMode(CORNER);
  cubes=new ArrayList<Cube>();
  noStroke();
}


void draw() {
  if (frameCount%200==1) {
    background(0xFFE97F02); // clear the screen to grey//int(random(256)),int(random(256)),int(random(256)),255);//

    int num = 5;   // select a random number of squares each frame
    int gap =18;//3+int(random(10)); // select a r::andom gap between each square
    colors[0]=0xFF8A9B0F;//color(int(random(256)),int(random(256)),int(random(256)),255);//
    colors[1]=0xFFBD1550;//color(int(random(256)),int(random(256)),int(random(256)),255);//
    colors[2]=0xFF490A3D;
    colors[3]=0xFFF8CA00;

    // calculate the size of each square for the given number of squares and gap between them
    float cellsize = ( width - (num + 2) * gap ) / (float)num;
    radius=random(cellsize/2);

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {   
        altitude=random(.5*cellsize,2.5*cellsize);
        cubes.add(new Cube(gap * (i+.8) + cellsize * i, gap * (j+.8) + cellsize * j, cellsize, cellsize/4, altitude, colors[int(random(4))]));
      }
    }
    for (float a=0; a<2.5*cellsize; a+=30) {
      for (int i=0; i<cubes.size (); i++) {
        cubes.get(i).display(a);
      }
    }
    cubes.clear();
  }
} //end of draw 

class Cube {

  float x, y, radius, altitude; // X-coordinate, y-coordinate
  float side; // Side of the square
  int col;

  Cube(float x, float y, float side, float radius, float altitude, color col) {

    this.x=x;
    this.y=y;
    this.side=side;
    this.altitude=altitude;
    this.radius=radius;
    this.col=col;
  }

  void display(float a) {
    if (a<altitude) {
      noStroke();
      fill(0x55110011); // shadow
      rect(x+a/15, y+a/15, side+a/10, side+a/10, radius);
      fill(col);
      stroke(180);
      rect(x+a/15, y+a/15, side+a/30, side+a/30, radius);
    }
  }
}


