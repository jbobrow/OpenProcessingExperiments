
//Global Variables
float noiseStart;
float noiseStep;
float noiseValue;
int startHeight;
int x_coord, y_coord;
int mappedColor;


//Configurations
void setup(){
  size(600, 600);
  sketchFullScreen();
  noCursor();
  smooth();
  startHeight = 400;
  noiseStart = random(30);
  noiseValue = noiseStart;
  noiseStep = 0.001;
  x_coord = 0;
  y_coord = startHeight;
  background(255);
  frameRate(30);
}

//Drawing Loop
void draw(){
  background(255);
  for(int i = 0; i < width; i++){
    mappedColor = (int) map(noiseValue, -100, 100, 0, 255); 
    stroke(mappedColor, 0, 0);
    noiseValue = noise(noiseStart+i*noiseStep)*200-100;
    point(x_coord, y_coord+noiseValue);
    line(x_coord, height, x_coord, y_coord+noiseValue);
    x_coord += 1;
  }
  noiseStart+=noiseStep*80;
  x_coord = 0;
}

//Fullscreen Variable
boolean sketchFullScreen() {
  return true;
}

//Screen Capturer
void keyPressed() {
  if (keyCode == ENTER) {
    saveFrame("screen-####.jpg");
  }
}
