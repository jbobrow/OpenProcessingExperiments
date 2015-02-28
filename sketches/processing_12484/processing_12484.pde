
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

int numberOfObjects = 2;
int minSize = 70;
int maxSize = 300;


int colorVariationRange = 80;

void setup() {
  size(640, 480);
  colorMode(HSB); 
  stroke(0, 0, 0); //this is a completely transparent black stroke
  strokeWeight(10);
 
  smooth();

  drawPattern();
  drawPattern2();
}


/*
Each time we use this command, drawPattern(),
 we calculate new random values for all the colors and positions.
 Since we do not store them in variables for later use, there's no
 way to recreate or modify the drawing once it's done.
 */

void drawPattern() {
  //clear the window
  background(240);

  float randomBaseHue = random(250,230);
  float randomBaseSat = random(255);
  float randomBaseBri = random( 255 );

  //loop once for each "object" we will draw
  for (int i=0; i < numberOfObjects; i = i + 1) {
    //set the fill color to a random value based on the constraints we've set up
     
    fill(random(randomBaseHue, randomBaseHue + colorVariationRange),
    random(randomBaseSat, randomBaseSat + colorVariationRange),
    random(randomBaseBri, randomBaseBri + colorVariationRange));
     
    //chose a random size
    float randomSize = random(minSize, maxSize);

    //draw one ellipse based on the random things we've calculated
   rect(random(randomSize / 2, width - (randomSize/2)), 
    random(randomSize / 2, height - (randomSize/2)), 
    randomSize, randomSize);
      
  }
}

void drawPattern2() {

  float randomBaseHue1 = random(0, 5);
  float randomBaseSat1 = random(255);
  float randomBaseBri1 = random(255);

  for (int j=0; j < numberOfObjects; j = j + 1) {
    //set the fill color to a random value based on the constraints we've set up
     
    fill(random(randomBaseHue1, randomBaseHue1 + colorVariationRange),
    random(randomBaseSat1, randomBaseSat1 + colorVariationRange),
    random(randomBaseBri1, randomBaseBri1 + colorVariationRange));
     
    //chose a random size
    float randomSize = random(minSize, maxSize);

    //draw one ellipse based on the random things we've calculated
   rect(random(randomSize / 2, width - (randomSize/2)), 
    random(randomSize / 2, height - (randomSize/2)), 
    randomSize, randomSize);
      
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
    drawPattern2();
  } 
}


