
import netscape.javascript.*;
ArrayList points;

PVector mouseClickStart;
PVector mouseClickEnd;
boolean mouseDragging = false;

void setup()
{
  size(720, 800, P3D);
  background(0);
  smooth();

  points = new ArrayList();

  mouseClickStart = new PVector(0.0, 0.0);
  mouseClickEnd = new PVector(0.0, 0.0);
}

void draw()
{
  fill(0, 30);
  noStroke();
  rect(0, 0, width, height);
  //draw a line as the mouse is dragged
  if (mouseDragging == true) {
    stroke(127);
    line(mouseClickStart.x, mouseClickStart.y, mouseClickEnd.x, mouseClickEnd.y);
  }

  for (int i = 0; i < points.size();  i++) {
    Point thePoint = (Point) points.get(i);
    thePoint.draw();
  }
}

void mousePressed()
{
  if (mouseButton == LEFT) {
    mouseClickStart.set(mouseX, mouseY, 0);

    points.add(new Point(mouseX, mouseY, 25));
  }
}

void mouseDragged()
{
  if (mouseButton == LEFT) {
    mouseDragging = true;
    mouseClickEnd.set(mouseX, mouseY, 0);
  }
}

void mouseReleased()
{
  if (mouseButton == LEFT) {
    mouseClickEnd.set(mouseX, mouseY, 0);

    for (int i = 0; i < points.size(); i++) {
      Point thePoint = (Point) points.get(i);
      thePoint.setDirection(mouseClickStart, mouseClickEnd);
    }

    mouseClickStart.set(0, 0, 0);
    mouseClickEnd.set(0, 0, 0);
    mouseDragging = false;
  }
}

//calculate slope and particle performance; having most math technique in this class
class Point
{
  PVector loc;
  PVector animatedLoc;
  PVector direction;
  int animateTime;
  int currentTime;
  boolean animate;
  float lineSlope;

  Point(int x, int y, int animateTime)
  {
    this.loc = new PVector(x, y);
    this.direction = new PVector();
    this.animateTime = animateTime;
    this.currentTime = 0;
    this.animate = false;
  }

  void setDirection(PVector startPoint, PVector endPoint)
  {
    this.direction= PVector.sub(endPoint, startPoint);
    this.animate = true;
    lineSlope = (endPoint.y - startPoint.y) / (endPoint.x - startPoint.x);
  }
  //everytime the user draws a line, update() will be called and help the particle perform the
  // right action
  void update()
  {
    
    if(this.currentTime > this.animateTime) {
     this.animate = false;
     this.currentTime = 0;
     this.loc.set(this.animatedLoc);
     return;
     }
     
    //lerp requires a float, so I just make up a number for animateTime, so the 
    //grphics will come out nicer
    float time = lerp(0.0, lineSlope, this.currentTime/float(this.animateTime));
    //every time the user draws a line, create a new particle
    this.animatedLoc = PVector.add(this.loc, PVector.mult(this.direction, time));
    //this.animatedLoc = PVector.add(this.loc, this.direction);
    this.currentTime += 1;
  }
  //call the particle from Particles class
  void draw()
  {

    fill(255, 255, 255);
    if (this.animate) {
      this.update();
      triangle(this.animatedLoc.x - 7, this.animatedLoc.y + 10,this.animatedLoc.x - 7, this.animatedLoc.y - 10, this.animatedLoc.x + 7, this.animatedLoc.y);
      //Particles(this.animatedLoc.x, this.animatedLoc.y);
    //}
    //else {
      //triangle(this.loc.x - 7, this.loc.y + 10, this.loc.x - 7, this.loc.y - 10, this.loc.x + 7, this.loc.y);
      //Particles(this.loc.x, this.loc.y);
    }
    textSize(12);
    
    String l = "";
    l += "The slope of the line you draw is " + lineSlope;
    text(l, 15, height - 130);
  }
}
/*
//create a 3D particles
public class Particles 
{

  float rotX = 5*PI/4-0.16, rotY = PI/4;
  float incX= .5, incY= .5;
  float locX, locY

  Particles(float locX, float locY)
  {
    this.locX = locX;
    this.locY = locY;
  }

  /*
  void setup() 
  {
    frameRate(20);
    size(640, 480, P3D);
    lights();
    smooth();
  }
  
  
  //auto-rotate particles
  void draw() 
  {
    background(0);

    pushMatrix();
    translate(locX, locY);
    translate(width/2, height/2, 0);
    rotateY(rotX);
    rotateX(rotY);
    rotX += incX;  
    rotY += incY;

    stroke(0, 0, 0);
    fill(100, 100, 100);
    box(20);

    popMatrix();

    fill(0, 0, 255);
    int rotXDeg = (int)(rotX * 180/PI + .5);
    int rotYDeg = (int)(rotY * 180/PI + .5);
  }
}
*/


