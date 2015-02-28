
Alien[] aliens;
Timer timer;
boolean alienIsOrange= false;
boolean alienIsGreen= false;


void setup() {
  frameRate(10);
  size(800, 800);
  timer = new Timer(2000); //"Aliens" appear every 2000 ms
  timer.start(); //Start the timer
  aliens = new Alien[0]; //initialize Alien index 0
  
  photo = loadImage("microscope.png");
}

void draw() {
  background(250);
  if (timer.isFinished()) { // If 2000 ms have passed:
    timer.start();
    //New Alien object
    Alien myAlien = new Alien(mouseX, mouseY);
    //Append to array
    aliens = (Alien[]) append(aliens, myAlien);
  }

  for (int i=0; i<aliens.length; i++) {
    aliens[i].move();
    aliens[i].displayShadows();
    //If its the first creature, make it orange:
    if (i<1) {
      aliens[i].displayOrangeAlien();
      aliens[0].alienIsOrange= true; //the first alien is orange
    }  
    //Make all of the other creatures grey:
     if (i>=1) {
      aliens[i].displayGreyAliens(); 
     }
    //check to see if one creature is intersecting with another:
    for (int j=0; j<aliens.length; j++)
    {
      if ( i != j)
      {
        if (aliens[i].intersect(aliens[j]) && (aliens[i].alienIsOrange || aliens[j].alienIsOrange)) { 
          //println("Creature " + i + " is intersecting with creature " + j);
           aliens[j].changeOrange();
           aliens[j].alienIsOrange= true;
           if (aliens[i].alienIsGreen && aliens[i].intersect(aliens[j])) {
             aliens[j].changeGreen();
             aliens[j].alienIsGreen = true;
             aliens[0].alienIsOrange = false;
           }
        }
      }
    }
  }
  
  image(photo, 0, 0);
}

void mousePressed() {
  
  for (int i=0; i<aliens.length; i++) {
    //if the user clicks on an alien:
    if (aliens[i].caught(mouseX, mouseY)) {
     // println("The user has clicked on an alien");
      aliens[i].changeGreen();
      aliens[i].alienIsGreen = true;
    }
  }
}


////////////////////////////// ALIEN CLASS //////////////////////////////////
class Alien {
  //center points
  float cx;
  float cy;
  float cxShadow;
  float cyShadow;

  //colors and stroke weights
  color shadow;
  color purple;
  color orange;
  color lightGrey;
  color darkGrey;
  color darkGreen;
  color lightGreen;
  color background;
  float legWeight;
  float eyeWeight;
  //legs
  float legX;
  float legY;
  float spokeLength;
  int howMany;
  //center eyeball
  float outsideW;
  float insideW;
  //outside eyeballs
  float orangeOutsideW;
  float orangeInsideW;

  float xSpeed;
  float ySpeed;
  float cxSpeed;
  float cySpeed;
  float angle;
  float offset;

  float[] spokeLengthList; //need arrays to generate random values 
  color[] orangeList;
  float[] orangeOutsideWList;
  float[] orangeInsideWList;

  boolean moveRight; //for the movement: to make them "bounce" off the walls
  boolean moveDown;

  Alien(int centerX, int centerY) {

    cx = random(0, 800);
    cy = random(0, 800);
    cxShadow = cx + 5;
    cyShadow = cy + 5;
    shadow = color(150, 100);
    xSpeed = int(random(-12, 12));
    ySpeed = int(random(-12, 12));
    cxSpeed = xSpeed;
    cySpeed = ySpeed;
    howMany = 6; //number of legs
    angle = 60; //6 legs, so the angles are 60 degrees apart
    offset = 0; //so legs rotate together
    //outsideW= random(30, 40); //width of outer purple circles
    //insideW= random(20, 25); //width of inner purple circles
    purple= color(random(100), 0, random(50, 100), 150);
    lightGrey= color(200);
    darkGrey= color(100);
    darkGreen= color(0, random(100, 150), 100);
    lightGreen= color(200, 250, random(20, 100));
    eyeWeight= random(1, 3); //strokes of the "eyes"

    spokeLengthList = new float[howMany]; //initialize arrays
    orangeList = new color[howMany];
    orangeOutsideWList = new float[howMany];
    orangeInsideWList = new float[howMany];


    for (int i=0; i<howMany; i++) {
      spokeLength = int(random(40, 80));
      orange = color(random(140, 240), random(50, 80), 50, 150);
      orangeOutsideW= random(15, 25);
      orangeInsideW= random(4, 10);
      spokeLengthList[i] = spokeLength;
      orangeList[i] = orange;
      orangeOutsideWList[i] = orangeOutsideW;
      orangeInsideWList[i] = orangeInsideW;
    }
  }

//A function that returns true or false based on if the creatures intersect
  boolean intersect(Alien a) {
    float distance = dist(cx, cy, a.cx, a.cy); //Calculate distance
    if (distance < spokeLength  + a.spokeLength) {
      return true;
    } 
    else {
      return false;
    }
  } 

//A function that returns true or false based on if the user has clicked on an alien
  float xLoc;
  float yLoc;

