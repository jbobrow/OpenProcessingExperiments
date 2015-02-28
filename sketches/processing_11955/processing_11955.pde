
/*
  Pattern 1 : Junk Dumping
 Using random() to dump lots of junk on the screen
 */

/*
 Exercises: Create interactive controls
 Use the mouseX position to set the colorVariationRange variable each time you redraw the pattern
 Use mouseY position to adjust min AND max size in some way on each redraw.
 (hint, this will require some simple arithmetic based on mouseY)
 */

int numberOfObjects = 30;
int minSize = 10;
int maxSize = 100;

int colorVariationRange = 50;

void setup() {
  size(640, 480);
  colorMode(HSB, 360, 255, 255); 
  stroke(0, 0); //this is a completely transparent black stroke
  rectMode(CORNER);
  ellipseMode(CENTER);

  drawPattern();
//  drawEllipse();
}


/*
Each time we use this command, drawPattern(),
 we calculate new random values for all the colors and positions.
 Since we do not store them in variables for later use, there's no
 way to recreate or modify the drawing once it's done.
 */

void drawPattern() {
  //clear the window
  background(53, 10, 200);

  float randomBaseHue = random(312, 360);
  float randomBaseSat = random(colorVariationRange, 255);
  float randomBaseBri = random(100, 255);
  float randomBaseHue2 = random(102, 271);
  float randomBaseSat2 = random(colorVariationRange, 255);
  float randomBaseBri2 = random(100, 255);

  //loop once for each "object" we will draw
  for (int i=0; i < numberOfObjects; i = i + 1) {
    //set the fill color to a random value based on the constraints we've set up
    fill(randomBaseHue,
    random(randomBaseSat + colorVariationRange),
    random(randomBaseBri + colorVariationRange));

    //chose a random size
    float randomSize = random(minSize, maxSize);

    //draw one rectangle based on the random things we've calculated
    noStroke();
    rect(random(mouseX, mouseY + 100), 
    random(randomSize / 2, height - (randomSize/2)), 
    random(randomSize + 50), random(100 - randomSize));
    
//    noFill();
//    stroke(random(randomBaseHue), random(randomBaseSat), random(randomBaseBri));
//    strokeWeight(random(0, 10));
    rect(random(randomSize/2, width - (randomSize/2)), 
    random(mouseX, mouseY + 10), random(0, 200), random(0, 200));
    
    //change fill color for ellipses.
    noStroke();
    fill(randomBaseHue2,randomBaseSat2, random(randomBaseBri2 + colorVariationRange));
    
    //draw one ellipse.
    ellipse(random(0, 200), random(0, 480), 
    random(0, maxSize), random(0, 50));
    
    //draw second ellipse.
    ellipse(random(300, 640), random(0, 480),
    random(100, 275), random(10, 250));
    
  }
}


void draw() {
  //we're not updating on a frame-by-frame basis.
  //so there's nothing to do here.
  //we did all of our drawing in setup(). 
}

void keyPressed() {
  if (key == ' ') {
    drawPattern();
  } 
}

