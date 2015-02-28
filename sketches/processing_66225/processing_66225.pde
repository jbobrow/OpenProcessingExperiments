
//we create and initialize the variables for the position and velocity of the two ellipses


float aBallXpos;
float aBallYpos;
float bBallXpos;
float bBallYpos;
float aVelocityX=13;
float aVelocityY=45;
float bVelocityX=23;
float bVelocityY=13;

/*We need to define the size of the canvas so we can later do math with it, define a framerate so "the speed is constant"
and make sure that everything is antialised using smooth()*/

void setup(){
frameRate(20);
size(600,600);
smooth();


//we define a random position so the sketch is not always the same

aBallXpos = random(32,width-32);
aBallYpos = random(32,height-32);
bBallXpos = random(32,width-32);
bBallYpos = random(32,height-32);




}

//we create the two ellipses and make sure that we clear the background every frame

void draw(){
  
background (0,0,0,0);
fill(255,0,0);
ellipse(aBallXpos, aBallYpos, 64,64);

fill(0,255,0);
ellipse(bBallXpos, bBallYpos, 64,64);

//Math necesary for the ellipses to move and a small random variance so it dont get in a "bounce loop"

aBallXpos = aBallXpos+aVelocityX+random(-0.4,0.4);
aBallYpos = aBallYpos+aVelocityY+random(-0.4,0.4);

bBallXpos = bBallXpos+bVelocityX+random(-0.4,0.4);
bBallYpos = bBallYpos+bVelocityY+random(-0.4,0.4);

/*Logic time!!!

Edge Detection and Collision

Assuming that the diameter of a ellipse is 64 
we can know that the "collision box" of the ellipse should be at 32 pixels from the center.
we already know where the center (AKA the control point) of the ellipse is so
we can use basic math to make them collide with the border and with each other.

The logic behind this is: the edge of the canvas is 0 and 800 in both coordinates,
but for the ellipse in order to not get out the canvas the edge should be
+-32 pixels the position of the center. (the collision stuff explained early)

So we create a conditional that reads the position of the ellipse, 
compares it to the “collision edges” and if the position is equal to
the “collision edges” it negates the velocity so it will bounce.

*/


if(aBallXpos>=width-32||aBallXpos<=32){
  aVelocityX *= -1;
}

if(aBallYpos>=height-32||aBallYpos<=32){
  aVelocityY*= -1;
}

if(bBallXpos>=width-32||bBallXpos<=32){
  bVelocityX*= -1;
}

if(bBallYpos>=height-32||bBallYpos<=32){
  bVelocityY*= -1;
}

/*Self Collision stuff

Using the same collision logic explained before, we read the distance between the ellipses and if the distance is less than
2 "collision box values" (because we have 2 ellipses) we negate the velocity value so they can bounce. */


if(dist(aBallXpos,aBallYpos,bBallXpos,bBallYpos)<=64){
  aVelocityX=aVelocityX-2*aVelocityX;
  aVelocityY=aVelocityY-2*aVelocityY;
  bVelocityX=bVelocityX-2*bVelocityX;
  bVelocityY=bVelocityY-2*bVelocityY;
}

/* 


debug stuff, ignore
println("aVelocityX = "+aVelocityX);
println("aVelocityY = "+aVelocityY);
println("bVelocityX = "+bVelocityX);
println("bVelocityY = "+bVelocityY);

*/

}


//We hit RUN and wait for the best. 


