
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

  //Crab constructor
  
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
    dir = 0;
    speedx = 200;
    speedy = 200;
  
  }
  
  /*float x = 60;
  float y = 60;
  float w = 50;
  float h = 50;
  float rad = 20; 
  float eyeSpace = 30;
  float eyeLine = 40;
  float teethx= x-30;*/
  String text1 = "press a, b, c, d, e, f, g";
  String text2 = "see what happens";
  
  
  /*int state = 0;
  int speed = 3;*/
  
    
 void moveCrab(){
    //move

    
    drawCrab(dir, speedx, speedy);
   if(keyPressed){
     
     if(key == CODED){
       if(keyCode == RIGHT){
         if((speedx<=width) && (speedx >=0 )){ 
           speedx = speedx + 3; 
           if (speedx > width) {
             dir = -PI/2;
             speedx = width-x;
    
              }
           }  
         } else if(keyCode == DOWN){
             if((speedy <= height) && (speedy >= 100)){
               speedy = speedy + 3;
               if(speedy > height){
                 speedy = height;
                 dir = 0;


               }
             }
       } else if(keyCode == LEFT){
         if((speedx <= width) && (speedx > 0)){
            speedx = speedx - 3;
            if (speedx < 0) {
              speedx = 0;
              dir = PI/2;
 
 
            }
          }  
       } else if(keyCode == UP){
         println("up");
           if((speedy <= height) && speedy >= 100){
               speedy = speedy - 3;
               if(speedy < 100){
                 speedy = 100;
                 dir = -PI;
               }
             }
           }
       }
     }
   }
    
 
  
  void drawCrab(float angle, float transX, float transY){
    //text
    fill(0);
    textSize(15);
    text(text1, 120, 150);
    text(text2, 120, 170);
    
    translate(transX, transY);
    rotate(angle);
    
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
    Boolean intersect(Drop d){
      float distance = dist(w, h, d.x, d.y);
      if(distance < w + d.r){
        return true;
      } else {
        return false;
      }
    }

  
  
    
   
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

     
    
  
   
  void switchCrab(boolean button2){
  
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


