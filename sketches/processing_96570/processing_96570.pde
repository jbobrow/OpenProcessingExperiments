

class Human {

  float x;
  float y;

  // rotation for man's leg and arm
  float rotate1;
  float rotate2;

  // rotate positive or negative?
  float rotate1val;
  float rotate2val;

  Human() {
    rotate1 = 0;
    rotate2 = 0;
    rotate1val = 1;
    rotate2val = -0.5;
  }

  // draw the man!
  void drawMan(float x, float y) {

    // body
    rectMode(CENTER);
    stroke(255, 0, 0);
    fill(255, 0, 0);
    rect(x, y, 15, 30, 12, 12, 12, 12);

    // legs
    rectMode(CORNER);

    pushMatrix();
    translate(x-7.5, y+10);
    rotate(radians(rotate1));
    rect(0, 0, 7, 30, 12, 12, 12, 12);
    popMatrix();

    pushMatrix();
    translate(x, y+10);  
    rotate(radians(rotate2));
    rect(0, 0, 7, 30, 12, 12, 12, 12);
    popMatrix();

    // arms
    pushMatrix();
    translate(x-5, y-13);
    rotate(radians(rotate2*1.2));
    rect(0, 0, 7, 30, 12, 12, 12, 12);
    popMatrix();

    pushMatrix();
    translate(x, y-10);
    rotate(radians(rotate1*1.2));
    rect(0, 0, 7, 30, 12, 12, 12, 12);
    popMatrix();

    // head
    pushMatrix();
    scale(0.13);
    translate(-250, -450);

    noStroke();
    //the face
    strokeWeight(2);
    fill(250, 193, 158, 255);
    ellipse(250, 250, 250, 250);
    strokeWeight(1);

    //the mouth
    fill(0, 0, 0, 255);
    arc(250, 230, 250, 250, PI/5, PI/1.5, CHORD);

    //the eyes
    ellipse(200, 200, 50, 50);
    ellipse(300, 200, 50, 50);

    popMatrix();

    // show second value
    fill(a, b, c);
    textSize(30);
    textAlign(CENTER);
    text(nf(ss, 2, 0), 0, -50);
  }

  // function for the human's leg movement
  void legMove() {

    rotate1 = rotate1 + rotate1val;
    rotate2 = rotate2 + rotate2val;

    if (rotate1 > 45)
      rotate1val = -0.5;
    else if (rotate1 < -45)
      rotate1val = 1;

    if (rotate2 > 45)
      rotate2val = -0.5;
    else if (rotate2 < -45)
      rotate2val = 1;
  }

  // the current second value sec is needed to
  // calculate the man's position and floor
  void calculateManPosition(float sec, float milli) {
    if (sec >= 0 && sec < 15) {
      x = width-margin;
      y = margin + (sec + milli/1000)*normalize;

      drawManFloor(width-marginB, marginB, width-marginB+10, y);

      updateManPosition(x, y, -90);
    }

    else if (sec >= 15 && sec < 30) {
      x = 800 - margin - (sec-15 + milli/1000)*normalize;
      y = height-margin;

      drawManFloor(width-marginB, marginB, width-marginB+10, height-marginB+10);
      drawManFloor(width-marginB, width-marginB, x, width-marginB+10);

      updateManPosition(x, y, 0);
    }

    else if (sec >= 30 && sec < 45) {
      x = margin;
      y = 800 - margin - (sec-30 + milli/1000)*normalize;

      drawManFloor(width-marginB, marginB, width-marginB+10, height-marginB+10);
      drawManFloor(width-marginB, width-marginB, marginB-10, width-marginB+10);
      drawManFloor(marginB, width-marginB, marginB-10, y);

      updateManPosition(x, y, 90);
    }

    else if (sec >= 45 && sec < 60) {
      x = margin + (sec-45 + milli/1000)*normalize;
      y = margin;

      drawManFloor(width-marginB, marginB, width-marginB+10, height-marginB+10);
      drawManFloor(width-marginB, width-marginB, marginB-10, width-marginB+10);
      drawManFloor(marginB, width-marginB, marginB-10, marginB-10);
      drawManFloor(marginB, marginB, x, marginB-10);

      updateManPosition(x, y, 180);
    }
  }

