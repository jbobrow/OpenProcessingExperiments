
//Rohan Rathod, andrewid: rkrathod
//Hw_2, Tuesday 4 Sep 2012, 48-257 Processing for the Arts
//All materials and images on this code Copyright (c) Rohan Rathod, 2012. 

//===============================================================

//DECLARE VARIABLES
float x = 0;//X CO-ORDINATE
float x1 = 0;//ON/OFF VARIBALE
float wd = 75;//RECTANLE WIDTH
float ht = 50;//RECTANGLE HEIGHT
float a = 0;//Y CO-ORDINATE




PImage img;

void setup() {
  //BASIC SETUP
  size(500, 400);
  fill(0);
  smooth();
}

//==============================================================

void draw() {

  //BACKGROUND TRAILS

  fill(255, 255, 255, 5);
  noStroke();
  rect(0, 0, width, height);
  fill(0, 100, 200);

  //MOUSE PRESSED

  if (mousePressed == true) {
    fill(0, mouseX, 0);
    strokeWeight(abs(0.08*mouseX));
    strokeCap(ROUND);
    stroke(0, 0, 0);
  }

  //RECTANGLE #1

  rectMode(CORNER);
  rect(random(x, width), a, wd, ht);

  //ON/OFF STATEMENTS that cause LOOPING or back and forth

  if (x1 == 0) {
    //x = width*sin(x);//OFF CONDITIONAL
    x = x + 1;
  }
  if (x == width - wd) {
    x1 = 1;
  }
  if (x1 == 1) {
    x = x-1;
  }
  if (x == 0) {//ON CONDITIONAL
    x1 = 0;
  }

  // OTHER RECTANGLES
  rect(random(x, width), a+ht, wd, ht);

  rect(random(x, width), a+2*ht, wd, ht);

  rect(random(x, width), a+3*ht, wd, ht);

  rect(random(x, width), a+4*ht, wd, ht);

  rect(random(x, width), a+5*ht, wd, ht);

  rect(random(x, width), a+6*ht, wd, ht);

  rect(random(x, width), a+7*ht, wd, ht);
}
