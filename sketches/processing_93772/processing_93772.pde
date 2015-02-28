
//Homework 8
//Sabrina Li
//Copyright Sabrina Li March 2013 Pittsburgh, PA

boolean forLoop, increase;
int c;

void setup() {
  size(400, 400);
  textSize(12);
  textAlign(CENTER);
  smooth();
  strokeWeight(1);
  
  frameRate(4);
  
  forLoop = true;
  
  increase = true;
  c = 0;
  
  forLoop();
  //whileLoop();
}

void draw() {
  if (forLoop == true) {
    forLoop();
  } else {
    whileLoop();
  };
}

void forLoop() {
  for (int x = 0; x < width; x += 20) {
    for (int y = 0; y < height; y += 20) {
      stroke(255);
      fill(0, random(255), random(255));
      rect(x, y, 20, 20);
    }
  }
  pushStyle();
    fill(0, 200);
    rect(0, height*.8, width, height*.15);
  popStyle();
  pushStyle();
    fill(255);
    text("This is drawn using a for loop.", width/2, height*.86);
    text("Press the spacebar to toggle to the while loop design.", width/2, height*.91);
  popStyle();
}

void whileLoop() {
  int x = 0;
  while (x < width) {
    int y = 0;
    while ( y < height) {
      stroke(255);
      fill(random(255), 0, random(255));
      rect(x, y, 20, 20);
      y += 20;
    }
    x += 20;
  };
  pushStyle();
    fill(0, 200);
    rect(0, height*.8, width, height*.15);
  popStyle();
  pushStyle();
    fill(255);
    text("This is drawn using a while loop.", width/2, height*.86);
    text("Press the spacebar to toggle to the for loop design.", width/2, height*.91);
  popStyle();
}
  
void keyPressed() {
  if (key == ' ') {
    if (forLoop == true) {
      forLoop = false;
    } else {
      forLoop = true;  
    };
  }
}

void mousePressed() {
  saveFrame("hw8.jpg");
}

