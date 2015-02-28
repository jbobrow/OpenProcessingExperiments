
int i, j;
int btn1 = 25;
int btn2 = 25;
int btn3 = 25;
char mode;

PImage img;
PImage invertImg;
PImage thresholdImg;
PImage posterizeImg;

PFont fontT;
PFont fontI;
PFont fontP;

void setup() {
  size(600, 650);
  smooth();

  img = loadImage("pika.jpg");

  invertImg = loadImage("pika.jpg");
  invertImg.filter(INVERT);
  thresholdImg = loadImage("pika.jpg");
  thresholdImg.filter(THRESHOLD);
  posterizeImg = loadImage("pika.jpg");
  posterizeImg.filter(POSTERIZE, 3);

  fontT = loadFont("SansSerif-48.vlw");
  fontI = loadFont("SansSerif-48.vlw");
  fontP = loadFont("SansSerif-48.vlw");
}

void draw() {

  background(0);
  image(img, 0, 0);

  fill (255);
  ellipse (260, 620, btn1, btn1);
  ellipse (300, 620, btn2, btn2);
  ellipse (340, 620, btn3, btn3);
  
  fill (0);
  textFont(fontT, 20);
  textFont(fontI, 20);
  textFont(fontP, 20);
  text ("T", 260 - textWidth("T")/2, 628);
  text ("I", 300 - textWidth("I")/2, 628);
  text ("P", 340 - textWidth("P")/2, 628);

  if (mode == 'T') {
    turnThreshold();
  }
  else if (mode == 'I') {
    turnInvert();
  }
  else if (mode == 'P') {
    turnPosterize();
  }
}

void turnThreshold() {

  if (mouseX >= 0 && mouseY >= 0 && mouseX <= 600 && mouseY <=600) {
    thresholdImg.loadPixels();
    img.loadPixels();
    loadPixels();

    for (i = 0; i < width; i++)
    {
      for (j = 0; j < 600; j++ )
      {
        int loc = i + j*width;
        float distance = dist(i, j, mouseX, mouseY);
        float fo = constrain((300-distance)/300, 0, 1);

        float r = (1-fo)*red(img.pixels[loc])+fo*red(thresholdImg.pixels[loc]);
        float g = (1-fo)*green(img.pixels[loc])+fo*green(thresholdImg.pixels[loc]);
        float b = (1-fo)*blue(img.pixels[loc])+fo*blue(thresholdImg.pixels[loc]); 

        pixels[loc] = color(r, g, b);
      }
    }
    updatePixels();
  }
}

void turnInvert() {

  if (mouseX >= 0 && mouseY >= 0 && mouseX <= 600 && mouseY <=600) {
    invertImg.loadPixels();
    img.loadPixels();
    loadPixels();

    for (i = 0; i < width; i++)
    {
      for (j = 0; j < 600; j++ )
      {
        int loc = i + j*width;
        float distance = dist(i, j, mouseX, mouseY);
        float fo = constrain((300-distance)/300, 0, 1);

        float r = (1-fo)*red(img.pixels[loc])+fo*red(invertImg.pixels[loc]);
        float g = (1-fo)*green(img.pixels[loc])+fo*green(invertImg.pixels[loc]);
        float b = (1-fo)*blue(img.pixels[loc])+fo*blue(invertImg.pixels[loc]); 

        pixels[loc] = color(r, g, b);
      }
    }
    updatePixels();
  }
}

void turnPosterize() {

  //  if (mouseX >= 0 && mouseY >= 0 && mouseX <= 600 && mouseY <=600) {
  posterizeImg.loadPixels();
  img.loadPixels();
  loadPixels();

  for (i = 0; i < width; i++)
  {
    for (j = 0; j < 600; j++ )
    {
      int loc = i + j*width;
      float distance = dist(i, j, mouseX, mouseY);
      float fo = constrain((300-distance)/300, 0, 1);

      float r = (1-fo)*red(img.pixels[loc])+fo*red(posterizeImg.pixels[loc]);
      float g = (1-fo)*green(img.pixels[loc])+fo*green(posterizeImg.pixels[loc]);
      float b = (1-fo)*blue(img.pixels[loc])+fo*blue(posterizeImg.pixels[loc]); 

      pixels[loc] = color(r, g, b);
    }
  }
  updatePixels();
  //  }
}

void mouseMoved() {
  if (mouseY >= 607.5 && mouseY <= 632.5) {

    if (mouseX >= 247.5 && mouseX <= 272.5) {
      btn1 = 35;
    }
    else {
      btn1 = 25;
    }

    if (mouseX >= 287.5 && mouseX <= 312.5) {
      btn2 = 35;
    }
    else {
      btn2 = 25;
    }

    if (mouseX >= 327.5 && mouseX <= 352.5) {
      btn3 = 35;
    }
    else {
      btn3 = 25;
    }
  }
}

void mouseClicked() {
  if (mouseY >= 607.5 && mouseY <= 632.5) {
    if (mouseX >= 247.5 && mouseX <= 272.5) {
      mode = 'T';
    }
    if (mouseX >= 287.5 && mouseX <= 312.5) {
      mode = 'I';
    }
    if (mouseX >= 327.5 && mouseX <= 352.5) {
      mode = 'P';
    }
  }
}


