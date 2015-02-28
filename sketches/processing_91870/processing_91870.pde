
int imageHeight = 78;
int imageWidth = 98;
int eggTopx = 100;
int eggTopy = 300;
PImage img0, img1, img3;
boolean commenceHatch = false;

PImage[] images = new PImage[4]; // Supposing we have 20 images
PImage egg = new PImage();
int counter = 0; 
final int DISPLAY_TIME = 2000; // 2000 ms = 2 seconds
int lastTime; // When the current image was first displayed
//int pointillize = 16;

void setup() {
  size(600, 600);
  background(0);
  smooth();
  fill(255);
  egg = loadImage("egg.jpg");
  for (int i = 0; i < images.length; i++)
  {
    images[i] = loadImage("chick" + i + ".jpg");
  }
  lastTime = millis();
}

void draw() {
  drawEgg();
  if (onEgg()) {
    tint(100); 
    promptEgg();
  }
  else {
    tint(255);
    unPromptEgg();
  }
  if (commenceHatch) {
    tint(255);
    drawChicks();
  }
}

boolean onEgg() {
  if ((mouseX > eggTopx) && (mouseY > eggTopy) &&
    (mouseX < eggTopx + imageWidth) && (mouseY < eggTopy + imageHeight)) {
    return true;
  }
  else {
    return false;
  }
}


void promptEgg() {
  if (!commenceHatch) { 
    fill(255);
  }
  else {
    fill(0); // no point prompting if hatching has commenced already!
  }
  writeText();
}

void writeText() {
  textSize(32);
  text("Click for chick!", 12, 45);
}

void unPromptEgg() {
  fill(0);
  writeText();
}


void drawEgg() {
  image(egg, eggTopx, eggTopy);
}

void mouseClicked() {
  if (onEgg()) {
    counter = 0;
    commenceHatch = true;
    lastTime = millis();
  }
}

void drawChicks() {
  if (millis() - lastTime >= DISPLAY_TIME) // Time to display next image
  {
    counter++;
    lastTime = millis();
  }
  if (counter < images.length) {
    fill(0);
    rect(eggTopx, eggTopy, imageWidth*(counter+1), imageHeight);
    image(images[counter], eggTopx+imageWidth*(counter+1), eggTopy);
  }
  if (counter == images.length) { //this is to "erase" the last image
    fill(0);
    rect(eggTopx, eggTopy, imageWidth*(counter+1), imageHeight);
    commenceHatch = false;
  }
}



