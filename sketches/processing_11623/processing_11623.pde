
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

int numberOfObjects = 350;
int interactionDistance = 2; //distance in pixels between two object to interact

int objectMinSize = 2;
int objectMaxSize = 30;
int maxSpeed = 6;
void setup() {
  size(400, 400);
  size(screen.width * 9/10, screen.height * 9/10);
  smooth();
  colorMode(HSB);
  background(200,50,80);

  //draw s from the center
  rectMode(LEFT);

  createColorPalette();

  createObjectStorage();
  //randomizeObjectPositions();
  //randomizeObjectMovements();
  setupObjectStyles();
  setupObjectColors();

}



void draw() {
  background(color(255)); 


  updateEachObjectPosition();

  updateEachObjectColors();

  reactToObjectOverlaps();

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
            constrain(brightness(objectFills[i]) - 1, 23, 255));
  }
}



void drawEachObject() {
  for (int i = 0; i < numberOfObjects; i++) {
    stroke(objectStrokes[i]);
    fill(objectFills[i]);

    if (objectStyles[i] == -1) {
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

        objectWidths[i] = constrain(objectWidths[i] + 2, objectMinSize, objectMaxSize);
        objectHeights[i] = constrain(objectWidths[i] + 2, objectMinSize, objectMaxSize);
        objectWidths[j] = constrain(objectWidths[j] - 2, objectMinSize, objectMaxSize);      
        objectHeights[j] = constrain(objectWidths[j] - 2, objectMinSize, objectMaxSize);

        objectFills[i] = colorPalette[1];
        objectFills[j] = colorPalette[3];
      }
    } 
  }
}





void perturbEachObjectMotion() {
  
  //go through all the objects:
  for (int i=0; i < numberOfObjects; i++) {    
     //add some randomness to either the x or y movement
     //also, make sure no object moves too fast.
     float perturbRange = objectWidths[i] / 20.0;
     if (random(20) > 2) {
       objectXMovements[i] = constrain(objectXMovements[i] + random(-perturbRange, perturbRange), -maxSpeed, maxSpeed);
     } else {
       objectYMovements[i] = constrain(objectYMovements[i] + random(-perturbRange, perturbRange), -maxSpeed, maxSpeed);
     }
     
  }
  
}




