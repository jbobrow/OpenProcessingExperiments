
/*  Conor Russomanno
    Bootcamp 2011
    Orbitorbs  */


/*----------VARIABLES----------*/

int ballCount = 0; 
int maxBalls = 5;
float[] xPos = new float[maxBalls];
float[] yPos = new float[maxBalls];
float[] xSpeed = new float[maxBalls];
float[] ySpeed = new float[maxBalls];
float[] xAcc = new float[maxBalls];
float[] yAcc = new float[maxBalls];
float[] d = new float[maxBalls];
float[] mass = new float[maxBalls];
/*float[] rosa = new float[maxBalls];
 float[] verde = new float[maxBalls];
 float[] azul = new float[maxBalls];*/
float[] opacity = new float[maxBalls];
float gConstant = pow(10, -4);
float[] totalXForce = new float[maxBalls];
float[] totalYForce = new float[maxBalls];

//force arrays
float[][] forceMain = {
  {
    0, 0, 0, 0, 0
  }
  , 
  {
    0, 0, 0, 0, 0
  }
  , 
  {
    0, 0, 0, 0, 0
  }
  , 
  {
    0, 0, 0, 0, 0
  }
  , 
  {
    0, 0, 0, 0, 0
  }
};

float[][] forceX = {
  {
    0, 0, 0, 0, 0
  }
  , 
  {
    0, 0, 0, 0, 0
  }
  , 
  {
    0, 0, 0, 0, 0
  }
  , 
  {
    0, 0, 0, 0, 0
  }
  , 
  {
    0, 0, 0, 0, 0
  }
};

float[][] forceY = {
  {
    0, 0, 0, 0, 0
  }
  , 
  {
    0, 0, 0, 0, 0
  }
  , 
  {
    0, 0, 0, 0, 0
  }
  , 
  {
    0, 0, 0, 0, 0
  }
  , 
  {
    0, 0, 0, 0, 0
  }
};

//booleans to determine what step the program is on

boolean beforeMotion = true;
boolean setLocation = true;
boolean setSize = false;
boolean setColor = false;
boolean setSpeed = false;
boolean setMassTime = false;
boolean setMass = false;
boolean go = false;

PImage bg;

color[] ballColor = new color[maxBalls];
PImage[] colorPallete;

float sizeTimer;

boolean mouseRel = false;


/*-------SETUP-------*/

void setup() {
  sizeTimer = millis();
  size(900, 900);
  smooth();
  ellipseMode(CENTER);
  imageMode(CENTER);
  frameRate(80);
  fill(0);
  stroke(255);
  //background(255);
  bg = loadImage("location.png"); //step 1 instructions

  for (int i = 0; i < maxBalls; i++) {
    xPos[i]=0;
    yPos[i]=0;
    xSpeed[i]=0;
    ySpeed[i]=0;
    xAcc[i]=0;
    yAcc[i]=0;
    totalXForce[i]=0;
    totalYForce[i]=0;
    d[i]=0;
    opacity[i]=255;
    mass[i] = 0;
  }
}

void mouseReleased() {
  mouseRel = true;
}

void keyPressed() {
  if (setLocation==true) {
    go = true;
    beforeMotion = false;
  }
}

/*---------THE GOOD STUFF---------*/

void draw() {
  image(bg, 450, 450);
  //background(255);
  if (beforeMotion == true && ballCount < maxBalls) {
    setLocation();
    setSize();
    setColor();
    setSpeed();
    setMassTime();
    setMass();
    if (go == false) {
      for (int i = 0; i < maxBalls; i++) {
        if (opacity[i] > 255) {
          opacity[i] = 255;
        }
        //mass[ballCount] = (100*(opacity[i]/255))/*density*/*(4/3)*(3.1415)*pow((d[i]/2), 3); //put mass of ball between 0-100 * 4/3(pi)r^3
        fill(ballColor[i], opacity[i]);
        ellipse(xPos[i], yPos[i], d[i], d[i]);
        line(xPos[i], yPos[i], xPos[i]+xSpeed[i]*20, yPos[i]+ySpeed[i]*20);
      }
    }
  }
  else {
    setInMotion();
    //make balls move
    //make balls collide with walls
  }
}

//sets location of current circle (with reference to ballCount)
void setLocation () {
  if (mousePressed && setLocation == true) {
    sizeTimer = millis();
    xPos[ballCount] = mouseX;
    yPos[ballCount] = mouseY;
    setLocation = false;
    setSize = true;
  }
}

