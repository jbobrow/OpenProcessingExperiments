
/* @pjs preload="HillWithSmallTree.jpg,HillWithClouds.jpg,LeprechaunLeft.png,PotOfGoldNotGlowing.png,PotOfGoldGlowing.png; */


// The concept for this project is a St. Patrick's Day game.  The object of the game
// is get a leprechaun to reveal the location of his pot of gold by streching
// a rainbow from him to the secret location.


// Background images
PImage treeHill;
PImage cloudHill;
PImage[] backgroundPictures = {treeHill, cloudHill};
final int BACKGROUND_PICTURE_TREE = 0;
final int BACKGROUND_PICTURE_CLOUD = 1;
final int BACKGROUND_PICTURE_COUNT = 2;
int backgroundPictureIndex = BACKGROUND_PICTURE_CLOUD;

// Leprechaun and gold images
PImage leprechaun;
PImage potOfGoldNotGlowing;
PImage potOfGoldGlowing;
PImage[] potsOfGold = {potOfGoldNotGlowing, potOfGoldGlowing};
int potOfGoldIndex = 0;
final int POT_OF_GOLD_COUNT = 2;

// Fonts
PFont fontIntro;
PFont fontInstructions;


// Game state and options
final int PATH_CURVE = 0;
final int PATH_RAY = 1;
int rainbowPath = PATH_CURVE;
boolean continuousFire = false;
boolean showIntroduction = true;
boolean showHelp = false;
boolean playerWon = false;


// Rainbow properties
int rainbowInitialLandingX = 0;
int rainbowInitialLandingY = 0;
float rainbowPowerCharge = 0.0;
final float RAINBOW_INCREMENT = 0.1;
final int RAINBOW_INTENSITY_MAX = 127;
final int RAINBOW_INTENSITY_MIN = 15;

