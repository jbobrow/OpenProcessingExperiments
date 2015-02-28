
Slash7/ Freckle
Time. Energy. Money. Track them all with Freckle.
Powered by influAds
OpenProcessing
browsing all sketches
classrooms collections books
search
bah
Scattered Letters
pattern 09
pattern 08
pattern 07
pattern 06
idea
60
pattern 03
fullscreen
ScatteredLetters.pde
/**
 * Scattered Letters
 * by Algirdas Rascius.
 * <br/>
 * Click to restart.
 */
  
PFont font;
float currentSize;
 
void setup() {
  size(500, 500);
  colorMode(HSB, TWO_PI, 1, 1, 1);
  initFont();
  smooth();
   
  initialize();
}
 
void initFont() {
  char[] chars = new char['Z'-'A'+1];
  for (char c='A'; c<='Z'; c++) {
    chars[c-'A'] = c;
  }
  font = createFont("MyFont", 200, true, chars);
}
 
void draw() {
  if (currentSize > 10) {
    if (!randomLetter(currentSize)) {
      currentSize = currentSize*0.95;
    }
  }
}
 
void initialize() {
  background(color(0, 0, 1));
  currentSize = 300;
}
 
void mouseClicked() {
   initialize();
}
 
void keyPressed() {
   initialize();
}
 
 
boolean randomLetter(float letterSize) {
  int intSize = (int)letterSize;
 
  PGraphics g = createGraphics(intSize, intSize, JAVA2D);
  g.beginDraw();
  g.background(color(0, 0, 1, 0));
  g.fill(color(0, 0, 0));
  g.textAlign(CENTER, CENTER);
  g.translate(letterSize/2, letterSize/2);
  g.rotate(random(TWO_PI));
  g.scale(letterSize/300);
  g.textFont(font);
  g.text((char)random('A', 'Z'+1), 0, 0);
  g.endDraw();
 
  PGraphics gMask = createGraphics(intSize, intSize, P2D);
  gMask.beginDraw();
  gMask.background(color(0, 0, 1, 1));
  gMask.image(g, 0, 0);
  gMask.filter(ERODE); 
  gMask.filter(ERODE);
  gMask.endDraw();
   
  for (int tries=50; tries>0; tries--) {
    int x = (int)random(width-intSize);
    int y = (int)random(height-intSize);
     
    boolean fits = true;
    for (int dx = 0; dx<intSize && fits; dx++) {
      for (int dy = 0; dy<intSize && fits; dy++) {
        if (brightness(gMask.get(dx, dy))<0.5) {
          if (brightness(get(x+dx, y+dy))<0.5) {
            fits = false;
          }
        }
      }
    }
    if (fits) {
      image(g, x, y);
      return true;
    }
  }
  return false;
}
                
                
