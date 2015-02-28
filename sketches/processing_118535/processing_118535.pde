
//reference my dear teacher:Sheng-Fen Nik Chien.
//"noisy circles" function.
//and change apart of it.

void setup() {
  size(900, 900);
  frameRate(20);
  background(255); 
  //noLoop();
}

void draw() {
  //background(255); 
  strokeWeight(0.5); 
  float radius = 100; 
  int centX = width/2; 
  int centY = height/2; 

  // draw the filled circle using "shape"
  stroke(random(255), random(255), random(255),random(30)); 
  float x, y; 
  float noiseval = random(10);
  float radVariance, thisRadius, rad;
  float radiusNoise1 = random(900)-450;
  float radiusNoise2 = random(900)-450;
  beginShape();
  fill(random(255), random(255), random(255),random(10)); 
  for (float ang=0; ang<=360; ang+=1) {
    radiusNoise1 += 0.05; 
    radiusNoise2 += 0.05;
    noiseval += 0.1; 
    radVariance=30*customNoise(noiseval);
    thisRadius = radius+radVariance; 
    rad = radians(ang); 
    x = centX + (thisRadius * cos(rad))+radiusNoise1; 
    y = centY + (thisRadius * sin(rad))+radiusNoise2; 
    curveVertex(x, y);
  }
  endShape();
}

// customed noise function

float customNoise(float value) {
  int count = int(value);
  float retValue=pow(sin(value), count);
  return retValue;
}


