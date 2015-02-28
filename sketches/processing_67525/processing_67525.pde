
int allImages = 10;
int displayImage = 0;
int currentStroke = 6;
int strokeCounter = 0;
PImage[] images = new PImage [allImages];
color pickedColor;

int [] brushes = new int[5];

boolean imageSelected = false;

void setup() {
  brushes[0] = 6;
  brushes[1] = 8;
  brushes[2] = 10;
  brushes[3] = 12;
  brushes[4] = 14;
  size(1000, 328);
  noStroke();
  for (int i = 0; i < images.length; i++) {
    images[i] = loadImage("image" + i + ".jpg");
  }
  for (int n = 0; n < brushes.length; n++) {
  }
}

void draw() {
  image(images[displayImage], 0, 0);
  if (mouseX <= width/2) {
    if (mousePressed == true) {
      pickedColor = get(mouseX, mouseY);
      noStroke();
      fill(pickedColor);
      ellipse(mouseX + width/2, mouseY, currentStroke, currentStroke);
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    // toggle back and forth through images
    if (keyCode == RIGHT || keyCode == LEFT && imageSelected == false) {
      imageSelected();
    }
    
    // increase brushstroke
    if (keyCode == UP) {
      currentStroke += 2;
      currentStroke = constrain(currentStroke, 6, 14);
      println(currentStroke);
    }
    
    // decrease brushstroke
    if (keyCode == DOWN) {
      currentStroke -= 2;
      currentStroke = constrain(currentStroke, 6, 14);
      println(currentStroke);
    }  
  }
}

void imageSelected() {
  displayImage = int(random(images.length));
}

void keyReleased() {
  imageSelected = false;
}


