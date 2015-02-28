
int lastSecond=0, boardLength=0, boardHeight=0, boardHeight2=0, 
handleDist=0, rodHeight=0, graspDist=0, graspWidth=0, graspWidth2=0,
stickRandom=0, numStick=0, brushStart=0, brushBristles=0, brushSize=0;
int boardMidPointX = (((500+boardLength)+(530+boardLength))/2);
int boardMidPointY = (boardHeight+410)/2;
int distanceOfRod = int(sqrt(sq(((((500+boardLength)+(530+boardLength))/2)-handleDist)-(290+handleDist+10))+sq((367.5-5-rodHeight)-(367.5-5-rodHeight))));

void setup() {
  size(1024, 768);
  background(255);
}


void draw() {
  background(255);

  
for (int i = 5; i < numStick; i=i+15){
  line(brushStart+i, 390, brushStart+i, boardHeight+stickRandom);
  line(brushStart+i+2, 390, brushStart+i+2, boardHeight+stickRandom);
  int j = brushBristles;
  if (boardHeight+stickRandom > 390+j){  
  for (j = brushBristles; j < stickRandom; j+=2)
  {
   line(brushStart+i+1, 390+j, brushStart+i-brushSize, 390+j+4);
   line(brushStart+i+1, 390+j, brushStart+i+brushSize, 390+j+4);
  }
  }
}

  noStroke();
  rect(290, 375, 310, 13);
  stroke(0);
  shovelBase(10, boardLength, boardHeight, boardHeight2);
  shovelHandle(handleDist, rodHeight, graspDist, graspWidth);
  switchMR();
}



void shovelBase(int x, int stretchRight, int boardHeight, int boardHeight2) {
//noFill();
  //Draw shovel base
  strokeWeight(.5);
  noStroke();
  rect(400, 375, 600, 30);
  stroke(1);
  //Draw Bottom-Bottom Curve
  beginShape();
  curveVertex(290, 375+x);
  curveVertex(290, 375+x);
  curveVertex(400, 412+x);
  curveVertex(530+stretchRight, boardHeight2+x);
  curveVertex(530+stretchRight, boardHeight2+x);
  endShape();

  //Draw Top Curve
  beginShape();
  curveVertex(500+stretchRight, boardHeight);
  curveVertex(500+stretchRight, boardHeight);
  curveVertex(400, boardHeight+5);
  curveVertex(290, 375);
  curveVertex(290, 375);
  endShape();

  //Draw Bottom Curve
  beginShape();
  curveVertex(290, 375);
  curveVertex(290, 375);
  curveVertex(400, 412);
  curveVertex(530+stretchRight, boardHeight2);
  curveVertex(530+stretchRight, boardHeight2);
  endShape();

  //Left Diagonal line
  line(500+stretchRight, boardHeight, 530+stretchRight, boardHeight2);
  //The two little things
  line(290, 375, 290, 375+x);
  line(530+stretchRight, boardHeight2, 530+stretchRight, boardHeight2+x);
  fill(255);

}
void shovelHandle(int handleDist, int rodHeight, int graspDist, int graspWidth) {

  int x = 5;
  int y = 20;
  int boardMidPointX = (((500+boardLength)+(530+boardLength))/2);
  int boardMidPointY = (boardHeight+410)/2;
  //LEFT ROD
  //outer line
  line(290+handleDist+10, boardMidPointY, 290+handleDist+10, boardMidPointY-5-rodHeight);
  //inner line
  line(290+handleDist+15, boardMidPointY, 290+handleDist+15, boardMidPointY-rodHeight);
  //left cusp
  rect(290+handleDist+10-2.5, boardMidPointY, 10, 5);
  line(290+handleDist+10-2.5, boardMidPointY+2.5, 290+handleDist+10-2.5+10, boardMidPointY+2.5);

  //RIGHT ROD
  //outer line
  line(boardMidPointX-handleDist-5, boardMidPointY, boardMidPointX-handleDist-x, boardMidPointY-rodHeight);
  //inner line
  line(boardMidPointX-handleDist, boardMidPointY, boardMidPointX-handleDist, boardMidPointY-5-rodHeight);
  //right cusp
  rect(boardMidPointX-handleDist-5-2.5, boardMidPointY, 10, 5);
  line(boardMidPointX-handleDist-5-2.5, boardMidPointY+2.5, boardMidPointX-handleDist-5-2.5+10, boardMidPointY+2.5);


  // TOP ROD
  line(290+handleDist+10, boardMidPointY-5-rodHeight, boardMidPointX-handleDist, boardMidPointY-5-rodHeight);
  line(290+handleDist+15, boardMidPointY-rodHeight, boardMidPointX-handleDist-5, boardMidPointY-rodHeight);
}

