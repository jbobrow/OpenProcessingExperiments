
/*****************************************
 * Assignment 04
 * Name:         Angela Mastrianni  
 * E-mail:       amastriann@brynmawr.edu
 * Course:       CS 110 - Section 01
 * Submitted:    10/23
 * 
 * This file contains a sketch of a sky. The top half of the sky has a smiling sun,
 with clouds passing over it. The bottom half is stormy with storm clouds 
 passing over the frowning sun. There is an array of cloud objects. The maximum 
 number of clouds that can be on the sky is 10.
 ***********************************************/
//global variables
int i;
int NUM_Clouds= 0;
int d= 20;
//maximum number of objects that can be displayed
int MAX_NUM= 10;
//array of clouds
Cloud[] myCloud= new Cloud[MAX_NUM];

void setup() {
  size(500, 500);
}

void draw() {
  background(0, 150, 220);
  fill(0, 0, 212);
  rect(0, height/2, width, height);
  //smiling sun
  fill(212, 212, 0);
  ellipse(width/3, height/4, 200, 200);
  fill(0);
  ellipse(130, 100, d, d);
  ellipse(190, 100, d, d);
  arc(160, 140, 80, 80, 0.000, 3.155);
  //frowning sun
  fill(212, 212, 0);
  ellipse(width/1.5, height/1.3, 200, 200);
  fill(0);
  ellipse(360, 360, d, d);
  ellipse(300, 360, d, d);
  arc(330, 435, 80, 80, 3.115, 6.298);
  //loop through array displaying and animating clouds
  for (int i = 0; i < MAX_NUM; i++) {
    if (myCloud[i] != null) {
      myCloud[i].step();
      myCloud[i].display();
    }
  }
}  

void mousePressed() {
  myCloud[NUM_Clouds]= new Cloud(mouseX, mouseY);
  NUM_Clouds= (NUM_Clouds + 1) % MAX_NUM;
}

class Cloud {
  //variables
  int x;
  int y;
  int w;
  int h;
  // constructor
  Cloud (int xCoordinate, int yCoordinate) {
    x= xCoordinate;
    y= yCoordinate;
    w= 125;
    h=50;
  }
  //fucntion to display cloud
  void display() {
    if (y>250) {
      fill(100);
    }
    else {
      fill(225);
    }
    ellipse(x-40, y-15, w, h);
    ellipse(x+50, y-15, w, h);
    ellipse(x, y, w, h);
  }
  //function to move clouds across screen  
  void step() {
    if (x >= 0) {
      x= x+1;
    }
  }
}