final color[] RAINBOW_COLOR = {#FF0000, #FF7700, #FFFF00, #00FF00, #0000FF, #000077, #330077};
final int RAINBOW_COLOR_COUNT = 7;
final int RAINBOW_STRIPE_THICKNESS = 10;



// Positions of the leprechaun and the pot of gold
int leprechaunX = 0;
int leprechaunY = 0;
final int LEPRECHAUN_WIDTH = 60;
final int LEPRECHAUN_HEIGHT = 150;
int goldX = 0;
int goldY = 0;
final int GOLD_WIDTH = 80;
final int GOLD_HEIGHT = 60;

// Make the leprechaun dance when the game is over
int leprechaunOffsetX = 0;
int leprechaunOffsetY = 0;
float leprechaunRotation = 0;
final int LEPRECHAUN_INCREMENTAL_MOVEMENT = 20;
final float LEPRECHAUN_INCREMENTAL_ROTATION = TWO_PI/32;
final float LEPRECHAUN_ROTATION_MAX = TWO_PI/8.0;


// Radius from the pot of gold within which to consider
// a shot to "hit", as a percentage of the distance between the
// leprechaun's hand and the pot of gold.
final float CLOSE_ENOUGH_TO_POT_OF_GOLD = 0.9;



/**
 * Welcome to Rainbow Gold!
 *
 * Help the leprechaun find his pot of gold.
 * Click and hold to shoot his rainbow beam around the picture.
 * Wait for the beam to reach the cursor to see if the gold is there!
 * The closer you get to it, the wider and brighter the beam will be!
 * 
 *   (press H for additional instructions and options)
 */
void setup()
{
  size(900, 720);
  background(#000000);
  resetGame();
  
  backgroundPictures[0] = loadImage("HillWithSmallTree.jpg");
  backgroundPictures[1] = loadImage("HillWithClouds.jpg");
  fontIntro = loadFont("KristenITC-Regular-36.vlw");
  fontInstructions = loadFont("KristenITC-Regular-24.vlw");
  
  leprechaun = loadImage("LeprechaunLeft.png");
  potOfGoldNotGlowing = loadImage("PotOfGoldNotGlowing.png");
  potOfGoldGlowing = loadImage("PotOfGoldGlowing.png");
  potsOfGold[0] = potOfGoldNotGlowing;
  potsOfGold[1] = potOfGoldGlowing;
  
  text("",0,0);
  showIntroduction = true;
}


/**
 * Draw the gameboard.
 */
void draw()
{
  background(#000000);
  
  drawBackgroundPicture();
  drawImage(leprechaun, leprechaunX + leprechaunOffsetX, leprechaunY + leprechaunOffsetY, LEPRECHAUN_HEIGHT, leprechaunRotation);

  if (playerWon)
  {
    // Draw the rainbow in the background, even with the pot of gold
    float rainbowStartX = goldX + GOLD_WIDTH/2.0;
    float rainbowStartY = goldY + GOLD_HEIGHT/2.0;
    float rainbowEndX = leprechaunX+LEPRECHAUN_WIDTH/16.0;
    float rainbowEndY = rainbowStartY;
    drawRainbow(PATH_CURVE, rainbowStartX, rainbowStartY, rainbowEndX, rainbowEndY, 1.0, 1.0);

    drawImage(leprechaun, leprechaunX + leprechaunOffsetX, leprechaunY + leprechaunOffsetY, LEPRECHAUN_HEIGHT, leprechaunRotation);
    drawImage(potsOfGold[potOfGoldIndex], goldX, goldY, GOLD_HEIGHT, 0.0);

    // Increment settings to animate the leprechaun and make the pot of gold blink.
    leprechaunOffsetX += int(random(-LEPRECHAUN_INCREMENTAL_MOVEMENT, LEPRECHAUN_INCREMENTAL_MOVEMENT));
    leprechaunOffsetX = max(-leprechaunX, min(leprechaunOffsetX, 0));
    leprechaunOffsetY += int(random(-LEPRECHAUN_INCREMENTAL_MOVEMENT, LEPRECHAUN_INCREMENTAL_MOVEMENT));
    leprechaunOffsetY = max(-leprechaunY, min(leprechaunOffsetY, 0));
    leprechaunRotation += random(-LEPRECHAUN_INCREMENTAL_ROTATION, LEPRECHAUN_INCREMENTAL_ROTATION);
    leprechaunRotation = max(min(leprechaunRotation, LEPRECHAUN_ROTATION_MAX), -LEPRECHAUN_ROTATION_MAX);
    potOfGoldIndex = (potOfGoldIndex + 1) % POT_OF_GOLD_COUNT;
  }
  else if (mousePressed)
  {
    
    if (continuousFire)
    {
      // If the beam is continuous-fire, but has moved far enough from the initial point, reset the power level.
      final float BEAM_RESET_DISTANCE = 20;
      if (distance(mouseX, mouseY, rainbowInitialLandingX, rainbowInitialLandingY) > BEAM_RESET_DISTANCE)
      {
        rainbowPowerCharge *= 0.5;
        rainbowInitialLandingX = mouseX;
        rainbowInitialLandingY = mouseY;
      }
      
    }

    float landingX = continuousFire ? mouseX : rainbowInitialLandingX;
    float landingY = continuousFire ? mouseY : rainbowInitialLandingY;
    

    // Calculate roughly where the leprechaun's hand is
    float leprechaunHandX = leprechaunX+LEPRECHAUN_WIDTH/16.0;
    float leprechaunHandY = leprechaunY+LEPRECHAUN_HEIGHT/3.0;
    float goldCenterX = goldX + GOLD_WIDTH/2.0;
    float goldCenterY = goldY + GOLD_HEIGHT/2.0;

    // Calculate the distance between the end of the rainbow and the center of the pot of gold
    float missDistance = distance(landingX, landingY, goldCenterX, goldCenterY);
    float goldToHandDistance = distance(leprechaunHandX, leprechaunHandY, goldCenterX, goldCenterY);
    float closeness = max(0.1, (goldToHandDistance - missDistance) / goldToHandDistance * rainbowPowerCharge);
    
    // As time passes, increase the power charge of the rainbow 
    rainbowPowerCharge = min(1.0, rainbowPowerCharge + RAINBOW_INCREMENT);
    drawRainbow(rainbowPath, leprechaunHandX, leprechaunHandY, landingX, landingY, rainbowPowerCharge, closeness);
    
    // If the cursor is "close enough" to the pot of gold
    // and the rainbow is fully charged, declare a winner.
    if (closeness >= CLOSE_ENOUGH_TO_POT_OF_GOLD && rainbowPowerCharge == 1.0)
    {
      endGame();
    }

  }
  else
  {
    final int CROSSHAIR_HALF_WIDTH = 10;
    stroke(#FFFF00, 63);
    strokeWeight(5);
    line(mouseX - CROSSHAIR_HALF_WIDTH, mouseY - CROSSHAIR_HALF_WIDTH, mouseX + CROSSHAIR_HALF_WIDTH, mouseY + CROSSHAIR_HALF_WIDTH);
    line(mouseX - CROSSHAIR_HALF_WIDTH, mouseY + CROSSHAIR_HALF_WIDTH, mouseX + CROSSHAIR_HALF_WIDTH, mouseY - CROSSHAIR_HALF_WIDTH);
  }

  printInstructions();

}


/**
 * React to the mouse button first being pressed.
 */
void mousePressed()
{
  if (playerWon)
  {
    // If the last game is over, start a new game.
    newGame();
  }

  // Keep track of the initial cursor location when the mouse button is first pressed.
  rainbowInitialLandingX = mouseX;
  rainbowInitialLandingY = mouseY;
  
  // Reset some stuff.
  rainbowPowerCharge = 0.0;
  showIntroduction = false;
  showHelp = false;
}


/**
 * React to keys being pressed.
 */
void keyPressed()
{
  switch(key)
  {
    case 'r':
    case 'R':
      resetGame();
      break;
    
    case 'n':
    case 'N':
      newGame();
      break;
      
    case 'b':
    case 'B':
      // switch the background picture;
      backgroundPictureIndex = (backgroundPictureIndex + 1) % BACKGROUND_PICTURE_COUNT;
      break;
    
    case 'p':
    case 'P':
      // switch the path the rainbow takes
      rainbowPath = rainbowPath == PATH_CURVE ? PATH_RAY : PATH_CURVE;
      break;
      
    case 'c':
    case 'C':
      continuousFire = !continuousFire;
      break;

    case 's':
    case 'S':
      captureScreenshot();
      break;
      
    case 'q':
    case 'Q':
      playerWon = true;
      break;
      
    case 'h':
    case 'H':
      showHelp = !showHelp;
      break;
      
    case 'i':
    case 'I':
      showIntroduction = !showIntroduction;
      break;
  }
}


/**
 * Declare the current game finished.
 */
void endGame()
{
  playerWon = true;
  frameRate(10);
}


/**
 * Start a new game.
 */
void newGame()
{
  leprechaunX = int(random(2*width/3, width)) - LEPRECHAUN_WIDTH;
  leprechaunY = int(random(3*height/4, height)) - LEPRECHAUN_HEIGHT;
  goldX = int(random(GOLD_WIDTH, width/3));
  goldY = int(random(3*height/4, height)) - GOLD_HEIGHT;
  leprechaunOffsetX = 0;
  leprechaunOffsetY = 0;
  leprechaunRotation = 0.0;
  playerWon = false;
  frameRate(20);
  potOfGoldIndex = 0;
}


/**
 * Reset configurable options.
 */
void resetGame()
{
  backgroundPictureIndex = BACKGROUND_PICTURE_CLOUD;
  continuousFire = true;
  rainbowPath = PATH_CURVE;
  newGame();
}



/**
 * Save the canvas to a file.
 */
void captureScreenshot()
{
    String filename = 
          year()+nf(month(),2)+nf(day(),2)+"-"+nf(hour(),2)+nf(minute(),2)+nf(second(),2)+"-"+nf(millis(),6)+".png";
    save(filename);
}


/**
 * Draw an image on the canvas 
 *
 * @param theImage         image object to be drawn
 * @param topLeftCornerX   the x-coordinate of the location to anchor the top-left corner of the image
 * @param topLeftCornerY   the y-coordinate of the location to anchor the top-left corner of the image
 * @param heightInPixels   the height to shrink/grow the image
 * @param rotation         the angle at which to draw the image 
 */
void drawImage(PImage theImage, float topLeftCornerX, float topLeftCornerY, float heightInPixels, float rotation)
{
  pushMatrix();
    translate(topLeftCornerX, topLeftCornerY);
    scale(heightInPixels/theImage.height);
    rotate(rotation);
    image(theImage, 0, 0);
  popMatrix();
}


/**
 * Draw the picture for the background of the game.
 */
void drawBackgroundPicture()
{
  float scaleX = float(width) / float(backgroundPictures[backgroundPictureIndex].width);
  float scaleY = float(height) / float(backgroundPictures[backgroundPictureIndex].height);
  float theScale = max(scaleX, scaleY);
  pushMatrix();
  translate(0, height - theScale*backgroundPictures[backgroundPictureIndex].height);
  scale(max(scaleX, scaleY));
  image(backgroundPictures[backgroundPictureIndex], 0, 0);
  popMatrix();
}


/**
 * Draws a rainbow from the leprechaun's hand to the cursor location
 *
 * @param rainbowStyle      The style of rainbow to draw, either RAINBOW_CURVE or RAINBOW_RAY.
 * @param handX             The x-coordinate of the leprechaun's hand, from which the ray originated.
 * @param handY             The y-coordinate of the leprechaun's hand, from which the ray originated.
 * @param cursorX           The x-coordinate of the cursor, towards which the ray is progressing.
 * @param cursorY           The y-coordinate of the cursor, towards which the ray is progressing.
 * @param percentComplete   The percent (0.0-1.0) of the path that the rainbow has completed.
 * @param intensity         Controls how bright (opaque) and wide to draw the rainbow.  1.0 - full intensity.
 */
void drawRainbow(int rainbowStyle, float handX, float handY, float cursorX, float cursorY, float percentComplete, float intensity)
{
  if (rainbowStyle == PATH_CURVE)
  {
    drawRainbowCurve(handX, handY, cursorX, cursorY, percentComplete, intensity);
  }
  else if (rainbowStyle == PATH_RAY)
  {
    drawRainbowRay(handX, handY, cursorX, cursorY, percentComplete, intensity);
  }  
}


/**
 * Draws a rainbow colored ray (straight line) from the leprechaun's hand to the cursor location
 *
 * @param handX             The x-coordinate of the leprechaun's hand, from which the ray originated.
 * @param handY             The y-coordinate of the leprechaun's hand, from which the ray originated.
 * @param cursorX           The x-coordinate of the cursor, towards which the ray is progressing.
 * @param cursorY           The y-coordinate of the cursor, towards which the ray is progressing.
 * @param percentComplete   The percent (0.0-1.0) of the path that the rainbow has completed.
 * @param intensity         Controls how bright (opaque) and wide to draw the rainbow.  1.0 - full intensity.
 */
void drawRainbowCurve(float handX, float handY, float cursorX, float cursorY, float percentComplete, float intensity)
{
  // determine the center
  // The lowest point determines the level of the center point
  float centerY = handY >= cursorY ? handY : cursorY;
  float centerX = (handX*handX + handY*handY - cursorX*cursorX - cursorY*cursorY + 2*centerY*(cursorY - handY)) / 2 / (handX - cursorX);
  float diameter = 2*distance(cursorX, cursorY, centerX, centerY);

  // determine the angle to draw
  float cursorAngle = resolveAngle(atan((cursorY - centerY)/(cursorX - centerX)), cursorX, centerX);
  float handAngle = resolveAngle(atan((handY - centerY)/(handX - centerX)), handX, centerX);
  
  float deltaAngle = abs(handAngle - cursorAngle);
  float startAngle = 0;
  float endAngle = 0;
  if (cursorAngle < handAngle)
  {
    startAngle = cursorAngle + (1.0-percentComplete)*deltaAngle;
    endAngle = handAngle;
  }
  else
  {
    startAngle = handAngle;
    endAngle = handAngle + percentComplete*deltaAngle;
  }  
  
  
  float weight = RAINBOW_STRIPE_THICKNESS * intensity;
  strokeWeight(weight);
  noFill();
  for (int colorIndex = 0; colorIndex < RAINBOW_COLOR_COUNT; ++colorIndex)
  {
    stroke(RAINBOW_COLOR[RAINBOW_COLOR_COUNT - colorIndex - 1], (RAINBOW_INTENSITY_MAX - RAINBOW_INTENSITY_MIN)*intensity + RAINBOW_INTENSITY_MIN);
    float stripeOffset = colorIndex * weight;
    arc(centerX, centerY, diameter + 2*stripeOffset, diameter + 2*stripeOffset, startAngle, endAngle);
  }
}


/**
 * Draws a rainbow colored ray (straight line) from the leprechaun's hand to the cursor location
 *
 * @param handX             The x-coordinate of the leprechaun's hand, from which the ray originated.
 * @param handY             The y-coordinate of the leprechaun's hand, from which the ray originated.
 * @param cursorX           The x-coordinate of the cursor, towards which the ray is progressing.
 * @param cursorY           The y-coordinate of the cursor, towards which the ray is progressing.
 * @param percentComplete   The percent (0.0-1.0) of the path that the rainbow has completed.
 * @param intensity         Controls how bright (opaque) and wide to draw the rainbow.  1.0 - full intensity.
 */
void drawRainbowRay(float handX, float handY, float cursorX, float cursorY, float percentComplete, float intensity)
{
  float lineStartX = handX + percentComplete*(cursorX - handX);
  float lineStartY = handY + percentComplete*(cursorY - handY);
  
  float weight = RAINBOW_STRIPE_THICKNESS * intensity;
  strokeWeight(weight);
  noFill();
  for (int colorIndex = 0; colorIndex < RAINBOW_COLOR_COUNT; ++colorIndex)
  {
    stroke(RAINBOW_COLOR[RAINBOW_COLOR_COUNT - colorIndex - 1], (RAINBOW_INTENSITY_MAX - RAINBOW_INTENSITY_MIN)*intensity + RAINBOW_INTENSITY_MIN);
    float stripeOffset = colorIndex * weight;
    line(lineStartX, lineStartY-stripeOffset, handX, handY-stripeOffset);
  }
}


/**
 * Calculate the distance between two points.
 *
 * @param x1   x-coordinate of the first point.
 * @param y1   y-coordinate of the first point.
 * @param x2   x-coordinate of the second point.
 * @param x2   y-coordinate of the second point.
 *
 * @return     The distance between (x1,y1) and (x2,y2).
 */
float distance(float x1, float y1, float x2, float y2)
{
  return sqrt(pow(x1-x2,2) + pow(y1-y2,2));  
}


/**
 * Map an angle to the correct quadrant
 *
 * @param angle    The angle to be mapped.
 * @param pointX   The x-coordinate of the end of the line.
 * @param centerX  The x-coordinate of the start of the line. 
 */
float resolveAngle(float angle, float pointX, float centerX)
{
  if (pointX <= centerX)
  {
    return angle + PI;
  }
  else
  {
    return angle + TWO_PI;
  }
}



/******
 *
 * Explain how to play the game.
 *
 */ 
void printInstructions()
{
  final int FONT_HEIGHT_HEADER = 40;
  final int FONT_HEIGHT_NORMAL = 30;
  int textLine = FONT_HEIGHT_HEADER + 10;

  if (showIntroduction)
  {
    stroke(#00CC00, 200);
    strokeWeight(10);
    fill(#CCCC00, 200);
    rect(5,5, width-10,7*FONT_HEIGHT_NORMAL + FONT_HEIGHT_HEADER);
    textFont(fontIntro, 36);
    
    fill(#007700);
    text("Welcome to Rainbow Gold!", 20, textLine); textLine += FONT_HEIGHT_HEADER;
    textFont(fontInstructions, 24);
    text("Help the leprechaun find his pot of gold.", 30, textLine); textLine += FONT_HEIGHT_NORMAL;
    text("Click and hold to shoot his rainbow beam around the picture.", 30, textLine); textLine += FONT_HEIGHT_NORMAL;
    text("Wait for the beam to reach the cursor to see if the gold is there!", 30, textLine); textLine += FONT_HEIGHT_NORMAL;
    text("The closer you get to it, the wider and brighter the beam will be!", 30, textLine); textLine += FONT_HEIGHT_NORMAL;
    textLine += 10;
    text("(press H for additional instructions and options)", 60, textLine); textLine += 3*FONT_HEIGHT_NORMAL;
  }

  if (showHelp)
  {
    stroke(#00CC00, 200);
    strokeWeight(10);
    fill(#CCCC00, 200);
    rect(5,textLine - FONT_HEIGHT_HEADER - 5, width-10, 10*FONT_HEIGHT_NORMAL + FONT_HEIGHT_HEADER+5);
    textFont(fontIntro, 36);
    
    fill(#007700);
    text("Rainbow Gold commands", 20, textLine); textLine += FONT_HEIGHT_HEADER;
    textFont(fontInstructions, 24);
    text("N to start a new game", 30, textLine); textLine += FONT_HEIGHT_NORMAL;
    text("B to change the background picture", 30, textLine); textLine += FONT_HEIGHT_NORMAL;
    text("P to switch between a ray and a rainbow", 30, textLine); textLine += FONT_HEIGHT_NORMAL;
    text("C to toggle between one-shot and continuous fire", 30, textLine); textLine += FONT_HEIGHT_NORMAL;
    text("R to reset all options to the defaults", 30, textLine); textLine += FONT_HEIGHT_NORMAL;
    text("Q to end the game and reveal the location of the pot", 30, textLine); textLine += FONT_HEIGHT_NORMAL;
    text("S to save a screenshot of the game", 30, textLine); textLine += FONT_HEIGHT_NORMAL;
    textLine += 10;
    text("I to show the introduction screen", 30, textLine); textLine += FONT_HEIGHT_NORMAL;
    text("H to show this help screen", 30, textLine); textLine += FONT_HEIGHT_NORMAL;
  }
}



