
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
  background (#57385c);

  // image(PImage, x, y);
  // image(PImage, x, y, breite, hÃ�Â¶he);

  int i = 0;
  int anzahlDerElemente = (int) random (20, 40);
  while (i < anzahlDerElemente) {
    int j = 0;
    float x = random (0, width);
    float y = random (0, height);
    float scaleing = random (0.1, 0.4);
    int anzahlDerBlumen = (int) random (2, 10);
    
    while (j < anzahlDerBlumen) {
      float angle = j * TWO_PI / anzahlDerBlumen;
      
      
      drawImage(blume, x, y, angle, scaleing, 2);

      
      j = j + 1;
    }
    
    drawImage(beeren, x, y, 0, scaleing*random (0.7, 0.9), 1);
    i = i + 1;
  }
  
  // rahmen
  strokeWeight (40);
  stroke (#ffedbc);
  noFill();
  rect (0, 0, width, height);
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



