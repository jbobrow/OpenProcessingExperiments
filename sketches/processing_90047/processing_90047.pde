
//Ball myBall1, myBall2
Ball[] chaos = new Ball[6];



void setup() {
  size(600, 300);
  background(255);
  for (int b=0; b< chaos.length; b++) {
    chaos[b] = new Ball(50, 50, random(25, 75), random(4, 10), random(4, 10));
  }

  /* chaos[0] = myBall1 = new Ball(50, 100,125, 3, 1);
   chaos[1] = myBall2 = new Ball(60, 100,60, 2, 2);
   chaos[2] = myBall2 = new Ball(80, 100,25, 3, 4);
   chaos[3] = myBall2 = new Ball(20, 100,100, 3, 3);
   chaos[4] = myBall2 = new Ball(150, 100,75, 6, 2);
   chaos[4] = myBall2 = new Ball(100, 50,50, 4, 1);
   */
  // myBall1 = new Ball(color(0,255,0),50, 100,5, 10);
  //myBall2 = new Ball(color(255,100,0), 50, 150, 5,10);
}

void draw() {

  for (int b=0; b< chaos.length; b++) {

    chaos[b].display();

    chaos[b].update();
  }
  /*
  chaos[0].display();
   chaos[0].update();
   
   myBall1.drive();
   myBall1.display(); 
   myBall2.drive();
   myBall2.display(); */
}


class Ball {
  float xpos, ypos, diam, xspeed, yspeed;
  color c;

  Ball( float tXpos, float tYpos, float tDiam, float tXspeed, float tYspeed) {
    xpos = tXpos;
    ypos = tYpos;
    diam = tDiam;
    xspeed = tXspeed;
    yspeed = tYspeed;
  }


  void display() {
    stroke(random(0,255),random(0,255),random(0,255),80);
    fill(0,40);
    ellipse(xpos, ypos, diam, diam);
  }

  /*  void drive() {
   xpos = xpos + xspeed;
   if(xpos-25 >= width) {
   xspeed = xspeed*-1;
   }
   }
   void drive() {
   xpos = xpos + xspeed;
   if(xpos+25 <= 0) {
   xspeed = xspeed*-1;
   }
   }
   void drive() {
   yxpos = ypos + yspeed;
   if(ypos-25 >= height) {
   yspeed = yspeed*-1;
   }
   }
   void drive() {
   yxpos = ypos + yspeed;
   if(ypos+25 >= 0) {
   yspeed = yspeed*-1;
   }
   }
   
   }*/

  void update() {
    xpos =xpos +xspeed;
    ypos = ypos + yspeed;
    if (xpos > width-diam/2 || xpos <diam/2) {
      xspeed = xspeed*-1;
    }
    if (ypos > height-diam/2 || ypos < diam/2) {
      yspeed = yspeed*-1;
    }
  }
}
