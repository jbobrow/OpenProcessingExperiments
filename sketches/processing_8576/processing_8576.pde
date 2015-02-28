
int numMiro = 5;
MovableImage[] miro = new MovableImage[numMiro];
MovableImage selectedImage;
boolean objectSelected = false;
PVector mouseDiff = new PVector(0, 0, 0);
PFont fontA;

void setup() {
  size(500, 500);
  background(255);
  frameRate(30);
  smooth();

  miro[0] = new MovableImage("sonnens.png", 200, 200);
  miro[1] = new MovableImage("bird.png", 200, 200); 
  miro[2] = new MovableImage("biografias_01.png", 250, 250);
  miro[3] = new MovableImage("bird.png", 150, 150); 
  miro[4] = new MovableImage("sonnens.png", 200, 200); 

  fontA = loadFont("SansSerif-48.vlw");
  textFont(fontA, 10);
}

void draw() {
  background(255);

  for (int i = 0; i < numMiro; i++) {
    miro[i].display();
  }

  for (int i = 0; i < numMiro; i++) {
    miro[i].update();
  }

  delay(30);

}

// On mouse clicked, activate the static object
void mouseClicked() {
  for (int i = numMiro-1; i >= 0; i--) {
    if (miro[i].mouseOverMe() && !miro[i].isMoving) {
      miro[i].toggleMoving();
      return;
    }
  }
}

// On mouse pressed, lock the mouse-overed object and save the relative x,y values.
void mousePressed() {
  for (int i = numMiro-1; i >= 0; i--) { // loop backward so the top object is checked first.
    if (miro[i].mouseOverMe()) {
      selectedImage = miro[i];
      selectedImage.isMoving = false;
      objectSelected = true;
      mouseDiff.x = mouseX - selectedImage.loc.x;
      mouseDiff.y = mouseY - selectedImage.loc.y;
      return;
    }
  }
}

// On mouse dragged, move the locked object.
void mouseDragged() {
  if (mousePressed && objectSelected) {
    selectedImage.loc.x = mouseX - mouseDiff.x;
    selectedImage.loc.y = mouseY - mouseDiff.y;
  }
}

// On mouse release, unlock the object.
void mouseReleased() {
  selectedImage = null;
  objectSelected = false;
}




