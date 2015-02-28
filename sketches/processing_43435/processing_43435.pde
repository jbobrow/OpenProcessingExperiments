
/* Fill in the outline!
 * +/- change brush size
 * SPACE clears the canvas
 */

PFont font;
PImage canvasImage;
Palette palette;

int brushSize;
PImage currentCanvas;

PImage movingStrokes[];
PImage nextCanvases[];
float moveX[];
float moveY[];

/* this is null if the user is not currently painting */
PImage currentStroke;

void setup() {
  size(600, 400);
  ellipseMode(CENTER_RADIUS);
  
  font = loadFont("Apple_Chancery.vlw");
  canvasImage = loadImage("blank_face.jpg");
  movingStrokes = new PImage[4];
  nextCanvases = new PImage[5];
  moveX = new float[4];
  moveY = new float[4];
  
  clearCanvas();
  
  PaletteColor[] paletteColors = {
    new PaletteColor("Grumpy", "Green", "grumpy_green.jpg", 200, 178, 80),
    new PaletteColor("Bleak", "Blue", "bleak_blue.jpg", 80, 185, 80),
    new PaletteColor("Lucious", "Lavendar", "lucious_lavendar.jpg", 160, 250, 80),
    new PaletteColor("Devious", "Dark", "devious_dark.jpg", 140, 115, 80),
    new PaletteColor("Cross", "Crimson", "cross_crimson.jpg", 130, 250, 80),
    new PaletteColor("Pouting", "Peach", "pouty_peach.jpg", 145, 280, 80),
    new PaletteColor("Grinning", "Gold", "grinning_gold.jpg", 110, 240, 80),
    new PaletteColor("Innocent", "Ivory", "innocent_ivory.jpg", 30, 130, 80)
  };
  
  palette = new Palette(paletteColors);
  
  brushSize = 8;
}

void draw() {
  background(0xFF333333);
  
  image(currentCanvas, 100, 0);
  
  for(int i=movingStrokes.length-1; i>=0; i--) {
    if(movingStrokes[i] != null) {
      float x = moveX[i] + 20*(mouseX-width/2)/width;
      float y = moveY[i] + 20*(mouseY-height/2)/height;
      image(movingStrokes[i], 100+x, 0+y);
    }
  }
  if(currentStroke != null) {
    image(currentStroke, 100, 0);
  }
  
  palette.drawPalette();
  
  if(palette.inPalette(mouseX, mouseY)) {
    cursor(HAND);
  } else {
    cursor(CROSS);
    
    if(!mousePressed) {
      strokeWeight(1);
      stroke(0xFF999999);
      noFill();
      ellipse(mouseX, mouseY, brushSize, brushSize);
    } else if(currentStroke != null) {
      palette.paint(currentStroke, mouseX-100, mouseY, brushSize);
      palette.paint(nextCanvases[0], mouseX-100, mouseY, brushSize);
    }
  }
}

void startStroke() {
  currentStroke = createImage(canvasImage.width, canvasImage.height, ARGB);
  
  for(int i=nextCanvases.length-1; i>=1; i--) {
    nextCanvases[i] = nextCanvases[i-1];
  }
  nextCanvases[0] = createImage(nextCanvases[1].width, nextCanvases[1].height, ARGB);
  for(int i=0; i<nextCanvases[1].pixels.length; i++) {
    nextCanvases[0].pixels[i] = nextCanvases[1].pixels[i];
  }
  //nextCanvases[0] = nextCanvases[1].copy();
}

void endStroke() {
  currentCanvas = nextCanvases[nextCanvases.length-1];
  
  for(int i=movingStrokes.length-1; i>=1; i--) {
    movingStrokes[i] = movingStrokes[i-1];
  }
  movingStrokes[0] = currentStroke;
  currentStroke = null;
}

