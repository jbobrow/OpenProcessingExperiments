
// Piston
// Ted Brown # January 27, 2010
// Written en route from Burbank to Eugene on a netbook, w00t
// Uses degrees instead of radians because my math was still shaky at this point

Piston_Object piston;

void setup () {
  size(400, 500);
  piston = new Piston_Object();
  stroke(0);
}

void draw () {
  piston.update();
  background(255, 255, 255, 1);
  piston.render();
}

class Piston_Object {
  float rotation, radius, shaft, headWidth, headHeight;
  float baseX, baseY, gearX, gearY, shaftX, shaftY;
  float energy;
  boolean downstroke;
  
  Piston_Object () {
    rotation = 0;
    radius = 75;
    shaft = 175;
    baseX = width/2;
    baseY = height/2 + shaft/2;
    headWidth = 75;
    headHeight = 50;
    energy = 4;
  }
  
  void update () {
    rotation += energy;
    if (rotation >= 360) rotation = 0;
    if (rotation == -360) rotation = 0;
      
    gearX = (cos(radians(rotation)) * radius) + baseX;
    gearY = (sin(radians(rotation)) * radius) + baseY;
    
    float a = gearX - baseX;
    float A;
    float prevShaftY = shaftY;
    
    if (a < 0) {
      A = acos(abs(a)/shaft);
      shaftX = (cos(A) * shaft) + gearX;
      shaftY = gearY - (sin(A) * shaft);
    } else {
      A = asin(a/shaft);
      shaftX = gearX - (sin(A) * shaft);
      shaftY = gearY - (cos(A) * shaft);
    }
    
    if (prevShaftY < shaftY) downstroke = true;
    else downstroke = false;
  }
  
  void render () {
    line(baseX, baseY, gearX, gearY);
    line(gearX, gearY, shaftX, shaftY);
    noFill();
    ellipse(baseX, baseY, radius * 2, radius * 2);
    rect(shaftX - headWidth/2, shaftY - headHeight, headWidth, headHeight); 
    fill(0);
    ellipse(gearX, gearY, 5, 5);
  }

}

