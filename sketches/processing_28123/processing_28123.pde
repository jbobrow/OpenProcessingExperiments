

PImage source;
int originX;
int originY;
pointsArray points;
boolean render;
int minRadius;
 
void setup()
{
  size(481,363);

  source = loadImage("6.jpg");

  noStroke();
  background(source);
  smooth();
  originX = 0;
  originY = 0;
  points = new pointsArray();
  render = false;
  minRadius = 2;
}
void keyPressed() {
  if (key=='d'){
  setup();
  }
  else if (key =='a'){
    render = ! render;
    if(!render){
      background(source);
      renderOriginPoints();
    }
    else{
     background(255);
    }
     
  }
}
 
 
void renderOriginPoints(){
  for( int i = 0; i < points.counter; i++){
    oPoint current = points.points[i];
    fill(255);
    ellipse(current.x, current.y, minRadius,minRadius);
  }
}
 
void draw()
{

  if(mousePressed){
    points.addPoint(new oPoint(mouseX, mouseY));
  }
 
  if (render){
    for( int i = 0; i< 60; i++){
      pointilize() ;
    }
  }
  else{
  
   renderOriginPoints();
  }
}
 
void pointilize()
{
  
  int x = int(random(source.width));
  int y = int(random(source.height));
 

  float distance = minDist(new oPoint(x,y));
 
  
  float circleSize = (distance/10) * produceNormalDistributionNumber();
 
  drawCircle(x, y, max(circleSize, minRadius));
}
 

float minDist(oPoint p){
  float smallestDistance = dist(p.x, p.y, points.points[0].x, points.points[0].y);
  for( int i = 1; i < points.counter; i++){
    oPoint current = points.points[i];
    smallestDistance = min(smallestDistance, dist(p.x, p.y, current.x, current.y));
  }
  return smallestDistance;
}
 

void drawCircle(int x, int y, float radius)
{
  radius = max(ceil(radius), minRadius);
  fill(getColorFromCircle(x,y,radius), 100);
  ellipse(x,y,radius,radius);
  if(radius > minRadius){
    drawCircle(x, y, radius -1);
  }
}
 
 
color getColorFromCircle(int x, int y, float radius){
  
  radius = random(floor(radius-1), radius) + radius;
 
  
  int angle = floor(random(0,360));
 
  
  int newX = floor((cos(angle) * radius)) + x;
  int newY = floor((sin(angle) * radius)) + y;
  return source.get(newX, newY);
}
 

class oPoint{
  int x;
  int y;
  oPoint(int xIn, int yIn){
    x = xIn;
    y = yIn;
  }
}
 
 
class pointsArray
{
  oPoint[] points;
  int counter;
 
  pointsArray(){
    points = new oPoint[5];
    counter = 0;
  }
 
  void addPoint(oPoint in){
    if( counter == points.length){
      oPoint[] temp = points;
      points = new oPoint[points.length+ 5];
      for (int i = 0; i < counter; i++){
        points[i] = temp[i];
      }
    }
    points[counter++] = in;
  }
   
  void reset(){
   counter = 0;
   points = new oPoint[5];
  }
}
 
 
float produceNormalDistributionNumber(){
  float a = random(0,2);
  float b = random(0,2);
  float c = random(0,2);
  float d = random(0,2);
  return (a + b + c + d)/4;
}

