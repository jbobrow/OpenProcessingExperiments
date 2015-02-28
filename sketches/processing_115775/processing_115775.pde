
Car myCar1;
Car myCar2;
Car myCar3;
float xpos1 = 0;
float xpos2 = 0;
float xpos3 = 0;
float r1 = 255;
float g1 = 255;
float b1 = 255;
float r2 = 255;
float g2 = 255;
float b2 = 255;
float r3 = 255;
float g3 = 255;
float b3 = 255;
float movement1 = random(1,5);
float movement2 = random(1,5);
float movement3 = random(1,5);

void setup(){
  size(1000,500);
  frameRate(105);
}

void draw(){
  background(255);
  myCar1 = new Car(r1,g1,b1,xpos1,75,30,15,movement1);
  myCar2 = new Car(r2,g2,b2,xpos2,225,30,15,movement2);
  myCar3 = new Car(r3,g3,b3,xpos3,375,30,15,movement3);
  myCar1.move();
  myCar2.move();
  myCar3.move();
  println(movement1);
  xpos1 = xpos1 + movement1;
  xpos2 = xpos2 + movement2;
  xpos3 = xpos3 + movement3;
  if(xpos1 + 30 > width || xpos2 + 30 > width || xpos3 + 30 > width){
    movement1 = -movement1;
    movement2 = -movement2;
    movement3 = -movement3;
  }
  if(xpos1 < 0 || xpos2 < 0 || xpos3 < 0){
    movement1 = -movement1;
    movement2 = -movement2;
    movement3 = -movement3;
  }
  if(xpos1 + 30 > width){
    r1 = random(255);
    g1 = random(255);
    b1 = random(255);
    movement1 = movement1 - .15;
    movement2 = movement2 - .25;
    movement3 = movement3 - .25;
  }
  if(xpos1 < 0){
    r1 = random(255);
    g1 = random(255);
    b1 = random(255);
    movement1 = movement1 + .15;
    movement2 = movement2 + .25;
    movement3 = movement3 + .25;
  }
    if(xpos2 + 30 > width){
    r2 = random(255);
    g2 = random(255);
    b2 = random(255);
    movement1 = movement1 - .25;
    movement2 = movement2 - .15;
    movement3 = movement3 - .25;
  }
  if(xpos2 < 0){
    r2 = random(255);
    g2 = random(255);
    b2 = random(255);
    movement1 = movement1 + .25;
    movement2 = movement2 + .15;
    movement3 = movement3 + .25;
  }
    if(xpos3 + 30 > width){
    r3 = random(255);
    g3 = random(255);
    b3 = random(255);
    movement1 = movement1 - .25;
    movement2 = movement2 - .25;
    movement3 = movement3 - .15;
  }
  if(xpos3 < 0){
    r3 = random(255);
    g3 = random(255);
    b3 = random(255);
    movement1 = movement1 + .25;
    movement2 = movement2 + .25;
    movement3 = movement3 + .15;
  }
}


class Car { // Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.Isnâ€™t object-oriented programming swell?
  float r;
  float g;
  float b;
  float xpos;
  float ypos;
  float rectW;
  float rectH;
  float xspeed;

  Car(float tempR, float tempG, float tempB, float tempXpos, float tempYpos, float tempRectW, float tempRectH, float tempXspeed) { // The Constructor is defined with arguments.
    r = tempR;
    g = tempG;
    b = tempB;
    xpos = tempXpos;
    ypos = tempYpos;
    rectW = tempRectW;
    rectH = tempRectH;
    xspeed = tempXspeed;
  }

  void move() {
    fill(r,g,b);
    rect(xpos,ypos,rectW,rectH);
    xpos = xpos + xspeed;
    if(xpos + 30 > width || xpos < 0){
      xspeed = -xspeed;
   // }
   // void backwards() {
     // fill(r,g,b);
      //rect(xpos,ypos,rectW,rectH);
      //xpos = xpos - xspeed;
    }
  }
}



