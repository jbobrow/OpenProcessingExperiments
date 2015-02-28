
//Author: Dulce Andino
//Purpose: Assignment 4 ;"Flowering Flowers"
//Concept: Carnation Blossom
//Reference: Noisy Spirals, Noisy Circles, and 100 Spirals. Exercises provided in class by:
//           schien@mail.ncku.edu.tw




float radius = 5;

void setup() {
  size(500, 500);
  background(255);
  strokeWeight(0.5);
  smooth();
  //noLoop();
  frameRate(3);
}

void floWer() {

  float centX = random(500);
  float centY = random(500);
  float x, y;
  // draw 100 spirals
  for (int i = 0; i<40; i++) {  


    float lastx = -999;
    float lasty = -999;
    float radiusNoise = random(5);
    float radius = 5;
    stroke(random(20), random(50), random(70), 50);

    int startangle = int(random(360));                                  
    int endangle =  1440 + int(random(700));                           
    int anglestep =  8 + int(random(2));
    for (float ang = startangle; ang <= endangle; ang += anglestep) {
      radiusNoise += 0.03;
      radius += 0.5;
      float thisRadius = radius + (noise(radiusNoise) * 200) - 200;
      float rad = radians(ang);
      x = centX + (thisRadius * cos(rad));
      y = centY + (thisRadius * sin(rad));
      if (lastx > -999) {
        strokeWeight(1);
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
    stroke(185, 17, 90);
    strokeWeight(3);
    float x, y;
    float noiseval = random(5);
    float radVariance, thisRadius, rad;
    beginShape();
    fill(250, 18, 119, 60);
    // fill(240,39,92,40);
    for (float ang=0; ang<=360; ang+=1) {
      noiseval += 0.1;
      radVariance = 30*customNoiseB(noiseval);
      thisRadius = radius+radVariance;
      rad = radians(ang);                                  
      x = centA + (thisRadius * cos(rad));
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

void floWer3() {

  float centC = random(500);
  float centD = random(500);

  stroke(255, 214, 3, 150);

  strokeWeight(3);
  radius = 3;
  float x, y;
  float lastx = -999;
  float lasty = -999;
  float radiusNoise = random(3);

  for (float ang=0; ang<=360*3; ang+=5) { 
    radiusNoise += 0.03;
    radius += 0.5;

    float thisRadius = radius + (noise(radiusNoise)*200) - 100;                
    float rad = radians(ang);                                  
    x = centC + (thisRadius * cos(rad));
    y = centD + (thisRadius * sin(rad)); 
    // the code that really form part of a circle
    if (lastx > -999) {
      line(x, y, lastx, lasty);
    }
    lastx = x;
    lasty = y;
  }
}

void draw () {
  floWer();
  floWer2();
  floWer3();
}

void keyPressed() {
  saveFrame("Carnation-####.jpg");
}


