
float radius = 5;

void setup() {
  size(600, 400);
  background(51, 64, 151);
  strokeWeight(0.5);
  smooth();
  //noLoop();
  frameRate(1);
}

void floWer() {
  // refresh
  float centX = random(250);
  float centY = random(200);
  float x, y;
  // draw 100 spirals
  for (int i = 0; i<30; i++) {                                        
    float lastx = -999;
    float lasty = -999;
    float radiusNoise = random(6);
    float radius = 10;
    stroke(255, 60);

    int startangle = int(random(360));                                 
    int endangle =  1440 + int(random(500));                          
    int anglestep =  6 + int(random(2));
    for (float ang = startangle; ang <= endangle; ang += anglestep) {
      radiusNoise += 0.03;
      radius += 0.5;
      float thisRadius = radius + (noise(radiusNoise) * 300) - 300;
      float rad = radians(ang);
      x = centX + (thisRadius * sin(rad));
      y = centY - (thisRadius * cos(rad));
      if (lastx > -999) {
        strokeWeight(0.5);
        line(x, y, lastx, lasty);
      }
      lastx = x;
      lasty = y;
    }
  }
}
void floWer2() {

  float centA = mouseX;
  float centB = mouseY ;

  strokeWeight(1);

  // repeat a number of times
  float layers = random(5);
  for (int i=0;i<layers;i+=5) {
    // randomize the radius
    radius = random(100);

    // draw the filled circle using "shape"
    stroke(0, 162, 154);
    strokeWeight(1);
    float x, y;
    float noiseval = random(10);
    float radVariance, thisRadius, rad;
    beginShape();
    fill(95, 183, 225, 60);
    // fill(240,39,92,40);
    for (float ang=0; ang<=360; ang+=1) {
      noiseval += 0.3;
      radVariance = 30*customNoiseB(noiseval);
      thisRadius = radius+radVariance;
      rad = radians(ang);                                 
      x = centA - (thisRadius * cos(rad));
      y = centB + (thisRadius * sin(rad));
      curveVertex(x, y);
    }
    endShape();
  }
}

float customNoise(float value) {
  float retValue = pow(sin(value), 2);
  return retValue;
}

float customNoiseB(float value) {
  int count = int(value%5);
  float retValue = pow(sin(value), count);
  return retValue;
}
void draw () {
  floWer();
  floWer2();

}


