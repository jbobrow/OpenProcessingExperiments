
/*
 * Creative Coding
 * Week 4, 03 - one pixel cinema
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * Read pixels from an image and draw them in different sizes based on a control pixel
 * Press '2' to view the image
 * Press '1' to return to the pixel camera view
 * Press 'i' to change the image used by the camera
 *
 */

int pixelsPerCirc = 7;
int noOfCircs = 6;
int noOfPixels = pixelsPerCirc * noOfCircs;

float rotationRate = PI/720;

PImage myImg;
int imageToShow = 1;
color[] pixelColors  = new color[noOfPixels];
float[] pixelX = new float[noOfPixels];
float[] pixelY = new float[noOfPixels];
float[] pixelDx = new float[noOfPixels];
float[] pixelDy = new float[noOfPixels];

float[] colourDist = new float[noOfPixels];
int scanLine;  // vertical position

float radius = 80;

float controlX;
float controlY;
float controlDx;
float controlDy;
color controlColour;
color compColour;

boolean drawImage = false;

void setup() {
  size(700, 622);
  
  // set up the image and the pixel cameras
  setImage();
  
  colorMode(HSB, 360, 100, 100); // use HSB colour mode, H=0->360, S=0->100, B=0->100

  smooth(4);
}

void draw() {
  background(0);
  
  if (!drawImage) {
    // read the colour for the control pixel
    controlColour = myImg.get((int)controlX, (int)controlY);
  
    //draw Control circle
    drawCircle(controlColour, 80, width/2, height/2);
    
    //calculate the complementary color
    compColour = getComplementary(controlColour);
    
    // draw outer circles
    drawOuterCircles();  
  }
  else {
    // draw the image
    float imgLocationX = width/2 - myImg.width/2;
    float imgLocationY = height/2 - myImg.height/2;
    image(myImg, imgLocationX, imgLocationY);
  
    // draw circle over control point
    stroke(0, 100, 100);
    noFill();
    ellipse(imgLocationX + controlX, imgLocationY + controlY, 5, 5 );
  
    // draw circles over where the "scanner" is currently reading pixel values
    for (int i=0; i<noOfPixels; i++) {
      stroke(255, 100, 100);
      noFill();
      ellipse(imgLocationX + pixelX[i], imgLocationY + pixelY[i], 5, 5 );
    }
  }

  // calculate new position for all pixels
  moveControl();
  for (int i=0; i< noOfPixels; i++) {
    movePixel(i);
  }
  
  //handle input
  if (keyPressed) {
    switch(key) {
      // pressing 1 or 2 will switch between image and 'camera' views.
      case '1':
        drawImage = false;
        break;
      case '2':
        drawImage = true;
        break;
      case 'i':
      case 'I':
        if (imageToShow == 4) {
          imageToShow = 1;
        }
        else {
          imageToShow++;
        }
        setImage();
        break;
      case 's':
        saveFrame("Frame"+frameCount+".jpg");
        break;
    }
  }
}

/*
* Sets up the correct image and resets the pixel cammeras
*/ 
void setImage() {
  // Set image to show
  switch(imageToShow) {
    case 1:
      myImg = loadImage("colourfulCrayons.jpg");
      break;
    case 2:
      myImg = loadImage("nasaImage.jpg");
      break;  
    case 3:
      myImg = loadImage("turtle.jpg");
      break;
   case 4:
      myImg = loadImage("melbourneCity.jpg");
      break;  
  }
  
  // reset pixel points to be within the image
  controlX = 0;
  controlY = 0;
  controlDx = random(-0.25, 0.25);
  controlDy = random(-0.25, 0.25);
  
  for (int i = 0; i < noOfPixels; i++) {
    pixelX[i] = 0;
    pixelY[i] = 0;
    pixelDx[i] = random(-1, 1);
    pixelDy[i] = random(-1, 1);
  }
}


void drawOuterCircles() {
  float rotation=frameCount*rotationRate;
  float currentRadius=radius;
  float offset = 0;
  
  for (int i=0; i<noOfCircs; i++) {
    for (int j=0; j<pixelsPerCirc; j++) {
      int pixelNo = j + i*pixelsPerCirc;
      // read the colour of the pixel
      pixelColors[pixelNo] = myImg.get((int)pixelX[pixelNo], (int)pixelY[pixelNo]);
      //calculate the colour distance for each pixel
      colourDist[pixelNo] = calcColourDistance(pixelColors[pixelNo]);
      
      // draw the sampled pixels as circles.  Larger circles for those closer to the main or complementary colour
      float circleX = (width/2 + (currentRadius * sin((TWO_PI*j)/pixelsPerCirc + offset + rotation)));
      float circleY = (height/2 + (currentRadius * cos((TWO_PI*j)/pixelsPerCirc + offset + rotation)));
      drawCircle(pixelColors[pixelNo], map(colourDist[pixelNo], 0, 90, 60, 5), circleX, circleY); 
    }
    currentRadius+=50;
    offset += PI/20;
  }
}


/*
* draw a circle with some 'glow'
*/ 
void drawCircle(color circCol, float distance, float xPos, float yPos) {
  noStroke();
  float size = distance;
  fill(circCol, 20);
  ellipse(xPos, yPos, size*1.5, size*1.5);
  ellipse(xPos, yPos, size*1.4, size*1.4);
  ellipse(xPos, yPos, size*1.3, size*1.3);
  fill(circCol, 50);
  ellipse(xPos, yPos, size*1.2, size*1.2);
  fill(circCol, 80);
  ellipse(xPos, yPos, size*1.1, size*1.1);
  fill(circCol);
  ellipse(xPos, yPos, size, size);
}

/*
*Calculate the complementary colour
*/
color getComplementary(color startColour) {
  float startHue = hue(startColour);
  if (startHue >= 180 && startHue < 360) {
    return color(startHue-180, saturation(startColour), brightness(startColour));
  }
  else {
    return color(startHue+180, saturation(startColour), brightness(startColour));
  }
}

/*
* Calculate the difference in the hue of the current colour and the main or complementary colour
*/
float calcColourDistance(color currentColour) {
  float controlDiff = abs(hue(currentColour) - hue(controlColour));
  float compDiff = abs(hue(currentColour) - hue(compColour));
  
  if (controlDiff > 180) {
    controlDiff = 360 - controlDiff;
  }
  if (compDiff > 180) {
    compDiff = 360 - compDiff;
  }
   
  return min(compDiff, controlDiff);
}

// Pixels bounce around within the image
void movePixel(int i) {
  pixelX[i] += pixelDx[i];
  pixelY[i] += pixelDy[i];

  //When the pixel hits the edge of the image, it reverses its direction and changes velocity
  if (pixelX[i] > myImg.width-5) {
    pixelDx[i] = -random(0.5, 1);
  }
  else if (pixelX[i] < 5) {
    pixelDx[i] = random(0.5, 1);
  }

  if (pixelY[i] > myImg.height-5) {
    pixelDy[i] = -random(0.5, 1);
  }
  else if (pixelY[i] < 5) {
    pixelDy[i] = random(0.5, 1);
  }
}

 // The control pixel bounces around within the image
void moveControl() {
  controlX += controlDx;
  controlY += controlDy;

  //When the pixel hits the edge of the image, it reverses its direction and changes velocity
  if (controlX > myImg.width-5) {
    controlDx = -random(0.1, 0.5);
  }
  else if (controlX < 5) {
    controlDx = random(0.1, 0.5);
  }

  if (controlY > myImg.height-5) {
    controlDy = -random(0.1, 0.5);
  }
  else if (controlY < 5) {
    controlDy = random(0.1, 0.5);
  }
}




