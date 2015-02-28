

int begin;              
boolean active;          
boolean done;           
boolean winning;
PImage beginImage;       
PImage endImage;        
PImage winningImage;
PImage tryImage;

float hue = random(360);
float saturation = random(30, 50); // color's code from openprocessing's user Reona~
float Hue = random(360);
float Saturation = random(50, 100);
float[] xPos = new float[20];
float[] yPos = new float[20];// ellipses
float[] xxPos = new float[5];
float[] yyPos = new float[5];// squares
float winningScreen;

int A;
int i;
int B;
int C;
int D;
int E;
int F;

void setup() 
{
  size(1000, 610); 
  active = false;       
  done = false;          
  winning = false;
  beginImage = loadImage("begin_image.png");
  endImage = loadImage("gameover.png");
  winningImage = loadImage("range2.png");
  tryImage = loadImage("try.png");

  frameRate(60);
  smooth();
  colorMode(HSB, 360, 100, 100);
  background(360);
  ellipseMode(RADIUS);
  rectMode(RADIUS);
  A = 20;
  B = 570;
  C = 530;
  D = 690;
  E = 650;
  F = 610;

  for (int i = 0; i < 20; i++) {
    xPos[i] = random(1000);
    yPos[i] = random(610);// ellipses
  }

  for (int z = 0; z < 5; z++) {
    xxPos[z] = random(1000);
    yyPos[z] = random(610);// squares
  }
}

void draw() 
{
  background(360);

  if (active == true) {
    eventGame();         
    timer();
  } 
  else {
    if (done == true) {
      endScreen();
    } 
    else {
      beginScreen();     // Show the "first" screen
    }
    if (winning == true) {
      winningScreen();
    }
  }
  
  saveFrame();
  
}


void eventGame() 
{
  background(360);


  strokeWeight(3);
  stroke(260, 80, 100, 120);
  noFill();
  beginShape();
  vertex(mouseX-40, 450);
  vertex(mouseX-40, 500);
  vertex(mouseX-80, 500);
  vertex(mouseX-80, 600);
  vertex(mouseX+80, 600);
  vertex(mouseX+80, 500);
  vertex(mouseX+40, 500);
  vertex(mouseX+40, 450);
  endShape();// bottle

    noStroke();
  fill(186, 25, 98);
  rect(mouseX, 580, 80, A);// bule retangle


  for (int i = 0; i < 20; i++) { 
    fill(hue, saturation, 100, 120);
    ellipse(xPos[i], yPos[i], 15, 15);

    yPos[i]+=2;

    if (yPos[i] > height) {
      yPos[i] = random(-10);
    }
    if (mouseX > 1000) {
      mouseX = 1000;
    }
    if (mouseX < 0) {
      mouseX = 0;
    }
  }       //  keep falling ellipses


  fill(Hue, Saturation, 100, 120);

  for (int z = 0; z < 5; z++) {
    rect(xxPos[z], yyPos[z], 20, 20);

    yyPos[z]+=2;
    //    if (xxPos[z] > width) {
    //      xxPos[z] = random(1000);
    //    }
    if (yyPos[z] > height) {
      yyPos[z] = random(-10);
    }
  }         // keep falling squares

  for (int i = 0; i < 20; i++) { 
    if (mouseX-40 < xPos[i] && mouseX+40 > xPos[i] && yPos[i] > 450 )
    { 
      xPos[i] = random(0, 1000);
      yPos[i] = random(-100, 0);
      println("good");
      A += 5;
    }
  }
  for (int z = 0; z < 5; z++) {
    if (xxPos[z] > mouseX-40 && xxPos[z] < mouseX+40 && yyPos[z] > 450 ) {
      xxPos[z] = random(0, 1000);
      yyPos[z] = random(-100, 0);
      active = false;
      done = true;     // if the mouse controlled bottle meets any square then end of the game(lose)
    }
  }
}

void mousePressed() 
{
  if (active == false) {
    active = true;
    begin = millis();
    A=20;
  } 
  else {
    print("mouse pressed\n");
  }
}

void mouseMoved() 
{
  print("bottle moved\n");
}

void timer() 
{
  int curTime = millis();
  if (curTime > begin + 20000) {
    active = false;
    done = true;
    winning = false;
  }

  if (A >= 80) {
    active = false;
    done = false;
    winning = true;
  }

  noStroke();
  fill(255);
  rect(0, height-5, width, 5);
  fill(0);
  rect(0, height-5, (curTime-begin)/20, 5);
}


void beginScreen() {

  image(beginImage, 0, 0);

  noStroke();
  fill(100, 40, 100, 120);
  ellipse(175, 55, 10, 10);
  ellipse(60, 540, 20, 20);
  ellipse(900, 450, 20, 20);

  fill(300, 75, 100, 120);
  rect(740, 180, 20, 20);
}


void endScreen() {
  image(endImage, 0, 0);
  image(tryImage, 220, 20);
}


void winningScreen() {
  image(winningImage, 220, -10, width/4, height/4);
}



