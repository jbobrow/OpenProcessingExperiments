
PImage photograph;
PImage photograph2; //need a second copy of the image to allow redrawing
//starting values
int segments = 8;
float twistAngle = PI / 6;
int outerLimit;
int innerLimit;
int centreX;
int centreY;

PFont font;

boolean newPic = false;
boolean savePic = false;
boolean firstGo = true;
boolean middleUpright = false;

void setup() {
  size(640, 640);
  background(255, 255, 255, 0);
  smooth();
  noStroke();
  noLoop();
  font = loadFont("AmericanTypewriter-Bold-48.vlw");
}

void draw() {
  if (firstGo) {
    firstGo = false;
    textFont(font, 48);
    textAlign(CENTER);
    stroke(0, 0, 0);
    rect(200, 60, 240, 50);
    fill(#ad3110);
    text("twisted", width / 2, 100);
    noStroke();
    textFont(font, 24);
    text("Load image: o", width / 2, 225);
    text("Save image: p", width / 2, 250);
    text("Rotation: w s", width / 2, 300);
    text("Segments: a s", width / 2, 325);
    text("Outer radius: z x", width / 2, 350);
    text("Inner radius: , .", width / 2, 375);
    text("Reset: space", width / 2, 400);
    text("Move centre: arrow keys", width / 2, 450);
    text("Toggle middle: m", width / 2, 475);
    textFont(font, 8);
    textAlign(LEFT);
    text("Tom Curtis 2012", 10, 630);
    textAlign(RIGHT);
    text("Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported Licence", 630, 630);
    noFill();
  }
  if (newPic) {
    newPic = false;
    chooseImage();
  }
  if (photograph2 != null) {
    PGraphics circles = createGraphics(width, height, P2D);// set of off-screen images used to create effect
    circles.beginDraw();
    circles.image(photograph2, 0, 0); // plonk down plain photo as background
    circles.endDraw();
    int i;
    for (i = 0; i < segments; i++) { //add new layer onto the one below - goes outside in
      circles = maskedImage(photograph, drawCircle(outerLimit - (((outerLimit - innerLimit) / segments)*i), centreX, centreY), i * (twistAngle / segments), circles);
    }
    if (middleUpright) {
      circles = maskedImage(photograph, drawCircle(innerLimit, centreX, centreY), 0, circles);
    }
    stroke(0, 0, 0);
    rect(((width - photograph2.width) / 2) - 1, ((height - photograph2.height) / 2) - 1, photograph2.width + 1, photograph2.height + 1);
    noStroke();
    image(circles, (width - photograph2.width) / 2, (height - photograph2.height) / 2);
    if (savePic) {
      savePic = false;
      String savePath = selectOutput();
      if (savePath != null) {
        if (!savePath.endsWith(".jpg")) {
          savePath = savePath + ".jpg";
        }
        PGraphics saveImage = createGraphics(circles.width, circles.height, P2D);
        saveImage.beginDraw();
        saveImage.image(circles, 0, 0);
        File f;
        f = new File(savePath);
        if (!f.exists()) {
          saveImage.save(savePath);
        }
        saveImage.endDraw();
      }
    }
  }
}

//gives an off-screen graphics layer with a white ring around the centre. Use as a mask to extract bits you need from images
PGraphics drawCircle(int outerRadius, int centreX, int centreY) {
  PGraphics context = createGraphics(photograph2.width, photograph2.height, P2D);
  context.beginDraw();
  context.background(color(0, 0, 0, 255));
  context.ellipseMode(CENTER);
  context.fill(color(255, 255, 255, 255));
  context.ellipse(centreX, centreY, outerRadius, outerRadius);
  context.endDraw();
  return context;
}

//applies a mask to a photograph, to extract part. It then twists this part image round and plonks it on another image
PGraphics maskedImage(PImage inputImage, PGraphics maskImage, float angle, PGraphics context) {
  PGraphics outputImage = createGraphics(photograph2.width, photograph2.height, P2D);
  outputImage.beginDraw();
  outputImage.image(context, 0, 0);//put down the old photo first
  inputImage.mask(maskImage);//extract part of the photo
  outputImage.translate(centreX, centreY);//move origin to centre
  outputImage.rotate(angle); //rotate around origin
  outputImage.translate(-centreX, -centreY); //move origin back to normal
  outputImage.image(inputImage, 0, 0);//stick the (masked) photograph down
  outputImage.endDraw();
  return outputImage;
}

void keyPressed() {
  if (key == 'q') { // twist round less
    twistAngle = twistAngle - (PI / 100);
    redraw();
  }
  if (key == 'w') { // twist round further
    twistAngle = twistAngle + (PI / 100);
    redraw();
  }
  if (key == 'a') { // fewer segments
    if (segments > 1) {
      segments = segments - 1;
      redraw();
    }
  }
  if (key == 's') { // more segments (buggy)
//    if (segments < 20) {
      segments = segments + 1;
      redraw();
  //  }
  }
  if (key == ',') { // shrink inner radius
    if (innerLimit >= 10) {
      innerLimit = innerLimit - 10;
      redraw();
    }
  }
  if (key == '.') { // expand inner radius
    if (innerLimit <= outerLimit - 10) {
      innerLimit = innerLimit + 10;
      redraw();
    }
  }
  if (key == 'z') { // shrink outer radius
    if (outerLimit >= innerLimit + 10) {
      outerLimit = outerLimit - 10;
      redraw();
    }
  }
  if (key == 'x') { // expand the outer radius
    if (((centreX - (outerLimit / 2)) > 0) && ((centreX + (outerLimit / 2)) < photograph2.width) && ((centreY - (outerLimit / 2)) > 0) && ((centreY + (outerLimit / 2)) < photograph2.height)) {
      outerLimit = outerLimit + 10;
      redraw();
    }
  }
  if (key == ' ') { //space bar resets
    twistAngle = PI / 6;
    middleUpright = false;
    segments = 8;
    outerLimit = int(min(photograph2.width, photograph2.height) * 0.9);
    while ((outerLimit % 10) > 0) {
      outerLimit--;
    }
    innerLimit = int(min(photograph2.width, photograph2.height) * 0.1);
    while ((innerLimit % 10) > 0) {
      innerLimit--;
    }
    centreX = photograph2.width / 2;
    centreY = photograph2.height / 2;  
    redraw();
  }
  if (key == 'm') {
     middleUpright = !middleUpright;
     redraw();
  }
  if (key == CODED) { //arrow keys move the twisty zone
    if (keyCode == UP) {
      if ((centreY - (outerLimit / 2)) > 0) {
        centreY = centreY - 1;
        redraw();
      }
    }
    if (keyCode == DOWN) {
      if ((centreY + (outerLimit / 2)) < photograph2.height) {
        centreY = centreY + 1;
        redraw();
      }
    }
    if (keyCode == LEFT) {
      if ((centreX - (outerLimit / 2)) > 0) {
        centreX = centreX - 1;
         redraw();
      }
    }
    if (keyCode == RIGHT){
      if ((centreX + (outerLimit / 2)) < photograph2.width) {
        centreX = centreX + 1;
        redraw();
      }
    }
  }
}

void keyReleased() {
  if (key == 'o') {
    newPic = true;
    redraw();
  }
  if (key == 'p') {
    if (photograph2 != null) {
      savePic = true;
      redraw();
    }
  }
}

PImage getNewPicture(String loadPath) { // returns the selected photo
  PImage pimage1 = loadImage(loadPath);
  if ((pimage1 == null) || (pimage1.width == -1)) {
    exit();
  }
  if (pimage1.width > pimage1.height) {
    if (pimage1.width > 638) {
      pimage1.resize(638, int(638 * (pimage1.height / pimage1.width)));
    }
    if (pimage1.height > 638) {
      pimage1.resize(int(638 * (pimage1.height / pimage1.width)), 638);
    }
  }
  else {
    if (pimage1.height > 638) {
      pimage1.resize(int(638 * (pimage1.width / pimage1.height)), 638);
    }
    if (pimage1.width  > 638) {
      pimage1.resize(638, int(638 * (pimage1.height / pimage1.width)));
    }
  }
  outerLimit = int(min(pimage1.width, pimage1.height) * 0.9);
  while ((outerLimit % 10) > 0) {
    outerLimit--;
  }
  innerLimit = int(min(pimage1.width, pimage1.height) * 0.1);
  while ((innerLimit % 10) > 0) {
    innerLimit--;
  }
  centreX = pimage1.width / 2;
  centreY = pimage1.height / 2;
  return pimage1;
}

void chooseImage() {
  background(255, 255, 255, 0);
  String loadPath = "bridge.jpg"; // this is a special version where only one photo is hardcoded
  if (loadPath != null) {
    photograph = getNewPicture(loadPath);
    photograph2 = getNewPicture(loadPath);
  }
}

