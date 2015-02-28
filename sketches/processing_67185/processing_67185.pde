
int[] lightbulbsX;
int yPos;
boolean allOn;
boolean leftOn;
int state;
PFont myFont;


void setup() {
  size(600, 600);
  lightbulbsX = new int [6];
  myFont = loadFont("AvenirLTStd-Book-48.vlw");
  textFont(myFont, 28);
  yPos = height/2 - 25; 
  state = 0;
  noStroke();
  smooth();
}

void draw() {
  background(150);
  
  fill(255);
  text("Press Q to turn on all lights", 100, 40);
  text("Press W to turn on three lights on the left", 100, 70);
  text("Press E to turn off all lights", 100, 100);
  
  fill(0); 
  for (int i = 0; i < lightbulbsX.length; i++) {
    lightbulbsX[i] = 125 + i * 70;
    ellipse(lightbulbsX[i], yPos, 50, 50);
  } 

  if (state == 1) {
    fill(255, 255, 0);
    for (int i = 0; i < lightbulbsX.length; i++) {
      ellipse(lightbulbsX[i], yPos, 50, 50);
    }
  }
  
  if (state == 3) {
    fill(0);
    for (int i = 0; i < lightbulbsX.length; i++) {
      ellipse(lightbulbsX[i], yPos, 50, 50);
    }
  }

  if (state == 2) {
    fill(255, 255, 0);
    for (int i = 0; i < lightbulbsX.length; i++) {
      for (int j = 0; j < 3; j++) {
        ellipse(lightbulbsX[j], yPos, 50, 50);
      }
    }
  }
  
  

}

void keyPressed() {
  if (keyCode == 81) {
    state = 1;
  }

  if (keyCode == 87) {
    state = 2;
  }

  if (keyCode == 69) {
    state = 3;
  }
}