  // this function draws the floor of the man walking.
  // you need an input of the points of the rect.
  void drawManFloor(float x1, float y1, float x2, float y2) {
    rectMode(CORNERS);
    noStroke();
    fill(243, 92, 120);
    rect(x1, y1, x2, y2);
  }


  void updateManPosition(float x, float y, float rotation) {

    pushMatrix();
    translate(x, y);
    rotate(radians(rotation));
    drawMan(0, 0);
    popMatrix();

    // print man's position to debug
    println("Man x: "+x+"  Man y: "+y);
  }
}


class Turtle {

  float x;
  float y;
  float legMove;
  float legMoveCount;

  Turtle() {
    x = 0;
    y = 0;
    legMove = 1;
    legMoveCount = 0;
  }

  void drawTurtle(float x, float y) {

    pushMatrix();
    translate(x, y);
    scale(0.3);

    pushMatrix();
    translate(-200, -200);

    noStroke();

    // the shell of turtle
    fill(0, 100, 0);
    rectMode(CENTER);
    fill (50, 205, 50);
    arc(220, 225, 190, 190, radians(-180), 0);

    // head
    fill(29, 139, 21);
    ellipse(100, 200, 70, 70);
    stroke(0);
    fill(0);
    ellipse(80, 200, 20, 20);


    // tail
    fill(29, 139, 21);
    triangle(335, 220, 315, 205, 315, 225);

    popMatrix();
    popMatrix();

    // show minute value
    fill(a, b, c);
    textSize(30);
    textAlign(CENTER);
    text(int(mm), 0, -30);
  }

  // this function calculates the turtle's position and floor
  void calculateTurtlePosition(float min, float sec) {
    if (min >= 0 && min < 15) {
      x = width-marginTurtle;
      y = marginTurtle + (min + sec/60)*normalizeT;

      drawTurtleFloor(width-marginTurtleB, marginTurtleB, width-marginTurtleB+10, y);

      updateTurtlePosition(x, y, -90);
    }

    else if (min >= 15 && min < 30) {
      x = 800 - marginTurtle - (min-15 + sec/60)*normalizeT;
      y = height-marginTurtle;

      drawTurtleFloor(width-marginTurtleB, marginTurtleB, width-marginTurtleB+10, height-marginTurtleB+10);
      drawTurtleFloor(width-marginTurtleB, width-marginTurtleB, x, width-marginTurtleB+10);

      updateTurtlePosition(x, y, 0);
    }

    else if (min >= 30 && min < 45) {
      x = marginTurtle;
      y = 800 - marginTurtle - (min-30 + sec/60)*normalizeT;

      drawTurtleFloor(width-marginTurtleB, marginTurtleB, width-marginTurtleB+10, height-marginTurtleB+10);
      drawTurtleFloor(width-marginTurtleB, width-marginTurtleB, marginTurtleB-10, width-marginTurtleB+10);
      drawTurtleFloor(marginTurtleB, width-marginTurtleB, marginTurtleB-10, y);

      updateTurtlePosition(x, y, 90);
    }

    else if (min >= 45 && min < 60) {
      x = marginTurtle + (min-45 + sec/60)*normalizeT;
      y = marginTurtle;

      drawTurtleFloor(width-marginTurtleB, marginTurtleB, width-marginTurtleB+10, height-marginTurtleB+10);
      drawTurtleFloor(width-marginTurtleB, width-marginTurtleB, marginTurtleB-10, width-marginTurtleB+10);
      drawTurtleFloor(marginTurtleB, width-marginTurtleB, marginTurtleB-10, marginTurtleB-10);
      drawTurtleFloor(marginTurtleB, marginTurtleB, x, marginTurtleB-10);

      updateTurtlePosition(x, y, 180);
    }
  }

  // this function draws the floor of the turtle walking.
  // you need an input of the points of the rect.
  void drawTurtleFloor(float x1, float y1, float x2, float y2) {
    rectMode(CORNERS);
    noStroke();
    fill(232, 141, 137);
    rect(x1, y1, x2, y2);
  }

  void updateTurtlePosition(float x, float y, float rotation) {

    pushMatrix();
    translate(x, y);
    rotate(radians(rotation));
    drawTurtle(0, 0);

    if (legMoveCount < 15) {
      turtleLegMove(0+legMove, 0);
      ++legMoveCount;
    }
    else if (legMoveCount >= 15) {
      turtleLegMove(0+legMove, 0);
      legMove = -legMove;
      legMoveCount = 0;
    }

    popMatrix();

    // print turtle's position to debug
    println("Turtle x: "+x+"  Turtle y: "+y);
  }

