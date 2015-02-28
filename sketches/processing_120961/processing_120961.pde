
//Lines myLines1;
Lines[] myLines = new Lines [200];
color changeC;

void setup() {
  size(900,900);
  background(0);
  changeC = color(random(255),random(100),0);
  fill(changeC);
  frameRate(100);
  //myLines1 = new Lines(random(width),random(height),random(1,5),random(1,20));
  for (int i=0; i<myLines.length; i++) {
    myLines[i] = new Lines(random(width),random(height),random(1,5),random(1,20),changeC);
  }
}

void draw() {
  //
  if (frameCount % 1000 == 0) {
    frameCount = 0;
    changeC = color(random(255),random(200),50);
    fill(changeC);
    background(0);
    for (int i=0; i<myLines.length; i++) {
      myLines[i] = new Lines(random(width),random(height),random(1,5),random(1,20),changeC);
    }
  } else {
    for (int i=0; i<myLines.length; i++) {
      Lines iLines = myLines[i];
      iLines.display();
    }
  }
}


class Lines {
  // class variables
  float xpos;
  float ypos;
  float strokeW;
  float lineLength;
  color lineColor;
  
  // constructor
  Lines(float tempX, float tempY, float tempStroke, float tempLength, color tempLineColor) {
    xpos = tempX;
    ypos = tempY;
    strokeW = tempStroke;
    lineLength = tempLength;
    lineColor = tempLineColor;
  }
  // display
  void display() {
    strokeW = random(1,2);
    lineLength = random(1,5);
    stroke(random(100,255));
    stroke(lineColor);
    if(xpos > width || xpos < 0 || ypos > height || ypos < 0) {
      xpos = random(width);
      ypos = random(height);
    } else {
      if (random(100)>80) {
        strokeWeight(strokeW);
        moveLeft(xpos,ypos,lineLength);
      } else if (random(100)>65) {
        strokeWeight(strokeW);
        moveUp(xpos,ypos,lineLength);
      } else if (random(100)>45) {
        strokeWeight(strokeW);
        moveDown(xpos,ypos,lineLength);
      } else {
        strokeWeight(strokeW);
        moveRight(xpos, ypos, lineLength);
      } 
    }
  }
  
  // behavior
  void moveRight(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX+i, startY);
      xpos = startX + i;
      ypos = startY;
    }
  }
  
  void moveLeft(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX-i, startY);
      xpos = startX - i;
      ypos = startY;
    }
  }
  
  void moveUp(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX, startY-i);
      ypos = startY - i;
      xpos = startX;
    }
  }
  
  void moveDown(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX, startY+i);
      ypos = startY + i;
      xpos = startX;
    }
  }
  void moveDiagDownRight(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX+i, startY+i);
      ypos = startY + i;
      xpos = startX + i;
    }
  }
  void moveDiagDownLeft(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX-i, startY+i);
      ypos = startY + i;
      xpos = startX - i;
    }
  }
  void moveDiagUpLeft(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX-i, startY-i);
      ypos = startY - i;
      xpos = startX - i;
    }
  }
  void moveDiagUpRight(float startX, float startY, float moveCount) {
    for(float i=0; i<moveCount; i++) {
      point(startX+i, startY-i);
      ypos = startY - i;
      xpos = startX + i;
    }
  }
}


