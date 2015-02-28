
class Mover
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float   topspeed = 2;
  int     radius;
  
  int     age = 0;
  boolean isAlive = true;
  int     maxAge = (int) random(ageRangeMin, ageRangeMax);
  
  float   mass;
  
  float noiseR, noiseB, noiseG;
  float noiseA = 0;
  
  float thetaR = 0.0;
  float thetaG = 0.0;
  float thetaB = 0.0;
  float thetaA = 0.0;
  
  color rectColor;
  
  Mover(PVector initialPos)
  {
    location = new PVector(initialPos.x, initialPos.y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(-0.001, 0.001);
    
    radius = (int)random(brushRadiusMin, brushRadiusMax);
    
    mass = radius;
  }
  
  void update()
  {
    acceleration = new PVector(random(-1, 1), random(-1, 1));
    acceleration.normalize();
    acceleration.mult(random(-.2, .2));
    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    
    if (age == maxAge)  isAlive = false;
    age ++;
    
    thetaR += random(0, .01);
    thetaG += random(0, .02);
    thetaB += random(0, .04);
    thetaA ++;
    
    noiseR = sin(thetaR) * 255;
    noiseG = sin(thetaG) * 255;
    noiseB = sin(thetaB) * 255;
    noiseA = thetaA % 255;
    
    //rectColor = color(noiseR, noiseG, noiseB, noiseA);
    if (isInColorMode)  rectColor = color(noiseR, 0, 0, noiseA);
    else                rectColor = color(noiseR, noiseA);
  }
  void display()
  {
    noStroke();
    noStroke();
    fill(rectColor);
    int r = (int)map(age, 0, maxAge, radius, .1); 
    ellipse(location.x, location.y, r, r);
  }
  
  void checkEdges()
  { 
    if (location.x > (canvasX + canvasWidth) - canvasPadding  || location.x < canvasX + canvasPadding)  velocity.x *= -1;
    if (location.y > (canvasY + canvasHeight) - canvasPadding || location.y < canvasY + canvasPadding) velocity.y *= -1;
  }
  
  void applyForce(PVector force)
  {
    //acceleration.add(PVector.div(force, mass));
  }
}


