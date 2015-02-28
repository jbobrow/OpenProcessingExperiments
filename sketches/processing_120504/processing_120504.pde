
// Assignment 5: Spring 11/13
// use 3D visualizations 
// use 2D/3D noise functions to create randomness with patterns
// by chen-hsin chang

float xstart, xnoise, ystart, ynoise;
float xstartNoise, ystartNoise;
void setup() {
  size(200, 600, P3D);
  background(255);
  frameRate(10);
  translate(width/2, height/2, 0);
  xstartNoise = random(20);
  ystartNoise = random(20);
  xstart = random(10);
  ystart = random(10);
}
void draw() {
  background(255);
  
  //nemo; 
  noStroke();
  fill(200, 200, 200, random(20,100)); 
  ellipse(mouseX, mouseY, 50, 50); 
  fill(252, 162, 78); 
  ellipse(mouseX+random(1, 4), mouseY+random(1, 4), 5, 5); 
  ellipse(mouseX+random(5, 8), mouseY+random(5, 8), random(3, 5), random(3, 5));
  stroke(0,10);
  
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(random(0,360));
  noFill();
  line(200, 200,-200,Y-200);
  popMatrix();
  

  xstartNoise += 0.01;
  ystartNoise += 0.01;
  xstart +=(noise(xstartNoise)*0.5)-0.25;
  ystart +=(noise(ystartNoise)*0.5)-0.25;
  xnoise = xstart;
  ynoise = ystart;
  for (int y = 0; y <= height; y+=1) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=1) {
      xnoise += 0.1;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, 450-y, -y+450);
  rotate(noiseFactor * radians(360));
  stroke(250, 150, 150, noiseFactor*100);
  noFill();
  rect(0, 0, 1, 10);
  popMatrix();
}


void drawNemo(float centX, float centY) {
  ellipse(centX, centY, 10, 10);
}



