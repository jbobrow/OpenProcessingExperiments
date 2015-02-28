
/*
 A text-painter, with color coming (primarily) from 4 possible images.
 Try painting a grid, reducing the size, and painting again!

  UP/DOWN - change text size
  LEFT/RIGHT - change amount of "jitter" (random offset for painting)
  a - toggle AutoPaint (on/off)
  1,2,3,4 - change color-source image
            stored as square "001.jpg" etc, in the data folder
  g - paint a grid of text covering entire screen (may take a while in .js)
  m/M - change paint Mode (the default mode takes color from images)
  s - save
  x - change black/white mode. mostly applies to alternate paint modes, or clearing screen
  c - clear screen; sets to white/black depending upon black/white mode (default: black)
*/


TextManager t;
int textsize = 20;
color blackfield = #000000;
color whitefield = #FFFFFF;
boolean blackNotWhite = false;
PImage img;

void setup() {
  size(800, 800);
  colorMode(HSB, width, height, 100);
  clearScreen();
  t = new TextManager();
  textSize(textsize);
  textAlign(CENTER, CENTER);
  frameRate(60); // change if paint events seem to be too rapid
  curPaintMode = 2; // paint with background color.
  setImage(4);
}

void draw() {
  if (autoPaintMode) {
    autoPaintRegion(0, 0, width, height);
    return;
  }

  if (mousePressed && mouseY > 0 && mouseY < height
        && mouseX > 0 && mouseX < width) {
    paintWordAtPoint(mouseX, mouseY);
  }
}

void paintWordAtPoint(int locX, int locY) {

  // absolute positioning
  float offX = getJitter(), offY = getJitter();
  setFill(locX + (int)offX, locY +(int)offY);
  text(t.getWord(), locX + offX, locY + offY);

}


void clearScreen() {
  color field = blackNotWhite ? whitefield : blackfield;
  background(field);
}

void changeTextsize(int direction) {
  int step = 5;
  textsize = (textsize + step*direction);
  if (textsize < 1) textsize = step;
  textSize(textsize);
}


int jitRange = 20;
float getJitter() {
  return random(-jitRange, jitRange);
}
void setJitRange(int direction) {
  int step = 5;
  jitRange = (jitRange + step*direction);
  if (jitRange < 1) jitRange = 1;
}

// select one of the 4 images
// this BEGS for a refactoring
/* @pjs preload="001.jpg,002.jpg,003.jpg,004.jpg"; */
void setImage(int image) {
  switch(image) {
    case 1:
      img = loadImage("001.jpg");
      break;

    case 2:
      img = loadImage("002.jpg");
      break;

    case 3:
      img = loadImage("003.jpg");
      break;

    case 4:
      img = loadImage("004.jpg");
      break;

  }

  img.resize(0, height);
  loadPixels();
}

// print a grid of characters from upper-left to lower-right
void paintGrid() {
  textAlign(LEFT, BOTTOM);
  int nextX = 0, nextY = 0, yOffset = (int)(textAscent() + textDescent());
  char w = t.getChar();
  nextY = nextY + yOffset;
  while (nextX < width && (nextY - yOffset) < height) {
    // println(w + " : " + nextX + ", " + nextY);
    setFill(nextX, nextY);
    text(w, nextX, nextY);
    nextX = nextX + (int)textWidth(w);
    w = t.getChar();
    if (nextX + (int)textWidth(w) > width) {
      nextX = 0;
      nextY = nextY + yOffset;
    }
  }
  textAlign(CENTER, CENTER);
}


int paintModes = 3;
int curPaintMode = 0;
void nextPaintMode(int direction) {
  curPaintMode = (curPaintMode + direction) % paintModes;
  if (curPaintMode < 0) curPaintMode = paintModes - 1;
}

void setFill(int locX, int locY) {

  if (locX < 0) locX = 0;
  if (locX >= width) locX = width-1;
  if (locY < 0) locY = 0;
  if (locY >= height) locY = height-1;

  switch(curPaintMode) {

    case 0:
    default:
      if (blackNotWhite) {
        fill(0, height, 0);
      } else {
        fill(0, 0, 100);
      }

      break;

    // this is the one I'm really interested in for the project
    case 2:
      int loc = locX + locY * width;
//      println(loc + "/" + img.pixels.length + " locX: " + locX + " locY: " + locY);
      float h = hue(img.pixels[loc]);
      float s = saturation(img.pixels[loc]);
      float b = brightness(img.pixels[loc]);
      fill(h, s, b);
      break;

    case 1:
      // TODO: fill based on... mouseX/MouseY + offset?
      fill(locX, locY, 100);
      break;
  }
}

boolean autoPaintMode = false;
void toggleAutoPaintMode() {
  autoPaintMode = !autoPaintMode;
}

void autoPaintRegion(int minX, int minY, int maxX, int maxY) {
  int locX = (int)random(minX, maxX),
        locY = (int)random(minY, maxY);
  paintWordAtPoint(locX, locY);
}


String save() {
  String filename = "image.text." + frameCount + ".png";
  saveFrame(filename);
  println("saved as: " + filename);
  return filename;
}


void keyPressed() {

  if (key == CODED) {
    if (keyCode == UP || keyCode == DOWN) {
      if (keyCode == UP) {
          changeTextsize(1);
        } else {
          changeTextsize(-1);
        }
      } else if (keyCode == RIGHT || keyCode == LEFT) {
      if (keyCode == RIGHT) {
          setJitRange(1);
        } else {
          setJitRange(-1);
        }
      } else if (keyCode == BACKSPACE || keycode == DELETE) {
        clearScreen();
      }

  }

  switch(key) {

    case '1':
      setImage(1);
      break;

    case '2':
      setImage(2);
      break;

    case '3':
      setImage(3);
      break;

    case '4':
      setImage(4);
      break;

    case 'a':
      toggleAutoPaintMode();
      break;

    case 'c':
      clearScreen();
      break;

    case 'g':
      paintGrid();
      break;

    case 'm':
      nextPaintMode(1);
      break;
    case 'M':
      nextPaintMode(-1);
      break;

    case 's':
      save();
      break;

    case 'x':
    case 'X':
      blackNotWhite = !blackNotWhite;
      setFill(mouseX, mouseY);
      break;

    // not working in processing.js
    case DELETE:
    case BACKSPACE:
      clearScreen();
      break;
  }

}



class TextManager {

  String w = "";
  String defaultText = "Those are the pearls that were his eyes: Nothing of him that doth fade, But doth suffer a sea-change Into something rich and strange.";
  String SPLIT_TOKENS = " ?.,;:[]<>()\"";
  String words[];
  int charIndex = 0;
  int wordIndex = 0;

  TextManager() {
    w = defaultText;
    words = splitTokens(w,SPLIT_TOKENS);
  }

  TextManager(String wInput) {
    w = wInput;
    words = splitTokens(w, SPLIT_TOKENS);
  }

  // getChar and getWord indexes are not yoked together
  char getChar() {
    char c = w.charAt(charIndex);
    charIndex = (charIndex + 1) % w.length();
    return c;
  }

  String getWord() {
    String word = words[wordIndex];
    wordIndex = (wordIndex + 1) % words.length;
    return word;
  }

}

