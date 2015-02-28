
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

int numberOfObjects = 400;
int minSize = 30;
int maxSize = 50;

//changes the how much or how little the ellipses vary in a common color
int colorVariationRange = 120;

void setup() {
  size(800, 680);
  colorMode(RGB); 
  stroke(0, 0); //this is a completely transparent black stroke
  rectMode(CENTER);

  drawPattern();
}


/*
Each time we use this command, drawPattern(),
 we calculate new random values for all the colors and positions.
 Since we do not store them in variables for later use, there's no
 way to recreate or modify the drawing once it's done.
 */

void drawPattern() {
  //clear the window
  background(200);

  float randomBaseHue = random(0, 255 - colorVariationRange);
  float randomBaseSat = random(0, 255 - colorVariationRange);
  float randomBaseBri = random(0, 255 - colorVariationRange);

  //loop once for each "object" we will draw
  for (int i=0; i < numberOfObjects; i = i + 1) {
    //set the fill color to a random value based on the constraints we've set up
    fill(random(randomBaseHue, randomBaseHue + colorVariationRange),
    random(randomBaseSat, randomBaseSat + colorVariationRange),
    random(randomBaseBri, randomBaseBri + colorVariationRange));

    //chose a random size
    float randomSize = floor(map( mouseY, 24, height, 0, 120));

    //draw one ellipse based on the random things we've calculated
    rect (random(randomSize / 2, width - (randomSize/2)), 
    random(randomSize / 2, height - (randomSize/2)), 
    randomSize, randomSize);
  }
}

void mouseMoved() {
  colorVariationRange = floor(map( mouseX, 0, width, 0, 40));
  
 // drawGrid();
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


