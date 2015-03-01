
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
 
float x, y;      // current drawing position
float dx, dy;    // change in position at each frame
float rad;       // radius for the moving hand
 
boolean showConstruct;
 
void setup() {
  size(500, 500);
 
  // initial position in the centre of the screen
  x = width/2;
  y = height/2;
 
  // dx and dy are the small change in position each frame
  dx = random(-1, 1);
  dy = random(-1, 1);
  background(0);
   
  // don't show construction at start
  showConstruct = true;
   
}
 
 
void draw() {
  // blend the old frames into the background
  //blendMode(BLEND);
  fill(0, 5);
  rect(0, 0, width, height);
  rad = radians(frameCount);
 
  // calculate new position
  x += dx;
  y += dy;
 
  float mmax = 1;
  float mmin = 0.5;
 
  //When the shape hits the edge of the window, it reverses its direction and changes velocity
  if (x > width-100 || x < 100) {
    dx = dx > 0 ? -random(mmin, mmax) : random(mmin, mmax);
  }
 
  if (y > height-100 || y < 100) {
    dy = dy > 0 ? -random(mmin, mmax) : random(mmin, mmax);
  }
   
  float bx = x + 100 * sin(rad);
  float by = y + 100 * cos(rad);
 
  float radius = 100 * sin(rad*0.1);
  float handX = bx + radius * sin(rad*3);
  float handY = by + radius * cos(rad*3);
 
  if (showConstruct) {
      background(0);
      stroke(255, 0, 0);
      point(x,y);
      fill(255);
      text( "Point x,y moving in a line in boundary 100 pixels less than size.", x,y);
      text( "Changes direction randomly at boundary.", x,y+12);
      noFill();
      point(bx,by);
      fill(255);
      text( " Point bx, by moves in a circle around x,y.", bx,by);
      noFill();
      stroke(255,255,0,25);
      ellipse(x,y,200,200);
      stroke(0,0,255);
      noFill();
      point(handX,handY);
      fill(255);
      text( "Point handX, handY moves in a circle around bx,by.", handX,handY+12);
      text( "The circle oscillates in size, they are joined by a line.", handX,handY+24);
      noFill();
      stroke(0,255,255);
      ellipse(bx,by, radius*2, radius*2);
      frameRate(20);
  }
  fill(180);
  stroke(255, 50);
  line(bx, by, handX, handY);
  ellipse(handX, handY, 2, 2);
}
 
void keyPressed() {
  if (key == 'h')
  showConstruct = !showConstruct;
}
 
void mousePressed() {
  showConstruct = !showConstruct;
}
