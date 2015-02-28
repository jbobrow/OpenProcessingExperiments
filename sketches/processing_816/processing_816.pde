
class Ball {
  int index;
  int state;
  boolean dead;
  color c;
  float x;
  float y;
  float w;
  float h;
  float speedX;
  float speedY;
  float theta;

  Ball(float tempW) {
    dead = false;
    w = tempW;
    h = w; // Since we want cicles
    x = random(w/2,width-(w/2));
    y = random(h/2,height-(h/2));
    speedX = 0.05*random(-5,5);
    speedY = 0.05*random(-5,5);
    theta = 0.00;
    state = 0;
  }

  void move(){
    if (dead == false) {
      ifOutReverse();
      x += speedX;
      y += speedY;
    }
  }

  private void ifOutReverse(){
    if (x+(w/2)>width) {
      x = width -(w/2);
      speedX *= -1;
    }
    else if (x-(w/2)<0) {
      x = (w/2);
      speedX *= -1;
    }
    if (y+(h/2)>height) {
      y = height -(h/2);
      speedY *= -1;
    }
    else if (y-(h/2)<0) {
      y = (h/2);
      speedY *= -1;
    }
  }

  void display(){
    if (dead == false) {
      noStroke();
      w = constrain(w,0,width+height/4);
      h = constrain(h,0,width+height/4);
      fillAs();
      fill(c);
      ellipse(x,y,w,h); 
    }
  }

  void fillAs() {
    switch (state) {
    case 1:
      c = color(255,100,100);
      break;
    case 2:
      c = color(100,255,100);
      break;
    case 3:
      c = color(100,100,255);
      break;
    case 0:
      c = color(0);
      break;
    } 
  }

  void removeDead() {
    if(w + h < 1) {
      dead = true;
      x = -100;
      y = -100;
    }
  }

  //Proximity 0.1
  boolean isInRangeAndBigger(Ball b1,Ball b2,float range){
    if (b1.dead == false && b2.dead == false) {
      float distance = dist(b1.x,b1.y,b2.x,b2.y);
      if (distance < ((((b1.w*range)+(b1.h*range))/4) + (((b2.w*range)+(b2.h*range))/4))) {
        if(b1.w+b1.h>b2.w+b2.h) {
          return true; 
        }
        else return false;
      } 
      else return false; 
    }
    else return false;
  }

  boolean isInRange(Ball b1,Ball b2,float range){
    if (b1.dead == false && b2.dead == false) {
      float distance = dist(b1.x,b1.y,b2.x,b2.y);
      if (distance < ((((b1.w*range)+(b1.h*range))/4) + (((b2.w*range)+(b2.h*range))/4))) {
        return true; 
      } 
      else return false; 
    }
    else return false;
  }
}












