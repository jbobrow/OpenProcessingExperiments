
class Player {
  int x,y;
  float xSpeed,ySpeed;
  float accel,deccel;
  float maxXspd,maxYspd;
  float xSave,ySave;
  int xRep,yRep;
  float gravity;
  float state;
  float stateRate;
  float stateShift;
  int charXShift;
  int charYShift;
  int pace;
  
  Player(int _x, int _y ) {
    x = _x;
    y = _y;
    xSpeed = 0;
    ySpeed = 0;
    accel = 0.5;
    deccel = 0.5;
    maxXspd = 2;
    maxYspd = 12;
    xSave = 0;
    ySave = 0;
    xRep = 0;
    yRep = 0;
    gravity = 0.3;
    stateRate = .1;
    stateShift = 2;
    charXShift = 22;
    charYShift = 42;
    pace = 2;
  }
  
  void update() {
    
    if ( right ) {
      xSpeed += accel;
      if ( xSpeed > maxXspd ) {
        xSpeed = maxXspd;
      }
      state = state + stateRate;
            if (state >2) {
            state =  stateRate;
           }
    }
    else if ( left ) {
      xSpeed -= accel;
      if ( xSpeed < -maxXspd ) {
        xSpeed = -maxXspd;
      }
      state = state - stateRate;
            if (state <-2) {
            state = - stateRate;
           }
    }
    else { //neither right or left pressed, decelerate
      state = 0;
      if ( xSpeed > 0 ) {
        xSpeed -= deccel;
        if ( xSpeed < 0 ) {
           xSpeed = 0;
        }
      }
      if ( xSpeed < 0 ) {
        xSpeed += deccel;
        if ( xSpeed > 0 ) {
           xSpeed = 0;
        }
      }
    }
     
    if ( up ) {
      if ( !place_free(x,y+pace) && !place_free(x+charXShift,y+pace)) {
        ySpeed = -4.3;
      }
    }
    ySpeed += gravity;
    
    int signX = (xSpeed<0) ? -pace : pace;
    int signY = (ySpeed<0) ? -pace : pace;
                 println("signX is" + signX);
                 println("signY is" + signY);
        
    xRep += floor(abs(xSpeed));
    yRep += floor(abs(ySpeed));
                 println(xRep);
                 println("yRep is" + yRep);             
                 
    for ( ; yRep > 0; yRep-- ) {
      if ( place_free(x,y+signY) && place_free(x+charXShift,y+signY)) {
        y += signY;
      }
      else {
        ySpeed = 0;
      }
    }
    
    
    for ( ; xRep > 0; xRep-- ) {
      if ( place_free(x+signX,y-charYShift) && place_free(x+signX,y) ) {
        x += signX;
    }
    else{
      xSpeed = 0;
    }
  }
  }
  void display() {//DISPLAY///////////////
    
    //LEFTA
    if (state <0 && state >=-1){
     PImage leftB;
     leftB = loadImage("LEFTA.png");
     image(leftB, x, y-charYShift);
    }// END LEFTA
    
    //LEFTB
     else if (state <-1 && state >=-2){ 
     PImage leftB;
     leftB = loadImage("LEFTB.png");
     image(leftB, x, y-charYShift);
    }// END LEFTB
    
     //RIGHTA
      else if (state >0 && state <=1){
      PImage rightA;
     rightA = loadImage("RIGHTA.png");
     image(rightA, x,y-charYShift);
    }// END RIGHTA
    
    //RIGHTB
     else if (state >1 && state <=2){
     PImage rightB;
     rightB = loadImage("RIGHTB.png");
     image(rightB, x, y-charYShift);
    }// END RIGHTB
    
    //STILL
    else if(state==0){
     PImage still;
     still = loadImage("STILL.png");
     image(still, x, y-charYShift);
    }//END STILL
      
  }//END DISPLAY///////////////////
  

}//END CLASS///////////////////////


