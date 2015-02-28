

/************************************************************
 *                                                          *
 *                Bleeding Drawing Program                  *
 *                Created by Colin WIllson                  *
 *                      -Homework #3                        *
 *                                                          *
 ************************************************************/

int colorIndex = 1;
int sizeIndex = 1;
int bleedDistance = 1;
int bleedDelay = 1;
int delayCount = 1;
int bleedTime = 30;
boolean eraser = false;
float erPosX = 0;
float erPosY = 0;
float prevPosX = 0;
float prevPosY = 0;



//Array for holding line history
  //Technique referenced from http://processing.org/learning/2darray/
int[][] lineHistory = new int[51][8];

int historyIndex = 1;


void setup() {

  size(800, 800);
  background(255);
  colorMode(HSB, 255, 255, 255, 100);
  smooth();
}

void draw() {
  //Size Changer
  strokeWeight(1);
  stroke(0, 0, 0);



  fill(255);
  rect(0, 0, 800, 90);
  fill(colorIndex, 255, 255);

  if (eraser == false) {
    strokeWeight(3);
  }
  else {
    strokeWeight(1);
  }

  rect(20, 20, 50, 50);
  strokeWeight(1);
  fill(255);
  rect(90, 20, 50, 50);
  fill(255);

  if (eraser == true) {
    strokeWeight(3);
  }
  else {
    strokeWeight(1);
  }
  rect(160, 20, 50, 50);

  strokeWeight(1);
  fill(0, 0, 255);
  ellipse(185, 45, 40, 40);


  // noStroke();
  fill(0, 0, 0);
  ellipse(115, 45, sizeIndex, sizeIndex);
  //Color Changer


  strokeWeight(sizeIndex);


  if (mousePressed && mouseY > 90 && pmouseY > 90) { 


    if (eraser == true) { 

      strokeWeight(20);

      stroke(0, 0, 255);


      erPosX = mouseX + random(-15, 15);
      erPosY = mouseY + random(-15, 15);

      line(prevPosX, prevPosY, erPosX, erPosY);

      prevPosX = erPosX;
      prevPosY = erPosY;
    }
    else {

      stroke(colorIndex, 255, 255);
      println("C");
      line(pmouseX, pmouseY, mouseX, mouseY);

      lineHistory[historyIndex][1] = mouseX;
      lineHistory[historyIndex][2] = mouseY;
      lineHistory[historyIndex][3] = pmouseX;
      lineHistory[historyIndex][4] = pmouseY;
      lineHistory[historyIndex][5] = colorIndex;
      lineHistory[historyIndex][6] = sizeIndex;
      lineHistory[historyIndex][7] = bleedTime;    

      if (historyIndex == 50) {

        historyIndex = 1;
      }
      else {

        historyIndex ++;
      }
    }
  }
  else {

    prevPosX = mouseX;
    prevPosY = mouseY;
  }

  if (delayCount >= bleedDelay) {
    lineBleed();
    delayCount = 1;
  }
  else {

    delayCount++;
  }
}



void mousePressed() {

  if (mouseY <= 70) {
    //Changes color
    if (mouseX > 20 && mouseX < 70 && mouseY > 20 && mouseY < 70) {
      if (eraser == false) {
        println("A");

        if (colorIndex >= 255) {

          colorIndex = 0;
        }
        else {

          colorIndex +=20;
        }
      }

      eraser = false;
    }//Change size of brush
    else if (mouseX > 90 && mouseX < 140 && mouseY > 20 && mouseY < 70) {

      println("B");
      if (sizeIndex >= 30) {

        sizeIndex = 1;
      }
      else {

        sizeIndex += 2;
      }
    }
    else if (mouseX > 160 && mouseX < 210 && mouseY > 20 && mouseY < 70) {

      eraser = true;
    }
  }
}

//Controls the ink bleed effect
void lineBleed() {

  int rotationIndex = historyIndex + 1;

  if (rotationIndex > 50) {

    rotationIndex = 1;
  }

  for (int x = 1; x <= 50; x++) {



    if (lineHistory[rotationIndex][7] > 0) { 

      //draws the expanding lines
      lineHistory[rotationIndex][6] += bleedDistance;  
      strokeWeight(lineHistory[rotationIndex][6]);
      stroke(lineHistory[rotationIndex][5], 255, 255);
      line(lineHistory[rotationIndex][1], lineHistory[rotationIndex][2], lineHistory[rotationIndex][3], lineHistory[rotationIndex][4]);
      //Keeps track of ammount of bleed (or the ammount of times the line segment strokeWeight is increased)
      lineHistory[rotationIndex][7]--;
      
    }

    if (rotationIndex == 50) {

      rotationIndex = 1;
    }
    else {

      rotationIndex++;
    }
  }
}


