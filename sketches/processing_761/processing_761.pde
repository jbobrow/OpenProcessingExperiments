
/**
 * Circle Painter
 * by Matt Katz. 
 * Click on the image to put origin points on the face.
 * I'd recommend you put them on eyes and lips, as you want detail there.
 * press g to begin rendering out the image..
 * We'll paint out the image using scatterings of concentric circles, 
 * larger ones where don't need detail.
 * inspired by this image: http://www.flickr.com/photos/tsevis/2498089530/sizes/l/
 *  
 */

PImage source;
int originX;
int originY;
pointsArray points;
boolean render;
int minRadius;

void setup()
{
  size(604,404);
  //name of the image we want.
  source = loadImage("deadness.jpg");
  //size(source.width,source.height);
  noStroke();
  background(source);
  smooth();
  originX = 0;
  originY = 0;
  points = new pointsArray();
  render = false;
  minRadius = 4;
}
void keyPressed() {
  if( key=='s'){//save the screen
    saveFrame( "seriousbusiness-####.jpg"); 
  }
  else if (key=='c'){//clear the screen
    background(255); 
  }
  else if (key =='g'){
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
    //world's coolest color
    fill(#BADA55);
    ellipse(current.x, current.y, minRadius,minRadius);
  }
}

void draw()
{ 
  //reset it all to a new origin point
  if(mousePressed){
    points.addPoint(new oPoint(mouseX, mouseY));
  }

  if (render){
    for( int i = 0; i< 60; i++){
      pointilize() ;
    }
  }
  else{
   //background(source);
   renderOriginPoints(); 
  }
}

void pointilize()
{
  //generate a raondom point that we are going to pointillize
  int x = int(random(source.width));
  int y = int(random(source.height));

  //what is the smallest distance we are from an origin point
  float distance = minDist(new oPoint(x,y));

  //let's generate a size based on that distance
  //we want that size to tend to be proportional to the distance
  //but allow for some random variation in size
  float circleSize = (distance/8) * produceNormalDistributionNumber();

  drawCircle(x, y, max(circleSize, minRadius));
}

//find the minimum distance from an origin point to this point p
float minDist(oPoint p){
  float smallestDistance = dist(p.x, p.y, points.points[0].x, points.points[0].y);
  for( int i = 1; i < points.counter; i++){
    oPoint current = points.points[i];
    smallestDistance = min(smallestDistance, dist(p.x, p.y, current.x, current.y));
  } 
  return smallestDistance;
}

//draw a circle and draw circles inside of it.
void drawCircle(int x, int y, float radius)
{
  radius = max(ceil(radius), minRadius);
  fill(getColorFromCircle(x,y,radius), 126);
  ellipse(x,y,radius,radius); 
  if(radius > minRadius){
    drawCircle(x, y, radius -1);
  }
}


color getColorFromCircle(int x, int y, float radius){
  //we want to get a point that is radius away from x,y
  //lets pic a point along the radius that we are intersted in
  //one before the next circle will get drawn.
  radius = random(floor(radius-1), radius) + radius;

  //let's pic a random angle around the circle.
  int angle = floor(random(0,360));

  //do a little trig
  int newX = floor((cos(angle) * radius)) + x;
  int newY = floor((sin(angle) * radius)) + y; 
  return source.get(newX, newY);
}

//just seems weird that processing doesn't have points
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