//sets size of current circle ('')
void setSize () {
  if (mousePressed && setSize == true) {
    //ellipse (xPos[ballCount], yPos[ballCount], 0.1*(millis()-sizeTimer), 0.1*(millis()-sizeTimer)); 
    d[ballCount] = (0.1*(millis()-sizeTimer)); //store diameter of ball[ballCount]
  }

  if (mouseRel == true && setSize == true) {
    setSize = false;
    setColor = true;
    mouseRel = false;
    bg = loadImage("color2.png"); //set speed instructions
  }
}

void setColor() {
  if (setColor == true) {
    if (775.0 <= mouseX && mouseX <= 832.0) {
      if (47.0 <= mouseY && mouseY <= 842.0) {
        if (mousePressed) {
          ballColor[ballCount] = bg.get(mouseX, mouseY); //stores color of pixel value clicked on screen
          /*rosa[ballCount] = 0;
           verde[ballCount] = 100;
           azul[ballCount] = 255;*/
          fill(ballColor[ballCount], 100);
          ellipse (xPos[ballCount], yPos[ballCount], d[ballCount], d[ballCount]);
        }
        if (mouseRel == true && setColor == true) {
          setColor = false;
          setSpeed = true;
          mouseRel = false;
          bg = loadImage("speed.png");
        }
      }
    }
    else {
      mouseRel = false;
    }
  }
}


//sets speed of current circle ('')
void setSpeed () {
  if (mousePressed && setSpeed == true) {
    line(xPos[ballCount], yPos[ballCount], mouseX, mouseY);
    xSpeed[ballCount] = (mouseX - xPos[ballCount])/20;
    ySpeed[ballCount] = (mouseY - yPos[ballCount])/20;
  }
  if (mouseRel == true && setSpeed == true) {      
    setSpeed = false;
    setMassTime = true;
    mouseRel=false;
    bg = loadImage("mass.png"); //set to setMass instructions
  }
}

void setMassTime () {
  if (mousePressed && setMassTime == true) {
    sizeTimer = millis();
    setMassTime = false;
    setMass = true;
  }
}

// set opacity of ball which correlates to mass
void setMass () {
  if (mousePressed && setMass == true) {
    opacity[ballCount] = .0255*(millis()-sizeTimer);
  }  
  if (mouseRel == true && setMass == true) {      
    println("the new ball count is: " + ballCount);
    println("the new ball opacity is: " + opacity[ballCount]);
    mass[ballCount] = (100*(opacity[ballCount]/255))/*density*/*(4/3)*(3.1415)*pow((d[ballCount]/2), 3);
    ballCount++;
    setMass = false;
    setLocation = true;
    //println (forceX[1][1]);
    mouseRel=false;
    bg = loadImage("location.png"); //back to step 1 instructions
  }
}

