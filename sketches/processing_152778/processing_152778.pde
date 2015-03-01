
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

float x1, y1;      // current drawing position
float dx, dy;    // change in position at each frame
float rad;       // radius for the moving hand
int currentFrame = 0;


void setup() {
  size(500, 500);
  frameRate(40);

  // initial position in the centre of the screen
  x1 = width/2;
  y1 = height/2;
  // dx and dy are the small change in position each frame
  dx = random(-1, 1);
  dy = random(-1, 1);
  
  background(0,0,50);
}


void draw() {
  // blend the old frames into the background
  
 /* blendMode(BLEND);  
  fill(0,0,50,5);
  rect(0, 0, width, height);
 */
  
 
  float max = 1;
  float min = 0.5;
  
  rad = radians(random(360));
// calculate new position
  x1 += dx;
  y1 += dy;
  //When the shape hits the edge of the window, it reverses its direction and changes velocity
  if ( x1 > width-100 || x1 < 100) {
    dx = dx > 0 ? -random(min, max) : random(min, max);
  }

  if (y1 > height-100 || y1 < 100) {
    dy = dy > 0 ? -random(min, max) : random(min, max);
  }

 twirl(x1, y1); 
}

void twirl(float myx, float myy){
  
  float tx = myx;
  float ty = myy;
  float bx = tx + 50 * sin(frameCount);
  float by = ty + 50 * cos(frameCount);
  float radius = 100 * sin(5);
  float handX = bx + radius * sin(frameCount)-dx*10;
  float handY = by + radius * cos(frameCount)-dy*10;
  

  stroke(200, 100);
  strokeWeight(2);
  // line 1
  line(bx, by, handX, handY);
  // line 2
  //line(bx, by, handX, handY);
  
  noStroke();
  fill(0,0,50);
  ellipse(tx,ty,60,60);
  
   // save your drawing when you press keyboard 's'
   if (keyPressed == true && key=='a') {
     currentFrame = frameCount;
   }
  if (keyPressed == true && key=='s') {
    //saveFrame("yourName.jpg");
     if (frameCount+currentFrame % 2 == 0 & frameCount< currentFrame+121) saveFrame("image-####.gif");
  
  }
}





