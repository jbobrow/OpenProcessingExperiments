
class Crab {
  
  float x;
  float y;
  float w; 
  float h; 
  float rad; 
  float eyeSpace; 
  float eyeLine; 
  float theethx;
  int state;
  int speed;
  float dir;
  float speedx;
  float speedy;
  
  float currentPosX;
  float currentPosY;
  
 
  Crab(
    float tempX, 
    float tempY, 
    float tempW, 
    float tempH, 
    float tempRad, 
    float tempEyeSpace, 
    float tempEyeLine, 
    float tempTheethx, 
    int tempState, 
    int tempSpeed
    ) 
  {
     //Crab constructor
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    rad = tempRad;
    eyeSpace = tempEyeSpace;
    eyeLine = tempEyeLine;
    theethx = tempTheethx;
    state = tempState;
    speed = tempSpeed;
    dir = PI/2;
    speedx = 200;
    speedy = 200;
    state = 3;
  }
  

  String text1 = "press a, b, c, d, e, f, g";
  String text2 = "see what happens";
  
  

    
 void moveCrab(){
   //set the orientation and the position of the crab
   drawCrab(dir, speedx, speedy);
   
   //set the arrow key to move the crab
 
   if(keyPressed){  
     if(key == CODED){
       if(keyCode == RIGHT){
         if (state == 0) {
           if(speedx <= width + 10){
             speedx = speedx + 3;
             //as the rotates on a center point of the canvas, the x, y position of the crab changes as the crab rotates
             //therefore, the individual speedx and speedy is different
             if (speedx > width + 10) {
               dir = -PI/2;
               speedx = width - 90;
               speedy = speedy + 30;
               state = 1;
             }
           }
         }
         else if (state == 1) {
           if(speedx <= width - 90){
             speedx = speedx + 3;
             if (speedx > width - 90) {
               speedx = width - 90;
               state = 1;
             }
           }           
         }
         else if (state == 2) {
           if(speedx <= width - 120){
             speedx = speedx + 3;
             if (speedx > width - 120) {
               dir = -PI/2;
               speedx = width - 90;
               speedy = speedy + 80;
               state = 1;
             }
           }
         }
         else if (state == 3) {
           if(speedx <= width + 10){
             speedx = speedx + 3;
             if (speedx > width + 10) {
               dir = -PI/2;
               speedx = width - 90;
               speedy = speedy + 120;
               state = 1;
             }
           }
         }
       } 
       else if(keyCode == DOWN){
         if (state == 0) {
           if (speedy <= height - 10){
             speedy = speedy + 3;
             if(speedy > height - 10){
               dir = 0;
               speedx = speedx - 120;
               speedy = height - 100;
               state = 2;
             }
           }
         }
         else if (state == 1) {
           if (speedy <= height - 10){
             speedy = speedy + 3;
             if(speedy > height - 10){
               dir = 0;
               speedx = speedx - 50;
               speedy = height - 100;
               state = 2;
             }
           }
         }
         else if (state == 2) {
           if (speedy <= height - 90){
             speedy = speedy + 3;
             if(speedy > height - 90){
               speedy = height - 90;
               state = 2;
             }
           }
         }
         else if (state == 3) {
           if (speedy <= height - 120){
             speedy = speedy + 3;
             if(speedy > height - 120){
               dir = 0;
               speedx = speedx - 80;
               speedy = height - 90;
               state = 2;
             }
           }
         }
       }
       else if(keyCode == LEFT){
         if (state == 0) {
           if(speedx >= 120){
             speedx = speedx - 3;
             if (speedx < 120) {
               dir = PI/2;
               speedx = 90;
               speedy = speedy - 70;
               state = 3;
             }
           } 
         }
         else if (state == 1) {
           if(speedx >= 10){
             speedx = speedx - 3;
             if (speedx < 10) {
               dir = PI/2;
               speedx = 90;
               speedy = speedy - 120;
               state = 3;
             }
           } 
         }
         else if (state == 2) {
           if(speedx >= 10){
             speedx = speedx - 3;
             if (speedx < 10) {
               dir = PI/2;
               speedx = 90;
               speedy = speedy - 20;
               state = 3;
             }
           } 
         }
         else if (state == 3) {
           if(speedx >= 90){
             speedx = speedx - 3;
             if (speedx < 90) {
               speedx = 90;
               state = 3;
             }
           } 
         } 
       }
       else if(keyCode == UP){
         if (state == 0) {
           if (speedy <= height){
             speedy = speedy - 3;
             if(speedy < 90){
               speedy = 90;
               state = 0;
             }
           }      
         }
         else if (state == 1) {
           if (speedy <= height){
             speedy = speedy - 3;
             if(speedy < 120){
               dir = -PI;
               speedx = speedx + 100;
               speedy = 90;
               state = 0;
             }
           }           
         }
         else if (state == 2) {
           if (speedy <= height){
             speedy = speedy - 3;
             if(speedy < 10){
               dir = -PI;
               speedx = speedx + 120;
               speedy = 90;
               state = 0;
             }
           }           
         }
         else if (state == 3) {
           if (speedy <= height){
             speedy = speedy - 3;
             if(speedy < 10){
               dir = -PI;
               speedx = speedx + 10;
               speedy = 90;
               state = 0;
             }
           }
         }
       }
     }
   }
  }

  
  void drawCrab(float angle, float transX, float transY){
 
    fill(0);
    textSize(15);
    text(text1, 120, 150);
    text(text2, 120, 170);
    
    translate(transX, transY);
    rotate(angle);
    
    //the origin where the crab rotates is 0, 0 (in the traditional sense of graph) 
    //imagine four quadrants, state 1, 2, 3, 4
    
    //state 2, upright position (0), 
    //center of the crab (revolving around origin 0, 0) is approximately (60, 55);
    if (angle == 0) {
      currentPosX = transX + 60;
      currentPosY = transY + 55;
    }
    //state 1, counterclockwise by 90 degrees (-PI/2), 
    //center of the crab (revolving around origin 0, 0) is approximately (55, -60);
    else if (angle == -PI/2) {
      currentPosX = transX + 55;
      currentPosY = transY - 60;
    }
     //state 0, counterclockwise by 180 degrees (-PI), 
    //center of the crab (revolving around origin 0, 0) is approximately (-60, 55);
    else if (angle == -PI) {
      currentPosX = transX - 60;
      currentPosY = transY - 55;
    }
    //state 0, clockwise 90 degrees (PI/2), 
    //center of the crab (revolving around origin 0, 0) is approximately (-55, 60);
    else if (angle == PI/2) {
      currentPosX = transX - 55;
      currentPosY = transY + 60;
    }
    
    //eyeline
    line(x-eyeSpace, y, x-eyeSpace, y-eyeLine);
    line(x+eyeSpace, y, x+eyeSpace, y-eyeLine);
    
    //body
    fill(255, 83, 3);
    ellipse(x, y, 2*w, h);
    
    //eye
    fill(0, 255, 0);
    arc(x-eyeSpace, y-eyeLine, rad, rad, -PI/4, 5*PI/4);
    arc(x+eyeSpace, y-eyeLine, rad, rad, -PI/4, 5*PI/4);
    
    //legs
    line(x+45, y-10, x+60, y-20);
    line(x+48, y-5, x+65, y-10);
    line(x+50, y+3, x+65, y+5);
    line(x+45, y+10, x+60, y+20);
    
    line(x-45, y+10, x-60, y+20);
    line(x-48, y+5, x-65, y+10);
    line(x-50, y-3, x-65, y-5);
    line(x-45, y-10, x-60, y-20);
    
    for(float teethx= x-30; teethx <= x+(w-20) && teethx >= x-30; teethx += 10){
      float r = random(255);
      float g = random(255);
      float b = random(255);
      rectMode(CENTER);
      fill(r, g, b);
      rect(teethx, y-5, 8, 10);
    }
  }
  
