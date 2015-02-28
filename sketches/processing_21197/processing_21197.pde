
/* Iteration
Simon Wiscombe

It's a simple function! It draws a 3x3 grid with lollipop wherever
the mouse clicks. Hold shift to add another 3x3 to whatever is already
on screen. Press space to clear the screen.

Two functions are called, drawCandyGrod (two options: x position and y
position), and drawCandy (6 possible options: x, y, radius of lillipop,
height of lillipop stick, color, rotation). In drawCandy, x and y are fed
by a nested for loop, while the radius of lillipop candy is randomly generated,
height is always scaled to 1, color is random, and rotation is random.
*/

float xposR, yposR;

void setup() {
  // Big screen!
  size(640, 480);
  background(0);

  ellipseMode(CENTER);
  noStroke();
  smooth();
  
  // A grid of lolli is placed randomly in the sketch area to start.
  xposR = random(200, width-200);
  yposR = random(200, height-200);
  drawCandyGrid(xposR, yposR);
}

// You have to have the draw function existing, else mousePressed
// will not work.
void draw() {
}

// Click mouse to add another grid. Shift+click to add grids without
// deleting the current one.
void mousePressed() {
  if (keyPressed) {
    if (keyCode == SHIFT) {
      drawCandyGrid(mouseX, mouseY);
    }
  }
  else {
    background(0);
    drawCandyGrid(mouseX, mouseY);
  }
}

// If the space bar is pressed, clears window entirely.
void keyPressed() {
  if (key == ' ') {
    background(0);
  }
}

// This simply runs a nested for loop to draw a 3x3 grid. It calls
// drawCandy to draw the actual candy.
void drawCandyGrid( float xpos, float ypos ) {
  pushMatrix();
  translate(xpos, ypos);
  for ( int j = -120; j <= 120; j += 120) {
    for ( int i = -120; i <= 120; i += 120) {
      color c = color(random(255), random(255), random(255));
      float angle = random(2*PI);
      float r_mod = random(0.5,1);
      float h_mod = 1;
      drawCandy(i, j, r_mod, h_mod, c, angle);
    }
  }
  popMatrix();
}

// That which draws the lollipop. Can be fed 5 different variables to
// change the appearance. But no alpha! Lollipop sticks don't vary in alpha!
// That's just silly.
void drawCandy( float xpos, float ypos, float r_mod, float h, color c, float angle) {
  pushMatrix();
  translate(xpos, ypos);
  rotate(angle);

  fill(255);
  rect(-4, -20, 8, 80*h);

  fill(c, 230);
  ellipse(0, -20, 40*r_mod, 40*r_mod);
  popMatrix();
}


