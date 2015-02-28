
Button[] menuButtons;
static final int NUMMENUBUTTONS = 3;
boolean drawBoxes;

void setup() {
  size(640, 640);
  menuButtons = new Button[3];
  menuButtons[0] = new Button("Draw hit box", new PVector(100, 100), 32, color(0), color(255, 0, 0));
  menuButtons[1] = new Button("Do something", new PVector(100, 300), 32, color(0), color(255, 0, 0));
  menuButtons[2] = new Button("Do another thing", new PVector(100, 500), 32, color(0), color(255, 0, 0));
  drawBoxes = false;
}

void draw() {
  background(255);
  displayMenu();
}

void displayMenu() {
  for (int i = 0; i < NUMMENUBUTTONS; i++) {
    menuButtons[i].draw(drawBoxes);
  }
}

void mousePressed() {
  if (menuButtons[0].containsMouse()) {
    if (drawBoxes) drawBoxes = false;
    else drawBoxes = true;
  }
  if (menuButtons[1].containsMouse()) {
    fill(0, 255, 0);
    rect(400, 300, 100, 100);
  }
  if (menuButtons[2].containsMouse()) {
    fill(255, 0, 0);
    rect(400, 300, 100, 100);
  }
}

class Button {
  PVector pos;
  color textColor, hoverColor;
  float size, tWidth;
  String text;

  Button(String text, PVector pos, float size, color textColor, color hoverColor) {
    this.pos = pos;
    this.textColor = textColor;
    this.hoverColor = hoverColor;
    this.size = size;
    this.text = text;
    textSize(size);
    tWidth = textWidth(text);
  }

  void draw(boolean on) {
    textSize(size);
    if (containsMouse()) fill(hoverColor);
    else fill(textColor);
    text(text, pos.x, pos.y + size);
    if (on)
      rect(pos.x, pos.y, tWidth, size);
  }

  boolean containsMouse() {
    if (mouseX > pos.x && mouseX < pos.x + tWidth && mouseY > pos.y && mouseY < pos.y + size ) 
      return true;
    else return false;
  }
}



