
/**
 * spxlTextTrail
 * 2010-02-14 by subpixel
 * http://subpixels.com
 *
 * Use offscreen PGraphics object to render smoke trail
 * Demonstrate different blend() modes
 *
 * Controls:
 * [SPACE] toggle pause
 * [d] toggle debug (onscreen, continuous)
 * [D] debug to console (single shot)
 *
 * RANDOM PARAMETER CHANGES
 * [a] toggle auto change
 * [r] random change [R] randomise all
 *
 * MAIN DISPLAY ELEMENTS
 * [i] toggle background image
 * [c] random circle colour [C] toggle circle
 *
 * TEXT
 * [f] random font
 * [x] random text colour [X] toggle text (not trail)
 * [m] random message [n] next message [N] first message
 *
 * TRAIL PARAMETERS
 * [t] random blendFactor [T] toggle trail
 * [w] toggle trail window / full display
 * [P] toggle pure trail blend (no pattern, no alpha adjust)
 * [p] toggle patterned trail
 * [/] random pattern [?] reset pattern
 * [,]/[.] adjust patternCopy [<]/[>] adjust patternSkip
 *
 * TRAIL BLEND PARAMETERS
 * [B] random blend mode [b] next blend mode
 * [LEFT]/[RIGHT] adjust blendFactor
 * [Mouse Click] set blendFactor by mouseX
 */

String[] messages = 
{
  "Hello Processing!",
  "subpixels.com",
  "SPXL.TV",
  "NO RUNNING",
  "Be Happy",
  "Random acts\nof kindness",
  "Wish upon\na star",
  "Once upon\na time...",

  "[SPACE] pause",
  "[d] debug",
  "[D] debug to\nconsole",
  "[a] auto change",
  "[r] randomise\none param",
  "[R] randomise\nall params",

  "[i] background\nimage",
  "[c] rnd\ncircle colour",
  "[C] toggle\ncircle",

  "[f] rnd\nfont",
  "[x] rnd\ntext colour",
  "[X] toggle\ntext",
  "[m] rnd\nmessage",
  "[n] next\nmessage",
  "[N] first\nmessage",

  "[t] rnd trail\nblend factor",
  "[T] toggle\ntrail",
  "[w] trail\nwindow",
  "[P] pure\ntrail blend",
  "[p] patterned\ntrail",
  "[/] rnd\npattern", 
  "[?] reset\npattern",
  "[,/.]pattern\ncopy",
  "[</>]\npattern\nskip",

  "[LEFT/RIGHT]\nblend factor",
  "[Click, mouseX]\nblend factor",
  "[B] rnd\nblend mode",
  "[b] next\nblend mode"
};

int[] blendModes =
{
  BLEND, ADD, SUBTRACT, DARKEST, LIGHTEST, DIFFERENCE, EXCLUSION,
  MULTIPLY, SCREEN, OVERLAY, HARD_LIGHT, SOFT_LIGHT, DODGE, BURN
};

String[] blendNames =
{
  "BLEND", "ADD", "SUBTRACT", "DARKEST", "LIGHTEST", "DIFFERENCE", "EXCLUSION",
  "MULTIPLY", "SCREEN", "OVERLAY", "HARD_LIGHT", "SOFT_LIGHT", "DODGE", "BURN"
};

// ------------------------------------------------------------

boolean debug = false;
boolean debugConsole = false;

boolean paused = false;
boolean autoChange = true;

boolean dispBackgroundImage = true;

boolean dispCircle = true; // Wandering circle
int circleColour;
int targetCircleColour;

int messageIndex = 0;    // Current index into messages[]
int fontIndex;           // index into fontList[]
int fontSize = 40; // Pixel size of font to load
int textColour;
int targetTextColour;

boolean dispText = true; // Display the text (solid, not the trail)?
boolean dispTrail = true;
boolean trailWindow = false; // Trail in window or full display?
int windowSize;
int halfWindowSize;

int blendIndex = 0;     // Current index into blendModes[]
boolean pureBlend;      // If set, don't use intermediate image with modified alpha

int blendFactor = 0x99; // If !pureBlend, used to set alpha channel for intermediate source image
float blendFactorF = blendFactor; // Used for gradual interpolation
int targetBlendFactor = blendFactor; // Requested blendFactor

boolean patternedTrail = true; // If set, if also !pureBlend, apply blendFactor to pattern of pixels
int patternCopy = 29; // draw patternCopy - set alpha to blendFactor)
int patternSkip = 28; // skip patternSkip - set alpha (entire pixel value) to 0

// ------------------------------------------------------------

final int PATTERN_LIMIT = 64; // max (+1) number of pixels copied or skipped in a row for patternedTrail

