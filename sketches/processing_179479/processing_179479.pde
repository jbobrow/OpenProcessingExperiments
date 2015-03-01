
/* @pjs pauseOnBlur=true; 
preload="AddSticker.gif,Back.gif,BlankBox.jpg,Clear.gif,Edit.gif,LayerBack.gif,LayerForward.gif,RemoveSticker.gif,RotateSticker.gif,Save.gif,SelectDown.gif,SelectUp.gif,Sticker01.gif,Sticker02.gif,Sticker03.gif,Sticker04.gif,Sticker05.gif,Sticker06.gif,Sticker07.gif,Sticker08.gif,Sticker09.gif,Sticker10.gif,Sticker11.gif,Sticker12.gif,Sticker13.gif,Sticker14.gif,Sticker15.gif,Sticker16.gif,Sticker17.gif,Sticker18.gif,Sticker19.gif,Sticker20.gif,Sticker21.gif,Sticker22.gif,Sticker23.gif,Sticker24.gif,Sticker25.gif,Sticker26.gif,Sticker27.gif,Sticker28.gif,Sticker29.gif,Sticker30.gif,Sticker31.gif,Sticker32.gif,Sticker33.gif,Sticker34.gif,Sticker35.gif,Sticker36.gif,Sticker37.gif,Sticker38.gif,Sticker39.gif,Sticker40.gif,Sticker41.gif,Sticker42.gif,Sticker43.gif,Sticker44.gif,Sticker45.gif,Sticker46.gif,Sticker47.gif,Sticker48.gif,Sticker49.gif,Sticker50.gif,Sticker51.gif,Sticker52.gif,Sticker53.gif,Sticker54.gif,Sticker55.gif,Sticker56.gif,Sticker57.gif,Sticker58.gif,Sticker59.gif,Sticker60.gif,Sticker61.gif,Sticker62.gif,Sticker63.gif,Sticker64.gif"; 
 */

// Preload images for js
// Sticker array and IntList for layers
Sticker[] stickers = new Sticker[64];
ArrayList<Integer> layers;

// Canvas and toolbar
public PGraphics canvas, tools;
PImage template;
Button EDIT, ADD_STICKER, SAVE, CLEAR, BACK, SELECT_DOWN, SELECT_UP, LAYER_DOWN, LAYER_UP, ROTATE, REMOVE;

// States
boolean editing = false;
boolean dragging = false;
boolean rotating = false;

// Edit variables
int currentSelection = 0;
PVector draggingStartedAt;

// ********
// Setup
// ********

void setup() {
  size(600, 675);
  background(255);
  
  // Initialize the stickers
  for (int i = 0; i < stickers.length; i++) {
    stickers[i] = new Sticker("Sticker" + nf(i+1, 2) + ".gif");
  }
  
  // Initialize the layers
  layers = new ArrayList<Integers>();
  
  // Initialize the canvas
  canvas = createGraphics(600, 600);
  template = loadImage("BlankBox.jpg");
  
  // Initialize the tools
  tools = createGraphics(600, 675);
  draggingStartedAt = new PVector(0, 0);
  EDIT = new Button(72, 600, "Edit.gif");
  ADD_STICKER = new Button(199, 600, "AddSticker.gif");
  SAVE = new Button(326, 600, "Save.gif");
  CLEAR = new Button(452, 600, "Clear.gif");
  BACK = new Button(37, 600, "Back.gif");
  SELECT_DOWN = new Button(113, 600, "SelectDown.gif");
  SELECT_UP = new Button(186, 600, "SelectUp.gif");
  LAYER_DOWN = new Button(262, 600, "LayerBack.gif");
  LAYER_UP = new Button(338, 600, "LayerForward.gif");
  ROTATE = new Button(413, 600, "RotateSticker.gif");
  REMOVE = new Button(487, 600, "RemoveSticker.gif");
  
}

// ********
// Draw
// ********

void draw() {
  dragAndRotate();
  displayTools();
  displayCanvas();
  image(tools, 0, 0);
  image(canvas, 0, 0);
}

void mouseClicked() {
  PVector mousePos = new PVector(mouseX, mouseY);
  checkTools(mousePos);
}

void mousePressed() {
  if (editing) {
    PVector mousePos = new PVector(mouseX, mouseY);
    
    // Hold to rotate
    if (ROTATE.isClicked(mousePos) && !rotating) rotating = true;
    
    // Dragging an active sticker
    else if (mouseY < canvas.height && !dragging) {
      draggingStartedAt.set(mouseX, mouseY);
      dragging = true;
    }
  }
}

void mouseReleased() {
  dragging = false;
  rotating = false;
}












// ********
// Toolbar
// ********

// Display buttons in the toolbar and the drag icon
void displayTools() {
  tools.beginDraw();
  tools.background(255);
  tools.endDraw();
    
  if (!editing) {
    EDIT.display();
    ADD_STICKER.display();
    SAVE.display();
    CLEAR.display();
  }
  else {
    BACK.display();
    SELECT_DOWN.display();
    SELECT_UP.display();
    LAYER_DOWN.display();
    LAYER_UP.display();
    ROTATE.display();
    REMOVE.display();
  }
}

