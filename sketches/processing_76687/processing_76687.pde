
/********************************
*Assignment #4
*Name: Siyang You
*E-mail: syou@brynmawr.edu
*Course: CS 110 - Section #1
*Submitted:  10/23/12
*
*This program sets up bouncing balls within a rectangular boundary
  I set up a ball class, and used arrays to limit the number of objects to 20 
  Each time the mouse is clicked, a new ball is generated at the location where the       mouse is just pressed
  Each ball keeps animation with time, and disappear until the 20th ball after it is generated
**********************************/


int idxBall=0;
int MAX_NUM_OBJECTS=20;


//write a class named Ball
class Ball {
  //the ball's location
  float locX;
  float locY;
  //the ball's speed on both of x and y coordinates
  float speedX=2;
  float speedY=4;

  Ball(float _locX, float _locY) {
    locX=_locX;
    locY=_locY;
  }

  void run() {
    display();
    moveBall();
    bounce();
  }
  //make sure the ball bounce inside the rectangle
  void bounce() {
    if (locX>=575) {
      locX=575;
      speedX=-speedX;
    }
    if (locX<=25) {
      locX=25;
      speedX=-speedX;
    }
    if (locY>=575) {
      locY=575;
      speedY=-speedY;
    }
    if (locY<=25) {
      locY=25;
      speedY=-speedY;
    }
  }

  //draw ball 
  void display() {
    stroke(255, 0, 0);
    strokeWeight(10);
    point(locX, locY);
  }

  //make the ball move
  void moveBall() {
    locX=locX+speedX;
    locY=locY+speedY;
  }
}

//set up an array named ballCollection
Ball[]ballCollection=new Ball[MAX_NUM_OBJECTS];

void setup() {
  size(600, 600);
  smooth();
}

void draw() {

  background(0);

  //draw rectangle
  stroke(255);
  strokeWeight(1);
  noFill();
  rectMode(CENTER);
  rect(300, 300, 550, 550);

  for (int i=0;i<ballCollection.length;i++) {
    //check if the ballCollection array is an object or is empty
    if (ballCollection[i]!=null) {
      ballCollection[i].run();
    }
  }
}

//when mouse is pressed, create a new ball wherever the mouse is clicked
void mousePressed() {
  ballCollection[idxBall]=new Ball(mouseX, mouseY);
  idxBall++;
  //set the index from 0 to 20
  //when it reaches 20, it is reset to begin again at 0
  //make sure that there is always no more than 20 balls on the screen
  if (idxBall==ballCollection.length) {
    idxBall=0;
  }
}
