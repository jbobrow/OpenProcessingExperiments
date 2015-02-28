
// Drawing program with undo/redo (OOP version)
// Press CTRL+Z to undo, CTRL+SHIFT+Z to redo

// We need these to know if CTRL/SHIFT are pressed
boolean controlDown = false;
boolean shiftDown = false;

Undo undo;

void setup() {
  size(500, 500);
  background(255);
  undo = new Undo(10);
}
void draw() {
  // Our two line drawing program
  if (mousePressed)
    line(mouseX, mouseY, pmouseX, pmouseY);
}
void mouseReleased() {
  // Save each line we draw to our stack of UNDOs
  undo.takeSnapshot();
}

void keyPressed() {
  // Remember if CTRL or SHIFT are pressed or not
  if (key == CODED) {
    if (keyCode == CONTROL) 
      controlDown = true;
    if (keyCode == SHIFT)
      shiftDown = true;
    return;
  } 
  // Check if we pressed CTRL+Z or CTRL+SHIFT+Z
  if (controlDown) {
    if (keyCode == 'Z') {
      if (shiftDown)
        undo.redo();
      else
        undo.undo();
    }
    return;
  } 
  // Check if we pressed the S key
  if (key=='s') {
    saveFrame("image####.png");
  }
}
void keyReleased() {
  // Remember if CTRL or SHIFT are pressed or not
  if (key == CODED) {
    if (keyCode == CONTROL) 
      controlDown = false;
    if (keyCode == SHIFT)
      shiftDown = false;
  }
}


class Undo {
  // Number of currently available undo and redo snapshots
  int undoSteps=0, redoSteps=0;  
  CircImgCollection images;
  
  Undo(int levels) {
    images = new CircImgCollection(levels);
  }

  public void takeSnapshot() {
    undoSteps = min(undoSteps+1, images.amount-1);
    // each time we draw we disable redo
    redoSteps = 0;
    images.next();
    images.capture();
  }
  public void undo() {
    if(undoSteps > 0) {
      undoSteps--;
      redoSteps++;
      images.prev();
      images.show();
    }
  }
  public void redo() {
    if(redoSteps > 0) {
      undoSteps++;
      redoSteps--;
      images.next();
      images.show();
    }
  }
}


class CircImgCollection {
  int amount, current;
  PImage[] img;
  CircImgCollection(int amountOfImages) {
    amount = amountOfImages;

    // Initialize all images as copies of the current display
    img = new PImage[amount];
    for (int i=0; i<amount; i++) {
      img[i] = createImage(width, height, RGB);
      img[i] = get();
    }
  }
  void next() {
    current = (current + 1) % amount;
  }
  void prev() {
    current = (current - 1 + amount) % amount;
  }
  void capture() {
    img[current] = get();
  }
  void show() {
    image(img[current], 0, 0);
  }
}
