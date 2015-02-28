
/************************
 Assignment 04
 Name: Meron Kasahun
 E-mail: mkasahun@brynmawr.edu
 Course: CS 110-01
 Submitted: 10/23/2012
 Description: Falling snowflakes
 *************************/

//Create snowflake class
class Snowflake {
  int x;
  int y;

  Snowflake (int xCoordinate, int yCoordinate) {
    x = xCoordinate;
    y = yCoordinate;
  }
  
  void display() {
    ellipseMode(CENTER);
    fill (255);
    ellipse (x, y, 10, 10);
  }
  
  void step() {
    y++;
  }
}

int MAX_NUM_OBJECTS = 20;

Snowflake[] myObjects = new Snowflake[MAX_NUM_OBJECTS];

int idxMyObjects = 0;

//setup sketch
void setup() {
  size (500, 500);
}

void draw() {
  background (25, 67, 229);
  fill (250, 180);
  smooth();

  //cloud clusters
  noStroke();
  ellipse (65, 130, 200, 80);
  ellipse (100, 115, 200, 80);
  ellipse (50, 100, 200, 120);

  ellipse (200, 130, 200, 80);
  ellipse (240, 115, 200, 80);
  ellipse (230, 100, 200, 120);

  ellipse (350, 130, 200, 80);
  ellipse (390, 115, 200, 80);
  ellipse (380, 100, 200, 120);

  for (int i = 0; i < MAX_NUM_OBJECTS; i++) {
    if (myObjects[i] != null) {
      myObjects[i].step();
      myObjects[i].display();
    }
  }
}

void mousePressed() {
  myObjects[idxMyObjects] = new Snowflake(mouseX,mouseY);
  idxMyObjects = (idxMyObjects+1) % MAX_NUM_OBJECTS;
  
}
