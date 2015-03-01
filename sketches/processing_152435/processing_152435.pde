
/*
 * Creative Coding
 * Week 3, 04 - spinning top: curved motion with sin() and cos()
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch is the first cut at translating the motion of a spinning top
 * to trace a drawing path. This sketch traces a path using sin() and cos()
 *
 * Variation
 *     use class for tops
 *     prevent point collision points where they are within x pixels
 *     draw lines between random pairs when within certain tolerance
 *
 */

Spinner[] top;

int tops;
float rad;       // radius for the moving hand
int bgh, bgs, bgb;
int edgeDeflect, pointDeflect;
int[] coloursel; //line colour
int mincol, maxcol;
float rowHeight, distanceMargin;
  
void setup() {
  size(800, 750);
  tops=5;

  //how close can the tops move to the edge
  edgeDeflect=100;
  
  //how close can the tope move to one another
  pointDeflect=10;

  colorMode(HSB,360,100,100);
  coloursel = new int[tops];

  mincol=89;
  maxcol=260;
  
  rowHeight=height/tops;
  
  distanceMargin = height/tops*.618034;
  
  top = new Spinner[tops];
  
  // initial position in the centre of the screen
  for (int i=0; i<tops; i++) {
    int thisDist=i;
    if (tops>0) {
      while (thisDist==i) {
        thisDist = int(random(0,tops));
      } 
    }
    
    top[i] = new Spinner(width/2, height/2, random(-1,1), random(-1,1), thisDist); 

  }

  
  background(0);
}


void draw() {
  // blend the old frames into the background
  //blendMode(BLEND);
  fill(0, 5);
  //rect(0, 0, width, height);
  
  rad = radians(frameCount);

  float max = 1;
  float min = 0.5;
  
  float x1, y1, x2, y2;

  // calculate new position
  for (int i=0; i<tops; i++) {
    top[i].locate(min, max, edgeDeflect);

    //compare the distance of the tops to one another and deflect where necessary
    //I wonder if I can add this to the locate method
    for (int chki=0; chki<tops; chki++) {
      //ignore where self
      if (chki!=i) {        
        if (dist(top[i].x,top[i].y,top[chki].x,top[chki].y)<=pointDeflect) {
          top[i].redirectx(min, max);
          top[i].redirecty(min, max);
          top[i].locate(min, max, edgeDeflect);
        }
      }
      
    }
      
    
    top[i].display(rad);    

    
    x1=top[i].bx;
    y1=top[i].by;
    
    x2=top[top[i].spinDist].handX;
    y2=top[top[i].spinDist].handY;
      
    float distance = dist(x1, y1, x2, y2);
      
    if (distance > rowHeight && distance < rowHeight + distanceMargin) {
      //stroke(coloursel[i], 62,70, 50);
      stroke(map(distance,0,rowHeight + distanceMargin,mincol,maxcol), 62,70, 50);
      
      line(x1, y1, x2, y2);        
 
      //stroke(255);
      point(x1, y1);
      point(x2, y2);
    }
    
  }
}


void setBackgroundColour() {
  bgs = int(map(mouseX, 0, width, 1, 100));
  bgb = int(map(mouseY, 0, height, 1, 100));
  bgh = int(map(mouseX+mouseY, 0, width+height, 360, 0));
  println(bgh);
 
  fill(bgh, bgs, bgb);
  noStroke();
  rect(0, 0, width, height);
}

 
void keyReleased() {
  switch (key) {
  case 'c':
    clear();
    //startFrame=frameCount;    
    setBackground();
    break;
  case 'b':
    setBackgroundBlack();
    break;
  case 'w':
    setBackgroundWhite();
    break;
  //case 's':
  //  writeData();
  //  break;
  //case 'r':
  //  randomise(); // put each circle on a new orbit
  //  break;
  //case 'x':
  //  break;
  } 
}


void setBackgroundWhite() {
  bgh = 0;
  bgs =0;
  bgb = 100;
  
  setBackground();
}

void setBackground() {
  background(bgh,bgs,bgb);
}


void setBackgroundBlack() {
  bgh = 0;
  bgs =0;
  bgb = 0;
  
  setBackground();
}



class Spinner {
  float x, y, dx, dy, bx, by, handX, handY;
  int spinDist;
  
  Spinner(float tempX, float tempY, float tempdX, float tempdY, int tempDist) {
    x = tempX;
    y = tempY;
    dx = tempdX;
    dy = tempdY;
    spinDist = tempDist;
  }
  
  
  void locate(float lMin, float lMax, float eDeflect) {
    x += dx;
    y += dy;
    
    //When the shape hits the edge of the window, it reverses its direction and changes velocity
    if (x > width-eDeflect || x < eDeflect) {  
      //dx = dx > 0 ? -random(lMin, lMax) : random(lMin, lMax);
      redirectx(lMin, lMax);
    }

    if (y > height-eDeflect || y < eDeflect) {
      //dy = dy > 0 ? -random(lMin, lMax) : random(lMin, lMax);
      redirecty(lMin, lMax);
    }
  }
  
  void redirectx(float rMin, float rMax) {
    dx = dx > 0 ? -random(rMin, rMax) : random(rMin, rMax);
  }
  
  void redirecty(float rMin, float rMax) {
    dy = dy > 0 ? -random(rMin, rMax) : random(rMin, rMax);
  }
  
  void display(float dRad) {
    bx = constrain(x + 100 * sin(dRad),0,height);
    by = constrain(y + 100 * cos(dRad),0,width);
      
    fill(180);

    float radiusDist = 100 *  sin(rad*0.1);
  
    handX = bx + radiusDist * sin(rad*3);
    handY = by + radiusDist * cos(rad*3);

    stroke(255, 50);
    //line(bx, by, handX, handY);
    //ellipse(handX, handY, 2, 2);
    //point(x,y);
    
  }
  
  
}


