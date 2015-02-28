
PGraphics offscreenViz, offscreenMask;
PImage maskedPI;
int currentScreen;
PrismPalette palette = new PrismPalette();
int paletteLength;
boolean boolSaveFrame, boolRandomizeAngles, boolUseMask, boolUpdateMask;
float[] angles;
boolean boolRandomizeAngles;
String[] statusDescriptions;
float lineWidth;

void setup() {
  size(1200, 700);
  colorMode(HSB, 360, 100, 100, 100);
  initLineStatuses();
  offscreenViz = createGraphics(width, height, JAVA2D);
  offscreenMask = createGraphics(width, height, JAVA2D);
  lineWidth = width * 1.6f;
  paletteLength = 13;
  angles = rotationAngles();
  drawVizOffscreen();
  drawMaskOffscreen();
  maskOffscreenViz();
}
void maskOffscreenViz() {
  //  maskedPI = offscreenViz.get(); //not working in processingjs
  //  maskedPI.mask(offscreenMask);
  offscreenViz.loadPixels();
  offscreenMask.loadPixels();
  for ( int i = 0; i < offscreenViz.pixels.length; i++ ) {
    offscreenViz.pixels[i] = (offscreenViz.pixels[i] & 0x00FFFFFF) + ((offscreenMask.pixels[i] & 0xFF) << 24);
  }
  offscreenViz.updatePixels();
}
void draw() {
  if (boolRandomizeAngles) {
    angles = rotationAngles();
    boolRandomizeAngles = false;
  }
  drawVizOffscreen();
  if (boolUpdateMask) {
    drawMaskOffscreen();
    boolUpdateMask = !boolUpdateMask;
  }

  if (boolUseMask) {
    maskOffscreenViz();
  }
  background(0, 0, 100, 100);
  image(offscreenViz, 0, 0);
  //this.g.removeCache(maskedPI);
  if (boolSaveFrame) {
    saveFrame("frames/tubeLines/" + year() + "-" + month() + "-" + day() + "/" + hour() + ":" + minute() + ":" + second() + ".png");
    boolSaveFrame = !boolSaveFrame;
  }
}
void mousePressed() {
  boolUpdateMask = !boolUpdateMask;
  println(statusDescriptions);
  boolUseMask = !boolUseMask;
}
void keyPressed() {
  if (key == 's') {
    boolSaveFrame = !boolSaveFrame;
  }
  if (key == 'm') {
    boolUseMask = !boolUseMask;
  }
  if (key == 'r') {
    boolRandomizeAngles = !boolRandomizeAngles;
  }
}

float[] rotationAngles() {
  float[] angles = new float[13];
  for (int i = 0; i < 13; i++) {
    angles[i] = random(-21, 21);
  }
  return angles;
}

void drawMaskOffscreen() {
  offscreenMask.beginDraw();
  offscreenMask.smooth();
  offscreenMask.noStroke();
  offscreenMask.fill(3);
  offscreenMask.pushMatrix();
  offscreenMask.rect(0, 0, width, height);
  offscreenMask.fill(255);
  float radius = width / random(4, 3);
  offscreenMask.translate(width / 2, height / 2);
  triangularMask();
  offscreenMask.popMatrix();
  offscreenMask.endDraw();
}

void triangularMask() {
  offscreenMask.beginShape();
  offscreenMask.vertex(random(00, 20) - width / 4, random(50, 100) - height / 2);
  offscreenMask.vertex(random(500, 600) - width / 4, random(50, 200) - height / 2);
  offscreenMask.vertex(300 - width / 4, height / 2-10);
  offscreenMask.endShape(CLOSE);
}
class PrismPalette {
  int colArr[] = new int[13];

