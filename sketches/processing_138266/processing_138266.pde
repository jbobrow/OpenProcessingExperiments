
// Some ellipses, centers centers, fill, and other stuff based on
// the user DRAGGING the mouse.  Can also change the width using
// 1-3 keys, and save, using the s or S keys. BS or DEL key clear
// the entire thing.  Static image from Carnival in Rio!

// color palette
int PALETTES = 5;
color[] palette = {#666306, #FFA125, #803300, #910795, #15182E};

// variables
PImage fractal;

// setup code block
void setup() {
  size(800,600);
  background(palette[0]);
  colorMode(HSB, width, height, 100);
  background(0);
  
  //fractal = loadImage("a.jpg");
  fractal = loadImage("z46301.jpg");
  image(fractal, 0, 0);

  // noLoop();
}

int global_size = 5;

// drawing code block
void draw() {
  int region;
  if (mousePressed) {
    for (int i = 0; i < 4; i++) {
      fill(palette[int(random(0,PALETTES))]);
      stroke(palette[int(random(1, PALETTES))]);
      strokeWeight(int(random(1, 10)));
      ellipse(mouseX, mouseY, mouseX/global_size, mouseY/global_size);
    }
  }
}

void keyPressed() {
  switch(key) {
    case('s'):
    case('S'):
      saveFrame("wk04.png");
      break;
    case('1'):
      global_size = 10;
      break;
    case('2'):
      global_size = 5;
      break;
    case('3'):
      global_size = 30;
      break;
    case(DELETE):
    case(BACKSPACE):
      background(0);
      break;
  }
}


