
// Need G4P library
// got rid of start button to put on web
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
 milliSecStart=millis();
  state=0;
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
  for (int i=0; i<1; i++) {
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

    if (fillValue-fadeIncrement[0]>0) {
      fillValue=fillValue-fadeIncrement[0];
      myCirc[lightNum].fillNum=fillValue;
      myCirc[lightNum].display();
      break;
    }
    else {
      state=0;
      fillValue=0;
      myCirc[lightNum].fillNum=fillValue;
      myCirc[lightNum].display();
      lightNum++;
      if (lightNum >0)
        lightNum=0;
      break;
    }
  }
}