String[] fontList;        // List of system font names
PFont    font;            // Current font loaded
String   loadedFontName;  // Name of last loaded font
int      loadedFontSize;  // Size of last loaded font

int   debugFontSize = 16; // Pixel size of font for on-screen debug text
PFont debugFont;          // Loaded font for on-screen debug text

PGraphics offscreen;      // Offscreen renderer for rendering smoke

PImage backgroundImage;   // Static image displayed as base layer in compositon

long time;                // Time (based on millis()) at start of draw()
long autoChangeTime;      // Time (based on millis()) to auto change

// ------------------------------------------------------------

void setup()
{
  final String renderEngine = JAVA2D;
  
  size(400, 400, renderEngine);

  halfWindowSize = (int)(min(width, height) / 4);
  windowSize = halfWindowSize * 2;
  
  backgroundImage = loadImage("bgimage.jpg");

  fontList = PFont.list();
  debugFont = createFont(fontList[0], debugFontSize);
  
  textAlign(CENTER, CENTER);

  offscreen = createGraphics(width, height, renderEngine);
  offscreen.background(0);
  
  // Randomise settings
  randomAll();
}

// ------------------------------------------------------------

void draw()
{
  time = millis();

  if (autoChange && time > autoChangeTime)
  {
    randomChange();
    
    autoChangeTime = time + 1000 * (int)random(5, 10);
  }
  
  if (mousePressed)
  {
    targetBlendFactor = (int)map(mouseX, 0, width - 1, 0, 255);
  }
  
  blendFactorF = lerp(blendFactorF, targetBlendFactor, 0.1);
  blendFactor = (int)blendFactorF;
  
  circleColour = lerpColor(circleColour, targetCircleColour, 0.1);
  textColour   = lerpColor(textColour,   targetTextColour, 0.1);
  
  // Determine new text position and rotation
  float ni = frameCount * 0.02;
  float tx = noise(ni) * width;
  float ty = noise(ni, 2) * height;
  float rot = HALF_PI * sin(frameCount * 0.01);

  updateTrail(tx, ty, rot);

  // Main display; start with background
  if (dispBackgroundImage)
    background(backgroundImage);
  else
    background(0);

  if (dispCircle) dispCircle();

  if (dispTrail) dispTrail();
  
  if (dispText) dispText(tx, ty, rot);
  
  if (debug || debugConsole) dispDebug();
}

// ------------------------------------------------------------

void updateTrail(float x, float y, float rotation)
{
  offscreen.beginDraw();
  
  // Blur and drop(downwards) existing trail
  offscreen.tint(255,127);
  offscreen.image(offscreen.get(), 2, 3);
  offscreen.image(offscreen.get(), -2, 2);
  offscreen.image(offscreen.get(), 0, 1);

  // Fade trail
  offscreen.fill(0, 1);
  offscreen.rect(0, 0, width, height);

  // Add new part of trail
  offscreen.translate(x, y);
  offscreen.rotate(rotation);
  offscreen.textFont(font);
  offscreen.textAlign(CENTER, CENTER);
  offscreen.fill(200 + 55 * noise(frameCount * 0.03));
  offscreen.text(messages[messageIndex], 0, 0);
  
  offscreen.endDraw();
}

void dispCircle()
{
  float ni = frameCount * 0.02;
  float cx = noise(ni, 5) * width;
  float cy = noise(ni, 6) * height;
  pushMatrix();
  {
    noStroke();
    fill(circleColour);
    ellipse(cx, cy, 100, 100);
  }
  popMatrix();
}

void dispTrail()
{
  // Intermediate buffer to perform "pattern" transparency  
  PImage trailImage = offscreen;

  if (pureBlend)
  {
    // Don't modify the alpha values at all for pure blend  
  }
  else
  {
    PImage buff = offscreen.get();
    buff.loadPixels();

    for (int i = 0; i < buff.width * buff.height; i++)
    {
      // If not patterned, modify alpha of all pixels
      // If patterned, use patternCopy pixels then skip patternSkip pixels
  
      if (!patternedTrail || i % (patternCopy + patternSkip) < patternCopy)
        buff.pixels[i] = buff.pixels[i] & 0xffffff | blendFactor << 24;
      else
        buff.pixels[i] = 0; // skip (blank out) pixel
    }

    buff.updatePixels();
    
    trailImage = buff;
  }

  // Copy to screen
  int x, y;  // Top-left of window to blend
  int w, h;  // Window width, height
  if (trailWindow)
  {
    // Attempt to centre the window at the current mouse coordinates,
    // but constrain it to fit entirely within the display
    x = constrain(mouseX - halfWindowSize, 0, trailImage.width  - windowSize - 1);
    y = constrain(mouseY - halfWindowSize, 0, trailImage.height - windowSize - 1);
    w = h = windowSize;
  }
  else
  {
    // There seems to be a bug that causes the image to be
    // slightly blurred (resabpled) when using (width, height).
    // Using (width-1, hieght-1) maintains clarity, but misses
    // the last row and column of the image. :o(
    x = y = 0;
    w = trailImage.width  - 1;
    h = trailImage.height - 1;
  }
  
  blend(trailImage, x, y, w, h, x, y, w, h, blendModes[blendIndex]);
}

