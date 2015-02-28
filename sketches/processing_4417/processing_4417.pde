
// Credit to Nicol Valenzuela. Code taken from 'trama 2'
// http://www.openprocessing.org/visuals/?visualID=4052 

int windowSize = 500; 
int xSize = windowSize;  
int ySize = windowSize;  
 
float a, b; // from 'trama 2'

float maxdTheta = TWO_PI/30; // from 'Interactive Roots'
int nMovers = 3; // from 'Interactive Roots'
CircleMover[] movers; // from 'Interactive Roots'
float diamInit = 200; // from 'Interactive Roots', value changed and made constant by me.
float vmin = 2; // from 'Interactive Roots'
float vmax = 4; // from 'Interactive Roots'
int maxTraverses = 0; //number of trips each mover takes. for infinite, 0 
boolean polar = true; // from 'Interactive Roots'
boolean decreasingSize = false; // from 'Interactive Roots'
boolean varyColors = false; //set false by me
boolean transparency = true; //set false by me
boolean outline = true; // from 'Interactive Roots'
float velocityScaling = 1; //value changed and made constant by me
float dThetaScaling = 1.7; //value changed and made constant by me

void setup() 
{ 
  a= 10; // from 'trama 2'  
  b = 200; // from 'trama 2'
  
  smooth(); 
  size(400, 600); 
  background(4, 8, 118); 
  movers = new CircleMover[nMovers];  // from 'Interactive Roots'
  for(int i=0; i<movers.length; i++) // from 'Interactive Roots'
    movers[i] = new CircleMover(50, 350); // from 'Interactive Roots'
} 
 
color randomColor() // from 'Interactive Roots'
{ 
  float alpha = 255; 
  alpha = random(0,100); 
  return color((int)random(0,255),(int)random(0,255),(int)random(0,255),alpha); 
} 
 
void draw() 
{ 
//  background(0); 
  for(int i=0; i<movers.length; i++){ // from 'Interactive Roots'
    movers[i].display(); 
    movers[i].move(); 
for(float y =b; y <= height-a; y += b){   // from 'trama 2'
    for(float x = a; x <= width-a; x += b){   
      float d;   
      d = dist(mouseX, mouseY, x, y);   
     float diam;   
    diam = map(d,0, 10*height, 20, 30);    
    fill(167, 3, 23, 30); 
   
   ellipse(x,y,d,d);   // from 'trama 2'
    
    }   
  }     

} 
} 

// CIRCLE MOVER  // from 'Interactive Roots'
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
    if(maxTraverses==0 || trips < maxTraverses){ 
      x += velocity*velocityScaling*cos(thetaDir);
      y += velocity*velocityScaling*sin(thetaDir);
      thetaDir += random(-dThetaScaling*maxdTheta, dThetaScaling*maxdTheta);
      if(polar){
        checkOutOfBoundsPolar();
        calculateSizePolar();  
      }
    }
  }
  
  void checkOutOfBoundsPolar()
  {
    r = sqrt((x-x0)*(x-x0)+(y-y0)*(y-y0));
    if(r > windowSize/2){
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

void keyTyped() { // added by me
   if (key == 'q' || key == 'Q') {
      save("interactive.tif");
    }
}  


