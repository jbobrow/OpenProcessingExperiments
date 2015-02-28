
// OBJECTS
Fluff myFluff;
MotherFluff myMotherFluff;
Fluff[] myFluffArray;

// INCOMING VARIABLES
float myActivity;
float myAverageX;
float myCloseness;

// GLOBAL VARIABLES
int counter;
int spawnDelay;
int spawnCounter;
int fluffAmount = 25;
int activeFluffAmount;
float generalActivity = 0;
boolean motherPresent = false;


// SETUP FUNCTION
void setup() {

  // GENERAL SETUP
  size(1280, 1024);
  smooth();
  noCursor();

  // CREATE FLUFFS
  myFluffArray = new Fluff[fluffAmount];
  for (int i = 0; i<fluffAmount; i++) {
    myFluffArray[i] = new Fluff(random(0, width), random(0, height));
  }
  myMotherFluff = new MotherFluff(width/2, height/2);
}


// DRAW FUNCTION
void draw() {
  counter++;
  updateFluffs();
  getMouseInput();
  //showDebugInformation();
  calculateActivity();
}


// UPDATE FLUFFS
void updateFluffs() {
  background(0);
  for (int i=0; i<fluffAmount; i++) {
    myFluffArray[i].update();
  }
  myMotherFluff.update();
}


// CALCULATE GENERAL ACTIVITY
void calculateActivity() {
  if (generalActivity < 1) generalActivity += myActivity;
  if (generalActivity > 0) generalActivity -= 0.01;
  else generalActivity = 0;

  if (generalActivity < 0.2 && activeFluffAmount < fluffAmount) {
    myFluffArray[activeFluffAmount].spawn();
    activeFluffAmount++;
    generalActivity += 0.15;
  } 
  else if (generalActivity > 0.8 && activeFluffAmount > 0) {
    myFluffArray[activeFluffAmount-1].hide();
    activeFluffAmount--;
    generalActivity -= 0.15;
  }
}


// CREATE FAKE VARIABLES
void getMouseInput() {
  float myLastX = myAverageX;
  float myLastCloseness = myCloseness;
  myAverageX = float(mouseX)/width;
  myCloseness = 1-float(mouseY)/height;  
  myActivity = (abs(myLastX-myAverageX)/width+abs(myLastCloseness-myCloseness)/height)*1000;
  println(myActivity);

  if (myActivity > .02) myActivity-=.02;
  else myActivity = 0;
}


// SHOW INFORMATION ON TOP LEFT CORNER
void showDebugInformation() {
  fill(255, (1-generalActivity)*255, (1-generalActivity)*255);
  text("General Activity: " + generalActivity, 20, 20);
  fill(255, (1-myActivity)*255, (1-myActivity)*255);
  text("User Activity: " + myActivity, 20, 40);
  fill(255, 255, 255);
  text("Average X: " + myAverageX, 20, 60);
  fill(255, (1-myCloseness)*255, (1-myCloseness)*255);
  text("Closeness: " + myCloseness, 20, 80);

  noStroke();
  fill(255, 102);
  rectMode(CENTER);
  rect(myAverageX*width, (1-myCloseness)*height, 50, 50);
  rect(myAverageX*width, (1-myCloseness)*height, (myActivity)*300, (myActivity)*300);
}


void mousePressed() {
  myMotherFluff.spawn();
  println("spawn mother");
}


void keyPressed() {
  if (key == 'j') {
    myMotherFluff.spawn();
    println("spawn mother");
  }
}

class Fluff {

  // MOOD VARIABLES
  String mood = "normal";
  float cf = 1;

  // POSITION VARIABLES
  float x;
  float y;
  float targetX;
  float targetY;
  float deltaX;
  float deltaY;
  float angle;
  float counter;
  float distance = 10;
  boolean isMoving = false;
  float easing = 0.1; // 0.05;
  float[] posX = new float[5];
  float[] posY = new float[5];

