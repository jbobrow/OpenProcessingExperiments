
/*
Author: Anita Chen
Purpose: Assignment-4 "Flowering Flowers"
Concept: Shy flowers
         Flowers  size follow the mouse position change more and more smaller
Reference: 1.Noisy Spirals, Noisy Circles, and 100 Spirals. Exercises provided in class by:schien@mail.ncku.edu.tw
*/

float maxDistance;

void setup() {
  size(500, 500);
  background(0);
  smooth();
  maxDistance = dist(0, 0, width/2, height/2);
}
void draw() {
  noStroke();
  fill(0, 100);
  rect(0, 0, width, height);
  flower();
}

void flower() {
  noFill();
  strokeWeight(1);
  color strokeCol=color(255, 0, random(255), 150);
  stroke(strokeCol);
  int n=50;
  int n2=n/2;
  for (int i = 0; i <= width; i += n ) {
    for (int j = 0; j <= height; j += n) {
      float mouseDist = dist(mouseX, mouseY, i, j);
      float diameter = (mouseDist / maxDistance) * 80;
      float radius=diameter /2;
      int centX=i+int(random(-n2, n2));
      int centY=j+int(random(-n2, n2));
      float x, y;
      float radiusNoise=random(10);
      int startangle=int(random(360));
      int endangle=720+int(random(720)); 
      int anglestep=1+int (random(3));
      
      beginShape();
      for (float ang=startangle;ang<=endangle; ang+=anglestep) {
        radiusNoise+=0.05;
        radius-=0.02;
        float thisRadius=radius+(noise(radiusNoise)*15);
        float rad=radians(ang);
        x=centX+(thisRadius*cos(rad));
        y=centY+(thisRadius*sin(rad));
        curveVertex(x, y);
        strokeWeight(0);
        line(centX, centY, x, y);
        strokeWeight(1);
      }
      endShape();
    }
  }
}
void keyPressed() {
 saveFrame("Flowering Flowers .jpg");
 }