  void turtleLegMove(float x, float y) {

    pushMatrix();
    translate(x, y);
    scale(0.3);

    pushMatrix();
    translate(-200, -200);

    noStroke();
    // legs
    noStroke();
    fill(29, 139, 21);
    ellipse(160, 230, 28, 22);
    ellipse(200, 230, 28, 22);
    ellipse(240, 230, 28, 22);
    ellipse(280, 230, 28, 22);

    popMatrix();
    popMatrix();
  }
}

import java.util.Calendar;
import java.util.TimeZone;
Calendar cal;

Human human1;
Turtle turtle1;


// margin for human
float margin = 100;

// margin for border
float marginB = 60;

// for the human's movement
float normalize = 600/15;

// margin for turtle
float marginTurtle = 200;

// margin for turtle border
float marginTurtleB = 188;

// for the turtle's movement
float normalizeT = 400/15;


// assign color for the time-telling numbers in clock
int a = 127;
int b = 155;
int c = 113;

// variables for storing time
float ss, mm, hh;

// variable for storing the millisecond value
float milliseconds = 0;


void setup() {
  size(800, 800);

  human1 = new Human();
  turtle1 = new Turtle();
}

// this function draws the hour bar with arc
void drawHour() {
  noFill();
  strokeWeight(8);
  stroke(214, 181, 155);
  float hourPoint =  (hh + mm/60)*360/24;
  //  float hourPoint = map(hh, 0, 24, 0, 360) + map(mm, 0, 59, 0, 360)/24;
  arc(width/2, height/2, 150, 150, radians(-45), radians(hourPoint-45));

  // text for hour
  fill(a, b, c);
  textSize(30);
  textAlign(CENTER);
  text(int(hh), width/2, height/2+50);
}

void draw() {
  // assign time value to variables
  ss = second();
  mm = minute();
  hh = hour();

  // get real milliseconds value from java
  cal = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
  milliseconds = cal.get(Calendar.MILLISECOND);

  // set background
  background(200, 255, 226);

  /*
  // draw margin for man and turtle
   strokeWeight(1);
   stroke(0);
   fill(0, 0, 0, 0);
   rectMode(CORNER);
   rect(marginB-1, marginB-1, width-marginB*2 +1, height-marginB*2 +1);
   rect(marginTurtleB-1, marginTurtleB-1, width-marginTurtleB*2 +1, height-marginTurtleB*2 +1);
   */

  // draw the 0hour 0min 0sec line
  strokeWeight(1);
  stroke(171, 142, 114);
  line(width/2, height/2, width, 0);

  // tell 0, 15, 30, 45
  textAlign(CENTER);
  fill(171, 142, 114);
  textSize(25);
  text(0, width-30, 30+10);
  text(15, width-30, height-30+10);
  text(30, 30, height-30+10);
  text(45, 30, 30+10);

  // create a debug mode that changes the hour and minute
  if (mousePressed && mouseButton == LEFT) {
    hh = map(mouseX, 0, width, 0, 24);
    mm = map(mouseY, 0, height, 0, 60);

    // write text to tell it is in debug mode
    fill(255, 0, 0);
    textSize(20);
    textAlign(CENTER);
    text("Debug Mode", width/2, height-150);
    textSize(15);
    text("mouseX: hours,  mouseY: minutes", width/2, height-130);
    textSize(20);
    // nf() function tells to print two digits
    text(nf(int(hh), 2)+":"+nf(int(mm), 2)+":"+nf(int(ss), 2), width/2, height-100);
  }


  // calculate human's position by time and draw man
  human1.calculateManPosition(ss, milliseconds);

  // make the human's leg move
  human1.legMove();

  // calculate the turtle's position by time and draw turtle
  turtle1.calculateTurtlePosition(mm, ss);


  // draw the hour bar in the middle with arc
  drawHour();


  // print current time
  // nf() function makes it to print two digits
  println("Current real time: "+nf(hour(), 2)+":"+nf(minute(), 2)
    +":"+nf(second(), 2)+":"+int(milliseconds));
  println("\n");
}

