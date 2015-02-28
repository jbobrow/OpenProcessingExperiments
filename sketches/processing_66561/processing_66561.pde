
int fontPosY = 40;
int counter = 0;
//PFont myFont;
//myFont = createFont("Menlo-Regular", 24, true);
//textFont(myFont);

void setup () {
  size(400, 650);
  background(#ededed);
  smooth();
  noStroke();
}

float buttonHeight = 150;
float buttonWidth = 320;
float buttonMarginTop = 100;
float buttonMarginLeft = 40;


PImage imageUsainMental = loadImage("usainmental.jpg");
PImage imageUsainAlien = loadImage("usainalien.jpg");
PImage imageOlympicFire = loadImage("fire.jpg");






void draw () {

  fill(#ededed);
  rect(0, 0, width, height);

  beginShape(QUADS);
  fill(#3b3733);
  vertex(buttonMarginLeft, buttonMarginTop);
  vertex(buttonMarginLeft, buttonHeight);
  vertex(buttonWidth, buttonHeight);
  vertex(buttonWidth, buttonMarginTop);

  vertex(buttonMarginLeft, 2*buttonMarginTop);
  vertex(buttonMarginLeft, buttonMarginTop + buttonHeight);
  vertex(buttonWidth, buttonMarginTop + buttonHeight);
  vertex(buttonWidth, 2*buttonMarginTop);

  vertex(buttonMarginLeft, 3*buttonMarginTop);
  vertex(buttonMarginLeft, 2*buttonMarginTop + buttonHeight);
  vertex(buttonWidth, 2*buttonMarginTop + buttonHeight);
  vertex(buttonWidth, 3*buttonMarginTop);
  endShape();

  if (mouseX > buttonMarginLeft && mouseX < buttonWidth) {

    if (mouseY > buttonMarginTop && mouseY < buttonHeight) {
      text("This is not an invasion. But if it was, you'd be cool with it.", 14, fontPosY);
      image(imageUsainAlien, buttonMarginLeft, buttonMarginTop);
      counter++;
    } 
    if (mouseY > 2*buttonMarginTop && mouseY < buttonMarginTop + buttonHeight) {
      text("Just a little fire. Nothing to worry about.", 14, fontPosY);
      image(imageOlympicFire, buttonMarginLeft, 2*buttonMarginTop);
      counter++;
    }
    if (mouseY > 3*buttonMarginTop && mouseY < 2*buttonMarginTop + buttonHeight) {
      text("You've just been incepted like " + counter + " times, champ.", 14, fontPosY);
      image(imageUsainMental, buttonMarginLeft, 3*buttonMarginTop);
      counter++;
    }
  }
}





//beginShape(TRIANGLES);
//vertex(30, 75);
//vertex(40, 20);
//vertex(50, 75);
//endShape();


