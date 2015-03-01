
/*
  Original idea is not my own, I made this using inspiration from:
  http://imgur.com/user/Ecne and http://imgur.com/gallery/H1CyoAP
*/
  
final int numLines = 20;

void setup() {
    size(400, 400);
    strokeWeight(7.8);
}

float R=125;
float centerR=125;
float a=PI/2;
float a1=PI;
float a2=3*PI/2;
float pathR=125;
float pathG=125;
float G=125;
float centerG=125;
float pathB=125;
float B=125;
float centerB=125;

void draw() {
  background(255);
  fill(pathR, pathG, pathB);
  noStroke();
  ellipse(200, 200, 270, 270);
  noFill();
  strokeCap(SQUARE);
  for(int i = 0; i < numLines; i++) {
    float j = abs(sin(frameCount/20.0f + (i/numLines * PI)) * TWO_PI);
    stroke(0);
    arc(width/2, height/2, i*14, i*14, -j/2,  j/2);
  }
  pathR=centerR+R*sin(a);
  a=a+.03;
 
  pathG=centerG+G*sin(a1);
  a1=a1+.03;
 
  pathB=centerB+B*sin(a2);
  a2=a2+.03;
}