  boolean caught(float xLoc, float yLoc) {
    //float xLoc = mouseX;
    //float yLoc = mouseY;
    float mouseDistance = dist(xLoc, yLoc, cx, cy);
    if (mouseDistance < spokeLength) {
      return true;
    } 
    else {
      return false;
    }
  }


////////////////////////// DISPLAY SHADOWS /////////////////////////////
  void displayShadows() {
    //Need to use a loop for the multiple legs and "eyes" on the ends of them
    for (int i = 0; i < howMany; i++) {
      spokeLength = spokeLengthList[i];
      orange = orangeList[i];
      orangeOutsideW = orangeOutsideWList[i];
      orangeInsideW = orangeInsideWList[i];
      outsideW= random(30, 40); //width of outer purple circles
      insideW= random(20, 25); //width of inner purple circles
      float legX = cxShadow + cos(radians(angle*i+offset))* spokeLength;
      float legY = cyShadow + sin(radians(angle*i+offset))* spokeLength;
      //legs:
      stroke(shadow);
      strokeWeight(3);
      line(cxShadow, cyShadow, legX, legY);
      //eyeballs:
      fill(shadow);
      noStroke();
      strokeWeight(eyeWeight);
      ellipse(legX, legY, orangeOutsideW, orangeOutsideW);
      fill(shadow);
      noStroke();
      ellipse(legX, legY, orangeInsideW, orangeInsideW);
    }

    //CENTER EYEBALL:
    //outside circle:
    fill(shadow);
    noStroke();
    ellipse(cxShadow, cyShadow, outsideW, outsideW);
    //inside circle:
    noStroke();
    fill(shadow);
    ellipse(cxShadow, cyShadow, insideW, insideW);
  }

//////////////////////// DISPLAY FIRST ORANGE ALIEN //////////////////////////////
  void displayOrangeAlien() {
    for (int i = 0; i < howMany; i++) {
      spokeLength = spokeLengthList[i];
      orange = orangeList[i];
      orangeOutsideW = orangeOutsideWList[i];
      orangeInsideW = orangeInsideWList[i];
      outsideW= random(30, 40); //width of outer purple circles
      insideW= random(20, 25); //width of inner purple circles
      float legX = cx + cos(radians(angle*i+offset))* spokeLength;
      float legY = cy + sin(radians(angle*i+offset))* spokeLength;
      //legs:
      stroke(100, 200);
      strokeWeight(3);
      line(cx, cy, legX, legY);
      //eyeballs:
      fill(250);
      stroke(orange);
      strokeWeight(eyeWeight);
      ellipse(legX, legY, orangeOutsideW, orangeOutsideW);
      fill(orange);
      noStroke();
      ellipse(legX, legY, orangeInsideW, orangeInsideW);
    }

    //CENTER EYEBALL:
    //outside circle:
    fill(250);
    stroke(purple);
    ellipse(cx, cy, outsideW, outsideW);
    //inside circle:
    noStroke();
    fill(purple);
    ellipse(cx, cy, insideW, insideW);
  }
  
