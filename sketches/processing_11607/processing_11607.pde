
int blueValue=0;
//boolean increasing=true

float[] objectXPositions;
float[] objectYPositions;
float[] objectXMovements;
float[] objectYMovements;
int[] objectStyles;
color[] objectStrokes;
color[] objectFills;
float[] objectWidths;
float[] objectHeights;

int colorPaletteSize = 4;
color[] colorPalette;

int numberOfObjects = 13;
int interactionDistance = 50; //distance in pixels between two object to interact

int objectMinSize = 5;
int objectMaxSize = 50;
int maxSpeed = 3;
void setup() {
  size(400, 400);
  size(screen.width * 9/10, screen.height * 9/10);
  smooth();
  colorMode(RGB);
  background(73,40,5);

  //draw ellipses from the center
  ellipseMode(CENTER);

  createColorPalette();

  createObjectStorage();
  randomizeObjectPositions();
  randomizeObjectMovements();
  setupObjectStyles();
  setupObjectColors();

}



void draw() {
  //background(color(255)); 
  noStroke();

  //background(74,40,5,1);
  //WHY DOES THIS DO THE SAME THING NO MATTER WHAT THE OPACITY?
  noStroke();
  fill(160,120,25,2);
  rect(0,0, width, height);
  
  
  
 /* for(int blueValue=0; blueValue<255; blueValue++){
    fill(30,200,blueValue,75);
    ellipse(blueValue*8, 100, 5, 5);
  }
  */
  
  updateEachObjectPosition();

  updateEachObjectColors();

  reactToObjectOverlaps();

  fill(30,200,blueValue, 75);
    blueValue++;
    
  drawEachObject();
  
  perturbEachObjectMotion();
  
  

}




void updateEachObjectPosition() {

  for (int i = 0; i < numberOfObjects; i++) {

    objectXPositions[i] = objectXPositions[i] + objectXMovements[i];
    objectYPositions[i] = objectYPositions[i] + objectYMovements[i];

    //did this object move offscreen? wrap it around...
    if (objectIsOffscreenLeft(i)) {
      //move it to the right edge
      objectXPositions[i] = width;
    }
    else if (objectIsOffscreenRight(i)) {
      //move it to the left edge
      objectXPositions[i] = 0; 
    }

    if (objectIsOffscreenTop(i)) {
      //move it to the right edge
      objectYPositions[i] = height;
    }
    else if (objectIsOffscreenBottom(i)) {
      //move it to the left edge
      objectYPositions[i] = 0; 
    }
  }

}


void updateEachObjectColors() {

  for (int i = 0; i < numberOfObjects; i++) {
    //dim the object
    objectFills[i] = 
      color(hue(objectFills[i]), 
            saturation(objectFills[i]), 
            constrain(brightness(objectFills[i]) - 1, 0, 255));
    //  color(red(myColor),green(myColor),blue(myColor));
  }
}



void drawEachObject() {
  for (int i = 0; i < numberOfObjects; i++) {
    stroke(objectStrokes[i]);
    
   /* for(int blueValue=0; blueValue<255; blueValue++){
      fill(30,200,blueValue,75);
      //print("test");
    }*/
    
    //fill(objectFills[i]);
  

    if (objectStyles[i] == -1) {
      //-1 means don't draw anything
    }
    else if (objectStyles[i] == 0) {
      bezier(objectXPositions[i], objectYPositions[i], objectWidths[i], objectHeights[i], 50,50,50,50);
    }
     stroke(objectStrokes[i]);
    
  }
}




void reactToObjectOverlaps() {
  for (int i=0; i < numberOfObjects; i++) {
    for (int j=i; j < numberOfObjects; j++) {
      float howFarApartAreThey = objectXPositions[i] - objectXPositions[j];
      if (abs(howFarApartAreThey) < interactionDistance) {

        objectWidths[i] = constrain(objectWidths[i] + 1, objectMinSize, objectMaxSize);
        objectHeights[i] = constrain(objectWidths[i] + 1, objectMinSize, objectMaxSize);
        objectWidths[j] = constrain(objectWidths[j] - 1, objectMinSize, objectMaxSize);      
        objectHeights[j] = constrain(objectWidths[j] - 1, objectMinSize, objectMaxSize);

        objectFills[i] = colorPalette[2];
        objectFills[j] = colorPalette[2];
      }
    } 
  }
}





void perturbEachObjectMotion() {
  
  //go through all the objects:
  for (int i=0; i < numberOfObjects; i++) {    
     //add some randomness to either the x or y movement
     //also, make sure no object moves too fast.
     float perturbRange = objectWidths[i] / 40.0;
     if (random(10) > 5) {
       objectXMovements[i] = constrain(objectXMovements[i] + random(-perturbRange, perturbRange), -maxSpeed, maxSpeed);
     } else {
       objectYMovements[i] = constrain(objectYMovements[i] + random(-perturbRange, perturbRange), -maxSpeed, maxSpeed);
     }
     
  }
  
}

void mouseClicked(){
  fill(73,40,5,100);
  rect(0,0,width, height);
}


