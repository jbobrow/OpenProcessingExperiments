
/*
Assignment #4
Name: Jenny Mott
E-mail: jmott@brynmawr.edu
Course: CS 110-Section 01
Submitted: 10/24/2012

So, I'm thinking this will be a thing where one clicks and there appears 
a balloon, which will then float upwards to be trapped by the ceiling
- and let's say that this room has a capacity of seven balloons, so things
start popping to make room.
*/
//define some variables
int i;
int max_balloons = 7;
int idxBalloons = 0;
//get this array shit goin'
Balloon[] balloons = new Balloon[max_balloons];
//make a window
void setup() {
    size(500,550);
}
//draw some stuff in the window - some stuff referring specifically to:
//a room and then a floor and then the possibility of some balloons.
void draw() {
  background (252,228,212);
  fill(224,147,95);
  rect(0,500,width,height);
  for (int i = 0; i < max_balloons; i++) {
    if(balloons[i] != null) {
      balloons[i].step();
      balloons[i].display();
    }
  }
}
//make it so pressing the mouse gives you a new balloon
//but then also that you don't get too wild with having too many balloons
void mousePressed() {
    balloons[idxBalloons] = new Balloon (mouseX, mouseY);
    idxBalloons = (idxBalloons+1) % max_balloons;
}
//define what a balloon is
class Balloon {
  float x;
  float y;
  float ySpeed = 5;
    
  Balloon (float tempX, float tempY) {
    x = tempX;
    y = tempY;
   }
//define what i want the balloons to look like when they show up
  void display() {
    ellipseMode (CENTER);
    fill (255,0,0);
    ellipse(x, y, 60, 60);
    fill (255);
    line(x, y+30, x, y+100);
    }
//fill with helium
  void step() {
    y = y - ySpeed;
      if (y < 30) {
        ySpeed = 0;
      }
   }

}
