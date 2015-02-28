
// Need G4P library
import g4p_controls.*;
Circ[] myCirc;
float xpos=100;
float ypos=200;
float  ellipseSize=100;
int fillValue=0;
int fade1, fade2, fade3, fade4;
int count;
long milliSecStart;
boolean startFlag=true;
int fps=100;
int state =0;

int lightNum;
int[] fadeIncrement = {
  100, 100, 100, 100
}; //starting fade value



public void setup() {
  size(1200, 900, JAVA2D);
  myCirc=new Circ[4];
fadeIncrement[0]=5;
  createGUI();
  customGUI();
  createCirc();
  frameRate(fps);
  background(0);
  // Place your setup code here
}

public void draw() {
  if (startFlag) {
    drawCirc();
  }
  //  background(230);
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI() {
}

public void createCirc() {
  xpos=200;
  ypos=400;
  ellipseSize=100;
  for (int i=0; i<4; i++) {
    myCirc[i]=new Circ(xpos, ypos, ellipseSize, ellipseSize, fillValue);
    myCirc[i].display();
    xpos=xpos+200;
  }
}
public void drawCirc() {
  switch(state) {
  case 0:
    if (fillValue+fadeIncrement[0]<255) {
      fillValue=fillValue+fadeIncrement[0];
      myCirc[lightNum].fillNum=fillValue;
      myCirc[lightNum].display();
      break;
    }
    else {
      state=1;
      fillValue=255;
     
      break;
    }
  case 1:

    if (fillValue-fadeIncrement[1]>0) {
      fillValue=fillValue-fadeIncrement[1];
      myCirc[lightNum].fillNum=fillValue;
      myCirc[lightNum].display();
      break;
    }
    else {
      state=2;
      fillValue=0;
      myCirc[lightNum].fillNum=fillValue;
      myCirc[lightNum].display();
      break ;
    }
    case 2:
    if (fillValue+fadeIncrement[2]<255){
     fillValue=fillValue+fadeIncrement[2];
     break;
    }
    else {
     state=0;
      fillValue=0;  
      lightNum++;
      if (lightNum >3)
        lightNum=0;
      break;
    }
  }
}






