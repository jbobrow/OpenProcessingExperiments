
// David Grant //
/// -- MY EYE MAPPING --///
// I will be writing this out as a tutorial for myself(and others!) to follow, because its simple math like this that I find easy to forget.
// -- NOTES --//
//Images
//PImage bgone;

void setup () {
//Try to stick to round even numbers when learning mapping, it'll help simplify the math.
// I used 500,300 because it fits the canvas of my blog, I started learning with 800,600.
  size(500,300);
  //bgone = loadImage("eyesbg.png");
  
}

void draw() {
  
  background(0);
  //image(bgone,600,400);
  // Size of the Pupil
  /// v --- NONE MOVEMENT --- v ///
  smooth();
  noStroke();
  fill(255);
  // Eyes Left/Right
  // width/height aligns the eyes to the canvas
  ellipse(width/2-100,height/2,100,50);
  ellipse(width/2+100,height/2,100,50);
  //Eye colour left/right
  noStroke();
  //Changes the colour of the eyes depending on mouse location
  fill(mouseX,mouseY,mouseX+mouseY);
  // width/height aligns the eyes to the canvas
  ellipse(width/2-100,height/2,50,50);
  ellipse(width/2+100,height/2,50,50);
  /// ^ --- NONE MOVEMENT --- ^ ///
  
  // v --- MY GUIDE TO MAPPING --- v ///
  
  float pupilRadius = 20;
  fill(0);
  noStroke();
  // The below two lines set the pupil to sit in the center of the eyeball by default. The width and the height
  // of the canvas is divded by two to get the center value of your canvas, then we nudge the pupils in to place by
  // adding (+) or subtracting (-) to the pupils value to position it.
  float defaultLeftPupilPosX = (width / 2) +100 ;
  float defaultLeftPupilPosY = (height / 2);
  
   // MAPPING
  // map() is just math, once I got my head around it, it was easy. Here's what it does:
  // I am using it here to map a big value (canvas) to a smaller value (eyeball), that's how the pupil becomes constrained to the
  // eyeball. So I'm saying that if mouseX is 0, it's at the far left side of the eyeball, and
  // if mouseX is at the far right of the canvas (500), then the pupil is at the far right side
  // of the eyeball. The same methodology is used for the vertical axis (Y) as well.
  
  
  float mappedLeftPupilPosX = map(mouseX, 0, width, defaultLeftPupilPosX - 15, defaultLeftPupilPosX + 15);
  float mappedLeftPupilPosY = map(mouseY, 0, width, defaultLeftPupilPosY - 15, defaultLeftPupilPosY + 30);
  // Now lets draw the pupil using our mapped position values
  ellipse(mappedLeftPupilPosX, mappedLeftPupilPosY, pupilRadius, pupilRadius);

  // Now that is it done with the left pupil, I now repeated the same process with the right.
  // Notice how the width/2) is set to -100; that is what determines the distance between the eyes.
  float defaultRightPupilPosX = (width / 2) - 100;
  float defaultRightPupilPosY = (height / 2);
  // Mapping
  float mappedRightPupilPosX = map(mouseX, 0, width, defaultRightPupilPosX - 15, defaultRightPupilPosX + 15);
  float mappedRightPupilPosY = map(mouseY, 0, width, defaultRightPupilPosY - 15, defaultRightPupilPosY + 30);
  
  
  ellipse(mappedRightPupilPosX, mappedLeftPupilPosY, pupilRadius,pupilRadius);
  
}
