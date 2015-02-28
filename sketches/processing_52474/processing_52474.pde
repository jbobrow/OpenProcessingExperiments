
/*********************************
 Assignment 03
 Name: Hannah Organick
 Email: horganick@brynmawr.edu
 Course:  CS 110 - Section 02
 Submitted: 2/14/12
 
 This program draws functionalized lanterns and flowers.  
 The placement and size of each lantern and flower can be 
 changed easily, as can the color of each flower's bud.  
 
 Gradient Code - Based off of Professor Dianna Xu's class
 example. 
 **********************************/

void setup() {
  size(900, 450);
  background(255);
  smooth();

  /*The sky is drawn using a color gradient iteration 
   (moving from black to dark blue) to mimic late evening.  
   The ground is then drawn on top of that (also in gradient, 
   moving from dark brown to black), overlapping the sky so 
   that the more blue part of the sky gradient is covered. 
   The horizon line is then drawn 70/100 of the way down the 
   canvas.  Using a fraction and variable allows for this 
   horizon line to be drawn at the same place on the canvas 
   no matter its size. */

  //Sky
  noStroke();
  int steps = height*80/100;
  float x = 0.0;
  float y = 0.0;
  float w = width;
  float h = height/steps;

  color startC, endC;
  startC = color(0, 0, 0); //Starting Color = Black
  endC = color(25, 25, 60); //Ending Color = Dark Blue

  float startR, startG, startB;
  float endR, endG, endB;
  float deltaR, deltaG, deltaB;

  startR = red(startC);
  startG = green(startC);
  startB = blue(startC);
  endR = red(endC);
  endG = green(endC);
  endB = blue(endC);

  deltaR = (endR-startR)/(steps-1);
  deltaG = (endG-startG)/(steps-1);
  deltaB = (endB-startB)/(steps-1);

  int i=0;
  while (i<steps) {
    fill(startC);
    rect(x, y, w, h);
    startR += deltaR;
    startG += deltaG;
    startB += deltaB;
    startC = color(startR, startG, startB);
    y += h;
    i++;
  }

  //Ground
  int steps2 =height*30/100;
  float x2 = 0.0;
  float y2 = height*70/100;
  float w2 = width;
  float h2 = (height-(height*70/100))/steps2;

  color startC2, endC2;
  startC2 = color(35, 15, 8); //Starting Color = Dark Brown
  endC2 = color(0, 0, 0); //Ending Color = Black


  float startR2, startG2, startB2;
  float endR2, endG2, endB2;
  float deltaR2, deltaG2, deltaB2;

  startR2 = red(startC2);
  startG2 = green(startC2);
  startB2 = blue(startC2);
  endR2 = red(endC2);
  endG2 = green(endC2);
  endB2 = blue(endC2);

  deltaR2 = (endR2-startR2)/(steps2-1);
  deltaG2 = (endG2-startG2)/(steps2-1);
  deltaB2 = (endB2-startB2)/(steps2-1);

  int j=0;
  while (j<steps2) {
    fill(startC2);
    rect(x2, y2, w2, h2);
    startR2 += deltaR2;
    startG2 += deltaG2;
    startB2 += deltaB2;
    startC2 = color(startR2, startG2, startB2);
    y2 += h2;
    j++;
  }

  //Horizon Line
  stroke(0);
  strokeWeight(1);
  line(0, height*70/100, width, height*70/100);

  /*Lanterns are drawn on the circumferences of 
   three circles. */
  //Center Lantern Placement
  int steps3 = 9;
  int radius = height/4;
  int centerx = width/2;
  int centery = height/3;

  float angle = 2*PI/steps3;
  for (int k=0; k<steps3; k++) {
    float xL = cos(angle*k)*radius + centerx;
    float yL = sin(angle*k)*radius + centery; 

    drawLantern(xL, yL, 35);
  }

  //Right Lantern Placement
  int steps4 = 6;
  int radius2 = height/9;
  int centerx2 = width*6/7;
  int centery2 = height/5;

  float angle2 = 2*PI/steps4;
  for (int m=0; m<steps4; m++) {
    float xL2 = cos(angle2*m)*radius2 + centerx2;
    float yL2 = sin(angle2*m)*radius2 + centery2; 

    drawLantern(xL2, yL2, 20);
  }

  //Left Lantern Placement
  int steps5 = 6;
  int radius3 = height/9;
  int centerx3 = width*1/7;
  int centery3 = height/5;

  float angle3 = 2*PI/steps5;
  for (int n=0; n<steps5; n++) {
    float xL3 = cos(angle3*n)*radius3 + centerx3;
    float yL3 = sin(angle3*n)*radius3 + centery3; 

    drawLantern(xL3, yL3, 20);
  }

  //Flowers are drawn here.
  drawFlower(width/7, height*6/7, 50, 148, 0, 211);
  drawFlower(width/8.8, height*7/8, 20, 160, 32, 240);
  drawFlower(width/12, height*6/7, 30, 186, 85, 211);
  drawFlower(width/10, height*4/5, 40, 147, 112, 219);
}


/* The lantern function contains parameters for
 the lantern's location and size.  Its aura is 
 drawn in the same way as the flower's bud, and its
 color is a randomized orange. */

void drawLantern(float xL, float yL, float sL) {
  noStroke();
  strokeWeight(2);
  smooth();

  //Aura
  fill(255, random(150, 200), 0, 15);
  ellipse(xL, yL, sL*3, sL*3);
  ellipse(xL, yL, sL*2.5, sL*2.5);
  ellipse(xL, yL, sL*2, sL*2);
  ellipse(xL, yL, sL*1.5, sL*1.5);


  stroke(0);
  rectMode(CENTER);

  //Tassel
  fill(255, 191, 0);
  rect(xL, yL+sL, sL/12.5, sL);
  //TasselBall
  ellipse(xL, yL+sL*1.2, sL/5, sL/5);
  //TasselBaseBall
  ellipse(xL, yL+sL*1.5, sL/4, sL/4);
  //LanternBase
  rect(xL, yL+sL/2, sL/1.9, sL/3.1);
  //Lantern
  fill(206, 12, 12);
  ellipse(xL, yL, sL, sL);
  //LanternTop
  fill(255, 191, 0);
  rect(xL, yL-sL/2, sL/2.5, sL/5);
}



/* The flower function contains parameters for
 the flower's location, size, and color.  First
 the stem is drawn, then circles decreasing in size 
 are drawn above the stem in the bud color with 
 a transparency of 90 . This is done to make the bud
 look more like a real flower, rather than just a circle 
 on top of the stem. */

//Flower
void drawFlower(float xF, float yF, float sF, float cFRed, float cFGreen, float cFBlue) {
  noStroke();

  //Stem
  fill(0, 100, 0, 100);
  rectMode(CENTER);
  rect(xF, yF+sF*1.5, sF/8, sF*2);

  //Bud
  fill(cFRed, cFGreen, cFBlue, 90);
  ellipse(xF, yF, sF, sF);
  ellipse(xF, yF, sF*.8, sF*.8);
  ellipse(xF, yF, sF*.6, sF*.6);
  ellipse(xF, yF, sF*.4, sF*.4);
  ellipse(xF, yF, sF*.2, sF*.2);
}


