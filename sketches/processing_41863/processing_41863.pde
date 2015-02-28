
//Samantha Oleson
//EMS II 
//Carnegie Mellon University
//September 2011

//I used some code from my dog animation code that Eric helped me edit

int movePicture = (millis()/77) % 801;

//LOAD IMAGE VARIABLES
PImage Ocean;
PImage FrontOcean;
PImage Hands;
PImage Sailboat;
PImage Fins;

//BOBBING HANDS VARIABLES
int gStep = 0;
boolean gForwardFlag = true;
final int kStepTime = 150;  // how fast to step
int gLastTime = 0;

//SHARFK FIN VARIABLES
int maxFins = 5; //Allows 10 circles to be made
int [] finXPosition = new int [maxFins];
int numberOfFins = 0;



void setup() {

  size(700, 500);
  smooth();

  //LOAD IMAGES 
  Ocean = loadImage("Flat Ocean.jpg", "jpg");
  FrontOcean = loadImage("Flat Ocean2.jpg", "jpg");
  Sailboat = loadImage("sailboat.png", "png");
  Hands = loadImage("Hands.png", "png");
  Fins = loadImage("Fins.png", "png");

  //SHARKS
  for (int i = 0; i < maxFins; i++) {
    finXPosition[i] = 0;
  }
}


void draw() {

  image(Ocean, 0, 0, 700, 500);
  drawSharkFins();

  int thisTime = millis();
  if (thisTime - gLastTime >= kStepTime) {
    if (gForwardFlag == true) {
      gStep++;
      if (gStep == 3) {
        gForwardFlag = false;
      }
    }
    else {
      gStep--;
      if (gStep == -3) {
        gForwardFlag = true;
      }
    }
    // save time
    gLastTime = thisTime;
  }
  drawHands(gStep);

  image(FrontOcean, 2, 410, 700, 100);
  drawSailboat();
  drawLightChange();
}

void drawSharkFins() {
  int movePicture = (millis()/77) % 801;
  for (int i = 0; i < numberOfFins; i++) { //when there are less than 10 circles another can be drawn
    constrain(movePicture, 500,700);
    image(Sailboat, finXPosition[i]+ movePicture, 300, 100, 100);
    
  }
  
}


void drawLightChange() {
  //make image darker and more opaque over 1 hour of time
  int m = millis()/600;
  rect(-5, -5, 710, 510);
  fill(255 - (m), 255 - (m), 255 - (m), 0+(m/20));
}


void drawSailboat() {
  int movePicture = (millis()/77) % 801;
  image(Sailboat, -110 + movePicture, 165, 100, 100);
}



void drawHands(int step) {

  switch(step) {  //makes hands bob in the water
  case -3:
    image(Hands, 300, 400, 100, 100);
    break;
  case -2:
    image(Hands, 300, 383, 100, 100);
    break;
  case -1:
    image(Hands, 300, 347, 100, 100);
    break;
  case 0:
    image(Hands, 300, 350, 100, 100);
    break;
  case 1:
    image(Hands, 300, 333, 100, 100);
    break;
  case 2:
    image(Hands, 300, 317, 100, 100);
    break;
  case 3:
    image(Hands, 300, 300, 100, 100);
    break;
  }
}


void mousePressed() {
  if (numberOfFins < maxFins) {
    finXPosition[numberOfFins] = mouseX; //x point of circle will be where mouse clicked
    numberOfFins ++;
  }
}


