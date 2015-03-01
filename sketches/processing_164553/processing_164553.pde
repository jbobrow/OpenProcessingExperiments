
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/164100*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* @pjs preload="Pic_1.jpg,Pic_2.jpg,Pic_3.jpg,Pic_4.jpg,Dreieck.jpg; */
/*
 If running in processing you can use the PGraphics-Object instead 
 of the PImage imgMask
 In processingjs the PGraphics mask doesn't work
 
 click canvas to choose an other part of the image
 
 keys:
 0 - 3 to choose image
 s = saveframe
 < > = decrease / increase triangles  
 m = turn symmetry On/Off
 
 */
PImage[] myImg; 
PImage block;
PImage imgMask; 
//PGraphics imgMask;    
float seite, hoehe;
int intSeite, intHoehe;
int numImage = 0;
int px, py; 
boolean mirror = true; 

void setup() {
  size(600, 600); 
  background(255); 
  smooth();
  noStroke();
  noLoop(); 

  seite = 100; 
  hoehe = sqrt(3.0)/2.0 * seite;

  intSeite = (int) seite;
  intHoehe = (int) hoehe + 1;  

  myImg = new PImage[4]; 
  myImg[0] = loadImage("Pic_1.jpg");
  myImg[0].resize(width, height); 
  myImg[1] = loadImage("Pic_2.jpg");
  myImg[1].resize(width, height);
  myImg[2] = loadImage("Pic_3.jpg");
  myImg[2].resize(width, height);
  myImg[3] = loadImage("Pic_4.jpg");
  myImg[3].resize(width, height);

  imgMask = loadImage("Dreieck.jpg");
  imgMask.resize(intSeite, intHoehe);

  /*
  imgMask = createGraphics(intSeite, intHoehe); 
   imgMask.beginDraw(); 
   imgMask.background(0); 
   imgMask.noStroke(); 
   imgMask.triangle(intSeite/2, -2, intSeite+2, intHoehe+2, -2, intHoehe+2);
   imgMask.endDraw();
   */

  block = createImage(intSeite, intHoehe, RGB);
  block.copy(myImg[numImage], width/2, height/2, intSeite, intHoehe, 0, 0, intSeite, intHoehe);
  block.mask(imgMask);
  if (mirror) {
    mirrorBlock();
  } 

  px = width/2; 
  py = height/2;
}

void draw() {
  background(255);   

  int xStart, yStart; 
  int xStep = 3*intSeite/2; 
  xStart = 0; 
  yStart = 0; 

  for (int y = 0; y < height+intHoehe; y += intHoehe) {
    for (int x = xStart; x < width+intSeite; x += intSeite*3) { 
      float angle = 60; 
      pushMatrix();
      translate(x, y); 
      for (int i = 0; i < 6; i++) {
        image(block, -intSeite/2, 0);
        rotate(radians(angle));
      }
      popMatrix();
    }
    xStart += xStep;
    xStep *= -1;
  }
}

void mouseReleased() {
  int x, y; 
  x = (int) constrain(mouseX, seite, width-seite);
  y = (int) constrain(mouseY - seite/2, seite, height-seite);
  block.copy(myImg[numImage], x, y, intSeite, intHoehe, 0, 0, intSeite, intHoehe);
  block.mask(imgMask);
  if (mirror) {  
    mirrorBlock();
  } 
  px = x; 
  py = y; 
  redraw();
}

void mirrorBlock() {
  int halfWidth = (int) intSeite / 2; 

  block.loadPixels();
  for (int x = 0; x < halfWidth; x++) { 
    for (int y = 0; y < intHoehe; y++) {
      int loc = x + y * intSeite; 
      int newLoc = (intSeite - 1) - x + y * intSeite; 
      block.pixels[loc] = block.pixels[newLoc];
    }
  }
  block.updatePixels();
}

void keyReleased() {
  if (key == '0') {
    numImage = 0;
  }
  if (key == '1') {
    numImage = 1;
  }
  if (key == '2') {
    numImage = 2;
  }
  if (key == '3') {
    numImage = 3;
  }

  if (key == '<' || key == '>') {
    if (key == '<') {
      seite = constrain(seite -= 10, 50, 200);
    }
    if (key == '>') {
      seite = constrain(seite += 10, 50, 200);
    }
    hoehe = sqrt(3.0)/2.0 * seite;
    intSeite = (int) seite;
    intHoehe = (int) hoehe + 1;

    imgMask.resize(intSeite, intHoehe);
    block.resize(intSeite, intHoehe);

    redrawKal();
  }

  if (key == 'm' || key == 'M') {
    mirror = !mirror;
    redrawKal();
  }

  if (key == '0' || key == '1' || key == '2' || key == '3') {
    redrawKal();
  }

  if (key == 's' || key == 'S') {
    String datum; 
    datum = str(year()) + str(month()) + str(day()) + str(hour()) + str(minute()) + str(second());     
    saveFrame(datum +"_####.jpg");
  }
}

void redrawKal() {
  block.copy(myImg[numImage], px, py, intSeite, intHoehe, 0, 0, intSeite, intHoehe);
  block.mask(imgMask);
  if (mirror) {
    mirrorBlock();
  } 
  redraw();
}