void clearCanvas() {
  currentCanvas = createImage(canvasImage.width, canvasImage.height, ARGB);
  for(int i=0; i<canvasImage.pixels.length; i++) {
    currentCanvas.pixels[i] = canvasImage.pixels[i] | 0xFF000000;
  }
  //currentCanvas = canvasImage.copy();
  currentStroke = null;
  Arrays.fill(movingStrokes, null);
  Arrays.fill(nextCanvases, currentCanvas);
  Arrays.fill(moveX, 0);
  Arrays.fill(moveY, 0);
}

void mousePressed() {
  if(palette.inPalette(mouseX, mouseY)) {
    palette.pickColor(mouseX, mouseY);
  } else {
    startStroke();    
  }
}

void mouseReleased() {
  if(currentStroke != null) {
    endStroke();
  }
}

void mouseMoved() {
  for(int i=0; i<moveX.length; i++) {
    moveX[i] = random(-2, 2);
    moveY[i] = random(-2, 2);
  }
}

void keyPressed() {
  if(key == ' ') {
    clearCanvas();
  } else if(key == '-' || key == '_') {
    brushSize = constrain(brushSize-1, 2, 20);
  } else if(key == '=' || key == '+') {
    brushSize = constrain(brushSize+1, 2, 20);
  }
}


// Inner Classes ------------------------------------------------------------

class Palette {
  PaletteColor[] allColors;
  PaletteColor currentColor;
  
  Palette(PaletteColor[] colors) {
    allColors = colors;
    currentColor = colors[0];
  }
  
  void drawPalette() {
    for(int i=0; i<allColors.length/2; i++) {
      allColors[i].drawColor(0, i * 100, allColors[i]==currentColor);
      allColors[i + allColors.length/2].drawColor(width-100, i * 100, allColors[i + allColors.length/2]==currentColor);
    }
  }
  
  void paint(PImage canvas, int x0, int y0, int brushSize) {
    float r;
    color c;
    
    for(int y=y0-brushSize; y<y0+brushSize; y++) {
      for(int x=0-brushSize; x<x0+brushSize; x++) {
        r = sqrt((x-x0)*(x-x0) + (y-y0)*(y-y0));
        if(r<=brushSize) {
          c = currentColor.baseImage.get(x, y);
          canvas.set(x, y, c);
        }
      }
    }
  }
  
  void pickColor(int x, int y) {
    if(x>=100 && x<width-100) {
      return;
    }
    
    currentColor = allColors[allColors.length/2*(x<width/2?0:1) + y/100];
  }
  
  boolean inPalette(int x, int y) {
    return x<100 || x>=width-100;
  }
}

class PaletteColor {
  String adjName, colName;
  PImage baseImage;
  PImage sampleImage;
  
  PaletteColor(String aName, String cName, String baseImageName, int sampleX, int sampleY, int sampleWidth) {
    adjName = aName;
    colName = cName;
    baseImage = loadImage(baseImageName);
    sampleImage = baseImage.get(sampleX, sampleY, sampleWidth, sampleWidth);
  }
  
  void drawColor(int x, int y, boolean selected) {
    /* If selected, make text yellow, otherwise white */
    color textColor = selected ? 0xFFFFFF00 : 0xFFFFFFFF;
    int _textWidth;
    
    textFont(font, 25);
    
    image(sampleImage, x + 10, y + 10, 80, 80);
    
    _textWidth = (int)textWidth(adjName);
    fill(0xFF333333);
    text(adjName, x + 50-_textWidth/2-1, y + 14);
    text(adjName, x + 50-_textWidth/2-1, y + 16);
    text(adjName, x + 50-_textWidth/2+1, y + 14);
    text(adjName, x + 50-_textWidth/2+1, y + 16);
    fill(textColor);
    text(adjName, x + 50-_textWidth/2, y + 15);
    
    _textWidth = (int)textWidth(colName);
    fill(0xFF333333);
    text(colName, x + 50-_textWidth/2-1, y + 94);
    text(colName, x + 50-_textWidth/2-1, y + 96);
    text(colName, x + 50-_textWidth/2+1, y + 94);
    text(colName, x + 50-_textWidth/2+1, y + 96);
    fill(textColor);
    text(colName, x + 50-_textWidth/2, y + 95);
  }
}

