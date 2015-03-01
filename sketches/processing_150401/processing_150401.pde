
// c=number of cars; t= number of turtles; l= number of logs
int c =5;
int t =8;
int l =5;
float timer = 60;
Car [] myCar = new Car[c];
Turtle [] myTurtle = new Turtle[t];
Log[] myLog = new Log [l];
float ey=395;
float ex=150;
int score=0;
boolean alive = true;
int frame = 80;

void setup() {
  size(300, 400);
  frameRate(frame);
  // 1st cars
  myCar[0] = new Car(color(255, 0, 0), 50, 230, 1.4);
  //2nd cars
  myCar[1] = new Car(color(255, 0, 0), 10, 260, 1);
  //3rd cars
  myCar[2] = new Car(color(255, 0, 0), 150, 290, 1.7); 
  //4th cars
  myCar[3] = new Car(color(255, 0, 0), 150, 320, 1.5);
  //5th cars
  myCar[4] = new Car(color(255, 0, 0), 90, 350, 1.3);

  //1st turtle
  myTurtle[0] = new Turtle(color(0, 255, 0), width-100, 45, 1.4);
  myTurtle[1] = new Turtle(color(0, 255, 0), width-190, 45, 1.4);
  myTurtle[2] = new Turtle(color(0, 255, 0), width-280, 45, 1.4);

  //2nd turtle
  myTurtle[3] = new Turtle(color(0, 255, 0), width-90, 105, 1.5);
  myTurtle[4] = new Turtle(color(0, 255, 0), width-180, 105, 1.5);

  //3rd turtle
  myTurtle[5] = new Turtle(color(0, 255, 0), width, 165, 1);
  myTurtle[6] = new Turtle(color(0, 255, 0), width- 80, 165, 1);
  myTurtle[7] = new Turtle(color(0, 255, 0), width- 160, 165, 1);

  //1st log
  myLog[0] = new Log(color(198, 150, 100), 0, 70, 1.4);
  myLog[1] = new Log(color(198, 150, 100), 75, 70, 1.4);

  //2nd log
  myLog[2] = new Log(color(198, 150, 100), 0, 135, 1);
  myLog[3] = new Log(color(198, 150, 100), 110, 135, 1);
  myLog[4] = new Log(color(198, 150, 100), 220, 135, 1);
}

void draw() {
  background(255);
  rectMode(CORNER);

  //starting and ending blocks
  fill(#56ED5F);
  rect(0, 0, 400, 30);
  rect(0, 370, 400, 30);

  //grey center block
  fill(#868798);
  rect(0, 180, 400, 30);

  //water block
  fill(#4C85FC);
  rect(0, 30, 400, 150);

  //road block
  fill(#1E2034);
  rect(0, 210, 400, 160);
  fill(#C720D3);

  //displays the cars
  for (int i=0; i<c; i++) {
    myCar[i].drive();
    myCar[i].display();
    if (myCar[i].hitTest(ex, ey)) {
      ex=150;
      ey=395;
    }
  }
  if (ey < height/2) {
    alive = false;
  }
  
  //displays the logs
  for (int i=0; i<l; i++) {
    if (myLog[i].hitTest(ex, ey)) {
      alive =true;
      ex += myLog[i].xspeed;
    }
  }

  //displays the turtles
  for (int i=0; i<t; i++) { 
    myTurtle[i].drive();
    myTurtle[i].display();
    if (ey<170) {
      if (myTurtle[i].hitTest(ex, ey)) {
        alive = true;
        ex = myTurtle[i].xpos;
      }
    }
  }

  //displays the logs
  for (int i=0; i<l; i++) {
    myLog[i].drive();
    myLog[i].display();
    if (ey<170) {
      if (myLog[i].hitTest(ex, ey)) {
        alive = true;
        ex = myLog[i].xpos;
      }
    }
  }

  //frog
  fill(#C527F2);
  //fill(random(255), random(255), random(255));
  ellipse(ex, ey, 10, 10);

  //sets boundries
  if (ey<0) {
    ey = 395;
    ex = 150;
    score +=1;
    frame +=500;
  }
  if (ey>height) {
    ey=height-5;
  }
  if (ex>width) {
    ex=width-5;
  }
  if (ex<0) {
    ex= 5;
  }

  //alive testing
  if (ey<170) {
    if (ey <35) {
      alive = true;
    }
    if (alive == false) {
      alive = false;
      ex = 150;
      ey = 395;
      alive = true;
    }
  }

  //timer and ending screen
  timer= timer -.0125;
  textSize(20);
  text(nf(timer, 2, 1), 250, 20);
  text(score, 10, 20);
  if (timer < 0.0) {
    timer = 0.0;
    rectMode(CORNER);
    fill(0);
    textSize(40);
    rect(0, 0, width, height);
    fill(255);
    text("GAME OVER", 40, height/2);
    textSize(20);
    text("You're score was", 60, 300);
    text(score, 225, 300);
  }
  if (key== 'p') score +=1;
}

//moves frog
void keyPressed() {
  if (key=='w' || keyCode ==UP) ey-=15;
  if (key=='s'|| keyCode==DOWN) ey+=15;
  if (key=='a'|| keyCode==LEFT) ex-=15;
  if (key=='d'|| keyCode==RIGHT) ex+=15;
}

class Car { 
  color c;
  float xpos;
  float ypos;
  float xspeed;
  boolean hitTest(float mx, float my) {
    if (dist(xpos, ypos, mx, my) < 18) {
      return true;
    }
    else return false;
  }

  // The Constructor is defined with arguments.
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    stroke(0);
    rectMode(CENTER);
    fill(c-100);
    rect(xpos+7, ypos-10, 7, 7);
    rect(xpos+7, ypos+10, 7, 7);
    rect(xpos-7, ypos-10, 7, 7);
    rect(xpos-7, ypos+10, 7, 7);
    fill(c);
    rect(xpos, ypos, 25, 15);
  }

  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}

class Log { 
  color c;
  float xpos;
  float ypos;
  float xspeed;
  boolean hitTest(float mx, float my) {
    if (dist(xpos, ypos, mx, my) < 20) {
      return true;
    }
    else return false;
  }



  Log(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
  void display() {
    stroke(0);
    color(c);
    rect(xpos, ypos, 60, 25);
  }
  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}

class Turtle { 
  color c;
  float xpos;
  float ypos;
  float xspeed;
  boolean hitTest(float mx, float my) {
    if (dist(xpos, ypos, mx, my) < 18) {
      return true;
    }
    else return false;
  }
  boolean stay(float mx, float my) {
    if (dist(xpos, ypos, mx, my) <50) {
      return true;
    }
    else return false;
  }

  Turtle(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    stroke(0);
    fill(0);
    ellipse(xpos-10, ypos-10, 7, 7);
    ellipse(xpos-10, ypos+10, 7, 7);
    ellipse(xpos+10, ypos-10, 7, 7);
    ellipse(xpos+10, ypos+10, 7, 7);
    ellipse(xpos-20, ypos, 10, 10);

    fill(c);
    ellipse(xpos, ypos, 40, 20);
  }

  void drive() {
    xpos = xpos - xspeed;
    if (xpos > width) {
      xpos = 0;
    }
    if (xpos < 0) {
      xpos = width;
    }
  }
}



