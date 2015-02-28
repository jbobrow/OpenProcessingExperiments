
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
      else{
        checkOutOfBoundsRect();
        calculateSizeRect();      
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
      if(varyColors)
        fillColor = randomColor();
      velocity = random(vmin,vmax);
      thetaDir = random(0, TWO_PI);
      trips++;
    }
  }
  
  void calculateSizePolar()
  {
    if(decreasingSize)
      diam = diamInit*(1-r*2/windowSize);
    else
      diam = r*2/windowSize*diamInit;
  }

  void checkOutOfBoundsRect()
  {
    if(x > windowSize || x <0 || y>windowSize || y<0){
      x = x0;
      y = y0;
      if(varyColors)
        fillColor = randomColor();
      velocity = random(vmin,vmax);
      thetaDir = random(0, TWO_PI);
      trips++;
    }
  }
  
  void calculateSizeRect()
  {
    if(decreasingSize)
      diam = diamInit*(1-max(abs(x-x0),abs(y-y0))*2/windowSize);
    else
      diam = max(abs(x-x0),abs(y-y0))*2/windowSize*diamInit;
  }

  void display() {
    if(!outline)
      noStroke();
    else
      stroke(0);
      
    if(maxTraverses==0 || trips < maxTraverses){
      fill(fillColor);
      ellipse(x,y,diam,diam);
    }
  }
}

