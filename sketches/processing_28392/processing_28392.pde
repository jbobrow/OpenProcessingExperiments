
/* adaption of example 5.8 in 'Learning Processing' By Daniel Shiffman
state 0 = left to right
state 1 = top to bottom
state 2 = right to left
state 3 = bottom to top */

int x = 0; //square x position
int y = 0; //square y position

int speed = 5; //speed of square

int state = 0; //set 'state' of square

//setup canvas//
void setup() {
  size(200,200);
  smooth();
  frameRate(50); //limit frame rate
}
//drawing loop//
void draw(){
  background(255,155,28); //orange background
  noStroke(); //square has no outline
  fill(28,155,255); //fill the square blue
  rect(x,y,15,15); //draw rectangle from x and y coords determined by conditionals
  if (state == 0){ //is rectangle is in state 0
    x = x + speed; //move rect from left to right
    if (x > width - 15){ //if rect has reached end of horizontal canvas
      x = width - 15; //set x position (stop it increasing)
      state = 1; //change state to state 1
    }
  } else if (state == 1){ //if state = 1
    y = y + speed; // more rectangle down
    if(y > height - 15){ //if rect has reached bottom  of vertical canvas
      y = height - 15; //set y position (stop it increasing)
      state = 2;  //set state to state 2
    }
  } else if (state == 2){ //if state = 2
    x = x - speed; // move rect from right to left
    if(x < 0){ //if x reaches the bottom left
      x = 0; //set x position
      state = 3; //change state to state 3
    }
  } else if (state == 3){ // if state = 3
    y = y - speed; // move rect up from bottom to top
    if(y < 0) { // if rect has reached the top
      y = 0; //set y position (to stop it increasing)
      state = 0; //go back to state 1
    }
  }
} // loop
