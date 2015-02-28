
boolean [] sectionUsed = new boolean [8];
boolean plantButton = false;
boolean waterButton = false;
ArrayList plants = new ArrayList();
int deadCount = 0;
PFont helvet;
PFont gameStatus;
int time;
int score = 0;
boolean gameStarted = false;
boolean gameOver = false;
import processing.serial.*;
//Serial myPort;
//int serialRead = 256;
int cursorLoc = 0;


void setup() {
  size(800, 600, P2D);
  background(255);
  frameRate(60);

 // String portName = Serial.list()[1];
 // println(portName);
 // myPort = new Serial(this, portName, 9600);

  helvet = createFont("Helvet", 30);
  gameStatus = createFont("Helvet", 50);
  //sets all the plants sections as being empty
  for (int i=0; i<8; i++) {
    sectionUsed[i] = false;
  }
}

void draw() {
  //refreshes background
  background(255);
  fill(0);
  if (gameStarted == false) {
    background(152, 217, 234);
    textFont(gameStatus);
    textAlign(CENTER);
    fill(18, 106, 24);
    text("Hit the 's' to Start", width/2, height/2);
  }

  if (gameStarted == true) {
    //draws the lives left
    noStroke();
    if (deadCount == 0) {
      rectMode(CENTER);
      fill(0, 255, 0);
      rect(275, 30, 50, 50);
      fill(0, 255, 0);
      rect(375, 30, 50, 50);
      fill(0, 255, 0);
      rect(475, 30, 50, 50);
    }

    else if (deadCount == 1) {
      rectMode(CENTER);
      fill(255, 0, 0);
      rect(275, 30, 50, 50);
      fill(0, 255, 0);
      rect(375, 30, 50, 50);
      fill(0, 255, 0);
      rect(475, 30, 50, 50);
    }

    else if (deadCount == 2) {
      rectMode(CENTER);
      fill(255, 0, 0);
      rect(275, 30, 50, 50);
      fill(255, 0, 0);
      rect(375, 30, 50, 50);
      fill(0, 255, 0);
      rect(475, 30, 50, 50);
    }

    rectMode(CORNER);
    fill(0);
    textFont(helvet);
    //keeps track of time and displays it
    time-=2;
    text((time-(time%100))/100, 20, 35);

    //if the user hasn't let more than 3 plants die game continues
    if (deadCount < 3) {
      int plantCount = 0;

      //counts how many plants exist to be used for the score
      for (int i=0; i<8; i++) {
        if (sectionUsed[i] == true) {
          plantCount++;
        }

        //println(plantCount);
      }

      score += plantCount;
      //displays score
      text(score, 700, 35);

      int cursorLoc = mouseX;

      //draws the cursor
      ellipseMode(CENTER);
      ellipse(cursorLoc, 120, 25, 25);



      cursorLoc = cursorLoc - (cursorLoc%100);
      //checks to see if the user wants to water a plant
      if (waterButton == true) {
        waterButton = false;
        //checks if there is a plant even in  the section
        if (sectionUsed[cursorLoc/100] == true) {
          for (int i = 0; i<plants.size(); i++) {
            Flower thisFlower = (Flower) plants.get(i);
            //checks if this flower is in the spot that the person wants to water
            println(thisFlower.flowerX);
            println(cursorLoc);
            if (thisFlower.flowerX == cursorLoc) {
              //resets the meter
              thisFlower.resetmeter();
              println("reset");
            }
          }
        }
        else {
          println("No Plant Here");
        }
      }
      //checks to see if the user wants to plant
      if (plantButton == true) {
        plantButton = false;



        //checks if the section already has a plant
        if (sectionUsed[cursorLoc/100] == false) {
          sectionUsed[cursorLoc/100] = true;
          //creates the plant in the arrayList
          plants.add(new Flower(cursorLoc));
        }

        //if a flower already exists in this section
        else {
          println("This section is already in use");
        }
      }


      for (int i = 0; i <plants.size(); i++) {
        Flower thisFlower = (Flower) plants.get(i);
        //checks if the flower is dead while also changing the meter
        if (thisFlower.changemeter() == false) {
          //draws the flowers and meter
          thisFlower.drawflower();
        }
      }
    }

    else {
      background(0);
      println("gameOver");
      textFont(gameStatus);
      textAlign(CENTER);
      fill(255, 0, 0);
      text("Game Over", width/2, height/2);
      text("Your Score was: " + score, width/2, (height/2)+60);
      gameOver = true;
    }
  }
}

//for processing only Gaming
void mousePressed() {
  plantButton = true;
}

//for processing only Gaming
void keyPressed() {
  if (key == 'w') {
    waterButton = true;
  }

  if (key == 's') {
    if (gameStarted == false) {
      gameStarted = true;
      time = 6000;
    }
  }

  if (key == 'r') {
    if (gameOver == true) {
      gameStarted = false;
      deadCount = 0;
      score = 0;
    }
  }
}

//void serialEvent (Serial p) {
//  //save the data we get to a variable
//  serialRead = p.read();
//
//  //if big Button is pressed
//  if (serialRead == 0) {
//    //println("Big Button");
//    plantButton = true;
//  }
//
//  //if small Button is pressed
//  else if (serialRead == 1) {
//    //println("Small Button");
//    waterButton = true;
//  }
//
//  //reads the data from potentiometer
//  else {
//    //takes the number read which is scaled 2 - 255
//    //and makes it a scale 0 - 253
//    serialRead = serialRead - 2;
//    //inverts the dial 
//    serialRead = abs(serialRead - 253);
//    //println(serialRead);
//
//    //maps out the dial to the window width
//
//    cursorLoc = round(map(serialRead, 0, 253, 20, 780));
//    //println(cursorLoc);
//  }
//}


