
// Created by Jasmine Li and Nathaniel Saslafsky
// Arch 6509 Beyond Measurement: Generative Modeling in Architecture and Urbanism
// Department of Architecture, AAP, Cornell University

// Skateboard City
// SCENARIO 1:
// SHORTCUT

//CITY GRID.

//Set range for the number of blocks.
int xMin = 10; //Input here.
int xMax = 10;
int yMin = 5;
int yMax = 20;

//Determines the number of blocks.
int nX = xMax;
int nY = yMax;

//Determines randomly the number of blocks.
//int nX = int(random(xMin, xMax));
//int nY = int(random(yMin, yMax));

//Determines block and street dimensions.
int blockX = 60; //Input here.
int blockY = 20;
int street = 6;

//Determines the position of the first block.
int posX = street;
int posY = street;

//Determines output size.
int sizeX = ((blockX + street) * xMax) + street;
int sizeY = ((blockY + street) * yMax) + street;

void setup() {

  //  size(sizeX, sizeY);
  size(666, 526);
  frameRate(4);
  background(255);
  noLoop();
}

//Determines the duration of program.
int count = 0;
int time = 80; //Input here.

//Suggested time range:
//short: 10
//medium: 40
//long: 80

void draw() {

  if (count < 1) {

    //Draws the city grid.
    for (int countX = 0; countX < nX; countX ++) {

      for (int countY = 0; countY < nY; countY ++) {

        stroke(200);
        fill(200);
        strokeWeight(0);
        rectMode(CORNER);
        rect(posX, posY, blockX, blockY);

        posY +=(blockY + street);
      }

      posX += (blockX + street);
      posY = street;
    }

    posX = street;
  }

  else if (count == time) {

    //Re-sets the city grid.
    noStroke();
    fill(255);
    rectMode(CORNER);
    rect(0, 0, sizeX, sizeY);

    count = -1;
    loop();
  }

  count++;
}

void mousePressed() {

  if (mouseButton == LEFT) {

    smooth();
    stroke(255, 255, 255, 180);
    strokeWeight(street);
    noFill();

    beginShape();
    curveVertex(0, 0); // the first control point
    curveVertex(0, 0); // is also the start point of curve
    curveVertex(random(0, 200), random(0, 200));
    curveVertex(random(200, 400), random(200, 400));
    curveVertex(random(400, 600), random(400, 500));
    curveVertex(665, 525); // the last point of curve
    curveVertex(665, 525); // is also the last control point
    endShape();

    loop();
  }
  else if (mouseButton == RIGHT) {

    //Re-set the program.
    count = time;
    loop();
  }
}


