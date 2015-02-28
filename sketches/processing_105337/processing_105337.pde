
PImage picture;
PFont text;

void setup () {
  size (400,400);
  picture = loadImage ("push.jpg");
  text = loadFont("Ayuthaya-150.vlw");
  background (255);
}

void draw () {
  image (picture, width/5, height/3);
  fill (255,0,0);
}
  
  void mouseClicked() {
    if (mouseX > 90 && mouseX < 300 && mouseY > 140 && mouseY < 350);
      textFont(text);
      text("BOOM", 10, 120);
  }
  



