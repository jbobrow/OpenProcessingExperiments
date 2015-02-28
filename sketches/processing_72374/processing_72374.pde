
//Charmaine Yau
//Introduction to Digital Media Fall 2012 - Assignment 01b
//Section B
//09.13.2012

float randomDiameter = 10; //Global Variable - Float - Diameter
int growingDiameter = 100; //Global Variable - Int - Diameter
int randomBlue = 0; //Global Variable - Int - Color
int randomRed = 0;
int randomGreen = 0;
boolean boolGrowing = false;
int[] xvals;
int[] yvals;
int[] bvals;

void setup() {
  size(1200, 600);
  //background(180, 120, 120);
  background(0);

  noStroke();
  rectMode(CENTER);

  xvals = new int[width];
  yvals = new int[width];
  bvals = new int[width];
}

void draw() {

  fill(255, 25);
  //rect(0,0,1200,600);

  smooth();
  noFill();
  strokeWeight(3);


  rect(mouseX, height/4, mouseY/4+5, mouseY/4+5);
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  rect(inverseX, height/2, (inverseY/2)+10, (inverseY/2)+10);

  //randomDiameter=random(50);


  //ellipse(mouseX,mouseY,randomDiameter,randomDiameter);

  if (boolGrowing == true) {
    if (growingDiameter < 100) {
      growingDiameter ++;
    }

    else {
      growingDiameter=0;
    }
  }

  arc(mouseX, mouseY, growingDiameter, growingDiameter, PI, TWO_PI);

  for (int i=1;i<500;i++) {
    strokeWeight(0.5);
    stroke(60, 30, i*6);
    line(1200, 0, 0, i*70);
  }
}

void mouseDragged() {

  randomBlue=int(random(205));
  randomRed=int(random(125));
  randomGreen=int(random(80));

  if (mouseButton == LEFT) {
    stroke(randomRed, randomGreen, 0);
  } 
  else if (mouseButton == RIGHT) {
    stroke(randomRed, 0, randomBlue);
  }
  else {
    stroke(255);
  }
}

void mouseClicked() {

  if (boolGrowing == false) {
    boolGrowing = true;
  }
  else {
    boolGrowing = false;
  }

  boolGrowing = !boolGrowing;
}

void keyPressed() {
  if (key == 's') {
    save("charmaineYau.png");
  }
}
