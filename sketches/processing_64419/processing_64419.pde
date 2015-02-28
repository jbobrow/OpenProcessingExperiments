
import processing.opengl.*;

// Special thanks to http://www.zenbullets.com

float radius = 100;

float startNoise, noiseStep;

void setup () {
  //size(1024, 768,OPENGL);
  size(500, 380, P3D);
  background(255);
  strokeWeight(3);
  //smooth();
  //frameRate(30);
}

float stepStep = 0.05;

void draw() {
  fill(255, random(60));
  noStroke();
  rect(0, 0, width, height);
  
  translate(width/2, height/2);
  rotate(frameCount*0.01);
  float centX = 0;
  float centY = 0;

  startNoise += random(1);
  noiseStep += stepStep;
  if (noiseStep > 5) {
    stepStep *= -1;
  } 
  else if (noiseStep < -5) {
    stepStep *= 1;
  }

  float x, y;
  float noiseval = startNoise;
  float forstep = 10;

  for (int i=0; i<10; i++) {

    fill(50, 220, 220, 30);
    stroke(255, 20, 190, 100);
    beginShape();

    for (float ang = 0; ang <= 720; ang +=20) {

      noiseval += noiseStep;
      float radVariance = 200 * customNoise(noiseval);

      float thisRadius = radius + radVariance;
      float rad = radians(ang);
      x = centX + (thisRadius * cos(rad));
      y = centY + (thisRadius * sin(rad));

      vertex(x, y);
    }

    endShape();
  }
}

float customNoise(float value) {   // returns value -1 to +1
  float retValue = sin(value);
  int count = int((value % 150));
  for (int i = 0; i < count; i++) {
    retValue *= sin(value);
  }
  return retValue;
}

//void keyPressed(){saveFrame("Brain-Sun-####.png");}


