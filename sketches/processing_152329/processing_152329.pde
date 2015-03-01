
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

int count;           //number of points
int buffer;          //distance from the edge to rebound the point
int speed;           //point vector speed
int armMin, armMax;  //the random range for the arm radius
int proximity;       //the distance under which a connection is drawn

boolean showConstruction;  //controls whether the construction lines are drawn
color bg, ln;            //global colour values

float[] x, y;    // current drawing position
float[] bx, by;  // current offset position 
float[] dx, dy;  // change in position at each frame
float[] offset;  // random offset for spinninng arm
int[]   radius;  // radius of the arms

void setup() {
  size(500, 500);
  
  //set global values
  count = 5;
  buffer = 50;
  speed = 2;
  armMin = 10;
  armMax = 100;
  proximity = 75;
  
  showConstruction = false;
  bg = color(#000000,255);
  ln = color(#ffffff,15);
    
  //initilise arrays
  x = new float[count];
  y = new float[count];
  dx = new float[count];
  dy = new float[count];
  bx = new float[count];
  by = new float[count];
  offset = new float[count];
  radius = new int[count];
  
  //fill the arrays with new random values
  fillArrays();

  background(bg);
}

void fillArrays() {
  for(int i=0;i<count;i++) {
    // initial position for the points
    x[i] = random(buffer,width-buffer);
    y[i] = random(buffer,height-buffer);
    
    // dx and dy are the small change in position each frame
    float dir = random(0,TWO_PI);
    dx[i] = speed*sin(dir);
    dy[i] = speed*cos(dir);
    
    //initilise the radius and offset
    offset[i] = random(0,TWO_PI);
    radius[i] = (int)random(armMin,armMax);
  }
}

void draw() {
  // blend the old frames into the background
  //blendMode(BLEND);
  
  float rad = radians(frameCount);
  
  //calculate the new positions
  for(int i=0;i<count;i++) {
    // calculate new position
    x[i] += dx[i];
    y[i] += dy[i];
  
    //When the shape hits the edge of the window, it reverses its direction and changes velocity
    if (x[i] > (width-buffer) || x[i] < buffer) dx[i] *= -1;
    if (y[i] > (height-buffer) || y[i] < buffer) dy[i] *= -1;
  
    //calculate arm position
    bx[i] = x[i] + radius[i] * sin(rad+offset[i]);
    by[i] = y[i] + radius[i] * cos(rad+offset[i]);
  }
  
  if(frameCount%100==0) {
    //draw the background to fade
    noStroke();
    fill(bg,5);
    rect(0,0,width,height);
  }
  
  //draw any lines that need drawing
  for(int i=0;i<count;i++) {
    
    //draw construction lines
    if(showConstruction) {
      stroke(#ff0000,32);
      fill(#ff0000,32);
      ellipse(x[i],y[i],5,5);
      stroke(#00ff00,32);
      line(x[i],y[i],bx[i],by[i]);
    }
    
    //draw proximity lines
    stroke(ln);
    for(int j=0;j<count;j++) {
      //don't test proximity between itself 
      if(j!=i) {
        if(dist(bx[i],by[i],bx[j],by[j])<proximity)
          line(bx[i],by[i],bx[j],by[j]);
      }
    }
  }
}

void keyPressed() {
  switch(key) {
    case 'c':
      showConstruction = !showConstruction;
      break;
    case ' ':
      background(bg);
      fillArrays();
      break;
    case 's':
      saveFrame("stitches-####.png");      
      break;
    default:
      println("Key <"+key+"> has no associated action");
  }
}


