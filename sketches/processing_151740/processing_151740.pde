
/*
 * Creative Coding
 * Week 2, 04 - The Clocks
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This program draws a grid of circular "clocks", whose hands move according to the elasped time.
 * The higher the clock number the faster it moves, the first clock takes 1 min to go all the way around.
 * The function "movingCircle" is used to draw each clock. It is passed the position, size and hand angle
 * as arguments.
 * 
 */


int num = 5;
int margin = 80;
float gutter = 10; //distance between each cell

float cellsize;
int savenumber;

PVector[][] endPoints = new PVector[num+2][num+2];

void setup() {
  size(600, 600);
  background(180);
  rectMode(CENTER);
  noStroke();
  cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num-1);
  
  for (int i=0; i<(num+2); i++) {
    for (int j=0; j<(num+2); j++) {
      float tx = margin + cellsize * (i-1) + gutter * (i-1);
      float ty = margin + cellsize * (j-1) + gutter * (j-1);

      endPoints[i][j] = new PVector(tx, ty);
    }
  }

}


void draw() {
  background(20);
  
  int circleNumber = 0; // counter

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      ++circleNumber;

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      endPoints[i+1][j+1] = movingPoint(tx, ty, cellsize/2, circleNumber * TWO_PI * millis() / 60000.0);
    }
  }
  
  stroke(180,180,255);
  strokeWeight(5);
  
  for (int i = 1; i < num+2; i++) {
    for (int j = 1; j < num+2; j++) {
      //ellipse(endPoints[i][j].x, endPoints[i][j].y, 150, 150);
      line(endPoints[i-1][j-1].x, endPoints[i-1][j-1].y, endPoints[i-1][j].x, endPoints[i-1][j].y);
      line(endPoints[i-1][j-1].x, endPoints[i-1][j-1].y, endPoints[i][j-1].x, endPoints[i][j-1].y);
    }
  }
}//end of draw 


void movingCircle(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  stroke(0);
  strokeWeight(1);
  fill(140, 180);
  ellipse(x, y, size, size); // circle

  stroke(255, 0, 0);
  line(x, y, tempX, tempY); // red line
}

PVector movingPoint(float x, float y, float size, float angle) {

  PVector end = PVector.fromAngle(angle);
  end.mult(size);
  end.add(new PVector(x,y));
  // calculate endpoint of the line
  
  return end;
}

void movingSquare(float x, float y, float size, float angle) {
  
  float radius = size / 2;
  float tempX = radius * sin(angle);
  float tempY = radius * cos(angle);
  float scale;
  
  if(abs(tempX) > abs(tempY)) {
    scale = radius / abs(tempX);
  } else {
    scale = radius / abs(tempY);
  }
  
  tempX = tempX * scale + x;
  tempY = tempY * scale + y;
  
  stroke(0);
  strokeWeight(4);

  stroke(255, 0, 255);
  line(x, y, tempX, tempY); // red line
  
  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    String fileName = "yourName" + savenumber + ".jpg";
    saveFrame(fileName);
    savenumber++;
  }
}

