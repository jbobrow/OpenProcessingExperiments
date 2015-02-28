
float ellipseWH;
int switcher = 0;
int smallAmountColor = 0;
int grayTone = 0;

void setup() {
size(500,500);
frameRate(30);
}

void draw() {
  float entropy = map(mouseX, 0, width, 0, 255);
  background(random(0,entropy),random(0,entropy),random(0,entropy));
  for(int i = 0; i<entropy; i++) {
      stroke(random(0,255));
      float ellipseColor = random(100,entropy);
    //Color Switcher;
      if(switcher == 0) fill(smallAmountColor,ellipseColor,ellipseColor);
      else if(switcher == 1) fill(smallAmountColor,ellipseColor,ellipseColor/2);
      else if(switcher == 2) fill(smallAmountColor,ellipseColor/2,ellipseColor);
      else if (switcher == 3) fill(ellipseColor, smallAmountColor, ellipseColor);
      else if (switcher == 4) fill(ellipseColor/2, smallAmountColor, ellipseColor);
      else if (switcher == 5) fill(ellipseColor, smallAmountColor, ellipseColor/2);
      else if (switcher == 6) fill(ellipseColor,ellipseColor,smallAmountColor);
      else if (switcher == 7) fill(ellipseColor,ellipseColor/2,smallAmountColor);
      else if (switcher == 8) fill(ellipseColor/2,ellipseColor,smallAmountColor);
    //Ellipse Drawing
    ellipseWH = random(10,entropy);
    float entropyForCoordinates = map(entropy, 0, 255, 0, width/2);
    int xCoordinate = width/2;
    int yCoordinate = height/2;
    ellipse(random(width/2-entropyForCoordinates,width/2+entropyForCoordinates),random(height/2-entropyForCoordinates,height/2+entropyForCoordinates),ellipseWH,ellipseWH);
    //Color Switcher and grayTone Incrementer
    switcher++;
    if(switcher == 9) switcher = 0;
  }
}

