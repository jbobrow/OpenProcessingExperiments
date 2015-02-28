
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
  }


  String text1 = "press a, b, c, d, e, f, g";
  String text2 = "see what happens";



  void moveCrab() {
    drawCrab(dir, speedx, speedy);

    if (keyPressed) {  
      if (key == CODED) {
        if (keyCode == RIGHT) {
          if (state == 0) {
            if (speedx <= width + 10) {
              speedx = speedx + 3;
              if (speedx > width + 10) {
                dir = -PI/2;
                speedx = width - 90;
                speedy = speedy + 30;
                state = 1;
              }
            }
          }
          else if (state == 1) {
            if (speedx <= width - 90) {
              speedx = speedx + 3;
              if (speedx > width - 90) {
                speedx = width - 90;
                state = 1;
              }
            }
          }
          else if (state == 2) {
            if (speedx <= width - 90) {
              speedx = speedx + 3;
              if (speedx > width - 90) {
                dir = -PI/2;
                speedx = width - 90;
                speedy = speedy + 80;
                state = 1;
              }
            }
          }
          else if (state == 3) {
            if (speedx <= width + 10) {
              speedx = speedx + 3;
              if (speedx > width + 10) {
                dir = -PI/2;
                speedx = width - 90;
                speedy = speedy+120;
                state = 1;
              }
            }
          }
        } 
        else if (keyCode == DOWN) {
          if (state == 0) {
            if (speedy <= height - 10) {
              speedy = speedy + 3;
              if (speedy > height - 10) {
                dir = 0;
                speedx = speedx - 120;
                speedy = height - 90;
                state = 2;
              }
            }
          }
          else if (state == 1) {
            if (speedy <= height - 10) {
              speedy = speedy + 3;
              if (speedy > height - 10) {
                dir = 0;
                speedx = speedx - 10;
                speedy = height - 90;
                state = 2;
              }
            }
          }
          else if (state == 2) {
            if (speedy <= height - 90) {
              speedy = speedy + 3;
              if (speedy > height - 90) {
                speedy = height - 90;
                state = 2;
              }
            }
          }
          else if (state == 3) {
            if (speedy <= height - 100) {
              speedy = speedy + 3;
              if (speedy > height - 100) {
                dir = 0;
                speedx = speedx - 80;
                speedy = height - 90;
                state = 2;
              }
            }
          }
        }
        else if (keyCode == LEFT) {
          if (state == 0) {
            if (speedx >= 90) {
              speedx = speedx - 3;
              if (speedx < 90) {
                dir = PI/2;
                speedx = 90;
                speedy = speedy - 70;
                state = 3;
              }
            }
          }
          else if (state == 1) {
            if (speedx >= 10) {
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
            if (speedx >= 10) {
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
            if (speedx >= 90) {
              speedx = speedx - 3;
              if (speedx < 90) {
                speedx = 90;
                state = 3;
              }
            }
          }
        }
        else if (keyCode == UP) {
          if (state == 0) {
            if (speedy <= height) {
              speedy = speedy - 3;
              if (speedy < 90) {
                speedy = 90;
                state = 0;
              }
            }
          }
          else if (state == 1) {
            if (speedy <= height) {
              speedy = speedy - 3;
              if (speedy < 120) {
                dir = -PI;
                speedx = speedx + 100;
                speedy = 90;
                state = 0;
              }
            }
          }
          else if (state == 2) {
            if (speedy <= height) {
              speedy = speedy - 3;
              if (speedy < 10) {
                dir = -PI;
                speedx = speedx + 120;
                speedy = 90;
                state = 0;
              }
            }
          }
          else if (state == 3) {
            if (speedy <= height) {
              speedy = speedy - 3;
              if (speedy < 10) {
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

  /*if (state == 0){
   drawCrab(-PI, speed, 100);
   speed = speed + 3;
   if(speed > width){
   speed = 110;
   state = 1;
   } 
   }
   
   else if(state == 1){
   drawCrab(-PI/2, 300, speed);
   speed = speed + 3;
   if (speed > height - 60){
   speed = width-110;
   state = 2;
   }
   } else if(state == 2){
   drawCrab(0, speed, 300);
   speed = speed - 3;
   if(speed < 60){
   speed = height-110;
   state = 3;
   }
   } else if(state == 3){
   drawCrab(PI/2, 100, speed);
   speed = speed - 3;
   if(speed < 60){
   speed = 110;
   state = 0;
   }
   }
   }*/

  void drawCrab(float angle, float transX, float transY) {
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

    for (float teethx= x-30; teethx <= x+(w-20) && teethx >= x-30; teethx += 10) {
      float r = random(255);
      float g = random(255);
      float b = random(255);
      rectMode(CENTER);
      fill(r, g, b);
      rect(teethx, y-5, 8, 10);
    }
  }

  boolean intersect(LittleDot d) {
    float distance = dist(w, h, d.x, d.y);
    if (distance < w + d.r) {
      println("touched");
      return true;
    } 
    else {
      return false;
    }
  } 

  void pressCrab() {
    char [] smallk = {
      'a', 'b', 'c', 'd', 'e', 'f', 'g'
    };
    char [] bigk = {
      'A', 'B', 'C', 'D', 'E', 'F', 'G'
    };

    if (keyPressed) {
      for (int i = 0; i<smallk.length; i++) {
        if (key == smallk[i] || key == bigk[i]) {
          fill(255, 0, 0);
          triangle(x-(30-i*10), y-10, x-(25-i*10), y, x-(35-i*10), y);
        } 
        else {
          fill(255);
          rect(x-(30-i*10), y-5, 8, 10);
        }
      }
    }
  }





  void switchCrab(Boolean button2) {

    if (button2) {
      fill(0, 255, 0);
      ellipse(x-eyeSpace, y-eyeLine, rad, rad);
      line(x-eyeSpace, y-eyeLine, x-eyeSpace, y-eyeLine-rad/2);
      ellipse(x+eyeSpace, y-eyeLine, rad, rad);
      line(x+eyeSpace, y-eyeLine, x+eyeSpace, y-eyeLine-rad/2);
    } 
    else {
      fill(0, 255, 0);
      arc(x-eyeSpace, y-eyeLine, rad, rad, -PI/4, 5*PI/4);
      arc(x+eyeSpace, y-eyeLine, rad, rad, -PI/4, 5*PI/4);
    }
  }
}


