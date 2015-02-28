
float jupiterDiameter;
PImage jupiter;
float jupiterx;

float earthDiameter;
PImage earth;
float earthx;

float marsDiameter;
PImage mars;
float marsx;

float mercuryDiameter;
PImage mercury;
float mercuryx;

float neptuneDiameter;
PImage neptune;
float neptunex;

float saturnDiameter;
PImage saturn;
float saturnx;

float uranusDiameter;
PImage uranus;
float uranusx;

float venusDiameter;
PImage venus;
float venusx;

float variableDiameter;
float oscilationValue;

void setup() {
  
  size(540, 380);
  smooth();
  frameRate(24);
    
  variableDiameter = 100;
  oscilationValue = 8;
  
  jupiter = loadImage("jupiter.png");
  earth = loadImage("earth.png");
  mars = loadImage("mars.png");
  mercury = loadImage("mercury.png");
  neptune = loadImage("Neptune.png");
  saturn = loadImage("saturn.png");
  uranus = loadImage("uranus.png");
  venus = loadImage("venus.png");
  
  
}

void draw() {

  jupiterDiameter = oscilationValue * cos(radians(frameCount)) + variableDiameter;
  jupiterx = 100 * sin(radians(frameCount)) + width/2;
  
  saturnDiameter = oscilationValue * cos(radians(frameCount + 45)) + variableDiameter * 1.2;
  saturnx = 100 * sin(radians(frameCount + 45)) + width/2;
  
  earthDiameter = oscilationValue * cos(radians(frameCount + 45*2)) + variableDiameter * 0.6;
  earthx = 100 * sin(radians(frameCount + 45*2)) + width/2;
  
  marsDiameter = oscilationValue * cos(radians(frameCount + 45*3)) + variableDiameter * 0.5;
  marsx = 100 * sin(radians(frameCount + 45*3)) + width/2;
  
  mercuryDiameter = oscilationValue * cos(radians(frameCount + 45*4)) + variableDiameter * 0.3;
  mercuryx = 100 * sin(radians(frameCount + 45*4)) + width/2;
  
  neptuneDiameter = oscilationValue * cos(radians(frameCount + 45*5)) + variableDiameter * 0.2;
  neptunex = 100 * sin(radians(frameCount + 45*5)) + width/2;
  
  uranusDiameter = oscilationValue * cos(radians(frameCount + 45*6)) + variableDiameter * 0.1;
  uranusx = 100 * sin(radians(frameCount + 45*6)) + width/2;
  
  venusDiameter = oscilationValue * cos(radians(frameCount + 45*7)) + variableDiameter * 0.08;
  venusx = 100 * sin(radians(frameCount + 45*7)) + width/2;
  
  background(0);
  imageMode(CENTER);
  
  image(jupiter, jupiterx, height/2, jupiterDiameter, jupiterDiameter);
  
  image(saturn, saturnx, height/2, saturnDiameter, saturnDiameter);
  
  image(earth, earthx, height/2, earthDiameter, earthDiameter);
  
  image(mars, marsx, height/2, marsDiameter, marsDiameter);
  
  image(mercury, mercuryx, height/2, mercuryDiameter, mercuryDiameter);
  
  image(neptune, neptunex, height/2, neptuneDiameter, neptuneDiameter);
  
  image(uranus, uranusx, height/2, uranusDiameter, uranusDiameter);
  
  image(venus, venusx, height/2, venusDiameter, venusDiameter);
  
}

