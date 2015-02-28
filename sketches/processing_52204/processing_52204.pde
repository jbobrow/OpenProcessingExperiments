

class Ball {// I'm not going to comment on all of this
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  float lastX;
  float lastY;
  int id;
  Ball[] others;

  Boolean canGrab=true;

  Ball(float xin, float yin, float din, int idin, Ball[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } 

  void update() {
  }

  void collide() {//the first way of checking collison
    for (int i = id + 1; i < currBallNum; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance <= minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }
  }

  void colorize() {
    float dx=others[2].x - x;
    float dy=others[2].y - y;
    for (int i = id + 1; i < currBallNum; i++) {
      dx = others[i].x - x;
      dy = others[i].y - y;
    }
    float distance = sqrt(dx*dx + dy*dy);
    
    if(keyPressed && key!=' ') numbs=key;
    
    switch(numbs){// create more colors for keybord numbers
      case('1')://done
      fill(255-distance,255,distance-255, 255-ballFade);
      break;
      case('2')://done
      fill(255,255-distance,distance-255, 255-ballFade);
      break;
      case('3')://done
      fill(255-distance,distance-255,255, 255-ballFade);
      break;
      case('4')://done
      fill(255,255-distance,255, 255-ballFade);
      break;
      case('5')://done
      fill(distance-255,distance,255-distance, 255-ballFade);
      break;
      case('6')://done
      fill(255,distance-255,distance-255, 255-ballFade);
      break;
      case('7')://done
      fill(255-distance,distance -255,distance-255, 255-ballFade);
      break;
      case('8')://done
      fill(distance-255,255-distance,255, 255-ballFade);
      break;
      case('9')://done
      fill(0,distance-255,255-distance, 255-ballFade);
      break;
      case('0'):
      fill(255, 255-ballFade);
      break;
      default:
      fill(255-distance,255,distance-255, 255-ballFade);
      break;
    }
  }



  void gravitate() {
    for (int i = id + 1; i < currBallNum; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);

      float rto;
      if(x <= others[i].x) rto = 180;
      else rto = 0;

      float rot = atan((y-others[i].y)/(x-others[i].x))+radians(rto);

      vx -= ((diameter*(massToScale))/(distance))*cos(rot);
      vy -= ((diameter*(massToScale))/(distance))*sin(rot);
      others[i].vx += ((diameter*(massToScale))/(distance))*cos(rot);
      others[i].vy += ((diameter*(massToScale))/(distance))*sin(rot);
    }
  }

  void connect() {
    for (int i = id + 1; i < currBallNum; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      stroke(255-distance,distance-255,255,255-distance -lineFade +lineLength);
      strokeWeight(abs(300-distance)/20 /(lineLength*0.001+1));
      line(x,y, others[i].x,others[i].y);
    }
  }

  void grab() {
    float dx = mouseX - x;
    float dy = mouseY - y;
    float distance = sqrt(dx*dx + dy*dy);
    if ((distance <= diameter/2 && mousePressed && canGrab && (!isOpen || mouseX<width-150))) {

      lastX=x;
      lastY=y;

      x=mouseX-dx;
      y=mouseY-dy;

      vx= mouseX -lastX;
      vy= mouseY -lastY;

      for (int i = id + 1; i < currBallNum; i++) {
        others[i].canGrab=false;
      }
    } 
    else if(!mousePressed) {
      for (int i = id + 1; i < currBallNum; i++) {
        others[i].canGrab=true;
      }
    }
  }

  void applyAirFriction() {
    vx -= friction*vx;
    vy -= friction*vy;
  }


  void move() {
    vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width/theScale) {
      x = width/theScale - diameter/2;
      vx *= -wallBounce; 
      //vx=-vx;
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= -wallBounce;
      //vx=-vx;
    }
    if (y + diameter/2 > height/theScale) {
      y = height/theScale - diameter/2;
      vy *= -wallBounce; 
      // vy=-vy;
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= -wallBounce;
      // vy=-vy;
    }
  }


  void display() {
    //  fill(255, 204);
    noStroke();
    ellipse(x, y, diameter, diameter);
  }
}

