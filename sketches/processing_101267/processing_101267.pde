
PFont f;

void setup() {
  size(600, 600);
  smooth();
  colorMode(RGB, 1.0);
  f = loadFont("Dialog-48.vlw");
  textFont(f, 40);
}

void drawText() {
 
    
    float distance = dist(width/17, height/17, mouseX, mouseY);
    float col = 1-(map(distance, 0, 100, 0, 1));
    fill(col);
  }
    
void draw() {
    background(0);
    text("Light",250,300);
    drawText();
}



