
class Body {
  
  float x;      // X position
  float y;      // Y position
  
  color limbs;   // Color of limbs
  
  float diam;    // Diameter
  float fixedX;  // Fixed X position for neck and torso
  float fixedY;  // Fixed Y position for neck and torso
  
  color bg;      // Background color
  
  float r;      // variable for red
  float g;      // variable for green
  float b;      // variable for blue
  float a;      // variable for alpha
  
  int i;        // number given by array
  
  float headX;  // head X position
  float headY;  // head Y position
    
  float leftShouldX;  // left shoulder X position
  float leftShouldY;  // left shoulder Y position
    
  float rightShouldX;  // right shoulder X position
  float rightShouldY;  // right shoulder Y position
    
  float leftArmX;     // left arm X postion
  float leftArmY;     // left arm Y postion
    
  float rightArmX;    // right arm X position
  float rightArmY;    // right arm Y position
    
  float nextX;        // the next figure's fixed X position
  float nextY;        // the next figure's fixed Y position
    
  float smallMovements; // adding small "natural" movements to figure
  float medMovements;    // adding medium "natural" movements to figure
    
  // constructor
  Body(float _x, float _y, color _limbs, float _diam, float _fixedX, float _fixedY, color _bg, float _r, float _g, float _b, float _a, int _i){
    x = _x;
    y = _y;
    limbs = _limbs;
    diam = _diam;
    fixedX = _fixedX;
    fixedY = _fixedY;
    bg = _bg;
    r = _r;
    g = _g;
    b = _b;
    a = _a;
    i = _i;

  }
  
  void moveBody(){
   nextX = i*(width/3);
   nextY = i*1;
   
   smallMovements = diam/40;
   
   medMovements = (diam/75);
    
   headX = constrain(x*2.5, fixedX+nextX-20, fixedX+nextX+20);
   headY = constrain(y*2.5, fixedY+nextY-65, fixedY+nextY-40);
   
   headX = constrain(x*2.5, fixedX+nextX-20, fixedX+nextX+20);
   headY = constrain(y*2.5, fixedY+nextY-65, fixedY+nextY-40);
   
   leftShouldX = constrain(x*5*smallMovements*random(1.12), fixedX+nextX-50,fixedX+nextX-45);
   leftShouldY = constrain(y*3*smallMovements*random(1.12), fixedY+nextY+5,fixedY+nextY+10);
  
   rightShouldX = constrain(x*5*smallMovements*random(1.12), fixedX+nextX+45, fixedX+nextX+50);
   rightShouldY = constrain(y*3*smallMovements*random(1.12), fixedY+nextY+5, fixedY+nextY+10);
   
   leftArmX = constrain(x*2-medMovements+(smallMovements*2*random(1.12)), fixedX+nextX-145, fixedX+nextX+15);
   leftArmY = constrain(y*4.2-medMovements-(smallMovements*2*random(1.2)), fixedY+nextY-90,fixedY+nextY+90);
   
   rightArmX = constrain(x*2-medMovements+(smallMovements*2*random(1.2)),fixedX+nextX-15,fixedX+nextX+145);
   rightArmY = constrain(y*4.2-medMovements-(smallMovements*2*random(1.12)), fixedY+nextY-90,fixedY+nextY+90);
  }
  
  void drawBody(){
    stroke(limbs);
    strokeWeight(4);
    
    //neck
    line(fixedX+nextX,fixedY+nextY,headX,headY);
    //left shoulder
    line(leftShouldX,leftShouldY,fixedX+nextX,fixedY+nextY);
    //right shoulder
    line(rightShouldX,rightShouldY,fixedX+nextX,fixedY+nextY);
    //left torso
    line(leftShouldX,leftShouldY,fixedX+nextX,fixedY+nextY+100);
    //right torso
    line(rightShouldX,rightShouldY,fixedX+nextX,fixedY+nextY+100);
    
    stroke(limbs);
    fill(r,g,b);
    
    //head
    ellipse(headX, headY,diam/2,diam/2);
    //chest
    ellipse(fixedX+nextX,fixedY+nextY,diam/5,diam/5);
    //torso
    ellipse(fixedX+nextX,fixedY+nextY+100,diam/2,diam/2);
    
    // Have to draw arms here so they appear infront of head, chest and torso, but not shoulders and hands
    stroke(limbs);
    //strokeWeight(4);
    //left arm
    line(leftShouldX,leftShouldY,leftArmX,leftArmY);
    //right arm
    line(rightShouldX,rightShouldY,rightArmX,rightArmY);
    
    //left shoulder
    ellipse(leftShouldX,leftShouldY,diam/4,diam/4);
    //right shoulder
    ellipse(rightShouldX,rightShouldY,diam/4,diam/4);
    //left hand
    ellipse(leftArmX,leftArmY,diam/5,diam/5);
    //right hand
    ellipse(rightArmX,rightArmY,diam/5,diam/5);
    
    stroke(r,g,b);
  }
}

