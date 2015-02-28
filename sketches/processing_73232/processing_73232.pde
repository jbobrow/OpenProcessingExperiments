
//////////////////////////////////////////////////////////////////////
///                   The Method of Functionality                  ///
///      Using Methods to Create an Attractive Image Display       ///
///                      By: Christian Carter                      ///
///                         3 October 2012                         ///
//////////////////////////////////////////////////////////////////////

//Stores time since last cycle in loop
int numberOfCycles = 0;

//The tint value for gradient over non-selected small images
//Darker or lighter tints may be applied based on personal preference
final int TINT_VALUE = 150;

//Threshold fr time between cycles
final float SECONDS_UNTIL_IMAGE_CYCLE = 5;

//Initial time
float timeOfLastCycle = 0;

//Placeholder for Large Image
PImage largeImage;

//Holders for all images
PImage index, image1, image2, image3, image4, image5, image6, image7, 
indexS, image1S, image2S, image3S, image4S, image5S, image6S, image7S;

//Switch for cycle activity
boolean stopCycle = false;

//Setup for main window
void setup() {

  background(0);
  size(700, 700);
  rectMode(CENTER);
  stroke(255);
  strokeWeight(5);
  rect(width/2, height/2 - 50, 575, 575);
  ImageLoad();
  ImagePlacement();
  GridLayout();
  largeImage = index;
  
}

//Runs different functions at specified framerate
void draw() {
  
  CycleLargeImage();
  CursorOverImage();
  CursorChange();
  GridLayout();
  
}

//Draws initial grid infront of all images
void GridLayout() {

  strokeWeight(3);
  fill(0);
  stroke(0);

  for (int i = 0; i <= width; i += 100) {    
    line(i, 600, i, height);
  }
  for (int i = 600; i <= height; i += 100) {    
    line(0, i, width, i);
  }
}

//Loads all images from data folder
void ImageLoad() {

  index   = loadImage("index.jpg");
  image1  = loadImage("image1.jpg");
  image2  = loadImage("image2.jpg");
  image3  = loadImage("image3.jpg");
  image4  = loadImage("image4.jpg");
  image5  = loadImage("image5.jpg");
  image6  = loadImage("image6.jpg");
  image7  = loadImage("image7.jpg");
  indexS  = loadImage("indexS.jpg");
  image1S = loadImage("image1S.jpg");
  image2S = loadImage("image2S.jpg");
  image3S = loadImage("image3S.jpg");
  image4S = loadImage("image4S.jpg");
  image5S = loadImage("image5S.jpg");
  image6S = loadImage("image6S.jpg");
  image7S = loadImage("image7S.jpg");
  
}

//Places images in respective spots in grid
//Images can be rearranged by changing the first 
//value in each image() function
void ImagePlacement() {

  imageMode(CENTER);
  image(index, width/2, height/2 - 50, 575, 575);
  image(image1S, 50, 650, 100, 100);
  image(image2S, 150, 650, 100, 100);
  image(image3S, 250, 650, 100, 100);
  image(image4S, 350, 650, 100, 100);
  image(image5S, 450, 650, 100, 100);
  image(image6S, 550, 650, 100, 100);
  image(image7S, 650, 650, 100, 100);
  
}

//Detects if cursor is located over a small image at bottom of screen
//If cursor is located over a small image, the small images looses tint
//If the image is currently selected, the tint is also removed from the
///respective small image
void CursorOverImage() {

  int x = mouseX;
  int y = mouseY;
  
  if (x >= 0 && x <= 100 && y >= 600 && y <= 700) {
    tint(TINT_VALUE);
    image(image2S, 150, 650, 100, 100);
    image(image3S, 250, 650, 100, 100);
    image(image4S, 350, 650, 100, 100);
    image(image5S, 450, 650, 100, 100);
    image(image6S, 550, 650, 100, 100);
    image(image7S, 650, 650, 100, 100);
    noTint();
    image(image1S, 50, 650, 100, 100);
  }
  else if (x >= 101 && x <= 200 && y >= 600 && y <= 700) {
    tint(TINT_VALUE);
    image(image1S, 50, 650, 100, 100);
    image(image3S, 250, 650, 100, 100);
    image(image4S, 350, 650, 100, 100);
    image(image5S, 450, 650, 100, 100);
    image(image6S, 550, 650, 100, 100);
    image(image7S, 650, 650, 100, 100);
    noTint();
    image(image2S, 150, 650, 100, 100);
  }
  else if (x >= 201 && x <= 300 && y >= 600 && y <= 700) {
    tint(TINT_VALUE);
    image(image1S, 50, 650, 100, 100);
    image(image2S, 150, 650, 100, 100);
    image(image4S, 350, 650, 100, 100);
    image(image5S, 450, 650, 100, 100);
    image(image6S, 550, 650, 100, 100);
    image(image7S, 650, 650, 100, 100);
    noTint();
    image(image3S, 250, 650, 100, 100);
  }
  else if (x >= 301 && x <= 400 && y >= 600 && y <= 700) {
    tint(TINT_VALUE);
    image(image1S, 50, 650, 100, 100);
    image(image2S, 150, 650, 100, 100);
    image(image3S, 250, 650, 100, 100);
    image(image5S, 450, 650, 100, 100);
    image(image6S, 550, 650, 100, 100);
    image(image7S, 650, 650, 100, 100);
    noTint();
    image(image4S, 350, 650, 100, 100);
  }
  else if (x >= 401 && x <= 500 && y >= 600 && y <= 700) {
    tint(TINT_VALUE);
    image(image1S, 50, 650, 100, 100);
    image(image2S, 150, 650, 100, 100);
    image(image3S, 250, 650, 100, 100);
    image(image4S, 350, 650, 100, 100);
    image(image6S, 550, 650, 100, 100);
    image(image7S, 650, 650, 100, 100);
    noTint();
    image(image5S, 450, 650, 100, 100);
  }
  else if (x >= 501 && x <= 600 && y >= 600 && y <= 700) {
    tint(TINT_VALUE);
    image(image1S, 50, 650, 100, 100);
    image(image2S, 150, 650, 100, 100);
    image(image3S, 250, 650, 100, 100);
    image(image4S, 350, 650, 100, 100);
    image(image5S, 450, 650, 100, 100);
    image(image7S, 650, 650, 100, 100);
    noTint();
    image(image6S, 550, 650, 100, 100);
  }
  else if (x >= 601 && x <= 700 && y >= 600 && y <= 700) {
    tint(TINT_VALUE);
    image(image1S, 50, 650, 100, 100);
    image(image2S, 150, 650, 100, 100);
    image(image3S, 250, 650, 100, 100);
    image(image4S, 350, 650, 100, 100);
    image(image5S, 450, 650, 100, 100);
    image(image6S, 550, 650, 100, 100);
    noTint();
    image(image7S, 650, 650, 100, 100);
  }
  else {
    tint(TINT_VALUE);
    image(image1S, 50, 650, 100, 100);
    image(image2S, 150, 650, 100, 100);
    image(image3S, 250, 650, 100, 100);
    image(image4S, 350, 650, 100, 100);
    image(image5S, 450, 650, 100, 100);
    image(image6S, 550, 650, 100, 100);
    image(image7S, 650, 650, 100, 100);
  }
}

