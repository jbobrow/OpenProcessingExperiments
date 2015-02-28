
color base = color(220);
color shapeOver = color(110);

color currentColor;   // 1 == square, 2 == circle
int currentShape;

int spaceX = 10;
int spaceY = 10;
int barWidth = 25;
int barHeight = 63;

float colorBarX = spaceX;
float [] colorBarY = new float [5];

int fillColor;

color [] colorBarColor = new color [5];

int squareBarX = spaceX;
int squareBarY = spaceY*7 + barHeight*5;

float circX = spaceX + barWidth/2;
float circY = spaceY*6 + barHeight*6;



void setup() {
  background(255);
  size(600, 600);
  smooth();

  colorBarColor [0] = color(200, 0, 0);
  colorBarColor [1] = color(255, 255, 0);
  colorBarColor [2] = color(50, 0, 235);
  colorBarColor [3] = color(0);
  colorBarColor [4] = color(255);
}

void draw() {
  //background(255);
  menu();
  

  if (mousePressed && drawingShape()) {
    myMousePressed(mouseX, mouseY);
    background(255);
    started = true;
    menu();
  }

  update();
}

boolean mouseDetectColor(float x, float y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    return true;
  } 
  else {
    return false;
  }
}


