
//praticeM,by chen, wu-zhi
//flower and flowerpot...

float customNoise(float value) {
  int count = int(value%12);
  float retValue=pow(sin(value), count);
  return retValue;
}

void setup() {
  size(900, 900);
  background(255);
  //noLoop();
  frameRate(10);
}

void draw() {
  noStroke();
  fill(250, 200, 135, random(0, 100));    
  ellipse(random(width), random(height), random(5, 10), random(5, 10));
  drawFlower3();
  drawFlower2();
  drawFlower1();
  drawClock();
  if (mousePressed) {
    background(255);
  }
}

void drawFlower1() {
  stroke(random(255), random(255), random(255), random(10));  
  strokeWeight(0.5); 
  noFill();
  //fill(random(255), random(255), random(255), random(2));
  float radius = random(100); 
  float centX = width/2; 
  float centY = height/2; 
  float x, y; 
  float lastx = -999; 
  float lasty = -999; 
  float radiusNoise1 = random(width)-width/2;
  float radiusNoise2 = random(height)-height/2;
  for (float ang=0; ang<=360; ang+=5) {                   
    float rad = radians(ang);
    radiusNoise1 += 0.01; 
    radiusNoise2 += 0.01;    
    x = centX + (radius * sin(rad))+radiusNoise1; 
    y = centY + (radius * tan(rad))+radiusNoise2; 
    rect(x, y, lastx, lasty);
    lastx = x;
    lasty = y;
  }
}

void drawFlower2() {
  //background(255); 
  strokeWeight(0.5); 
  float radius = 100; 
  int centX = width/2; 
  int centY = height/2; 
  // draw the filled circle using "shape"
  stroke(random(255), random(255), random(255), random(30)); 
  float x, y; 
  float noiseval = random(10);
  float radVariance, thisRadius, rad;
  float radiusNoise1 = random(width)-450;
  float radiusNoise2 = random(height)-450;
  beginShape();
  fill(random(255), random(255), random(255), random(10)); 
  for (float ang=0; ang<=360; ang+=1) {
    radiusNoise1 += 0.05; 
    radiusNoise2 += 0.1;
    noiseval += 0.1; 
    radVariance=30*customNoise(noiseval);
    thisRadius = radius+radVariance; 
    rad = radians(ang); 
    x = centX + (thisRadius * sin(rad))+radiusNoise1; 
    y = centY + (thisRadius * sin(rad))+radiusNoise2; 
    curveVertex(x, y);
  }
  endShape();
}

void drawFlower3() {
  //background(255); 
  strokeWeight(0.5); 
  float radius = 100; 
  int centX = width/2; 
  int centY = height/2; 
  // draw the filled circle using "shape"
  stroke(random(255), random(255), random(255), random(30)); 
  float x, y; 
  float noiseval = random(10);
  float radVariance, thisRadius, rad;
  float radiusNoise1 = random(width)-450;
  float radiusNoise2 = random(height)-450;
  beginShape();
  fill(random(255), random(255), random(255), random(10)); 
  for (float ang=0; ang<=360; ang+=1) {
    radiusNoise1 += 0.05; 
    radiusNoise2 += 0.1;
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

void drawClock() {
  int s=second();
  strokeWeight(0.5);
  fill(random(255), random(255), random(255), random(1));
  ellipse(mouseX, mouseY, 20*s, 20*s);
  line(mouseX-50-10*s,mouseY-50-10*s,mouseX+50+10*s,mouseY+50+10*s);
}