void dispText(float x, float y, float rotation)
{
  // Redraw text (on screen this time)
  pushMatrix();
  {
    translate(x, y);
    rotate(rotation);
    textFont(font);
    textAlign(CENTER, CENTER);
    fill(textColour);
    text(messages[messageIndex], 0, 0);
  }
  popMatrix();
}

void dispDebug()
{
  String dt = getDebugText();
  
  // Display info on screen
  if (debug)
  {
    pushMatrix();
    {
      textFont(debugFont);
      textAlign(LEFT, TOP);
      fill(255, 255, 0, 200);
      text(dt, 5, 5);
    }
    popMatrix();
  }
  
  // Send info to console, single shot
  if (debugConsole)
  {
    println(dt);
    debugConsole = false;
  }
}

String getDebugText()
{
  // Build string containtaining debug information
  StringBuilder sb = new StringBuilder(512);

  sb.append("frameRate: " + frameRate + "\n");
  sb.append("font: [" + fontIndex + "] " + fontList[fontIndex] + "\n");
  sb.append("message: [" + messageIndex + "] " + messages[messageIndex].replace("\n","\\n") + "\n");
  sb.append("patternCopy: " + patternCopy + "\n");
  sb.append("patternSkip: " + patternSkip + "\n");
  sb.append("blend: [" + blendIndex + "] "  + blendNames[blendIndex] + " = " + blendModes[blendIndex] + "\n");
  sb.append("blendFactor: " + targetBlendFactor + " 0x" + hex(targetBlendFactor, 2) + " (" + blendFactor +", " + blendFactorF + ")" + "\n");

  return sb.toString();
}
void keyPressed()
{
  if (key == CODED) switch(keyCode)
  {
    case UP:    fontSize = min(80, fontSize + 10); updateFont(); break;
    case DOWN:  fontSize = max(10, fontSize - 10); updateFont(); break;
    case LEFT:  targetBlendFactor = constrain(targetBlendFactor - 0x33, 0x33, 0xff); dispTrail = true; break;
    case RIGHT: targetBlendFactor = constrain(targetBlendFactor + 0x33, 0x33, 0xff); dispTrail = true; break;
  }
  else switch(key)
  {
    case ' ': togglePause();        break;
    
    case '0':
    case '1':
    case '2':
    case '3':
    case '4':
    case '5':
    case '6':
    case '7':
    case '8':
    case '9':
      blendIndex = Character.digit(key, 10);
      break;

    case 'a': autoChange ^= true;     break;
    case 'b': nextBlendMode();        break;
    case 'B': randomBlendMode();      break;
    case 'c': randomCircleColour();   break;
    case 'C': dispCircle ^= true;     break;
    case '`':
    case 'd': debug ^= true;          break;
    case 'D': debugConsole ^= true;   break;
    case 'f': randomFont();           break;
    case 'i': dispBackgroundImage ^= true; break;
    case 'm': randomMessage();        break;
    case 'n': nextMessage();          break;
    case 'N': messageIndex = 0;       break; // first message
    case 'p':
      if (pureBlend) // always go to patterned from pure
      {
        pureBlend = false;
        patternedTrail = true;
      }
      else
      {
        patternedTrail ^= true;
      }
      break;
    case 'P': pureBlend ^= true;      break;
    case 'r': randomChange();         break;
    case 'R': randomAll();            break;
    case 't': randomBlendFactor();    break;
    case 'T': dispTrail ^= true;      break;
    case 'w': trailWindow ^= true;    break;
    case 'x': randomTextColour();     break;
    case 'X': dispText ^= true;       break;
    case ',': if (patternCopy > 0) patternCopy--; if (patternCopy == 0 && patternSkip == 0) patternSkip = 1; patternedTrail = true; break;
    case '.': if (patternCopy < PATTERN_LIMIT) patternCopy++; patternedTrail = true; break;
    case '<': if (patternSkip > 0) patternSkip--; if (patternCopy == 0 && patternSkip == 0) patternCopy = 1; patternedTrail = true; break;
    case '>': if (patternSkip < PATTERN_LIMIT) patternSkip++; patternedTrail = true; break;
    case '?': resetPattern();         break;
    case '/': randomPattern();        break;
  }
}

