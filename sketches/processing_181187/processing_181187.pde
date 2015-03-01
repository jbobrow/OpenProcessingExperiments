
/*
Linear Tweening

Calculate tween for a given starting point, ending point and duration

In this example, the ball's speed varies with distance, but the duration of its movement remains constant.

Based on Robert Penner's highly informative chapter on tweening: http://robertpenner.com/easing/penner_chapter7_tweening.pdf

*/

int duration = 500; //how long the transition should last, in milliseconds
int starttime;      //when did the transition start

float startX, startY;  //where did we start?
float currX, currY;  //where are we now?
float destX, destY;  //where are we going?

void setup(){
  size(200,200);
  
  //some random initial values
   startX = random(width);
   startY = random(height);
   destX = random(width);
   destY = random(height);
   currX = startX;
   currY = startY;
   
  starttime = millis();  //we start now
}

void draw(){
  background(0,0,0);
  
  //show the starting + ending positions
  fill(125,125,125);
  ellipse(startX, startY, 10,10);
  fill(255,0,0);
  ellipse(destX, destY, 10,10);
  
  if( millis() < starttime + duration ){  //are we done yet?
    fill(255,255,255);
    ellipse(currX, currY, 10,10);  //draw the current position
    
    //calculate velocity
    float xVelocity = (destX - startX) / duration;
    float yVelocity = (destY - startY) / duration;
    
    //calculate position (current position + velocity * elapsed time)
    currX = startX + xVelocity * (millis() - starttime);
    currY = startY + yVelocity * (millis() - starttime);
  }
  else{ 
    //create a new destination and start again
    startX = destX;
    startY = destY;
    destX = random(width);
    destY = random(height);
    starttime = millis();
  }
}



