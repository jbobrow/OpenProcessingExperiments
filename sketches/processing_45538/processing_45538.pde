
//Author: Herbert Hsu
//Purpose: Using randomness and function to create the flowering image
//Concept: realistic Flowers
//Reference: class-example from Nik, schien@mail.ncku.edu.tw
void setup() {
  size(600, 400);
  background(163, 210, 134);
  smooth();
  frameRate(5);
  // noLoop();
}


void draw() {

  flower();
  fade();

}

void mousePressed(){
noLoop();
}

void keyPressed(){
saveFrame("FF.jpg");
}

void flower() {
  float radius=random(60)+40;
  float centX=random(600);
  float centY=random(400);
  stroke(20, 50, 70);
  strokeWeight(1);
  float x, y;
  float noiseval=random(5);


  float radVariance, thisRadius, rad;
  float p=10;

  for (int i=0; i<8;i++) {
    radius-=10;
    beginShape();
    fill(20, 50, 70, 40);
    for (float ang=0; ang<=360;ang+=1) {
      noiseval+=0.7;
      radVariance=30*customNoise(noiseval);
      thisRadius=radius+radVariance;
      rad = radians(ang); 
      x=centX+(thisRadius*cos(rad));
      y=centY+(thisRadius*sin(rad));
      curveVertex(x, y);
      stroke(225, random(76)+90, random(76)+90, 200);
      strokeWeight(random(3)+3);
      line(centX, centY, x, y);
      strokeWeight(0);
    }
    endShape();
  }

  //the pistil
  beginShape();
  for (float ang=0; ang<=360;ang+=1) {
    noiseval+=0.5;
    radVariance=30*customNoise(noiseval);
    thisRadius=noise(radVariance)*15+radius+20;
    rad = radians(ang); 
    x=centX+(thisRadius*cos(rad));
    y=centY+(thisRadius*sin(rad));
    curveVertex(x, y);
    stroke(random(30)+210, 234, 62, 50);
    strokeWeight(random(3)+3);
    line(centX, centY, x, y);
    strokeWeight(0);
  }
  endShape();
}

float customNoise(float value) {
  int count = int((value % 13));
  float retValue=pow(cos(value), count+2);
  return retValue;
}

void fade() {
  fill(163, 210, 134, 40);
  noStroke();
  rect(0, 0, width, height);
}


