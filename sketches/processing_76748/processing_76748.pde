
/*****************************************
 * Assignment 3
 * Name: Emma Sawin
 * E-mail: esawin@haverford.edu
 * Course:  CS 110 - Section 01
 * Submitted: 9/26/2012
 *
 * This file contains a class defining an object 
 * that draws a firework which grows as time passes.
 * It also draws a firework using this class wherever 
 * the mouse is clicked.
 *
***********************************************/
/*****************************************
 *Draws a randomly colored firework that 
 *expands over time
 *
 *@ Emma Sawin (esawin@haverford.edu)
 *
***********************************************/
class Firework {
  //x-coordinate
  int x;
  //y-coordinate
  int y;
  //time since created
  float t;
  //random color generator
  float amountRed;
  float amountGreen;
  float amountBlue;

  /**Constructor
  * @param xCoordinate the initial x coordiante of the firework
  * @param yCoordinate the initial y coordiante of the firework
  */
  Firework(int xCoordinate, int yCoordinate) {
    x = xCoordinate;
    y = yCoordinate;
    t = 0;
    amountRed = random(0, 255);
    amountGreen = random(0, 255);
    amountBlue = random(0, 255);
  }
  
  //draw the firework
  void display() {
    fill(amountRed, amountGreen, amountBlue);
    if (t < 150){
      for (int i = 0; i<10; i++){
        ellipse(x, y + (t / 5) * i, 5, 5);
      }
      for (int i = 0; i<10; i++){
        ellipse(x, y - (t / 5) * i, 5, 5);
      }
      for (int i = 0; i<10; i++){
        ellipse(x + (t / 5) * i, y, 5, 5);
      }
      for (int i = 0; i<10; i++){
        ellipse(x - (t / 5) * i, y, 5, 5);
      }
      for (int i = 0; i<10; i++){
        ellipse(x - (t / 7) * i, y - (t / 7) * i, 5, 5);
      }
      for (int i = 0; i<10; i++){
        ellipse(x - (t / 7) * i, y + (t / 7) * i, 5, 5);
      }
       for (int i = 0; i<10; i++){
        ellipse(x + (t / 7) * i, y - (t / 7) * i, 5, 5);
      }
       for (int i = 0; i<10; i++){
        ellipse(x + (t / 7) * i, y + (t / 7) * i, 5, 5);
      }
       for (int i = 0; i<10; i++){
        ellipse(x - (t / 10.5) * i, y- (t / 5.5) * i, 5, 5);
      }
      for (int i = 0; i<10; i++){
        ellipse(x - (t / 10.5) * i, y+ (t / 5.5) * i, 5, 5);
      }
      for (int i = 0; i<10; i++){
        ellipse(x + (t / 10.5) * i, y- (t / 5.5) * i, 5, 5);
      }
      for (int i = 0; i<10; i++){
        ellipse(x + (t / 10.5) * i, y+ (t / 5.5) * i, 5, 5);
      }
      for (int i = 0; i<10; i++){
        ellipse(x + (t / 5.5) * i, y+ (t / 10.5) * i, 5, 5);
      }
      for (int i = 0; i<10; i++){
        ellipse(x - (t / 5.5) * i, y+ (t / 10.5) * i, 5, 5);
      }
      for (int i = 0; i<10; i++){
        ellipse(x + (t / 5.5) * i, y- (t / 10.5) * i, 5, 5);
      }
      for (int i = 0; i<10; i++){
        ellipse(x - (t / 5.5) * i, y- (t / 10.5) * i, 5, 5);
      }
    }
  }
  
  //advance the animation with time
  void step(){
    t++;
  }
} 

//max number of objects that can be displayed at onece
int MAX_NUM_OBJECTS = 10;

//array of fireworks
Firework[] fireworks = new Firework[MAX_NUM_OBJECTS];

//counter to show where to place new fireworks
int idxFireworks = 0;

void setup(){
  size(500,500);
}

void draw() {
  
  background(0);
  
  for (int i = 0; i<MAX_NUM_OBJECTS; i++){
    
    if (fireworks[i] !=null){
      fireworks[i].step();
      fireworks[i].display(); 
    }
  }
}

void mousePressed(){
  fireworks[idxFireworks]= new Firework( mouseX, mouseY);
  idxFireworks = (idxFireworks+1)%MAX_NUM_OBJECTS;
}
