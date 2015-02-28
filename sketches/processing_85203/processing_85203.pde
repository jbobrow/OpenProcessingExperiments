
//This is how we go from the start menu to actually the drawing menu
class Levels {
  PFont ourFont; // enables a variable to hold our font for text
  String fontStyle;//font type
  int fontSize;//font size
  int fontSizeScroll;
  int level;

  //constructor
  Levels(String tempFontStyle, int tempFontSize, int tempLevel) {
    fontStyle = tempFontStyle;
    fontSize = tempFontSize;
    level = tempLevel;
  }
  void fontLoader() {
 //   ourFont = loadFont(fontStyle);
   // textFont(ourFont, fontSize);
    textFont(createFont(fontStyle,fontSize));
  }

  //main menu button for main game level
  void startMenu() {
    fill(textColor);
    textAlign(CENTER);
    text("Lets Draw!!!", 200, 100);
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(200, 285, 140, 40);
    fill(textColor);
    text("Start", 200, 300);
    if (mouseX >=(140) && mouseX <=(259) && mouseY >=(273)&& mouseY <=(303)&& mousePressed) {
      level = 1;
      rectMode(CORNER);
      fill(255);
      rect(0, 0, 450, 450);
      fill(0);
    }
  }
  //Start Menu
  void drawingBoard() {
    if (mousePressed) {
      fill(random(0, 255));
      rectMode(CENTER);
      rect(mouseX, mouseY, 70, 70);
    } 
    else {
      fill(random(0, 255), random(0, 255), random(0, 255));
      ellipse(mouseX, mouseY, 60, 60);
    }
    fill(textColor);
    textAlign(CENTER);
    //reset button
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(100, 410, 140, 35);
    fill(textColor);
    text("Reset", 100, 420);
    if (mouseX >=(37) && mouseX <=(160) && mouseY >=(391)&& mouseY <=(415)&& mousePressed) {
      level = 1;
      rectMode(CORNER);
      fill(255);
      rect(0, 0, 450, 450);
      fill(0);
    }
    //quit button
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(360, 410, 100, 35);
    fill(textColor);
    text("Quit", 360, 420);
    if (mouseX >=(318) && mouseX <=(397) && mouseY >=(391)&& mouseY <=(415)&& mousePressed) {
      // Quit running the sketch once the file is written
      //exit(); //exit out of application (only good in Java mode)
      level = 0;
    }
//    //save button (only works well in java mode)
//    fill(0, 255, 0);
//    rectMode(CENTER);
//    rect(360, 28, 120, 35);
//    fill(textColor);
//    text("Save", 360, 40);
//    if (mouseX >=(302) && mouseX <=(417) && mouseY >=(12)&& mouseY <=(42)&& mousePressed) {
//      //saves an image
//      save("myDrawing_01.png");
//    }
  }
}


