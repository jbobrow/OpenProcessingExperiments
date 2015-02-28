
float r, g, b, a;
int dy=10, dx=10;
boolean upPressed = false, downPressed = false, leftPressed = false, rightPressed = false;

void setup() {
  size(400, 400);//create 400x400 window
  background(0);//set black as bkg
  noFill();
  smooth();
  noCursor();
  frameRate(20);
}

void draw() {
  //draw a translucent rect on top of each frame to create fading effect
  noStroke();
  fill(0, 15);
  rect(0, 0, width, height);

  //set random color and alpha
  r= random(255);
  g= random(255);
  b= random(255);
  a= random(255);

  //draw circles along the cursor
  stroke(r, g, b, a);
  strokeJoin(ROUND);
  strokeWeight(20);
  noFill();
  ellipse(mouseX, mouseY, 50, 50);

  stroke(r, g, b, a);
  rectMode(RADIUS);
  rect(200, 200, 200, 200);

  if (upPressed) {//draw lines on upper part after pressing UP
    for (int y=10; y<=200; y=y+dy) {
      strokeWeight(1);
      stroke(r,g,b);
      line(0, y, width, y);
    }
    upPressed = false;
  }
  
   if (downPressed) {//draw lines on lower part after pressing DOWN
    for (int y=200; y<=height-10; y=y+dy) {
      strokeWeight(1);
      stroke(r,g,b);
      line(0, y, width, y);
    }
    downPressed = false;
  }
  
  if (leftPressed) {//draw lines on left part after pressing LEFT
    for (int x=10; x<=200; x=x+dx) {
      strokeWeight(1);
      stroke(r,g,b);
      line(x, 0, x, height);
    }
    leftPressed = false;
  }
  
  if (rightPressed) {//draw lines on right part after pressing RIGHT
    for (int x=200; x<=height-10; x=x+dx) {
      strokeWeight(1);
      stroke(r,g,b);
      line(x, 0, x, height);
    }
    rightPressed = false;
  }
}

void keyPressed() {
  if (key==CODED) {
    if (keyCode==UP) {
      upPressed = true;
    }else if (keyCode==DOWN) {
      downPressed = true;
    }else if (keyCode==LEFT) {
      leftPressed = true;
    }else if (keyCode==RIGHT) {
      rightPressed = true;
    }
  }
}







