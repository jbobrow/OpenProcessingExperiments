
int[] posXArray;
int posY;
boolean button1;
boolean button2; 
boolean button3; 
boolean button4;
boolean button5;
boolean button6;
PFont myFont;

void setup() {
  size(500, 500);
  smooth();
  myFont=loadFont("GillSans-24.vlw");
  textFont(myFont, 24);
  button1=false;
  button2=false;
  button3=false;
  button4=false;
  button5=false;
  button6=false;
  posXArray= new int[6];
  posY= 250;
  for (int i=0; i<posXArray.length; i++) {
    posXArray[i] = 35+i*85;
  }
}

void draw() {
  ButtonHandler();
  DrawText();
}

void keyReleased() {
  if (keyCode =='Q') {
    DrawLights();
    button4=false;
    button5=false;
    button3=false; 
    button6=false;
    button2=false;
    button1=true;
  }
  if (keyCode == 'W') {
    DrawLights();
    button4=false;
    button5=false;
    button6=false;
    button3=false;
    button1=false;
    button2=true;
  }
  if (keyCode == 'Y') {
    DrawLights();
    button1=false;
    button5=false;
    button6=false; 
    button4=false;
    button2=false;
    button3=true;
  }
  if (keyCode == 'R') {
    DrawLights();
    button6=false; 
    button1=false;
    button5=false;
    button2=false;
    button3=false;
    button4=true;
  }
  if (keyCode == 'T') {
    DrawLights();
    button6=false; 
    button1=false;
    button2=false;
    button3=false;
    button4=false;
    button5=true;
  }
  if (keyCode == 'E') {
    DrawLights();
    button1=false;
    button2=false;
    button3=false;
    button4=false;
    button5=false;
    button6=true;
  }
}

void DrawLights() {
  for (int i=0; i<posXArray.length;i++) {
    fill(0);
    ellipse(posXArray[i], posY, 50, 50);
  }
}

void ButtonHandler() {
  for (int i=0; i<posXArray.length;i++) {
    if (button1) {
      fill(255, 255, 0);
      ellipse(posXArray[i], posY, 50, 50);
    }
    else if (button2) {
      if (i%2==0) {
        fill(255, 255, 0);
        ellipse(posXArray[i], posY, 50, 50);
      }
    }
    else if (button3) {
      fill(0);
      ellipse(posXArray[i], posY, 50, 50);
    }
    else if (!button1 && !button2 && 
      !button3 && !button4 && 
      !button5 && !button6) {
      fill(0);
      ellipse(posXArray[i], posY, 50, 50);
    }
    else if (button4 && i<3) {
      fill(255, 255, 0);
      ellipse(posXArray[i], posY, 50, 50);
    }
    else if (button5) {
      if (i>2) {
        fill(255, 255, 0);
        ellipse(posXArray[i], posY, 50, 50);
      }
    }
    else if (button6) {
      if (i%2==1) {
        fill(255, 255, 0);
        ellipse(posXArray[i], posY, 50, 50);
      }
    }
  }
}

void DrawText() {
  fill(80, 100, 255);
  text("Press the Q key to turn all lights on.", 50, 30);
  text("Press the W key to turn odd lights on.", 50, 60);
  text("Press the E key to turn even lights on.", 50, 90);
  text("Press the R key to turn on lights 1-3.", 50, 120);
  text("Press the T key to turn on lights 4-6.", 50, 150);
  text("Press the Y key to turn all lights off.", 50, 180);
}


