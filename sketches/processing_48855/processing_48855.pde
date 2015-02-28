
PFont font;

void setup() {
  size(400, 400);

  font = loadFont("font.vlw");
  textFont(font);

  colorMode(HSB, 360, 100, 100);

  background(360);
  smooth();

  noLoop();
}

void draw(){
  for (int i = 0; i < 100;i++) {   
    fill(random(36)*10, 100, 100, 150);

    textSize(random(20, 60));
    text("Processing", random(-50,width), random(height));
  }
}

void mousePressed(){
  redraw();
}