  // DRAWING VARIABLES
  float scale = 0;
  float origSize = 10;
  float size;
  float hairLength;
  float randomSeed = random(0, 1000);
  int hairNumber = 18;
  float hairThickness;
  float[] hairThicknessArray = new float[hairNumber];
  float blinkCounter;
  float blinkEvent = 100;
  boolean isBlinking = false;
  float eyeSizeX = origSize/4;
  float eyeSizeY = eyeSizeX;
  float eyeSizeCounter = 4;
  float crazyness = 0;

  // CONSTRUCTOR
  Fluff(float in_x, float in_y) {

    // VARIABLES
    x = in_x;
    y = in_y;
    angle = random(0, 360);
    origSize = origSize*random(1, 2);
    size = origSize;

    // ARRAY
    for (int i=0; i<hairNumber; i++) {
      hairThicknessArray[i] = random(0.75, 1.25)/7;
    }
  }


  void update() {
    counter++;

    if (mood == "growing") {
      scale+=.1;
      if (scale < 1) {
        noFill();
        strokeWeight(4);
        stroke(255, (1-scale)*255);
        ellipse(x, y, 5*scale*origSize, 5*scale*origSize);
      } 
      else {
        mood = "normal";
        scale = 1;
      }
    }

    // MOVING WHEN GROWING IS COMPLETE
    else if (mood == "normal") {
      if (isMoving == false) getTarget();
      else getMoving();
      checkPosition();
    }

    else if (mood == "hiding") {
      scale-=.1;
      if (scale > 0) {
        noFill();
        strokeWeight(2);
        stroke(255, scale*255);
        ellipse(x, y, 3*(1-scale)*origSize, 3*(1-scale)*origSize);
      } 
      else {
        mood = "normal"; // invisible?
        scale = 0;
        x = random(0, width);
        y = random(0, height);
      }
    }


    pushMatrix();
    translate(x, y);
    scale(scale);
    drawBody();
    drawHair();
    drawEyes();
    popMatrix();
  }


  void checkPosition() {
    for (int i=posX.length-1; i>0; i--) {
      posX[i] = posX[i-1];
      posY[i] = posY[i-1];
    }
    posX[0]=deltaX;
    posY[0]=deltaY;

    float averageX = abs((posX[0]+posX[1]+posX[2]+posX[3]+posX[4])/5);
    float averageY = abs((posY[0]+posY[1]+posY[2]+posY[3]+posY[4])/5);

    if (averageX < 0.1 && averageY < 0.1) {
      mood = "hiding";
      println(averageX + " / " + averageY);
    }
  }


  void spawn() {
    mood = "growing";
  }


  void hide() {
    mood = "hiding";
  }


  void getTarget() {

    float distToPerson = abs(x/width-myAverageX);
    float fleeFactor = 100*(1-distToPerson)*myCloseness;
    if (x/width < myAverageX) fleeFactor = -fleeFactor;

    angle = angle + random(-45, 45);
    float newDistance = distance*random(1, 5);
    targetX = x + sin(radians(angle))*newDistance+fleeFactor;
    targetY = y + cos(radians(angle))*newDistance;

    if (targetX > 1.5*size && targetX < width-1.5*size && targetY > 1.5*size && targetY < height-1.5*size) {
      isMoving = true;
    } 
    else {
      angle = random(0, 360);
      return;
    }
  }


  void getMoving() {
    deltaX = targetX - x;
    deltaY = targetY - y;
    x += deltaX * easing;
    y += deltaY * easing;
    if (abs(deltaX) < 1 && abs(deltaY) < 1 ) {
      isMoving = false;
    }
  }


  void drawBody() {
    //size = origSize*scale;
    noStroke();
    fill(255, 255*scale);
    ellipse(0, 0, size*2, size*2);
  }


