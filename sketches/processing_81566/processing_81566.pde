
// MODIFIED BY JAKE OLIVEIRA
//
// CREDIT TO: Claudius Lazzeroni
//
/**
 * creates a terrain like mesh based on noise values.
 * 
 * MOUSE (click/drag)
 * --changes the intesnsity of the earthquake--
 *
 */

import processing.opengl.*;

// ------ mesh ------
int tileCount = 50;
int zScale = 150;

// ------ noise ------
int noiseXRange = 10;
int noiseYRange = 10;
int octaves = 4;
float falloff = 0.5;

// ------ mesh coloring ------
color midColor, topColor, bottomColor;
float threshold = 0.30;

// ------ mouse interaction ------
int offsetX = 0, offsetY = 0, clickX = 0, clickY = 0, zoom = 180;
float rotationX = 0, rotationZ = 0, targetRotationX = -PI/3, targetRotationZ = 0, clickRotationX, clickRotationZ; 

// ------ image output ------
int qualityFactor = 4;
TileSaver tiler;  
boolean showStroke = false;


void setup() {
  size(400, 500, OPENGL);
  colorMode(RGB, 255, 255, 255);
  tiler = new TileSaver(this);
  strokeWeight(0);
  cursor(CROSS);

  // colors
  topColor = color(210, 105, 30);
  midColor = color(160, 82, 45);
  bottomColor = color(165, 42, 42);


}


void draw() {
  if(tiler==null) return; 
  tiler.pre();



  background(124, 51, 25);
  lights();


  // ------ set view ------
  pushMatrix();
  translate(width*0.5, height*0.6, zoom);

  if (mousePressed && mouseButton==RIGHT) {
    offsetX = mouseX-clickX;
    offsetY = mouseY-clickY;
    targetRotationX = min(max(clickRotationX + offsetY/float(width) * TWO_PI, -HALF_PI), HALF_PI);
    targetRotationZ = clickRotationZ + offsetX/float(height) * TWO_PI;
  }
  rotationX += (targetRotationX-rotationX)*0.25; 
  rotationZ += (targetRotationZ-rotationZ)*0.25;  
  rotateX(-rotationX);
  rotateZ(-rotationZ); 


  // ------ mesh noise ------
  if (mousePressed && mouseButton==LEFT) {
    noiseXRange = mouseX/10;
    noiseYRange = mouseY/10;
  }

  noiseDetail(octaves, falloff);
  float noiseYMax = 0;

  float tileSizeY = (float)height/tileCount;
  float noiseStepY = (float)noiseYRange/tileCount;

  for(int meshY=0; meshY<=tileCount; meshY++) {
    beginShape(TRIANGLE_STRIP);
    for(int meshX=0; meshX<=tileCount; meshX++) {

      float x = map(meshX, 0,tileCount, -width/2,width/2);
      float y = map(meshY, 0,tileCount, -height/2,height/2);

      float noiseX = map(meshX, 0,tileCount, 0,noiseXRange);
      float noiseY = map(meshY, 0,tileCount, 0,noiseYRange);
      float z1 = noise(noiseX,noiseY);
      float z2 = noise(noiseX,noiseY+noiseStepY);

      noiseYMax = max(noiseYMax, z1);
      color interColor;
      colorMode(RGB);
      if (z1 <= threshold) {
        float amount = map(z1, 0,threshold, 0.15,1);
        interColor = lerpColor(bottomColor, midColor, amount);
      } 
      else {
        float amount = map(z1, threshold,noiseYMax ,0,1);
        interColor = lerpColor(midColor, topColor, amount);
      }
      colorMode(HSB,360,100,100);
      fill(interColor);

      vertex(x, y, z1*zScale);   
      vertex(x, y+tileSizeY, z2*zScale);
    }
    endShape();
  }
  popMatrix();

  tiler.post();
}

void mousePressed(){
  clickX = mouseX;
  clickY = mouseY;
  clickRotationX = rotationX;
  clickRotationZ = rotationZ;
}

void keyPressed() {
  if (keyCode == UP) falloff += 0.05;
  if (keyCode == DOWN) falloff -= 0.05;
  if (falloff > 1.0) falloff = 1.0;
  if (falloff < 0.0) falloff = 0.0;

  if (keyCode == LEFT) octaves--;
  if (keyCode == RIGHT) octaves++;
  if (octaves < 0) octaves = 0;

  if (key == '+') zoom += 20;
  if (key == '-') zoom -= 20;
}



String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}