//Commands for cliclking of an image.
//If an image is clicked, the timed cycle restarts
void mouseClicked() {

  noTint();
  int x = mouseX;
  int y = mouseY;
  // Note the time when last cycle occurred
  timeOfLastCycle = millis()/1000;

  if (y >= 600) { // User clicked an image
    if (x >= 0 && x <= 100) { 
      image(image1, width/2, height/2 - 50, 575, 575);
      numberOfCycles = 1;
    }    
    else if (x >= 101 && x <= 200 ) {
      image(image2, width/2, height/2 - 50, 575, 575);
      numberOfCycles = 2;
    }
    else if (x >= 201 && x <= 300 ) {
      image(image3, width/2, height/2 - 50, 575, 575);
      numberOfCycles = 3;
    }
    else if (x >= 301 && x <= 400 ) {
      image(image4, width/2, height/2 - 50, 575, 575);
      numberOfCycles = 4;
    }
    else if (x >= 401 && x <= 500) {
      image(image5, width/2, height/2 - 50, 575, 575);
      numberOfCycles = 5;
    }
    else if (x >= 501 && x <= 600 ) {
      image(image6, width/2, height/2 - 50, 575, 575);
      numberOfCycles = 6;
    }
    else if (x >= 601 && x <= 700) {
      image(image7, width/2, height/2 - 50, 575, 575);
      numberOfCycles = 7;
    }
  }
  else 
    image(index, width/2, height/2 - 50, 575, 575);
    NumberOfCycles();
}

//Restarts cycle if necessary
int NumberOfCycles() {

  if (numberOfCycles > 7) {
    numberOfCycles = 0;
    return numberOfCycles;
  }
  else
    return numberOfCycles++;
}


//Method in control of cycling images
//Cycle time dependent on time since start of program
//Images default cycle index - image7
void CycleLargeImage() {

  noTint();

  if (millis()/1000.0 - timeOfLastCycle < SECONDS_UNTIL_IMAGE_CYCLE)
    largeImage = largeImage;
  else if(stopCycle == false) {
    if (numberOfCycles == 0) {
      largeImage = index;
    }
    else if (numberOfCycles == 1) {
      largeImage = image1;
    }
    else if (numberOfCycles == 2) {
      largeImage = image2;
    }
    else if (numberOfCycles == 3) {
      largeImage = image3;
    }
    else if (numberOfCycles == 4) {
      largeImage = image4;
    }
    else if (numberOfCycles == 5) {
      largeImage = image5;
    }
    else if (numberOfCycles == 6) {
      largeImage = image6;
    }
    else if (numberOfCycles == 7) {
      largeImage = image7;
    }
    else {
      largeImage = index;
      numberOfCycles = 0;
    }

    image(largeImage, width/2, height/2 - 50, 575, 575);

    numberOfCycles++;

    // Note the time when last cycle occurred
    timeOfLastCycle = millis()/1000;
  }
}

//Key for boolean switch
void keyPressed() {
  if(key == 's' || key == 'S')
    stopCycle = !stopCycle;
}

//Changes pointer shape depending on position
//Hand is selecting small image
//Arrow if else.
void CursorChange() {

  int x = mouseX;
  int y = mouseY;

  if (y >= 600 && y <= 700)
    cursor(HAND);
  else
    cursor(ARROW);
}


