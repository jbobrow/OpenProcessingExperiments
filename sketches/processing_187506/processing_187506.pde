
int circleX = 0;                                   // sets the initial starting conditions of the bouncing circle,
int circleY = 120;                                 // it's position and size. Size is a named variable for a planned
int circleSize = 40;                               // feature to change the size via keyboard controls.

int velocityX = 25;                                // these are the two velocity vectors, and they decide how much the
int velocityY = 20;                                // ball moves each frame in X and Y.

int bounceCount = 0;                               // this is the initialisation of the count variable, and the two
int cLimit1 = 10;                                  // limits which decided when the ball should do a colour shift.
int cLimit2 = 15;                                 

int fadeCount = 0;                                      
int fade = 30;                                     // this variable is the factor by which the trail of the ball disappears
                                                   // the higher the fade, the shorter the trail.
void setup(){
  size(400,400);
  background(0);                                   // the setup is relatively straight-forwards, with numbers controlling
  smooth();                                        // the background colour, frame rate and window size being easy to 
  frameRate(60);                                   // identify. The rectMode is set in order to have the trail fade properly.
  rectMode(CORNER);                                // In future, it might be possible to make shapes appear in the bg
  noStroke();                                      // by having more complex fade shapes.
}

void draw(){
  fadeCount++;                                      // every draw loop, fade count increases by one.

//MOTION EQUATIONS  
  circleX = circleX + velocityX;                    // pretty simple velocity rules, in the future my particle
  circleY = circleY + velocityY;                    // modelling will include acceleration. For now, we have
                                                    // frictionless elastic collisions.
                                                                   
//BOUNCE LOGIC
/* This has a very basic set of rules, where the moment the position of the ball is past the limits of the frame, the 
velocity in that direction is reversed, simulating a perfect elastic collision; all momentum possessed by the ball
upon hitting the wall is still possessed by the ball upon leaving it. */
  
  if(circleX>width|circleX<0){                                    
    velocityX = velocityX * -1;
    bounceCount++;
  }
  if(circleY>height|circleY<0){
    velocityY = velocityY * -1;
    bounceCount++;
  }
 
//COLOUR CHANGE LOGIC
/* Building on my previous work gradually changing greyscale colours, I used a similar logic to cycle through 3 separate
colour palettes as the ball traverses the screen. This is done by having two limits, and 3 conditions specific to the 
bounceCount variable. Every time it bounces off of an edge, the bounceCount increases. Relative to the cLimit , it 
is a specific set of colours that can be modified in order to change the way the whole thing looks. I need to work on
creating a better system for colour change than simply editing the values in. */

  if(bounceCount <= cLimit1){
    fill(random(circleY,255),random(circleY/2,125),0,250);
  }
  if(bounceCount > cLimit1 && bounceCount <= cLimit2){
    fill(random(circleY,255),0,random(circleY/2,125),250);
  }
  if(bounceCount > cLimit2){
    fill(0,random(circleY,255),random(circleY/2,125),250);
  }
  if(bounceCount > cLimit1 + cLimit2){
    bounceCount = 0;
  }
  ellipse(circleX,circleY,circleSize,circleSize);

//FADER LOGIC
/* Every other frame, a rectangle with opacity decided by fade is drawn on the screen. This means that the longer an 
image remains on the screen, the darker it gets, until it fades completely into the background. This gives the effect
of the ball having a moving trail. In future, it might be possible to use this method to highlight areas using redrawn 
translucent shapes. */

  if(fadeCount>1){
    fill(0,0,0,fade);
    rect(0,0,width,height);
    fadeCount = 0;
  } 
}

//BOUNCE REVERSE CLICK
void mousePressed(){
  velocityY = velocityY * -1;
}