  void drawHair() {
    float newX;
    float newY;
    hairLength = size*1.25*scale;
    stroke(255, 255*scale);
    for (int i=0; i<hairNumber; i++) {
      float noise = noise(counter*0.05+i*10+randomSeed, randomSeed+i*10);
      strokeWeight(hairThicknessArray[i]*origSize*scale);
      newX = sin(radians(i/float(hairNumber)*360+crazyness*noise))*hairLength*map(noise, 0, 1, 0.8, 1.2);
      newY = cos(radians(i/float(hairNumber)*360+crazyness*noise))*hairLength*map(noise, 0, 1, 0.8, 1.2);
      line(deltaX*.2, deltaY*.2, newX, newY);
    }
  }


  void drawEyes() {

    eyeSizeX = size/4*scale;

    if (isBlinking == false) {
      eyeSizeY = eyeSizeX;
      blinkCounter++;
      if (blinkCounter >= blinkEvent) isBlinking = true;
    } 
    else {
      eyeSizeY = eyeSizeCounter/4*eyeSizeX;

      if (eyeSizeCounter <= -4) {
        eyeSizeY = eyeSizeX;
        eyeSizeCounter = 4;
        blinkCounter = 0;
        blinkEvent = 100*random(0.5, 1.5);
        isBlinking = false;
      } 
      else {
        eyeSizeCounter--;
      }
    }

    noStroke();
    fill(0, 255*scale);
    float leftEyeX = -size/2 + deltaX*.1;
    float rightEyeX = size/2 + deltaX*.1;
    float eyeY = size/4 + deltaY*.1;
    pushMatrix();
    translate(leftEyeX, eyeY);
    rotate(myCloseness*0.25);
    ellipse(0, 0, eyeSizeX, eyeSizeY*(2-myCloseness)*.5);
    popMatrix();
    pushMatrix();
    translate(rightEyeX, eyeY);
    rotate(-myCloseness*0.25);
    ellipse(0, 0, eyeSizeX, eyeSizeY*(2-myCloseness)*.5);
    popMatrix();
  }
}



class MotherFluff extends Fluff {

  // POSITION VARIABLES
  float lifeCounter;
  float lifeMax = 2000;

  // CONSTRUCTOR
  MotherFluff(float in_x, float in_y) {
    super(in_x, in_y);

    origSize = 150;
    distance = 20;
  }


  void update() {
    crazyness = myCloseness;
    counter++;
    lifeCounter++;
    cf = 1+myCloseness/2;
    size = origSize*cf;
    
    // GROWING WHEN FRESHLY SPAWNED
    if (mood == "growing") {
      scale+=.1;
      if (scale < 1) {
        noFill();
        strokeWeight(8);
        stroke(255, (1-scale)*255);
        ellipse(x, y, 4*scale*size, 4*scale*size);
      } 
      else {
        mood = "normal";
        scale = 1;
      }
    }

    // NORMAL BEHAVIOUR
    else if (mood == "normal") {
      if (isMoving == false) getTarget();
      else getMoving();
      lifeCounter++;
      if (lifeCounter >= lifeMax) {
        mood = "hiding";
      }
    } 

    // DISAPPEARING AFTER CERTAIN TIME
    else if (mood == "hiding") {
      lifeCounter = 0;
      scale-=.1;
      if (scale > 0) {
        noFill();
        strokeWeight(4);
        stroke(255, scale*255);
        ellipse(x, y, (1-scale)*origSize, (1-scale)*origSize);
      } 
      else {
        mood = "normal";
        scale = 0;
        motherPresent = false;
      }
    }

    pushMatrix();
    translate(x, y);
    scale(scale);
    drawBody();
    drawHair();
    drawEyes();
    popMatrix();
  }


  void getTarget() {

    float PersonVector = myAverageX*width-x;
    float attractionFactor = 0.5*PersonVector*myCloseness;

    angle = angle + random(-45, 45);
    float newDistance = distance*random(1, 5);
    targetX = x + sin(radians(angle))*newDistance + attractionFactor;
    targetY = y + cos(radians(angle))*newDistance;

    if (targetX > 1.5*size && targetX < width-1.5*size && targetY > 1.5*size && targetY < height-1.5*size) {
      isMoving = true;
    } 
    else {
      angle = random(0, 360);
      return;
    }
  }
}



