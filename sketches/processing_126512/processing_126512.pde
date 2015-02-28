
//Flowers
//Clark Li
//Reference from:http://www.openprocessing.org/sketch/119311
//Try to draw the image of leaf.

void setup() {
  size(500, 500);
  background(250);
  smooth();
 frameRate(10);
}

void draw() {
   if (mousePressed) {
    flowers();
  }
 
 
  stroke(1);
  strokeWeight(10);
  float x, y;
  float radius=10;
  float radiusNoise=random(10);
  float noisecal=random(10);
  int centX=int(random(width*2/5));
  int centY=int(random(height*2/3));
}

void flowers() {

  stroke(20,random(80));
  strokeWeight(random(1));
  int centX =  mouseX;
  int centY =  mouseY;
  float x, y;
  float radius = random(30);
  float radiusNoise = random(1);
  float noisecal =random(20, 5);

  beginShape();
  fill(20, 230, 50,20);
  for (float ang=0; ang<=360*2; ang+=10) {
    radiusNoise += 0.5;
    radius += random(0.3);

    float thisRadius = radius + (noise(radiusNoise)*100) - 50;
    float rad = radians(ang);

    x = centX + (thisRadius* cos(rad));
    y = centY + (thisRadius* sin(rad));
    curveVertex(x, y);
  }
  endShape();
}



