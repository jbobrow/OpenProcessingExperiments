
boolean mouseIsDown = false;

int upperLimit = 255;
int lowerLimit = 100;

void setup() {
  size(480,600);
  background(255);
  drawText();
}

void drawText() {
  fill(#111111);
  textFont(createFont("LucidaConsole", 18));
  textAlign(CENTER);
  text("press c to clear", width/2, height - 20);
}

float counter = 0;

float prevStrokeWeight = random(1,30);
float currStrokeWeight;

int refreshInterval = int(random(100,600));
int timeStamp = 0;

int r = int(random(lowerLimit, upperLimit));
int g = int(random(lowerLimit, upperLimit));
int b = int(random(lowerLimit, upperLimit));

boolean decrease = true;

void mousePressed() {
  mouseIsDown = true;
  r = int(random(lowerLimit, upperLimit));
  g = int(random(lowerLimit, upperLimit));
  b = int(random(lowerLimit, upperLimit));
  
}

void mouseReleased() {
  mouseIsDown = false;
  prevStrokeWeight = random(1,30);
}

void keyPressed() {
  if (keyCode == 67) { //c = clear
    background(255);
    drawText();
  }
}

void draw() {
  noStroke();
  //fill(getOpposite(r),getOpposite(g),getOpposite(b),10);
  fill(255,255,255,10);
  rect(0,0,width,height);
  noStroke();
  
  if (mouseIsDown) {
    int xDiff = abs(pmouseX - mouseX);
    int yDiff = abs(pmouseY - mouseY);
    
    int channelChoice = int(random(3));
    
    if (channelChoice == 0) {
      r = generateColor(r,xDiff,yDiff);
    } else if (channelChoice == 1) {
      g = generateColor(g,xDiff,yDiff);
    } else {
      b = generateColor(b,xDiff,yDiff);
    }
    
    currStrokeWeight = constrain(abs(pmouseX-mouseX),
    prevStrokeWeight-0.5,prevStrokeWeight+0.5);
    prevStrokeWeight = currStrokeWeight;
      
    strokeWeight(currStrokeWeight);
    stroke(r,g,b);
    line(pmouseX, pmouseY, mouseX, mouseY);
    
    noStroke();
    int circleNum = int(random(2,14));
    
    for (int i = 0; i < circleNum; i++) {
      fill(r,g,b,50);
      float ellipseW = currStrokeWeight + random(-10,10);
      float ellipseH = currStrokeWeight + random(-10,10);
       
      float offsetX = random(-20,20);
      float offsetY = random(-20,20);
      ellipse(mouseX+offsetX,mouseY+offsetY,ellipseW,ellipseW);  
       
     }
//     float ellipseSize = random(1,100);
//     if (int(random(2)) == 0) {
//       fill(getOpposite(r),getOpposite(g),getOpposite(b),random(5,15));
//     } else {
//       fill(255,255,255);
//     }
//     ellipse(random(width),random(height),ellipseSize,ellipseSize);
  }
}

int getOpposite(int value) {
  return upperLimit - value;
}

int generateColor(int value, int xDiff, int yDiff) {
  int choice = int(random(2));
  int diff;
  
  if (choice == 0) {
    diff = xDiff;
  } else {
    diff = yDiff;
  }
  
  if (value >= upperLimit) {
    value--;
    decrease = true;
  } else if (value < lowerLimit) {
    value++;
    decrease = false;
  } else {
    if (decrease) {
      value -= diff;
    } else {
      value += diff;
    }
  }

  return value;
}
