
/*
 * Satish Goda, Jan 29 2010. satishgoda at gmail dot com
 * USAGE:
 *   There is a Point. 
 *   Paint direction Vector using "left mouse click", drag and let go.
 *   Point moves along the direction vector.
 *   To reset point to original position, Click "right mouse click"
 **/

PVector point1;
PVector point1progress;
int timeToAnimate = 20;
int currentTime = 0;
boolean animatePoint = false;

PVector mouseClickStart;
PVector mouseClickEnd;
PVector mouseDirection;
boolean mouseDragging = false;

void setup()
{
  size(720, 546);
  background(0);
  smooth();
  
  point1 = new PVector(width/2, height/2, 25);
  mouseClickStart = new PVector(0.0, 0.0);
  mouseClickEnd = new PVector(0.0, 0.0);
  mouseDirection = new PVector(0.0, 0.0);
}

void draw()
{
  fill(0, 30);
  noStroke();
  rect(0, 0, width, height);

  if(mouseDragging == true) {
    stroke(127);
    line(mouseClickStart.x, mouseClickStart.y, mouseClickEnd.x, mouseClickEnd.y);
  }

  fill(255, 0, 0);
  stroke(255, 255, 0);

  if(currentTime > timeToAnimate) {
    animatePoint = false;
    currentTime = 0;
    point1.set(point1progress);
  } 
  
  if(animatePoint){
    float normalizedTime = lerp(0.0, 1.0, currentTime/float(timeToAnimate));
    point1progress = PVector.add(point1,PVector.mult(mouseDirection, normalizedTime));
    ellipse(point1progress.x, point1progress.y, point1.z, point1.z);
    currentTime += 1;
  } 
  else {
    ellipse(point1.x, point1.y, point1.z, point1.z);
  }
}

void mousePressed()
{
  if(mouseButton == LEFT) {
    mouseClickStart.set(mouseX, mouseY, 0);
  }
}

void mouseDragged()
{
  if(mouseButton == LEFT) {
    mouseDragging = true;
    mouseClickEnd.set(mouseX, mouseY, 0);
  }
}

void mouseReleased()
{
  if(mouseButton == LEFT) {
    mouseClickEnd.set(mouseX, mouseY, 0);

    mouseDirection = PVector.sub(mouseClickEnd, mouseClickStart);
    animatePoint = true;

    mouseClickStart.set(0, 0, 0);
    mouseClickEnd.set(0, 0, 0);
    mouseDragging = false;
  }  
}

void mouseClicked()
{
  if(mouseButton == RIGHT) {
    point1.set(width/2, height/2, 25);
  } 
}








