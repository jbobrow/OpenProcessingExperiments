
int randWidth;            // variable used for randomizing each rectangle's width
int randHeight;           // variable used for randomizing each rectangle's height
int randStroke;           // variable used for randomizing each rectangle's stroke



// We set the window size to 600x600 and turn the looping off.
void setup() {
  size(600, 600);          // sets the window width and height to 600 pixels
  noLoop();                // stops the draw function after it's being executed once
}

// main function
void draw() {
  drawRect();              // calls out the drawRect function
}


// function fills the window with random sized rectangles
void drawRect() {

  for (int i= 0; i <= 600; i+=randWidth+randStroke) {                      // the for loop keeps on looping until all the rectangle's that have been drawn widths adds up to 600 (user's window width)
    randWidth = int(random(20, 80));                            // randomizing the width of the rectangle
    // randStroke = int(random(3,5));                           // randomizing the width of the stroke around the rectangle
    chooseColor();                                              // calls out function named chooseColor
    for (int j=0; j <= 600; j+= (randHeight+randStroke)) {                   // the foor loop keeps on looping until all the rectangle's that have been drawn heights adds up to  600 (user's window height)
      randHeight = int(random(20, 80));                         // randomizing the height of the rectangle 
      randStroke = int(random(2, 5));                           // randomizing the thickness of the stroke around the rectangle
      chooseColor();                                            // calls out function named chooseColor  
      strokeColor();                                            // calls out function named strokeColor
      strokeWeight(randStroke);                                 // randomizes the thickness of the rectangle's stroke
      rect(i, j, randWidth-randStroke, randHeight-randStroke);  // draws the rectangle (the size of the rectangle (both the height and the width) are being reduced, so that the strokes of
    }                                                           // the rectangles would not overlap)
  }
}

// function randomizes stroke color
void strokeColor() {
  int strokeRand = (int)random(4);                                
  if (strokeRand == 0) {
    stroke(180, 186, 182);                     // dark grey
  } 
  else 
    if (strokeRand == 1) {
    stroke(235, 225, 223);                     //  light grey
  } 
  else
    if (strokeRand == 2) {
      stroke(106, 103, 96);                      // light black
    }
    else stroke(255, 255, 255);                  // white
}


// function randomizes the color of the fill for each rectangle
void chooseColor() {
  int colorRand = (int)random(6);
  if (colorRand == 0) {
    fill(54, 149, 91);    // medium green
  } 
  else 
    if (colorRand == 1) {    // light red
    fill(192, 82, 57);
  } 
  else
    if (colorRand == 2) {    // light black
      fill(51, 32, 52);
    } 
    else
      if (colorRand == 3) {    // light yellow
        fill(229, 214, 91);
      } 
      else
        if (colorRand == 4) {    // dark orange
          fill(200, 147, 55);
        } 
        else
          fill(104, 72, 153);     // violet
}


