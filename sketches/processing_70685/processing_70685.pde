
//  R.A. Robertson 2012.10 "Perlin Multiscale Topography" ~ www.rariora.org ~
//  License: Creative Commons Attribution, Share Alike.

float colorLevel = 120.0;              // This initial value has significant impact.
float incColorLevel = 0.0;             // Adjust number of color levels.
float levelNum = 5.0;                  // Multiscale levels.
float perlin = 0.007;                  // Sensitive, but well worth fiddling. 0.007 default.
float incX, incY;                      // Scale Perlin dimensions.
float panX, panY;
float z = 1.0;                         // Perlin Z axis. Useful for animation.
float colorVal1 = 0.0;                 // Main variable for assigning hue.
float mod = 5.0;                       // Modulus. Key for transforming noise into topography.
float colorLevelMin, colorLevelMax;    // Map values. Keeps color values in range (more or less).
float shiftHue;
float shiftSaturation = 0.0;
float shiftBrightness = 0.0;
float shiftAlpha;
boolean toggleLoop = true; 
boolean showCursor;

void setup() {
//  frame.setTitle("Perlin Multiscale Topography");
//  frame.setResizable(true);  
  size(400, 200, P2D);
//size(screen.width, screen.height, P2D);
  colorMode(HSB, colorLevel);
  incX = incY = 1;
}

void draw() {

  if (!showCursor) { noCursor(); }  // CURSOR_VISIBILITY:_SEE MOUSEMOVED_BELOW
  else { cursor(); showCursor = false; }
  
  colorLevel = 100;
  colorLevel += incColorLevel;
  if (!toggleFlow) z+= 0.7;
  for (int level = 0; level < levelNum; level++) {  // Multiscale loop.
    colorLevel = (colorLevel - (colorLevel/levelNum));  // Scale color levels.
    noiseDetail(int(colorLevel * .1), colorLevel / 100);  // Scale noise detail.

    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {

        colorVal1 = (noise((perlin * x) * incX + panX, (perlin * y) * incY + panY, (perlin * z)) * colorLevel) % mod;
        
        // Trig Functions.
        if (toggleSin) colorVal1 = sin(colorVal1) * colorLevel;                 // [1]
        if (toggleCos) colorVal1 = cos(colorVal1) * colorLevel;                 // [2]
        if (!toggleTan) colorVal1 = tan(colorVal1) * colorLevel;                // [3] Default.
        if (toggleAsin) colorVal1 = asin(colorVal1) * colorLevel;               // [4] 
        if (toggleAcos) colorVal1 = acos(colorVal1) * colorLevel;               // [5]
        if (toggleAtan) colorVal1 = atan(colorVal1) * colorLevel;               // [6]
        if (toggleAtan2) colorVal1 = atan2(colorVal1, y * 0.075) * colorLevel;  // [7]

        // Map (Envelope).                                                         [8] On by default.
        if (!toggleMap) colorVal1 = map(colorVal1, 0 + colorLevelMin, colorLevel + colorLevelMax, 0, colorLevel * colorLevel/mod);
        
        // Math Functions.
        if (toggleAbs) colorVal1 = abs(colorVal1) * colorLevel;                 // [!]
        if (toggleRound) colorVal1 = round(colorVal1) * colorLevel;             // [@]
        if (toggleCeil) colorVal1 = ceil(colorVal1) * colorLevel;               // [#]        
        if (toggleFloor) colorVal1 = floor(colorVal1) * colorLevel;             // [$]
        if (toggleExp) colorVal1 = exp(colorVal1) * colorLevel;                 // [%]
        if (toggleSq) colorVal1 = sq(colorVal1) * colorLevel;                   // [^]
        if (toggleSqrt) colorVal1 = sqrt(colorVal1) * colorLevel;               // [&]
        if (toggleLog) colorVal1 = log(colorVal1) * colorLevel;                 // [*]
        
        // Multiscale Color Evaluation

        if (toggleGray) {
        stroke((colorVal1 / colorLevel) + shiftHue, colorLevel + shiftAlpha);
        }
        
        else {
        stroke((colorVal1 / colorLevel) + shiftHue,
        (colorLevel * levelNum) + shiftSaturation,
        colorVal1 + shiftBrightness,
        colorLevel + shiftAlpha);
        }

        
        point(x, y);
      }  // End X.
    }  // End Y.
  }  // End Multiscale.
    //  println(frameRate);      
}  // End Draw.

/* =======================       UI       ======================= */

boolean toggleFlow, toggleMap, toggleGray;
boolean toggleSin, toggleCos, toggleTan, toggleAsin, toggleAcos, toggleAtan, toggleAtan2;
boolean toggleAbs, toggleRound, toggleCeil, toggleFloor, toggleExp, toggleSq, toggleSqrt, toggleLog;

