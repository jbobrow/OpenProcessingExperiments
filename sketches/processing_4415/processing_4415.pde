
// Credit to Esteban Hufstedler.Code taken from 'Interactive Roots' 
// http://www.openprocessing.org/visuals/?visualID=2920

int windowSize = 400; 
int xSize = windowSize;  
int ySize = windowSize;  
 
float maxdTheta = TWO_PI/30; //from 'Interactive Roots'  
int nMovers = 5; //from 'Interactive Roots'
CircleMover[] movers; // from 'Interactive Roots'
float diamInit = 150; // from 'Interactive Roots',value change and made constant by me
float vmin = 2; //from 'Interactive Roots'
float vmax = 4; //from 'Interactive Roots'
int maxTraverses = 0; //from 'Interactive Roots'
boolean polar = true; //from 'Interactive Roots'
boolean decreasingSize = true; //from 'Interactive Roots', made true by me
boolean varyColors = false; //set false by me
boolean transparency = false; // set false by me
boolean outline = true; //from 'Interactive Roots', set false by me
float velocityScaling = 1.5; //value changed and made constant by me
float dThetaScaling = .3; //value changed and made constant by me

void setup() 
{ 
  smooth(); 
  size(400, 600); 
  background(255); 
  movers = new CircleMover[nMovers]; 
  for(int i=0; i<movers.length; i++) 
    movers[i] = new CircleMover(200, 300); //value changed and made constant by me
} 
 
color randomColor() 
{ 
  float alpha = 255; 
  alpha = random(200,255); 
  return color((int)random(20,65),(int)random(0,206),(int)random(0,19),alpha);
 // I changed the random colour values above so that the colours would only vary between greens and browns 
} 
 
void draw() //from 'Interactive Roots'
{ 
//  background(0); 
  for(int i=0; i<movers.length; i++){ 
    movers[i].display(); 
    movers[i].move(); 
  } 
} 

// CIRCLE MOVER  //from 'Interactive Roots', If/else statements removed by me
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
   
      diam = diamInit*(1-max(abs(x-x0),abs(y-y0))*10/windowSize); //from 'Interactive Roots', values changed by me
  }

  void display() {
         noStroke();

      
      fill(fillColor);
      ellipse(x,y,diam,diam);
    }
  }

void keyTyped() { // added by me
   if (key == 'q' || key == 'Q') {
      saveFrame();
    }
}  