  PrismPalette() {
    colArr[0] = (int) unhex("FFA0A5A9");
    colArr[1] = (int) unhex("FF00A4A7");
    colArr[2] = (int) unhex("FF95CDBA");
    colArr[3] = (int) unhex("FF00782A");
    colArr[4] = (int) unhex("FF84B817");
    colArr[5] = (int) unhex("FF003688");
    colArr[6] = (int) unhex("FFFFD300");
    colArr[7] = (int) unhex("FFEE7C0E");
    colArr[8] = (int) unhex("FFB36305");
    colArr[9] = (int) unhex("FF9B0056");
    colArr[10] = (int) unhex("FF000000");
    colArr[11] = (int) unhex("FFF3A9BB");
    colArr[12] = (int) unhex("FFE32017");
  }

  int getColour(int i) {
    return colArr[i];
  }
}
void initLineStatuses() {
  XML xml = loadXML("xml/LineStatus.xml");
  XML[] lineStatuses = xml.getChildren("LineStatus");
  println(lineStatuses);
  
  //test array already parsed for openprocessing.org
  String[] parsedArray = new String[13];
  parsedArray[0] = "Minor Delays";
  parsedArray[1] = "Good Service";
  parsedArray[2] = "Planned Closure";
  parsedArray[3] = "Good Service";
  parsedArray[4] = "Good Service";
  parsedArray[5] = "Good Service";
  parsedArray[6] = "Good Service";
  parsedArray[7] = "Good Service";
  parsedArray[8] = "Good Service";
  parsedArray[9] = "Part Suspended";
  parsedArray[10] = "Severe Delays";
  parsedArray[11] = "Good Service";
  parsedArray[12] = "Good Service";

  
//  statusDescriptions = new String[lineStatuses.length];
    statusDescriptions = parsedArray;
/*  
  for (int i = 0; i < lineStatuses.length; i++) {

    String currentLineName = lineStatuses[i].getChild("Line").getString("Name");
    String currentLineStatusDescription = lineStatuses[i].getChild("Status").getString("Description");

    if ("Jubilee".equals(currentLineName)) {
      statusDescriptions[0] = currentLineStatusDescription;
    } 
    else if ("Victoria".equals(currentLineName)) {
      statusDescriptions[1] = currentLineStatusDescription;
    } 
    else if ("Waterloo and City".equals(currentLineName)) {
      statusDescriptions[2] = currentLineStatusDescription;
    } 
    else if ("District".equals(currentLineName)) {
      statusDescriptions[3] = currentLineStatusDescription;
    } 
    else if ("DLR".equals(currentLineName)) {
      statusDescriptions[4] = currentLineStatusDescription;
    } 
    else if ("Piccadilly".equals(currentLineName)) {
      statusDescriptions[5] = currentLineStatusDescription;
    } 
    else if ("Circle".equals(currentLineName)) {
      statusDescriptions[6] = currentLineStatusDescription;
    } 
    else if ("Overground".equals(currentLineName)) {
      statusDescriptions[7] = currentLineStatusDescription;
    } 
    else if ("Bakerloo".equals(currentLineName)) {
      statusDescriptions[8] = currentLineStatusDescription;
    } 
    else if ("Metropolitan".equals(currentLineName)) {
      statusDescriptions[9] = currentLineStatusDescription;
    } 
    else if ("Northern".equals(currentLineName)) {
      statusDescriptions[10] = currentLineStatusDescription;
    } 
    else if ("Hammersmith and City".equals(currentLineName)) {
      statusDescriptions[11] = currentLineStatusDescription;
    } 
    else if ("Central".equals(currentLineName)) {
      statusDescriptions[12] = currentLineStatusDescription;
    }
  }
  */
}