// ------------------------------------------------------------

void togglePause()
{
  if (paused ^= true)
    noLoop();
  else
    loop();
}

// ------------------------------------------------------------

void randomChange()
{
  println("randomChange()...");
  switch(rnd(10))
  {
    case 0: randomAll();           break;
    case 1: randomFont();          break;
    case 2: randomMessage();       break;
    case 3: randomBlendMode();     break;
    case 4: randomBlendFactor();   break;
    case 5: randomPattern();       break;
    case 6: resetPattern();        break;
    case 7: dispCircle ^= true;    break;
    case 8: randomCircleColour();  break;
    case 9: randomTextColour();    break;
  }
}

void randomAll()
{
  println("randomAll()...");
  randomFont();
  randomMessage();
  randomBlendMode();
  randomBlendFactor();
  randomPattern();
  randomCircleColour();
  randomTextColour();
}

void randomBlendFactor()
{
  int current = max(1, ceil(targetBlendFactor / 51f));
  int rand = (rndx(5, current - 1) + 1);
  targetBlendFactor = rand * 0x33;
  println("randomBlendFactor() -> " + targetBlendFactor + " 0x" + hex(targetBlendFactor, 2));
  dispTrail = true;
}

void randomBlendMode()
{
  blendIndex = rndx(blendModes.length, blendIndex);
  println("randomBlendMode() -> " + blendIndex + " = " + blendModes[blendIndex]);
  dispTrail = true;
}

void nextBlendMode()
{
  blendIndex = (blendIndex + 1) % blendModes.length;
  println("nextBlendMode() -> " + blendIndex + " = " + blendModes[blendIndex]);
  dispTrail = true;
}

void randomCircleColour()
{
  targetCircleColour = getRandomColour(0x33);
  println("randomCircleColour() -> 0x" + hex(targetCircleColour, 8));
  dispCircle = true;
}

void randomTextColour()
{
  targetTextColour = getRandomColour(0x66);
  println("randomTextColour() -> 0x" + hex(targetTextColour, 8));
  dispText = true;
}

int getRandomColour(int minAlpha)
{
  return rnd(0x1000000) | (int)random(minAlpha, 256) << 24;
}

void randomFont()
{
  fontIndex = rndx(fontList.length, fontIndex);
  println("randomFont() -> " + fontIndex);
  updateFont();
}

void updateFont()
{
  if (loadedFontName == null || loadedFontName.isEmpty() ||
      loadedFontSize != fontSize ||
      !loadedFontName.equalsIgnoreCase(fontList[fontIndex]))
  {
    println("Loading font: " + fontList[fontIndex] + " (size " + fontSize + ")");
    font = createFont(fontList[fontIndex], fontSize);
    loadedFontName = fontList[fontIndex];
    loadedFontSize = fontSize;
    println("loadedFont: " + loadedFontName + " (size " + loadedFontSize + ")");
  }
  else
  {
    println("Font already loaded?.. loadedFont: " + loadedFontName + " (size " + loadedFontSize + ")");
  }
  
  // Since we wanted a new font, we should consider displaying it somehow!
  if (!dispText && !dispTrail) dispText = true;
}

void randomMessage()
{
  messageIndex = rndx(messages.length, messageIndex);
  println("randomMessage() -> " + messageIndex);
  if (!dispText && !dispTrail) dispText = true;
}

void nextMessage()
{
  messageIndex = (messageIndex + 1) % messages.length;
  println("nextMessage() -> " + messageIndex);
  if (!dispText && !dispTrail) dispText = true;
}

void randomPattern()
{
  patternCopy = rndx(PATTERN_LIMIT, patternCopy);
  patternSkip = rndx(PATTERN_LIMIT, patternSkip);
  if (patternCopy == 0 && patternSkip == 0) patternCopy = 1;
  println("randomPattern() -> patternCopy: " + patternCopy + ", patternSkip: " + patternSkip);
  patternedTrail = true;
}

void resetPattern()
{
  patternCopy = 1;
  patternSkip = 0;
  println("resetPattern() -> patternCopy:" + patternCopy + ", patternSkip: " + patternSkip);
  patternedTrail = true;
}

// ------------------------------------------------------------

// Return a random integer from 0 to n-1, not including x
int rndx(int n, int x)
{
  return (n = (int)random(n - 1)) < x ? n : n + 1;
}

// Return a random integer from 0 to n-1
int rnd(int n)
{
  return (int)random(n);
}


