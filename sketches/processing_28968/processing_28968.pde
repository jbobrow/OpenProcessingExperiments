
ArrayList points;
 
PVector mouseClickStart;
PVector mouseClickEnd;
boolean mouseDragging = false;
 
void setup()
{
  size(720, 800);
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
  
  if(mouseDragging == true) {
    stroke(127);
    line(mouseClickStart.x, mouseClickStart.y, mouseClickEnd.x, mouseClickEnd.y);
  }
 
  for(int i = 0; i < points.size();  i++) {
    Point thePoint = (Point) points.get(i);
    thePoint.draw();
  }
}
 
void mousePressed()
{
  if(mouseButton == LEFT) {
    mouseClickStart.set(mouseX, mouseY, 0);
     
    points.add(new Point(mouseX, mouseY, 25));
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
 
    for(int i = 0; i < points.size(); i++) {
      Point thePoint = (Point) points.get(i);
      thePoint.setDirection(mouseClickStart, mouseClickEnd);
    }
 
    mouseClickStart.set(0, 0, 0);
    mouseClickEnd.set(0, 0, 0);
    mouseDragging = false;
  }  
}
 

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
 
  void update()
  {
    
    if(this.currentTime > this.animateTime) {
      this.animate = false;
      this.currentTime = 0;
      this.loc.set(this.animatedLoc);
      return;
    } 
    
    float normalizedTime = lerp(0.0, lineSlope , this.currentTime/float(this.animateTime));
    this.animatedLoc = PVector.add(this.loc, PVector.mult(this.direction, normalizedTime));
    //this.animatedLoc = PVector.add(this.loc, this.direction);
    this.currentTime += 1;
    
  }
  
  void draw()
  {
    
    fill(255, 255, 255);
    if(this.animate){
      this.update();
      triangle(this.animatedLoc.x - 7, this.animatedLoc.y + 10,this.animatedLoc.x - 7, this.animatedLoc.y - 10, this.animatedLoc.x + 7, this.animatedLoc.y);
    }
    else {
      triangle(this.loc.x - 7, this.loc.y + 10, this.loc.x - 7, this.loc.y - 10, this.loc.x + 7, this.loc.y);
    }
  }
  
}



