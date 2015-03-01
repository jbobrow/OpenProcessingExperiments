
int intRoomX = 1;
int intRoomY = 1;
int intButtonClick = 0;

void setup() {
  size(600,600);  
}

void draw() {
  background(0);
  checkDirections();
  printRoom();
  //intButtonClick = 0;
}

void checkDirections() {
  if (intRoomY > 0) {
    drawDirections(1,275,25,50,100);
  }
  if (intRoomY < 2) {
    drawDirections(2,275,475,50,100);
  }
  if (intRoomX > 0) {
    drawDirections(3,25,275,100,50);
  }
  if (intRoomY < 2) {
    drawDirections(4,475,275,100,50);
  }
}

void drawDirections(int intButtonNum, int intButtonX, int intButtonY, int intButtonSizeX, int intButtonSizeY) {
  fill(255);
  if ((mouseX>=intButtonX) && (mouseX<=intButtonX+intButtonSizeX) && (mouseY>=intButtonY) && (mouseY<=intButtonY+intButtonSizeY)) {
    fill(128);
    intButtonClick = intButtonNum; 
  } else {
    intButtonClick=0;
  }
  rect(intButtonX,intButtonY,intButtonSizeX,intButtonSizeY);
}

void mousePressed() {
  println("Button "+intButtonClick);
  if (intButtonClick == 1) {
    intRoomY=intRoomY+1;
  } else if (intButtonClick == 2 ) {
    intRoomY=intRoomY-1;
  } else if (intButtonClick == 3) {
    intRoomX=intRoomX+1;
  } else if (intButtonClick == 4) {
    intRoomX=intRoomX-1;
  }
  
}

void printRoom() {
  
  text(intRoomX+", "+intRoomY, 300, 300);
}


