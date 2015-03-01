
/*
 * Creative Coding
 * Week 2, Foldout 03: Advanced Graphics
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch draws the Bacteriophage T4 Virus
 * using Processing's graphics drawing shapes
 */

void setup() {
  size(900, 1000);
  smooth(4); // add extra smoothing to lines -- this takes more time, but gives better quality
  frameRate(10);
}


void draw() {
  background(0);

  //head
  stroke(255);
  noFill();

  float headCenterX = width/2 ;
  float headCenterY = height/2 ;
  float R = random(100,400);
  float angle = TWO_PI/6;

  float x1 = width/2;
  float x2 = width/2;
  float y1 = height/2;
  float y2 = height/2;


  beginShape();
  for (int i =0; i< 6; i++) {
    float x = headCenterX + R *cos(angle/2 + angle*i);
    float y = headCenterY + R *sin(angle/2 + angle*i);
    
    float a = headCenterX + R/3 *cos(angle/2 + angle*i);
    float b = headCenterY + R/3 *sin(angle/2 + angle*i);


    vertex(a, b); // add a new vertex

    //line from center
    strokeWeight(1);
    line(headCenterX, headCenterY, x, y );

    strokeWeight(6);
  }
  endShape(CLOSE);
  
  if (mousePressed == true && key =='s' ) {
    saveFrame("hexagon-####.jpg");
  }
  }
