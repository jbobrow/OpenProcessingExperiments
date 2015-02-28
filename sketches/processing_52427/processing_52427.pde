
/*
*Assignment #3
 *Nancy Toure
 *ntoure@brynmawr.edu
 *CS 110 Section 2
 *Submitted 2/14/2012
 This program contains complicated objects. The theme of
 the drawing involves sound waves and music notes. A color 
 gradiant is used to show the different sound waves.
 This drawing was hard to do because it involved many functions
 and variables.
 */



void setup() {
  size(700, 600);
  background(178, 250, 0);

  //Size of squares and color
  squares(width/2, height/2, 500, 700, color(255, 255, 0), color (0, 255, 0));
  drawfallingnotes(x, y, w, h);
}


//creating functions for multiple rectangle
void squares (int x, int y, int rectangle, int maxSize, color startC, color endC ) { 
  float maxX= x+(1/2*width);
  float maxY= y+(1/2*height);
  float minX= x-(1/2*width);
  float minY= y-(1/2*height);
  int steps = rectangle;

  //creating a color gradiant for multiple rectangles
  float startR, startG, startB;
  float endR, endG, endB;
  float deltaR, deltaG, deltaB;

  startR = red(startC);
  startG= green(startC);
  startB= blue(startC);
  endR= red(endC);
  endB= blue(endC);
  endG = green(endC);


  deltaR= (endR-startR)/(steps-1);
  deltaG= (endG-startG)/(steps-1);
  deltaB= (endB-startB)/(steps-1);


  for (int i=0; i<rectangle; i++) {
    float scalX=random(maxSize);
    float scalY= random(maxSize);

    float m= random(5, 5);
    float n= random(5, 5);
    float r = random(0, 1);
    fill(startC);
    startR += deltaR;
    startG += deltaG;
    startB += deltaB;
    startC = color(startR, startG, startB);
    strokeWeight(3);
    rectMode(CORNER);
    rect(m*i, n/i, scalX, scalY);
  }
}

//function for creating notes
float x, y, w, h, i;
void drawfallingnotes(float x, float y, float w, float h) {
  noStroke();
  for (i=20; i<width/2; i=i+100) {
    fill(0, 0, 0);
    x = 100;
    y = 400;
    w = 30;
    h = 30;
    beginShape(); //music note 
    vertex(i+185, y+30); //triangle part of music note
    vertex(i+140, y+40);//triangle part of music note
    vertex(i+140, y+110);//line of note
    vertex(i+125, y+110); //line of note
    vertex(i+125, y+10); //line of note
    endShape(CLOSE);

    noStroke();
    fill(0, 0, 0);
    ellipse(i+127, y+110, w, h);
  } //end of loop
}


