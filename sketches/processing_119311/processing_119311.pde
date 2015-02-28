

//Lin,Lien-Ya
//flowers 

void setup() {
  size(500, 300);
  background(255);
  frameRate(8);
}

void draw() {

  if (mousePressed) {
    pushMatrix();
    translate(random(30), random(20));
    flowers();
    popMatrix();
  }
  spiralW();
}

void spiralW() {

  rotate(random(360));
  //spiral baby steps
  strokeWeight(1); 
  float radius = 10; 
  int centX =0;
  int centY =0;
  stroke(255, 50); 
  float x, y; 
  float lastx = -999; 
  float lasty = -999; 
  float radiusNoise=10;
  for (float ang=0; ang<=360*100; ang+=5) {
    radius += 0.5;  
    radiusNoise += 0.05;  
    float rad = radians(ang);                                   
    float thisRadius = radius + (noise(radiusNoise) *200);
    x = centX + (thisRadius* cos(rad));
    y = centY + (thisRadius* sin(rad));
    if (lastx > -999) { 
      line(x, y, lastx, lasty);
    } 
    lastx = x; 
    lasty = y;
  }
}


void flowers() {
  // draw the filled circle using "shape"
  float radius =random(50);
  int centX =mouseX;
  int centY =mouseY;
  stroke(255);
  float x, y;
  float noiseval = random(10);
  float radVariance, thisRadius, rad;

  beginShape();
  fill(random(0, 120), 50, random(70, 170), 50);
  for (float ang=0; ang<=360; ang+=1) {
     strokeWeight(1);
    noiseval += 0.1;
    radVariance=30*customNoise(noiseval);
    thisRadius = radius+radVariance;
    rad = radians(ang);
    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad));
    curveVertex(x, y);
  }
  
  for (float ang=0; ang<=360*2; ang+=5) {
    radius += 0.3;
    strokeWeight(2);
    float rad2 = radians(ang);
    x = centX + (radius * cos(rad2));
    y = centY + (radius * sin(rad2));
    point(x, y);
  }
   strokeWeight(1);
  endShape();
}
float customNoise(float value) {
  float retValue=pow(sin(value), 3);
  return retValue;
}


