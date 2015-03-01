
PImage blume = null;
PImage beeren = null;

 /* @pjs preload="blume_01.png, beeren.png"; */ 

void setup() {

  size(600, 600);
  smooth();
  blume = loadImage("blume_01.png");
  beeren = loadImage("beeren.png");
  noLoop();
}

void draw () {
  background (#ffedbc);

  // image(PImage, x, y);
  // image(PImage, x, y, breite, hÃ¶he);
  drawImage(blume, width/2, height/2, random (0, TWO_PI), 0.6, 2);
  
  drawImage(beeren, width/2, height/2, random (0, TWO_PI), 0.3, 1);
}


void drawImage(PImage img, float x, float y, float rotation, float scaleing, int rotationPoint) {

  float imgWidth = img.width * scaleing;
  float imgHeight = img.height * scaleing; 
  
  /**
   * rotationPoint
   * 0 = oben links
   * 1 = mitte
   * 2 = unten mitte
   */
   
   float imgX = 0;
   float imgY = 0;
   
   if (rotationPoint == 0) {
     // entspricht der Voreinstellung
   } else if (rotationPoint == 1) {
     imgX = imgX - imgWidth/2;
     imgY = imgY - imgHeight/2;
   } else if (rotationPoint == 2) {
     imgX = imgX - imgWidth/2;
     imgY = imgY - imgHeight;
   }
   
  pushMatrix();
  translate(x, y);
  rotate(rotation+PI);
  scale (scaleing);
  image(img, imgX, imgY, imgWidth, imgHeight);
  popMatrix();
}


void mousePressed () {
  redraw();
}


