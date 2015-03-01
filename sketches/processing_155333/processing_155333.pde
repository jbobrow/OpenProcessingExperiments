
/*
 * An exercise to recreate the cycloid optical illusion 
 * featyred on IFLS...
 * http://www.iflscience.com/brain/cycloid-optical-illusion-will-boggle-your-mind
 * by Gerard Holden
 */
 
Ball[] dot = new Ball[8]; // The white balls
float cycle;              // a counter for  
float radius;             // the radius of the red circle
int stage;                // controls the main stages of the sketch
int step;                 // a counter for displaying the white balls and guide lines one-by-one
float BALLDIAMETER = 40;   // the diameter of the white balls  
float TIMERSTAGE1 = 10000; // a timer for the first stage
float TIMERSTAGE2 = 5000;  // a timer for thhe second stage
int timer;                 // a timer governing the stages 

void setup() {
 size(700, 700);
 frameRate(60);
 
 radius = min(width/2, height/2) * 0.8;
 
 dot[0] = new Ball(0);
 dot[1] = new Ball(PI/2);
 dot[2] = new Ball(PI/4);
 dot[3] = new Ball(PI/4*3);
 dot[4] = new Ball(PI/8);
 dot[5] = new Ball(PI/8*5);
 dot[6] = new Ball(PI/8*3);
 dot[7] = new Ball(PI/8*7);
 
 cycle = 0;
 stage = 0;
 step = 0;
 
}

void draw() {
  background(0);
  
  // Draw the red circle
  translate(width/2, height/2);
  noStroke();
  fill(255,0,0);
  ellipse(0, 0, radius*2 + BALLDIAMETER, radius*2 + BALLDIAMETER);
 
  switch(stage) {
    // In this stage the white balls are displayed without the
    // guide lines 
    case 0:
    
      for (int i = 0; i < 8; i++) {
        dot[i].draw(cycle);
      }
      
      
      // At the end of the stage disable all white balls
      // and reset the timer
      if (millis() > timer + TIMERSTAGE1) {
        for (int i = 0; i < 8; i++) {
          dot[i].setIsActive(false);
        }        
        timer = millis();
        stage++;
      }
      break;

    case 1:

      // Activate the next ball and its guideline
      dot[step].setIsActive(true);
      dot[step].setHasLine(true);
   
      for (int i = 0; i < step + 1; i++) {
        dot[i].draw(cycle);
      }
      
      // At the end of the stage remove the lines and reset stage number
      if (millis() > timer + TIMERSTAGE2) {
        step++;
        if (step > 7) {
          step = 0;
          stage = 0;
          for (int i = 0; i < 8; i++) {
            dot[i].setHasLine(false);
          }
        }        
        timer = millis();
      }
      break;      
  }
           
   
  cycle += 0.01;
  if (cycle > TWO_PI) {
    cycle = 0;
  }
}
/*
 * The Ball class describes the white balls.
 */

class Ball {
  float angle;      // the angle of the guideline and hence the ball's path
  float offset;     // the offset for displaying the ball 
  boolean isActive; // indicates of ball is to be displayed
  boolean hasLine;  // indicates if guideline is to be drawn
  
  // Constructor - the angle is supplied and the other attributes are
  // set to defaults
  Ball(float _angle) {
    angle = _angle;
    offset = _angle;
    isActive = true;
    hasLine = false;
  }
  
  // Draw the white ball
  void draw(float timer) {
    pushMatrix();
    rotate(angle);
    if (isActive) {
      if (hasLine) {
        stroke(0);
        line(-radius-BALLDIAMETER, 0, radius+BALLDIAMETER, 0);
      }
      noStroke();
      fill(255, 255, 255);
      ellipse(radius * sin(timer + offset), 0, BALLDIAMETER, BALLDIAMETER);
    }
    popMatrix();
  }
  
  // a method to set the isActive attribute
  void setIsActive(boolean state) {
    isActive = state;
  }
  
  // a method to set the hasLine attribute 
  void setHasLine(boolean state) {
    hasLine = state;
  }
}
    


