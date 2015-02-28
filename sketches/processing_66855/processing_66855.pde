
/* ======================================================
Aurthor: Xiaozhou ZHOU
Student ID: 347214
Natural System Studio, University of Melbourne
 
NO COPYRIGHT! 
welcome to copy, modify and distribute any way you want!
======================================================  */

//============= GLOBAL VARIABLES =============
ArrayList ArrayOfLines;
int vertexNumMax = 3;
int strokeWidthMax = 20;
int oscillator = 4;         //stroke width
int oscillator_col = 30;    //stroke color
int oscillator_pos = 10;    //position

//============= SETUP =============
void setup() {
  size(800, 600);
  smooth();
  frameRate(30);
  ArrayOfLines = new ArrayList();
}

//============= DRAW =============
void draw() {
  background(255);
  
  DynLine temp = new DynLine();
  for (int i = 0; i < ArrayOfLines.size(); i++) {
    temp = (DynLine) ArrayOfLines.get(i);
    temp.update();
    temp.display();
  }
}

//============= FUNCTIONS =============
void mousePressed() {
  DynLine curveLine = new DynLine();
  ArrayOfLines.add(curveLine);
}

void keyPressed() {
  if (key == 32) {    //reset the array list
    ArrayOfLines = new ArrayList();
  } else if (key == 8 || key == 127) {   //remove the most recent line by pressing delete or back space button
    ArrayOfLines.remove(ArrayOfLines.size()-1);
  }
}
  

class DynLine {
  float startX;
  float startY;
  float endX;
  float endY;
  int vertexNum;
  float[] vertexPosSet;
  int strokeWidth;
  int[] strokeRGBA;

  DynLine() {
    // randomlly define both start and end x,y positions
    startX = random(0, width);
    startY = 0;
    endX = random(0, width);
    endY = height;

    // randomly generate several vertex points
    //of which the num is less equal than predefined max num.
    vertexNum = int(random(1, vertexNumMax));
    vertexPosSet = new float[vertexNum*2];    //vertexNum*2 - 2 means space for x position and y position
    for (int i = 0; i < vertexPosSet.length; i++) {
      vertexPosSet[i] = random(1, width-1);   // generate x,y postion randomly within the screen
    }

    //random stroke width
    strokeWidth = int(random(1, strokeWidthMax));

    //random color and transparency
    strokeRGBA = new int[4];
    for (int i = 0; i < 4; i++) strokeRGBA[i] = int(random(0, 255));
  }

  void update() {
    //move start x position and constrain it
    startX += random(-oscillator_pos, oscillator_pos);
    startX = constrain(startX, 0, width);

    //move end x position and constrain it
    endX += random(-oscillator_pos, oscillator_pos);
    endX = constrain(endX, 0, width);

    //move vertex x,y position and constrain them
    for (int i = 0; i < vertexNum; i++) {
      vertexPosSet[i*2] += random(-oscillator_pos, oscillator_pos);
      vertexPosSet[i*2] = constrain(vertexPosSet[i], 0, width);
      vertexPosSet[i*2+1] += random(-oscillator_pos, oscillator_pos);
      vertexPosSet[i*2+1] = constrain(vertexPosSet[i+1], 0, height);
    }

    // change stroke wdith
    strokeWidth += random(-oscillator, oscillator);
    strokeWidth = constrain(strokeWidth, 2, strokeWidthMax);

    //change color
    for (int i = 0; i < 3; i++) {
      strokeRGBA[i] += random(-oscillator_col, oscillator_col);
      strokeRGBA[i] = constrain(strokeRGBA[i], 0, 255);
    }
    
    // change transparency whthin 100 to 255
    strokeRGBA[3] += random(-oscillator_col, oscillator_col);
    strokeRGBA[3] = constrain(strokeRGBA[3], 100, 255);
  }

  void display() {
    noFill();
    strokeWeight(strokeWidth);
    stroke(strokeRGBA[0], strokeRGBA[1], strokeRGBA[2], strokeRGBA[3]);
    
    /*
    print("R"+strokeRGBA[0]);
    print("G"+strokeRGBA[1]);
    print("B"+strokeRGBA[2]);
    println("A"+strokeRGBA[3]);
    */
    
    beginShape();
    curveVertex(startX, startY);
    curveVertex(startX, startY);

    for (int i = 0; i < vertexNum; i++) curveVertex(vertexPosSet[i*2], vertexPosSet[i*2+1]);

    curveVertex(endX, endY);
    curveVertex(endX, endY);
    endShape();
  }
}


