
void setup() {
  size(500,300);
  background(10);
  smooth();

  float radius;
  float centX;
  float centY;
  
  stroke(20,50,70);
  strokeWeight(1);

  float x,y;
  float radVariance, thisRadius,rad;
  int borderx = 20;
  int bordery = 50;

  for (int i = 0; i < 30; i++) {
    float lastx = -999;
    float lasty = -999;
    float noiseVal = random(10);
    
    radius = random(50) + 50; //radius between 50 and 100
    centX = random(width-(2*borderx)) + borderx; //center along x with 20 border
    centY = random(height-(2*bordery))+bordery; //50px border along y
    
    stroke(random(90)+100,random(20),random(50)+30);
    
    for (float ang=0; ang <= 360;ang+=1) {
      noiseVal+=0.1;
      radVariance = 30*customNoise(noiseVal);
      thisRadius = radius + radVariance;
      rad = radians(ang);
      x = centX + (thisRadius*cos(rad));
      y = centY + (thisRadius*sin(rad));
      
      if (lastx > -999) {
        line(x,y,lastx,lasty);
      }
      
      lastx = x;
      lasty = y;
    }
  }
  //saveFrame("DeconstructedCircles-##.jpg");
}

float customNoise(float value) {
  //float retValue = pow(sin(value),3);
  //float retValue = exp(cos(value));
  float retValue = pow(noise(value),2) + pow(cos(value),3);
  //float retValue = noise(value)*cos(random(1));
  return retValue;
}

