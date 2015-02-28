
//"Crystalline Display" - 60-257
// copyright Eric Mackie December 2011 Pittsburgh, PA 15221


float xPos[], yPos[], deltX[], deltY[];
int numPos = 40;
int numSpread = 20;
boolean mode;



void setup() {
  size(700, 700);
  smooth();
  xPos = new float [numPos];
  yPos = new float [numPos];
  deltX = new float [numPos];
  deltY = new float [numPos];

  
  mode = true;

  stroke(255);
}


void draw() {
  makeBackground();
  moveStuff();
  
}



void makeBackground() {
  if (mode == true) {
    fill(110, 135, 145, 5);
    rect(0, 0, width, height);
  }
}




void keyPressed() {
  if (mode == true) {
    mode=false;
    fill(110, 135, 145);
  } 
  else if (mode == false) {
    mode=true;
  }
}


void mousePressed() {
  initPoints();
}

void initPoints () {
  for (int i=0; i<numPos; i++) {
    xPos[i]=random(mouseX-numSpread, mouseX+numSpread);
    yPos[i]=random(mouseY-numSpread, mouseY+numSpread);
    deltX[i]=random(-2, 2);
    deltY[i]=random(-2, 2);
  }
}


void moveStuff() {
  for (int i=0; i<numPos; i++) {

    if ((xPos[i]>=width) || (xPos[i]<=0)) {
      deltX[i]= -deltX[i];
    }
    if ((yPos[i]>=height) || (yPos[i]<=0)) {
      deltY[i]= -deltY[i];
    }


    xPos[i]+=deltX[i];
    yPos[i]+=deltY[i];

    fill(255);
    ellipse(xPos[i], yPos[i], 1, 1);
  }
}