void drawVizOffscreen() {
  int numDashes = 180;
  int strokeThickness = 40;
  int dotPeriod = 6;

  offscreenViz.beginDraw();
  offscreenViz.smooth();
  offscreenViz.strokeWeight(strokeThickness);
  offscreenViz.colorMode(HSB, 360, 100, 100, 100);
  offscreenViz.background(0, 0, 100, 100);
  offscreenViz.pushMatrix();
  offscreenViz.translate(width / 2, height);

  rectMode(CORNER);

  for (int i = 0; i < paletteLength; i++) {
    offscreenViz.translate(0, -strokeThickness);
    offscreenViz.rotate(radians(angles[i]+ i / 5));

    if ("Severe Delays".equals(statusDescriptions[i])) {

      numDashes = 190;
      strokeThickness = 40;
      dotPeriod = 8;

      offscreenViz.stroke(hue(palette.getColour(i)), 
      saturation(palette.getColour(i)), 
      brightness(palette.getColour(i)), 80);
      offscreenViz.line(-lineWidth / 2, 0, lineWidth / 2, 0);
      offscreenViz.noStroke();
      for (float j = 0; j <= numDashes; j++) {
        float x = lerp(-lineWidth / 2, lineWidth / 2, 
        (float) (j / numDashes));
        float y = 0;
        offscreenViz.fill(hue(palette.getColour(i)), 
        saturation(palette.getColour(i)), 
        brightness(palette.getColour(i)), 90);
        offscreenViz.rect(x, (-strokeThickness / 2) + 1, 15, strokeThickness - 2);
        if (j % dotPeriod == 0) {
          offscreenViz.fill(0, 0, 100, 100);
          offscreenViz.ellipse(x, 0, strokeThickness / 3, 
          strokeThickness / 3);
        }
      }
    } 
    else if ("Minor Delays".equals(statusDescriptions[i])) {

      numDashes = 190;
      strokeThickness = 40;
      dotPeriod = 3;

      offscreenViz.stroke(hue(palette.getColour(i)), 
      saturation(palette.getColour(i)), 
      brightness(palette.getColour(i)), 80);
      offscreenViz.line(-lineWidth / 2, 0, lineWidth / 2, 0);
      offscreenViz.noStroke();
      for (float j = 0; j <= numDashes; j++) {
        float x = lerp(-lineWidth / 2, lineWidth / 2, 
        (float) (j / numDashes));
        float y = 0;
        offscreenViz.fill(hue(palette.getColour(i)), 
        saturation(palette.getColour(i)), 
        brightness(palette.getColour(i)), 90);
        offscreenViz.rect(x, (-strokeThickness / 2) + 1, 15, 
        strokeThickness - 2);
        if (j % dotPeriod == 0) {
          offscreenViz.fill(0, 0, 100, 100);
          offscreenViz.ellipse(x, 0, strokeThickness / 3, 
          strokeThickness / 3);
        }
      }
    } 
    else if ("Planned Closure".equals(statusDescriptions[i])) {
      numDashes = 500;

      offscreenViz.stroke(hue(palette.getColour(i)), 
      saturation(palette.getColour(i)), 
      brightness(palette.getColour(i)), 90);
      offscreenViz.line(-lineWidth / 2, 0, lineWidth / 2, 0);
      offscreenViz.noStroke();
      for (float j = 0; j <= numDashes; j++) {
        float x = lerp(-lineWidth / 2, lineWidth / 2, 
        (float) (j / numDashes));
        float y = 0;
        offscreenViz.fill(0, 0, 100, 100);
        offscreenViz.rect(x, (-strokeThickness / 2), 1, 
        strokeThickness);
      }
    } 
    else if ("Part Suspended".equals(statusDescriptions[i])) {
      numDashes = 5;
      offscreenViz.stroke(hue(palette.getColour(i)), 
      saturation(palette.getColour(i)), 
      brightness(palette.getColour(i)), 90);
      offscreenViz.line(-lineWidth / 2, 0, lineWidth / 2, 0);
      offscreenViz.noStroke();
      for (float j = 0; j <= numDashes; j++) {
        float x = lerp(-lineWidth / 2, lineWidth / 2, 
        (float) (j / numDashes));
        offscreenViz.fill(0, 0, 100, 100);
        offscreenViz.rect(x, (-strokeThickness / 2)-1, 250, 
        strokeThickness + 2);
      }
    } 
    else {
      offscreenViz.stroke(hue(palette.getColour(i)), 
      saturation(palette.getColour(i)), 
      brightness(palette.getColour(i)), 90);
      offscreenViz.line(-lineWidth / 2, 0, lineWidth / 2, 0);
    }

    offscreenViz.rotate(-radians(angles[i]));
  }
  offscreenViz.popMatrix();

  offscreenViz.endDraw();
}