 /////////////////////////// DISPLAY GREY ALIENS ///////////////////////////
 void displayGreyAliens() {
    for (int i = 0; i < howMany; i++) {
      spokeLength = spokeLengthList[i];
      //orange = orangeList[i];
      orangeOutsideW = orangeOutsideWList[i];
      orangeInsideW = orangeInsideWList[i];
      outsideW= random(30, 40); //width of outer purple circles
      insideW= random(20, 25); //width of inner purple circles
      float legX = cx + cos(radians(angle*i+offset))* spokeLength;
      float legY = cy + sin(radians(angle*i+offset))* spokeLength;
      //legs:
      stroke(100, 200);
      strokeWeight(3);
      line(cx, cy, legX, legY);
      //eyeballs:
      fill(250);
      stroke(lightGrey);
      strokeWeight(eyeWeight);
      ellipse(legX, legY, orangeOutsideW, orangeOutsideW);
      fill(lightGrey);
      noStroke();
      ellipse(legX, legY, orangeInsideW, orangeInsideW);
    }

    //CENTER EYEBALL:
    //outside circle:
    fill(250);
    stroke(darkGrey);
    ellipse(cx, cy, outsideW, outsideW);
    //inside circle:
    noStroke();
    fill(darkGrey);
    ellipse(cx, cy, insideW, insideW);
  }
  
  /////////////////////////// DISPLAY GREEN ALIENS ///////////////////////////
 void displayGreenAliens() {
    for (int i = 0; i < howMany; i++) {
      spokeLength = spokeLengthList[i];
      //orange = orangeList[i];
      orangeOutsideW = orangeOutsideWList[i];
      orangeInsideW = orangeInsideWList[i];
      outsideW= random(30, 40); //width of outer purple circles
      insideW= random(20, 25); //width of inner purple circles
      float legX = cx + cos(radians(angle*i+offset))* spokeLength;
      float legY = cy + sin(radians(angle*i+offset))* spokeLength;
      //legs:
      stroke(100, 200);
      strokeWeight(3);
      line(cx, cy, legX, legY);
      //eyeballs:
      fill(250);
      stroke(lightGreen);
      strokeWeight(eyeWeight);
      ellipse(legX, legY, orangeOutsideW, orangeOutsideW);
      fill(lightGreen);
      noStroke();
      ellipse(legX, legY, orangeInsideW, orangeInsideW);
    }

    //CENTER EYEBALL:
    //outside circle:
    fill(250);
    stroke(darkGreen);
    ellipse(cx, cy, outsideW, outsideW);
    //inside circle:
    noStroke();
    fill(darkGreen);
    ellipse(cx, cy, insideW, insideW);
  }
  
////////////////////// CHANGE COLORS /////////////////////////////
void changeOrange() {
  darkGrey= purple;
  lightGrey= orange;
}


void changeGreen() {
  darkGrey= darkGreen;
  purple= darkGreen;
  lightGrey= lightGreen;
  orange= lightGreen;
} 

///////////////////////// HIDE GREY ALIENS ///////////////////////////
void hideAlien() {
    //stop intersected alien from moving
    xSpeed= 0;
    ySpeed= 0;
    cxSpeed= 0;
    cySpeed= 0;
    //set location to somewhere off screen
    cy= -1000;
    cyShadow = -1000;
} 
  


  ////////////////////////// MOVEMENT ///////////////////////////////
  void move() {
    offset+= 4; //rotation

    cx=cx+xSpeed;
    cy=cy+ySpeed;

    //Change directions after hitting the sides of the screen: 
    if (cx>width || cx<0) { 
      xSpeed *= -1;
    }

    if (cy> height || cy<0) {
      ySpeed*= -1;
    }

    //Shadows move with the creatures (offset by 5):
    cxShadow=cxShadow+cxSpeed;
    cyShadow=cyShadow+cySpeed;

    if (cxShadow>width +5  || cxShadow<5) {
      cxSpeed *= -1;
    }

    if (cyShadow> height +5 || cyShadow<5) {
      cySpeed*= -1;
    }
  }
}
/////////////////////////////// TIMER CLASS //////////////////////////////////
class Timer {

  int savedTime; //When timer started
  int totalTime; //How long timer should last

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  //Starting the timer
  void start() {
    //When the timer starts it stores the current time in millisecond
    savedTime = millis();
  }

  //The function isFinished() returns true if 2000 ms have passed.
  boolean isFinished() {
    //Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } 
    else {
      return false;
    }
  }
}


