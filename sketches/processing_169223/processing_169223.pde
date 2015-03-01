
int targetNum = 1;                          // number of targets
int i;                                      // iterator variable
int targetSize = 15;                        // size of target ellipse
int chaseSize = 30;                         // size of chase ellipse
float flip = -1;                            // changes the sign of speed variables for "bounce"
float Chase_speed = 2;                      // chase object speed
float distance;                             // stores disstance between chase and target 

Target[] targets = new Target[targetNum];    // initialize target array



void setup(){
  size(600,600);
  
  chaser = new Chase(random(600), random(600), Chase_speed);     // creates chase object
  
  for(i = 0; i < targetNum; i++){     // creates the target objects, see the Target function
  
    targets[i] = new Target(random(600), random(600), random(-3,3),random(-3,3));
  }
  
}




void draw(){
  // background
  fill(255);
  noStroke();
  rect(0,0,600,600);
  
  for(i = 0; i < targetNum; i++){
    targets[i].move();         // updates target objects
    
    if(targets[i].X > 600 || targets[i].X < 0){
      targets[i].Xspeed *= flip;      // changes the direction of movement if hit the side of window
    }
    
    if(targets[i].Y > 600 || targets[i].Y < 0){
      targets[i].Yspeed *= flip;      // changes the direction of movement if hit the side of window
    }
  }
  
  chaser.chaseTarget(targets[0].X, targets[0].Y);  // updates chase and gives current target pos
}




class Chase {                                // chase class
  float Ypos;
  float Xpos;
  float speed;
  float Xvector;                             // stores x direction vector
  float Yvector;                             // stores y direcction vector
  
  Chase(float x, float y, float chaseSpeed){
    Ypos = y;                                // y pos of chase object
    Xpos = x;                                // x pos of chase object
    speed = chaseSpeed;                      // how fast the object chases the target
  }
  
  // MATH SECTION: Do not worry if it makes no sense
  
  void chaseTarget(float targX, float targY){
    
    // MATH SECTION: Do not worry if it makes no sense
    
    distance = dist(Xpos, Ypos, targX, targY);  // distance between chase and target
    Xvector = targX - Xpos;                        // x distance from target to chase
    Yvector = targY - Ypos;                        // y distance from target to chase
    
    // normalization is when the x and y vectors (Xpos and Ypos) are scales so that the
    // hypotenus (distance) is equal to 1. This can then be multiplied by speed to make
    // it move at the desired speed in the direction
    Xvector /= distance;                           // normalizes the x distance vector
    Yvector /= distance;                           // normalizes the y distance vector
    
    // move the object in direction of target at move speed
    Xpos += Xvector*speed;
    Ypos += Yvector*speed;
    
    // draw the chase object
    fill(0);
    noStroke();
    ellipse(Xpos,Ypos,chaseSize,chaseSize);
  }
}
  
  
  
  
class Target {                          // target class
  float X;                              // target X position
  float Y;                              // target Y position
  float Xspeed;                         // x speed, adds to the x position each draw
  float Yspeed;                         // y speed, adds to the y position each draw
  
  Target(float x, float y, float xspeed, float yspeed){    // function that creates the objects
    X = x;                                                 // random xstart between 0 and 600
    Y = y;                                                 // random ystart between 0 and 600
    Xspeed = xspeed;                                       // random x speed
    Yspeed = yspeed;                                       // random y speed
  }
  
  void move(){
    X += Xspeed;                                           // adds the x speed to position
    Y += Yspeed;                                           // adds the y speed to position
    fill(255);
    stroke(0);
    ellipse(X,Y,targetSize,targetSize);                    // draws target at new location
  }
  
}