  //a function that returns true or false based on
  //if the crab intersects with a dot
   boolean intersect(LittleDot d){
     //calculate distance
      float distance = dist(currentPosX + w/2, currentPosY + h/2, d.x, d.y);
      //compare distance ot sum of radii
      if(distance < w/2 + d.r){
        return true;
      } else {
        return false;
      }
    } 
   
   //make an array of the characters for the key
   // so each key  corresponds to a triangle inside a rectangle
  void pressCrab(){
     char [] smallk = {'a', 'b', 'c', 'd', 'e', 'f', 'g'};
     char [] bigk = {'A', 'B', 'C', 'D', 'E', 'F', 'G'};
     
     if(keyPressed){
       for(int i = 0; i<smallk.length; i++){
         if(key == smallk[i] || key == bigk[i]){
           fill(255, 0, 0);
           triangle(x-(30-i*10), y-10, x-(25-i*10), y, x-(35-i*10), y);
         } else {
           fill(255);
           rect(x-(30-i*10), y-5, 8, 10);
         }
       }
     }
  }
  
  
  void switchCrab(Boolean button2){
  
    if(button2){
      fill(0, 255, 0);
      ellipse(x-eyeSpace, y-eyeLine, rad, rad);
      line(x-eyeSpace, y-eyeLine, x-eyeSpace, y-eyeLine-rad/2);
      ellipse(x+eyeSpace, y-eyeLine, rad, rad);
      line(x+eyeSpace, y-eyeLine, x+eyeSpace, y-eyeLine-rad/2);
    } else {
      fill(0, 255, 0);
      arc(x-eyeSpace, y-eyeLine, rad, rad, -PI/4, 5*PI/4);
      arc(x+eyeSpace, y-eyeLine, rad, rad, -PI/4, 5*PI/4);
    }
  }
}