void handleMouse() {
  int y = 20;
  int x = 5;
  int unit = 30;
  int boardMidPointX = (((500+boardLength)+(530+boardLength))/2);

  //Handle
  ellipseMode(CENTER);
  if (boardLength > 20) {
    int handleBaseX = (290+handleDist+graspDist+graspWidth)-20;
    float handleMidpointX = ((290+handleDist+15)+(boardMidPointX-handleDist-5))/2;
    ellipse((handleMidpointX-graspWidth2), boardHeight-5-rodHeight+unit, x, y);
    ellipse(handleBaseX, boardHeight-5-rodHeight+unit, x, y);
    noStroke();
    //rect((handleMidpointX-graspWidth2), 367.5-15-rodHeight, graspWidth, y);

    stroke(0);
    line(handleMidpointX, boardHeight-15-rodHeight+unit, handleBaseX, boardHeight-15-rodHeight+unit);
    line(handleMidpointX, boardHeight-15-rodHeight+y+unit, handleBaseX, boardHeight-15-rodHeight+y+unit);

    line(handleMidpointX, boardHeight-15-rodHeight+unit, (handleMidpointX-graspWidth2), boardHeight-15-rodHeight+unit);
    line(handleMidpointX, boardHeight-15-rodHeight+y+unit, (handleMidpointX-graspWidth2), boardHeight-15-rodHeight+y+unit);
    
    /*fill(255);
    noStroke();
    quad(handleMidpointX, 367.5-15-rodHeight, handleBaseX, 367.5-15-rodHeight,
    handleBaseX, 367.5-15-rodHeight+y, handleMidpointX, 367.5-15-rodHeight+y);
    quad(handleMidpointX, 367.5-15-rodHeight, (handleMidpointX-graspWidth2), 367.5-15-rodHeight,
    (handleMidpointX-graspWidth2), 367.5-15-rodHeight+y, handleMidpointX, 367.5-15-rodHeight+y);
    stroke(0);*/
  }
}

void handleRandom() {
  if (boardLength > 20) {
    float handleMidpointX = ((290+handleDist+15)+(boardMidPointX-handleDist-5))/2;
    ellipse(290+handleDist+30, 367.5-rodHeight, 5, 20);
    ellipse(boardMidPointX-handleDist+25, 367.5-rodHeight, 5, 20);
    line(290+handleDist+30, 367.5-rodHeight-10, boardMidPointX-handleDist+25, 367.5-rodHeight-10);
    line(290+handleDist+30, 367.5-rodHeight+10, boardMidPointX-handleDist+25, 367.5-rodHeight+10);
 
   quad(290+handleDist+30, 367.5-rodHeight-10, boardMidPointX-handleDist+25, 367.5-rodHeight-10,
   boardMidPointX-handleDist+25, 367.5-rodHeight+10, 290+handleDist+30, 367.5-rodHeight+10);
 
 
 
   }
}

void switchMR() {
  //Switch between mousePressed and Random
  if (mousePressed == true) {
    boardLength = int(map(mouseX, 0, width, -45, 200));
  } 
  else if (key == '1') {        //control how far apart handle is
    handleDist = int(map(mouseY, 0, height, 30, 150));
  }
  else if (key == '2') {        
    boardHeight = int(map(mouseY, 0, height, 250, 375));
    boardHeight2 = int(map(mouseY, 0, height, 375, 410));
  }
  else if (key == '3') {      
    rodHeight = int(map(mouseY, height, 0, 0, 200));
  }
  else if (key == '4') {
    graspWidth = int(map(mouseX, 0, width, distanceOfRod/2, distanceOfRod-20));
    graspWidth2 = int(map(mouseX, 0, width, 0, (distanceOfRod/2)-20));
    handleMouse();
  }
  else if (key == '5') {
    brushStart = int(map(mouseX, 0, width, 300, 300+boardHeight));
  }
  else if (key == '6') {
    stickRandom = int(map(mouseY, 0, height, 50, 200));
    numStick = int(map(mouseX, 0, width, 0, 500));
  }
  else if (key == '7') {
    brushBristles = int(map(mouseY, 0, height, 50, 100));
    brushSize = int(map(mouseX, 0, width, 0, 15));
  }
  else {
    int currentSecond = second();
    if (currentSecond != lastSecond) {
      //Board
      boardLength = int(random(-80, 200));
      boardHeight = int(random(325, 375));
      boardHeight2 = int(random(375, 410));

      //Handle
      handleDist = int(random(60, 90));
      graspDist = int(random(0, 50));  
      rodHeight = int(random(10, 300));

      //Brushes
      numStick = int(random(0, 200));
      stickRandom = int(random(50, 200));
      brushStart = int(random(300, 410));
      brushBristles = int(random(20, 80));
      brushSize = int(random(3, 15));

      lastSecond = currentSecond;
    }
  }
}