//once the user doesn't want to make any more circles this is how they set the circles in motion
void setInMotion() {
  for (int i = 0; i < ballCount; i++) {
    //println("masses" + mass[i]);  // tester
  }
  if (go == false) {
    bg = loadImage("pressg.png");
  }
  //once g is pressed:
  if (go == true) {
    noStroke();
    bg = loadImage("watch.png"); // step 3 (once motion has started);
    //background(255);
    for (int i = 0; i < ballCount; i++) {
      fill(ballColor[i], opacity[i]);
      ellipse(xPos[i], yPos[i], d[i], d[i]);
      //xPos[i] += xSpeed[i];
      //yPos[i] += ySpeed[i];
    }

    //interact with walls
    for (int i = 0; i < ballCount; i++) {
      if (xPos[i]<=d[i]/2) {
        xPos[i] = d[i]/2 + 1;
        xSpeed[i] = xSpeed[i]*-1;
      }   
      if (xPos[i]>=width-(d[i]/2)) {
        xPos[i] = width-(d[i]/2)-1;
        xSpeed[i] = xSpeed[i]*-1;
      }  
      if (yPos[i]<=d[i]/2) {
        yPos[i] = d[i]/2 + 1;
        ySpeed[i] = ySpeed[i]*-1;
      }   
      if (yPos[i]>=height-(d[i]/2)) {
        yPos[i] = height-(d[i]/2)-1;
        ySpeed[i] = ySpeed[i]*-1;
      }
    }

    //Find force between each ball and each other ball and store
    for (int i = 0; i < ballCount; i++) { //main force on each ball (direction from one to the other)
      for (int j = 0; j < ballCount; j++) {
        if (i!=j) {
          forceMain[i][j] = (gConstant*mass[i]*mass[j])/pow(dist(xPos[i], yPos[i], xPos[j], yPos[j]), 2);//force between 2 objects eqtn: F=Gm1m2/r^2
          /*println("xPos[i]" + xPos[i]);
           println("yPos[i]" + yPos[i]);
           println("xPos[j]" + xPos[j]);
           println("yPos[j]" + yPos[j]);
           println("pow(dist)^2" + pow(dist(xPos[i], yPos[i], xPos[j], yPos[j]), 2));
           println("dist" + dist(xPos[i], yPos[i], xPos[j], yPos[j]));*/          //tester
        } 
        else forceX[i][j] = 0;
      }
    }
    //println("forceMain" + forceMain[0][1]); //tester

    //Convert to ForceX and ForceY and store
    for (int i = 0; i < ballCount; i++) { //main force on each ball (direction from one to the other)
      for (int j = 0; j < ballCount; j++) {
        if (xPos[i]>xPos[j]) {
          forceX[i][j] = ((xPos[j]-xPos[i])/dist(xPos[i], yPos[i], xPos[j], yPos[j]))*forceMain[i][j];
        }
        if (yPos[i]>yPos[j]) {        
          forceY[i][j] = ((yPos[j]-yPos[i])/dist(xPos[i], yPos[i], xPos[j], yPos[j]))*forceMain[i][j];
        }
        if (xPos[i]<xPos[j]) {
          forceX[i][j] = ((xPos[j]-xPos[i])/dist(xPos[i], yPos[i], xPos[j], yPos[j]))*forceMain[i][j];
        }
        if (yPos[i]<yPos[j]) {
          forceY[i][j] = ((yPos[j]-yPos[i])/dist(xPos[i], yPos[i], xPos[j], yPos[j]))*forceMain[i][j];
        }
      }
    }

    //println("forceX" + forceX[0][1]);//tester

    //Sum all X and Y force on each ball and store in totalXForce and totalYForce
    for (int i = 0; i < ballCount; i++) { //main force on each ball (direction from one to the other)
      for (int j = 0; j < ballCount; j++) {
        if (i!=j) {
          totalXForce[i] += forceX[i][j];
          totalYForce[i] += forceY[i][j];
          //println(forceX[0][0]);
          println(forceX[0][1]);
          println(forceX[1][0]);
          //  println(forceX[1][1]);
        }
      }
    }
    //println("totalXForce[0]" +  totalXForce[0]);//tester

    //convert totalXForce and totalYForce to xAcc and yAcc
    for (int i = 0; i < ballCount; i++) { //main force on each ball (direction from one to the other)
      xAcc[i] = totalXForce[i]/mass[i];
      yAcc[i] = totalYForce[i]/mass[i];
    }

    //println("xAcc[0]" + xAcc[0]);

    // Apply Accelerations to speeds and then speeds to positions
    for (int i = 0; i < ballCount; i++) {
      xSpeed[i] += xAcc[i];
      ySpeed[i] += yAcc[i];  //should be x Time but assuming t=1 per framce

      if (xSpeed[i] > 20) { // so balls don't get out of control
        xSpeed[i] = 10;
      }
      if (ySpeed[i] > 20) { 
        ySpeed[i] = 10;
      }

      xPos[i] += xSpeed[i];
      yPos[i] += ySpeed[i];

      totalXForce[i] = 0;
      totalYForce[i] = 0;

      println("xAcc[0]: " + xAcc[0]);
      println("yAcc[0]: " + yAcc[0]);
      println("xAcc[1]: " + xAcc[1]);
      println("yAcc[1]: " + yAcc[1]);

      //     exit();
    }
  }
}


/*
    //apply gravitational accelerations to all balls
 //x-accelerations
 for (int i = 0; i < 5; i++) {
 for (int j = 0; j < 5; j++) {
 if (xPos[i] > xPos[j]) {
 xAcc[i] = xAcc[i] - forceX[i][j]/(mass[i]);  //since it's going to go through both axises of the matrix i will account for that by only applying half the force now
 }
 if (xPos[i] < xPos[j]) {
 xAcc[i] = xAcc[i] + forceX[i][j]/(mass[i]);
 }
 }
 }
 
 //y-accelerations
 for (int i = 0; i < 5; i++) {
 for (int j = 0; j < 5; j++) {
 if (yPos[i] < yPos[j]) {
 yAcc[i] = yAcc[i] + forceY[i][j]/(mass[i]);
 }
 
 if (yPos[i] > yPos[j]) {
 yAcc[i] = yAcc[i] - forceY[i][j]/(mass[i]);  //since it's going to go through both axises of the matrix i will account for that by only applying half the force now
 }
 }
 }
 
 //Apply speed changes
 for (int i = 0; i < maxBalls; i++) {
 xSpeed[i] += xAcc[i];
 ySpeed[i] += yAcc[i];  //should be x Time but assuming t=1 per framce
 
 xPos[i] += xSpeed[i];
 yPos[i] += ySpeed[i];
 
 xAcc[i]=0;
 xAcc[i]=0;
 }
 }
 }*/

