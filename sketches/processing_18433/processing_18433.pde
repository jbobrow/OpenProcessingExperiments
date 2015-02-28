

PFont font;
void setup() {
  size(250, 250);
  background(0);
  font = loadFont("MonotypeCorsiva-40.vlw");
}
  
  void draw() {
    frameRate(10);
    smooth();
    textFont (font);
    fill(#AD7FFC); // moving text with mouse
    background(0);
    text ("L9C 6W9", mouseX - 80, mouseY); // mouse is connected with center of word not with the left side
    for (int x = 125 ; x < 250; x += 20) { // "blizzard" effect, white ellipses
      for(int y = 10; y < 30; y +=5) {
      fill(250, 80);
      noStroke();
      smooth();
    ellipse (random (mouseX + 50), random (mouseY + 50), random (y), random (y));
      }
    }
        for (int x = 0; x < 250; x += 20) {
      fill(100, 90);
      noStroke();
      smooth();
    ellipse (random (mouseX + 50), random (mouseY + 50), 10, 10); // different shade for "blizzard"
    }
  }

