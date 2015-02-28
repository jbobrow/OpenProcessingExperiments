
// This is an interactive sketch, using ellipses (circles) with
// centers and radii dependent primarily on the mouse's x and
// y coordinates when pressed. Other commands would be s or S
// for screenshots and the numbers 1 through 5, which change the
// color of the ellipses from its default (black, which cannot
// be returned to once the user has changed the color) to one of
// five different shades of blue. When the canvas is filled to
// some extent, it is somewhat reminiscent of space. Sort of.

// Global Variables
int f;
color[] palette = {#4776E5, #004FFF, #0700BF, #04007F, #020043};

// setup()
void setup() {
  size(800, 800);
  background(0);
}

// draw()
void draw() {
  if(mousePressed) {
    int r = mouseY/2-height/2+mouseX/2;
    stroke(#FFFFFF);
    fill(f);
    ellipse(mouseX, mouseY, r, r);
  }
}

// keyReleased()
void keyReleased() {
  if (key == 's' || key == 'S') saveFrame("screenshot.png");
  
  switch(key) {
    case '1':
      f = palette[0];
      break;
    case '2':
      f = palette[1];
      break;
    case '3':
      f = palette[2];
      break;
    case '4':
      f = palette[3];
      break;
    case '5':
      f = palette[4];
      break;
  }
}

