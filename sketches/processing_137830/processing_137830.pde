
//pictures
PImage idea, head;
// global save coordinates idea
int ideaX = 360, ideaY = 360;

void setup() {
  size(800, 600);
  background(0);
  idea = loadImage("idea.png");
  head = loadImage("head.png");
  // set cursor to a hand
  cursor(HAND);
}

void draw() {
  // redraw background and head everytime to erase all
  background(0);
  image(idea, ideaX, ideaY, 80, 80);
  image(head, 350, 490, 120, 120);
  if (mouseX < (ideaX + 110) && mouseX > (ideaX - 110) && mouseY < (ideaY + 110) && mouseY > (ideaY - 110)) {
    ideaX = int(random(40, 680));
    ideaY = int(random(40, 400));
  }
}

