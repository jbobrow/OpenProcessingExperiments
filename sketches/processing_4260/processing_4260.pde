
int windowSize = 500; 
int xSize = windowSize;  
int ySize = windowSize;  
 
float maxdTheta = TWO_PI/30; 
int nMovers = 10; 
CircleMover[] movers; 
float diamInit = 250; 
float vmin = 2; 
float vmax = 4; 
int maxTraverses = 0; //number of trips each mover takes. for infinite, 0 
boolean polar = true; 
boolean decreasingSize = true; 
boolean varyColors = false; 
boolean transparency = false; 
boolean outline = true; 
float velocityScaling = 1.5; 
float dThetaScaling = .3;

void setup() 
{ 
  smooth(); 
  size(windowSize, windowSize); 
  background(255); 
  movers = new CircleMover[nMovers]; 
  for(int i=0; i<movers.length; i++) 
    movers[i] = new CircleMover(windowSize/2,windowSize/2); 
} 
 
color randomColor() 
{ 
  float alpha = 255; 
  alpha = random(200,255); 
  return color((int)random(20,65),(int)random(0,206),(int)random(0,19),alpha); 
} 
 
void draw() 
{ 
//  background(0); 
  for(int i=0; i<movers.length; i++){ 
    movers[i].display(); 
    movers[i].move(); 
  } 
} 

// CIRCLE MOVER
class CircleMover 
{
  float diam;
  float r;
  float x,y;
  float x0,y0;
  float velocity; //its speed of travel in thetaDir
  float thetaDir; // direction of velocity
  color fillColor;
  int trips = 0;
  
  CircleMover(float xI, float yI) {
    x = xI;
    y = yI;
    x0 = x;
    y0 = y;
    r = sqrt((x-x0)*(x-x0)+(y-y0)*(y-y0));
    velocity = random(vmin,vmax);
    thetaDir = random(0, TWO_PI);
    fillColor = randomColor();
  }
 
  void move () {
         x += velocity*velocityScaling*cos(thetaDir);
      y += velocity*velocityScaling*sin(thetaDir);
      thetaDir += random(-dThetaScaling*maxdTheta, dThetaScaling*maxdTheta);
      if(polar){
        checkOutOfBoundsPolar();
        calculateSizePolar();
    }
  }
  
  void checkOutOfBoundsPolar()
  {
    r = sqrt((x-x0)*(x-x0)+(y-y0)*(y-y0));
    if(r > windowSize/1){
      x = x0;
      y = y0;
      r = 0;
      fillColor = randomColor();
      velocity = random(vmin,vmax);
      thetaDir = random(0, TWO_PI);
      trips++;
    }
  }
  
  void calculateSizePolar()
  {
        diam = r*2/windowSize*diamInit;
  }

  void checkOutOfBoundsRect()
  {
    if(x > windowSize || x <0 || y>windowSize || y<0){
      x = x0;
      y = y0;
      fillColor = randomColor();
      velocity = random(vmin,vmax);
      thetaDir = random(0, TWO_PI);
      trips++;
    }
  }
  
  void calculateSizeRect()
  {
   
      diam = diamInit*(1-max(abs(x-x0),abs(y-y0))*2/windowSize);
  }

  void display() {
         noStroke();

      
      fill(fillColor);
      ellipse(x,y,diam,diam);
    }
  }

void keyTyped() {
   if (key == 'q' || key == 'Q') {
      save("roots_green.tif");
    }
}  

