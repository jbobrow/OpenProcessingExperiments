
float[] circleX = new float[1];
float[] circleY = new float[1];
float[] diameters = new float[1];
color[] colors = new color[1];
int circleNum = 0;
boolean newCircle;
boolean diamMode=false;
color backColor,circleColor;
int circleDensity=60;
String pointsFilename = "circlePoints.txt";
int brightnessIndex = 0;


void setup() {
  size(800,600);
  colorMode(HSB,360,100,100,100);
  //  backColor=color(24,77,50,25);
  backColor=color(24,0,0,30);
  //  circleColor=color(196,100,94,5);
  circleColor=color(196,0,100,2);
  setupColors();
  background(backColor);
  smooth();
  resetDrawing();
}


void draw() {

  background(backColor);

  increasingDiameter();

  drawCircles();

  flicker();
}



void mousePressed() {

  canIDrawHere();

  if (newCircle) {    
    addACircle();
  }
}


void mouseReleased() {
  diamMode=false;
}

void keyPressed() {
  if (key=='r') {
    resetDrawing();
  }
  if (key=='f') {
    for(int i=circleNum;i>0;i--) {
      colors[i]=color(hue(colors[i]),saturation(colors[i]),brightness(colors[i])-5,alpha(colors[i]));
    }
    brightnessIndex--;
  }
  if (key=='b') {
    for(int i=circleNum;i>0;i--) {
      colors[i]=color(hue(colors[i]),saturation(colors[i]),brightness(colors[i])+5,alpha(colors[i]));
    }
    brightnessIndex++;
  }
  if (key=='s') {
    saveDrawing();
  }
  if (key=='l') {
    loadDrawing();
  }
}