// Check if buttons are pressed and run actions
void checkTools(PVector _mouse) {
  if (!editing) {
    if (EDIT.isClicked(_mouse)) editing = true;
    else if (ADD_STICKER.isClicked(_mouse)) addActiveSticker();
    else if (SAVE.isClicked(_mouse)) saveCanvas();
    else if (CLEAR.isClicked(_mouse)) clearCanvas();
  }
  else {
    if (BACK.isClicked(_mouse)) editing = false;
    else if (SELECT_DOWN.isClicked(_mouse)) selectDown();
    else if (SELECT_UP.isClicked(_mouse)) selectUp();
    else if (LAYER_DOWN.isClicked(_mouse)) moveStickerDown();
    else if (LAYER_UP.isClicked(_mouse)) moveStickerUp();
    else if (REMOVE.isClicked(_mouse)) removeSticker();
  }
}

//********
// Saving
//********
void saveCanvas() {
  canvas.save("TheInformation.jpg");
}


// ********
// Selection functions
// ********

// Highlight the selected sticker
void showSelectedSticker() {
  stickers[layers.get(currentSelection)].showSelection();
}

// Select down a layer
void selectDown() {
  if (currentSelection > 0) currentSelection--;
  else currentSelection = layers.size() - 1;
}

// Select up a layer
void selectUp() {
  if (currentSelection < layers.size() - 1) currentSelection++;
  else currentSelection = 0;
}


// ********
// Editing functions
// ********

// Drag and rotate
void dragAndRotate() {
  if (dragging) {
      PVector mousePos = new PVector(mouseX, mouseY);
      PVector mouseMovedBy = PVector.sub(mousePos, draggingStartedAt);
      stickers[layers.get(currentSelection)].loc.add(mouseMovedBy);
      draggingStartedAt.set(mouseX, mouseY);
    }
  else if (rotating) rotateSticker();
}

// Rotate a sticker clockwise
void rotateSticker() {
  stickers[layers.get(currentSelection)].rotateBy(PI * 0.02);
}

// ********
// Layer functions
// ********

// Display all active stickers and the template
void displayCanvas() {
  canvas.beginDraw();
  canvas.image(template, 0, 0);
  canvas.endDraw();
  if (layers.size() > 0) {
    for (int i = 0; i < layers.size(); i++) {
      stickers[layers.get(i)].display();
    }
    if (editing) showSelectedSticker();
  }
}

// Add a random inactive sticker index to layers
void addActiveSticker() {
  if (layers.size() < stickers.length) {
    int newStickerIndex;
    do {
      newStickerIndex = int(random(stickers.length));
    } while (layers.contains(newStickerIndex));
    layers.add(newStickerIndex);
    currentSelection = layers.size() - 1;
    editing = true;
  }
}

// Remove a sticker index from layers
void removeSticker() {
  layers.remove(currentSelection);
  if (layers.size() == 0) editing = false;
  else if (currentSelection >= layers.size()) currentSelection--;
}

// Remove all sticker indexes from layers
void clearCanvas() {
  layers.clear();
}

// Move a sticker index down a layer
void moveStickerDown() {
  if (currentSelection > 0) {
    int[] thisStickerIndex = new int[1];
    thisStickerIndex[0] = layers.get(currentSelection);
    layers.remove(currentSelection);
    currentSelection--;
    layers.add(currentSelection, thisStickerIndex);
  }
}

// Move a sticker index up a layer
void moveStickerUp() {
  if (currentSelection < layers.size() - 1) {
    int[] thisStickerIndex = new int[1];
    thisStickerIndex[0] = layers.get(currentSelection);
    layers.remove(currentSelection);
    currentSelection++;
    layers.add(currentSelection, thisStickerIndex);
  }
}
class Button {
  
  PVector loc, center;
  boolean inUse;
  PImage img;
  
  Button(int _x, int _y, String _imageLabel) {
    loc = new PVector(_x, _y);
    inUse = false;
    img = loadImage(_imageLabel);
    center = new PVector(img.width * 0.5 + loc.x, img.height * 0.5 + loc.y);
  }
  
  void display() {
    tools.beginDraw();
    tools.image(img, loc.x, loc.y);
    tools.endDraw();
  }
  
  boolean isClicked(PVector _mouse) {
    if (center.dist(_mouse) < img.width * 0.5 - 5) return true;
    else return false;
  }
  
}
class Sticker {
  
  PVector loc, center;
  float rotation;
  PImage img;
  
  Sticker(String _imageLabel) {
    loc = new PVector(width * 0.5, height * 0.5);
    rotation = 0.0;
    img = loadImage(_imageLabel);
    center = new PVector(img.width * 0.5, img.height * 0.5);
  }
  
  void display() {
    canvas.beginDraw();
    canvas.pushMatrix();
    canvas.translate(loc.x, loc.y);
    canvas.rotate(rotation);
    canvas.image(img, -center.x, -center.y);
    canvas.popMatrix();
    canvas.endDraw();
  }
  
  void rotateBy(float _rad) {
    rotation += _rad;
    rotation = rotation % TWO_PI;
  }
  
  void showSelection() {
    canvas.beginDraw();
    canvas.pushMatrix();
    canvas.translate(loc.x, loc.y);
    canvas.rotate(rotation);
    canvas.fill(255, 100, 100, 50);
    canvas.noStroke();
    canvas.rect(-center.x, -center.y, img.width, img.height);
    canvas.popMatrix();
    canvas.endDraw();
  }
  
}


