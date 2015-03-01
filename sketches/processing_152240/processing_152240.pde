
/*
 * Creative Coding
 * Week 3, 04 - spinning top: curved motion with sin() and cos()
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch is the first cut at translating the motion of a spinning top
 * to trace a drawing path. This sketch traces a path using sin() and cos()
 *
 */

int num;            // number of 'tops'
float x[], y[];     // primary co-ordinate for each top
float dx[], dy[];   // speed change for each primary co-ordinate, implying velocity of top
float bx[], by[];
float handx[], handy[];
float rad[];        // radius for the moving hand
float startRadius;  // for the initial circle

void setup() {
  size(500, 500);
  num = 8;

  x = new float[num];
  y = new float[num];
  dx = new float[num];
  dy = new float[num];
  bx = new float[num];
  by = new float[num];
  handx = new float[num];
  handy = new float[num];
  rad = new float[num];
  
  // initial position in the centre of the screen
  startRadius = 100;
  for (int i=0;i<num;i++){
    x[i] = width/2 + startRadius * cos(TWO_PI * (i+1)/num);
    y[i] = height/2 + startRadius * sin(TWO_PI * (i+1)/num);

  // dx and dy are the small change in position each frame
    dx[i] = random(-2, 2);
    dy[i] = random(-2, 2);
    background(0);
  }
}


void draw() {
  // blend the old frames into the background
//  blendMode(BLEND);
  fill(0, 4);
  rect(0, 0, width, height);
  
  for (int i=0;i<num;i++){
    rad[i] = radians(frameCount);
  
    // calculate new position
    x[i] += dx[i];
    y[i] += dy[i];
  
    float max = 1;
    float min = 0;
  
    //When the shape hits the edge of the window, it reverses its direction and changes velocity
    if (x[i] > width-100 || x[i] < 100) {
      dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
    }
  
    if (y[i] > height-100 || y[i] < 100) {
      dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
    }
    
    //When one primary shape hits another then both change direction
    for (int j=0;j<num;j++){
       if (j != i && dist(x[j],y[j],x[i],y[i])<10){
         dx[i] = -dx[i];
         dy[i] = -dy[i];
       }
    }    
      
    bx[i] = x[i] + 100 * sin(rad[i]);
    by[i] = y[i] + 100 * cos(rad[i]);
  
    fill(180);
  
    float radius = 100 * sin(rad[i]*0.1);
    handx[i] = bx[i] + radius * sin(rad[i]*3);
    handy[i] = by[i] + radius * cos(rad[i]*3);
  
    stroke(255, 50);
    line(bx[i], by[i], handx[i], handy[i]);
    fill(0,255,0);
    ellipse(handx[i], handy[i], 5, 5);
    fill(0,0,255);
    ellipse(bx[i],by[i],5,5);
    fill(255,0,0);
    ellipse(x[i],y[i],10,10);
  }
}



