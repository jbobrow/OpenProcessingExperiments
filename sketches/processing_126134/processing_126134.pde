
//Mondrian Painting Generator
//Joel Schad
//schadjo <at> gmail <dot> com

//ratio of minimum divider line to minimum cell width:
// 4:3

//ratio of divider line to painting width
// 3:130 ~= 0.023
//float divWidth = 0.023;
float divWidth = 0.02;

//#E5BC04;  //Mondrian yellow
//monRed =  #B61E03;     //Mondrian red
//int monBlue = #4678A5;    //Mondrian blue
int[] monColor = new int[3];
int debounceTime = 100;
int lastTime = 0;
boolean runFlag = true;

//1.777777 for 16:9
//1.333333 for 4:3
//1        for square
float aspectRatio = 1;//.7777777777;
int wX = 600;
int wY = floor(wX / aspectRatio);

//the more gapVal, the more breaks in the dividing lines
float gapVal = 0.5;

void setup() {
  monColor[0] = #E5BC04;
  monColor[1] = #B61E03;
  monColor[2] = #4678A5;

  noSmooth();

  size(wX, wY);
  background(255);
  fill(0);

  drawCells();
}

void draw() {
  if (keyPressed & (millis() - lastTime > debounceTime)) {
    if (key == 'r') {
      background(255);
      drawCells();
    }
    else if (key == 's') {
      saveFrame();
    }
    
    lastTime = millis();

    
  }
}



void drawCells() {
  int numCols = floor(random(3, 9));
  int numRows = floor(random(3, 9));

  float[] divXcoord = new float[numCols];
  float[] divYcoord = new float[numRows];

  divXcoord[0] = 0;
  divYcoord[0] = 0;

  float colWidth = wX / numCols; //
  float rowWidth = wY / numRows; //

  //generate column x-values
  for (int i = 1; i < numCols; i++) {
    divXcoord[i] = colWidth * (random(divWidth, 1 - divWidth) + i);
  }  

  //generate row y-values
  for (int i = 0; i < numRows; i++) {
    divYcoord[i] = rowWidth * (random(divWidth, 1 - divWidth) + i);
  }

  println("Array sizes: " + divXcoord.length + ", " + divYcoord.length); 

  //print colored rectangles
  for (int i = 0; i < numCols - 1; i++) {
    for (int j = 0; j < numRows - 1; j++) {
      if (random(1) < 0.13) {
        fill(monColor[floor(random(3))]);
        noStroke();
        rect(divXcoord[i], divYcoord[j], divXcoord[i+1] - divXcoord[i], divYcoord[j+1] - divYcoord[j]);
      }
    }
  }

  fill(0);

  //print bounding lines
  for (int i = 0; i < numCols; i++) {
    for (int j = 0; j < numRows; j++) {

      println(divXcoord[i] + ", " + divYcoord[j]);

      //draw squares at intersection points
      if (j == 0) {
        if (i != 0) {
          rect(divXcoord[i] - wX * divWidth / 2, 0, wX * divWidth, divYcoord[1]);
        }
      }

      //draw line down
      if (i != 0) {
        rect(divXcoord[i] - wX * divWidth / 2, divYcoord[j] - wY * divWidth/2, wX * divWidth, wX * divWidth);

        if (j < numRows) {
          rect(divXcoord[i] - divWidth * wX / 2, divYcoord[j], wX * divWidth, wY - divYcoord[j]);
        }
        else {
          rect(divXcoord[i] - divWidth * wX / 2, divYcoord[j], wX * divWidth, divYcoord[j+1] - divYcoord[j]);
        }
      }

      //draw line across
      if (random(1) < gapVal) {
        if (i == 0) {
          rect(divXcoord[i], divYcoord[j] - divWidth * wX / 2, divXcoord[i + 1], wX * divWidth);
        }
        else if (i == numCols - 1) {
          rect(divXcoord[i], divYcoord[j] - divWidth * wX / 2, wX - divXcoord[i], wX * divWidth);
        }
        else {// if (i > 0 & i < numCols) {
          rect(divXcoord[i], divYcoord[j] - divWidth * wX / 2, divXcoord[i+1] - divXcoord[i], wX * divWidth);
        }
      }
    }
  }
}


