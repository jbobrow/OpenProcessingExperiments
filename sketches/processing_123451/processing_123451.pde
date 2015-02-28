
String textTyped = "Nothing yet";

void setup() {
  size(200, 126);
  background(255);
  fill(0);
  textAlign(CENTER);
  frame.setResizable(true);
}
void draw() {
  background(255);
  if (key == CODED) textSize((int) width/20);
  else   textSize((int) width/10);
  text(textTyped, width/2, height/2);
}
void keyPressed() {
  if (keyPressed) {
    String space = "space";
    String tab = "tab";
    if (key != 32 && key != 9 && key != 10 && key != CODED) {
      textTyped = key + " = " + (int)key;
    }
    else if (key == 32) textTyped = "space" + " = " + (int)key;
    else if (key == 9) textTyped = "tab" + " = " + (int)key;
    else if (key == 10) textTyped = "enter" + " = " + (int)key;

    else if (key == CODED) {
      String codedKey = "Not Coded";
      if (keyCode == SHIFT) codedKey = "shift";
      else if (keyCode == CONTROL) codedKey = "ctrl";
      else if (keyCode == ALT) codedKey = "alt";
      else if (keyCode == 20) codedKey = "caps lock";
      else if (keyCode == BACKSPACE) codedKey = "backspace";
      else if (keyCode == DELETE) codedKey = "delete";
      else if (keyCode == UP) codedKey = "arrow up";
      else if (keyCode == DOWN) codedKey = "arrow down";
      else if (keyCode == LEFT) codedKey = "arrow left";
      else if (keyCode == RIGHT) codedKey = "arrow right";
      textTyped = "KEYCODED: " + CODED + ", " + codedKey + " = " + keyCode;
    }
  }
}


