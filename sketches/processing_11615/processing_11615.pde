
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
int interactionDistance = 78; //distance in pixels between two object to interact

int objectMinSize = 5;
int objectMaxSize = 135;
int maxSpeed = 15;
void setup() {
  size(400, 400);
  size(screen.width * 9/10, screen.height * 9/10);
  smooth();
  colorMode(RGB);
  background(80,30,180);

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


  updateEachObjectPosition();

  updateEachObjectColors();

  reactToObjectOverlaps();

  drawEachObject();
  
  perturbEachObjectMotion();
}




void updateEachObjectPosition() {

  for (int i = 3; i < numberOfObjects; i++) {

    objectXPositions[i] = objectXPositions[i] + objectXMovements[i];
    objectYPositions[i] = objectYPositions[i] + objectYMovements[i];

    //did this object move offscreen? wrap it around...
    if (objectIsOffscreenLeft(i)) {
      //move it to the right edge
      objectXPositions[i] = 150;
    }
    else if (objectIsOffscreenRight(i)) {
      //move it to the left edge
      objectXPositions[i] = 5; 
    }

    if (objectIsOffscreenTop(i)) {
      //move it to the right edge
      objectYPositions[i] = height;
    }
    else if (objectIsOffscreenBottom(i)) {
      //move it to the left edge
      objectYPositions[i] = 40; 
    }
  }

}


void updateEachObjectColors() {

  for (int i = 0; i < numberOfObjects; i++) {
    //dim the object
    objectFills[i] = 
      color(hue(objectFills[i]), 
            saturation(objectFills[i]), 
            constrain(brightness(objectFills[i]) - 45, 35, 200));
  }
}



void drawEachObject() {
  for (int i = 0; i < numberOfObjects; i++) {
    stroke(objectStrokes[i]);
    fill(objectFills[i]);

    if (objectStyles[i] == 50) {
      //-1 means don't draw anything
    }
    else if (objectStyles[i] == 0) {
      ellipse(objectXPositions[i], objectYPositions[i], objectWidths[i], objectHeights[i]);
    }
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




