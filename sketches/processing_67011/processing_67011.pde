
PImage paper; //background
PImage spray; //brush type

int colortint;

void setup () {
  frameRate(10);
  size (500, 355);
  smooth ();
  paper = loadImage ("paper.jpg");
  spray = loadImage ("spray.png");
  image (paper, 0, 0);
}

void keyPressed() {
  if (keyCode == UP) {
    tint(0, 150, 200); //blue
    image(spray, -50, -50);
  }
  if (keyCode == DOWN) {
    tint(250, 50, 0); //red
    image(spray, -50, -50);
    }
  if (keyCode == LEFT) {
    tint(50, 250, 150); //green
    image(spray, -50, -50);
      }
  if (keyCode == RIGHT) {
    tint(255, 255, 0); //yellow
    image(spray, -50, -50);
    }
  }

  void draw () {
    if(mousePressed == true) {
    image (spray, mouseX, mouseY);
    }
  }
  void mouseDragged() {
  image(spray, mouseX, mouseY);
}



