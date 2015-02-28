
/**
There's a few ways we could do this.
- Manually scale everything: You click in THIS region, do the math, and color THAT pixel.
- Handy scaling: get THIS pixel range, scale it down, draw it THERE.  That could go in either direction.
  (That's the one it uses.)

Features:
- Big click-area for zoomed-in sprite editing
- Multiple (2? 3?) different (pre-set) zoom levels, so you can see it at run-time size.  Start w/ just 2 levels.
- Palette selector.
- alpha support, including a fancy diagonal alpha-indicator background
- right-click to delete a pixel, spacebar to clear the whole image
- mirror-draw mode, left-to-right (type 'm' to toggle)

TODO:
- File > Save (in browser, what, base64?)
- a better color selector
- shape drawer: circle, rect, line, etc
- tool: color eye-dropper (so you can click on the canvas)
- tool: paint-bucket: fill to edge
- refactor layout: something hierarchical, like tree layout? using relative spacing
- click mirror-mode display text to toggle (once you fix layout stuff)

BUGS:
- you can click to the right of the palette, & it'll change the pen color to black.
*/

PImage sprite;
int spriteSize = 32;
int scale = 10;
int canvasSize = spriteSize * scale;
int canvasX1 = 50;
int canvasY1 = 100;
int canvasX2 = canvasX1 + canvasSize;
int canvasY2 = canvasY1 + canvasSize;
color pen = color(255, 0, 0);
boolean mirrorMode = true;

void setup() {
  size(900, 600);
  textFont(createFont("Monospaced", 15));
  
  initSprite();
}

void initSprite() {
  sprite = createImage(spriteSize, spriteSize, ARGB);
}

void keyPressed() {
  if (keyCode == ' ') initSprite();
  else if (key == 'm') mirrorMode = !mirrorMode;
}

void draw() {
  background(0);
  
  drawPalette();
  drawCanvas();
  drawPreview();
  
  text("mirror: " + (mirrorMode ? "on" : "off"), 30, 500);
}

void mouseDragged() {
  drawOnSprite();
}
void mouseClicked() {
  drawOnSprite();
  changePenColor();
}
void drawOnSprite() {
  if (clickIsInBounds(canvasX1, canvasY1, canvasX2, canvasY2)) {
    int x = int(map(mouseX, canvasX1, canvasX2, 0, spriteSize));
    int y = int(map(mouseY, canvasY1, canvasY2, 0, spriteSize));
    color c = mouseButton == LEFT ? pen : color(0, 0); // 100% transparent
    sprite.set(x, y, c);
    if (mirrorMode) sprite.set(spriteSize - x, y, c);  // HERE is the mirror-mode
  }
}

void drawCanvas() {
  pushMatrix();
  translate(canvasX1, canvasY1);
  
  // draw the "see the alpha" background
  pushStyle();
  noStroke();
  fill(255);
  rect(0, 0, canvasSize, canvasSize);
  fill(230);
  for(int i = 0; i < 10; i += 2) {
    int foo = int(map(i  , 0, 10, 0, canvasSize));
    int bar = int(map(i+1, 0, 10, 0, canvasSize));
    beginShape();
      vertex(foo, 0);
      vertex(0, foo);
      vertex(0, bar);
      vertex(bar, 0);
    endShape(CLOSE);
    beginShape();
      vertex(foo, canvasSize);
      vertex(canvasSize, foo);
      vertex(canvasSize, bar);
      vertex(bar, canvasSize);
    endShape(CLOSE);
  }
  popStyle();
  
  // draw the zoomed-in copy of the sprite
  scale(scale);
  image(sprite, 0, 0);
  popMatrix();
  
  // draw a border
  pushStyle(); // TODO extract method: drawBorder
  stroke(100);
  noFill();
  rectMode(CORNERS);
  rect(canvasX1, canvasY1, canvasX2, canvasY2);
  popStyle();
}

void drawPreview() {
  image(sprite, 550, 200);  // TODO how to reify this?
  
  pushStyle();
  stroke(100);
  noFill();
  rect(550, 200, spriteSize, spriteSize);
  popStyle();
}

void drawPalette() {
  pushStyle();
  colorMode(HSB);
  
  stroke(100);
  fill(pen);
  rect(550, 75, 20, 20);
  
  
  
  pushMatrix();
  translate(600, 50);
  
  rect(-1, -1, 101, 51);
  noStroke();
  
  scale(5);
  int grain = 10;  // ack, it's not REALLY grain.  oh well, move on.
  
  for (int x = 0; x < grain; x++) {
    for (int y = 0; y < grain; y++) {
      fill(color(map(y, 0, grain, 0, 255),
                 map(x, 0, grain, 0, 255),
                 255));
      rect(x, y, 1, 1);
      
      fill(color(map(y, 0, grain, 0, 255),
                 255,
                 map(x, 0, grain, 0, 255)));
      rect((grain*2-1)-x, y, 1, 1);
    }
  }
  
  popMatrix();
  popStyle();
}

void changePenColor() {
  if (clickIsInBounds(600, 50, 600+200, 50+100)) {
    pen = get(mouseX, mouseY);
  }
}

boolean clickIsInBounds(int x1, int y1, int x2, int y2) {
  return mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2;
}

