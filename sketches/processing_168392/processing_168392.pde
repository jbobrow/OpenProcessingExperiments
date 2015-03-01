
PFont f;
float x = 33;
float y = 60;

void setup() {
  size(300,300);
  f = loadFont("Serif-48.vlw");
  textFont(f);
  noStroke();
}

void draw() {
  fill(204, 1200);
  rect(0,0, width, height);
  fill(0);
  if ((mouseX >= x) && (mouseX <= x+55) && (mouseY >= y-24) && (mouseY <= y)) {
    x += width/5;
    y += height/5;
  }
  
  text("jump away", x, y);
}

  


