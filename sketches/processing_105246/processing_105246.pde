
PImage orkimage;
PFont fontfor;
PFont fontforother;
int value; 

void setup () {
  size(500, 500);
  smooth();
  orkimage = loadImage("ork.jpg");
  fontfor = loadFont("fontfor.vlw");
  fontforother = loadFont("fontfor2.vlw");
   background (255);
  image(orkimage, 75, 0, 350, 500);
}

void draw() {
 
  textFont (fontfor);
  fill(0, 0, 0);
  text("The Ork\n King", 0, 50);
  textFont (fontforother);
  fill(0, 200, 100);
  text("The Ork king groweth to bold: \nDraw a mustache on the silly ork king\n by dragging the mouse.", 0, 425);
  fill(value); 
  
}

void mouseDragged() {
  if (value == 0) {
    ellipse(mouseX, mouseY, 4, 4);
  } else {
    value = 0;
  }
}



