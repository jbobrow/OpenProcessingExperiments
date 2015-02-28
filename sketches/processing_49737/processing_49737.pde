
boolean eraserMode = false;
PFont A;
int ST1;
int ST2;
int ST3;
int SW = 1;

void setup() {
  size(800,800);
  background(255);
  stroke(0);
  strokeWeight(2);
  rectMode(CENTER);
  colorPal();
  clearPal();
  weight();
  A = loadFont("AppleCasual-48.vlw");
  textFont(A);
}

void draw() {
  eraserTool();
  eraserSetup();
  weight();
  weightButton();
  topRect();
  colorButton();
  colorPal();
  clearPal();
  clearButton();
  if(eraserMode == false) {
    lineTool();
  }
}
  
void colorPal() {
  stroke(0);
  strokeWeight(2);
  fill(200,0,0);
  rect(10,10,20,20);
  fill(255,124,0);
  rect(10,30,20,20);
  fill(255,247,0);
  rect(10,50,20,20);
  fill(0,200,0);
  rect(30,10,20,20);
  fill(0,0,200);
  rect(30,30,20,20);
  fill(229,0,255);
  rect(30,50,20,20);
  fill(0,0,0);
  rect(10,70,20,20);
  fill(255);
  rect(30,70,20,20);
  fill(255);
  line(40,20,760,20);
  rect(20,485,40,630);
  rect(780,500,40,600);
}

void colorButton() {
  if(mousePressed) {
    if(mouseX < 20) {
      if(mouseY < 20) {
        ST1 = 200;
        ST2 = 0;
        ST3 = 0;
      } else if(mouseY < 40 && (mouseY > 20)) {
        ST1 = 255;
        ST2 = 124;
        ST3 = 0;
      } else if(mouseY < 60 && (mouseY > 40)) {
        ST1 = 255;
        ST2 = 247;
        ST3 = 0;
      } else if(mouseY < 80 && (mouseY > 60)) {
        ST1 = 0;
        ST2 = 0;
        ST3 = 0;
      }
    } else if(mouseX > 20 && (mouseX < 40)) {
        if(mouseY < 20) {
        ST1 = 0;
        ST2 = 200;
        ST3 = 0;
        } else if(mouseY < 40 && (mouseY > 20)) {
          ST1 = 0;
          ST2 = 0;
          ST3 = 200;
        } else if(mouseY < 60 && (mouseY > 40)) {
          ST1 = 229;
          ST2 = 0;
          ST3 = 255;
        } else if(mouseY < 80 && (mouseY > 60)) {
          ST1 = 255;
          ST2 = 255;
          ST3 = 255;
        }
    }
  }
}

void clearPal() {
  rect(20,105,40,50);
  textAlign(CENTER);
  stroke(0);
  fill(0);
  text("C", 20,120);
}

void clearButton() {
  if(mousePressed) {
    if(mouseX < 40 && (mouseY < 130) && (mouseY > 80)) {
      background(255);
    }
  }
}
void lineTool() {
  if(mousePressed) {
      stroke(ST1,ST2,ST3);
      strokeWeight(SW);
      line(mouseX, mouseY, pmouseX, pmouseY);
}
}

void topRect() {
  fill(255);
  stroke(0);
  rect(400,10,718,20);
  stroke(ST1,ST2,ST3);
  strokeWeight(SW);
  line(50,10,750,10);
  stroke(0);
  strokeWeight(2);
  line(40,20,760,20);
}

void weight() {
  stroke(0);
  fill(255);
  strokeWeight(2);
  rect(780,20,40,40);
  rect(780,60,40,40);
  rect(780,100,40,40);
  rect(780,140,40,40);
  rect(780,180,40,40);
  stroke(ST1,ST2,ST3);
  fill(ST1,ST2,ST3);
  ellipse(780,20,1,1);
  ellipse(780,60,2,2);
  ellipse(780,100,3,3);
  ellipse(780,140,4,4);
  ellipse(780,180,5,5);
}

void weightButton() {
  if(mousePressed) {
    if(mouseX > 760) {
      if(mouseY < 40) {
        SW = 1;
      } else if(mouseY < 80 && (mouseY > 40)) {
        SW = 2;
      } else if(mouseY < 120 && (mouseY > 80)) {
        SW = 3;
      } else if(mouseY < 160 && (mouseY > 120)) {
        SW = 4;
      } else if(mouseY < 200 && (mouseY > 160)) {
        SW = 5;
      }
    }
  }
}

void eraserSetup() {
  rectMode(CENTER);
  stroke(0);
  strokeWeight(2);
  fill(255);
  rect(20,150,40,40);
  fill(0);
  textAlign(CENTER);
  text("E",20,165);
  if(mousePressed) {
    if((mouseX > 760) || ((mouseX < 40) && ((mouseY > 170) || (mouseY < 130)))) {
      eraserMode = false;
    } else if((mouseX < 40) && (mouseY < 170) && (mouseY > 130)) {
        eraserMode = true;
    }
  }
}

void eraserTool() {
  if(mousePressed) {
    if(eraserMode == true) {
      noStroke();
      fill(255);
      rectMode(CENTER);
      rect(mouseX, mouseY, 20, 20);
      stroke(0);
    } else if(eraserMode == false) {
    }
  }
}