void keyPressed() {

  // Toggle Switches.
  if (key == 'f' || key == 'F' ) toggleFlow = !toggleFlow;
  if (key == 'g' || key == 'G') toggleGray = !toggleGray;
  
  // Trig and Other Math Function Switches
  if (key == '1') toggleSin = !toggleSin;
  if (key == '2') toggleCos = !toggleCos;
  if (key == '3') toggleTan = !toggleTan;
  if (key == '4') toggleAsin = !toggleAsin;
  if (key == '5') toggleAcos = !toggleAcos;
  if (key == '6') toggleAtan = !toggleAtan;
  if (key == '7') toggleAtan2 = !toggleAtan2;
  if (key == '8') toggleMap = !toggleMap;
  if (key == '!') toggleAbs = !toggleAbs;
  if (key == '@') toggleRound = !toggleRound;
  if (key == '#') toggleCeil = !toggleCeil;
  if (key == '$') toggleFloor = !toggleFloor;
  if (key == '%') toggleExp = !toggleExp;
  if (key == '^') toggleSq = !toggleSq;
  if (key == '&') toggleSqrt = !toggleSqrt;
  if (key == '*') toggleLog = !toggleLog;
  
  // Value Adjusters. Right-click to reset all.
  if (key == 'p') perlin -= 0.0005;  if (key == 'P') perlin += 0.0005;
  if (key == 'm') mod -= 1.0;  if (key == 'M') mod += 1.0;  
  if (key == 'c') incColorLevel -= 1.0;  if (key == 'C') incColorLevel += 1.0;
  if (key == 'n') levelNum -= 1.0;  if (key == 'N') levelNum += 1.0;
  if (key == 'x') incX -= 0.2;  if (key == 'X') incX += 0.2;
  if (key == 'y') incY -= 0.2;  if (key == 'Y') incY += 0.2;
  if (key == 'z') z -= 0.5;  if (key == 'Z') z += 0.5;
  if (key == 'l') colorLevelMin -= 5.0;  if (key == 'L') colorLevelMin += 5.0;
  if (key == 'u') colorLevelMax -= 5.0;  if (key == 'U') colorLevelMax += 5.0;
  if (key == 'h') shiftHue -= 5.0;  if (key == 'H') shiftHue += 5.0;
  if (key == 's') shiftSaturation -= 25.0;  if (key == 'S') shiftSaturation += 25.0;
  if (key == 'b') shiftBrightness -= 100.0;  if (key == 'B') shiftBrightness += 100.0;
  if (key == 'a') shiftAlpha -= 3.0;  if (key == 'A') shiftAlpha += 3.0;  
  
  // Image Capture. Future version should save settings file along with image.
  if (key == 'i' || key == 'I') { // Saves an image file.
      saveFrame("perlin_multiscale_topography_####.jpg");
  }  
  
  if (key == CODED) {
    if (keyCode == UP) panY -= 0.05;
    if (keyCode == DOWN) panY += 0.05;
    if (keyCode == LEFT) panX -= 0.05;
    if (keyCode == RIGHT) panX += 0.05; 
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (toggleLoop) { 
      noLoop();
      cursor();
      toggleLoop = false;
    }
    else { 
      loop(); 
      toggleLoop = true;
    }
  }
  
 if (mouseButton == RIGHT) {  // Reset globals, re-initialize setup().
  colorLevel = 120.0;
  perlin = 0.007;
  mod = 5.0;
  incColorLevel = 0.0;
  levelNum = 5.0;
  z = 1.0;
  colorVal1 = 0.0;
  colorLevelMin = 0.0;
  colorLevelMax = 0.0;
  shiftHue = 0.0;
  shiftSaturation = 0.0;
  shiftBrightness = 0.0;
  shiftAlpha = 0.0;
  toggleFlow = toggleMap = toggleGray = false;
  toggleSin = toggleCos = toggleTan = false;
  toggleAsin = toggleAcos = toggleAtan = toggleAtan2 = false;
  toggleAbs = toggleRound = toggleCeil = toggleFloor = false;
  toggleExp = toggleSq = toggleSqrt = toggleLog = false;
  incX = incY = panX = panY = 0; 
  setup();                    // IS THIS NECESSARY?
 }
}

void mouseMoved() {
  showCursor = true;
}

/* =======================       UI Key       ======================= 

Variables Affected              Key            Value                   Comments

perlin                          p              0.0005                  Scale around origin
mod                             m              1.0                     Modulus
incColorLevel                   c              1.0                     Number of levels in HSB space.
levelNum                        n              1.0                     Number of multiscale levels.
incX, incY, z                   x, y, z      ~ 0.2   z += 0.5          Scale X and Y; manually animate with Z.
colorLevelMin, Max              l, u           5.0                     Envelope floor and ceiling (lower, upper).
shiftHue                        h              5.0                     Hue.
shiftSaturation                 s              25.0                    Saturation.
shiftBrightness                 b              100.0                   Brightness.
shiftAlpha                      a              3.0                     Alpha.

Save Image                      i              [no value]              Output frame to jpeg.

Function Toggles:

Animation                       f                                      Automated flow.
Grayscale                       g                                      Color/Grayscale.

Math & Trig:
sin()                           1
cos()                           2
tan()                           3                                      On by default.
asin()                          4
acos()                          5
atan()                          6
atan2()                         7
map()                           8                                      On by default. Toggles map().
abs()                           !
round()                         @
ceil()                          #
floor()                         $
exp()                           %
sq()                            ^
sqrt()                          &
log()                           *

Navigation
PanX                            LEFT, RIGHT
PanY                            UP, DOWN

Mouse Functions

Left-Click      Pause/Resume
Right-Click     Reset sketch

Menu bar is available for resizing.

*/


