
float x, y;      // current drawing position
float dx, dy;    // change in position at each frame
float rad;       // radius for the moving hand

void setup() {
  size(500, 500);

  // initial position in the centre of the screen
  x = width/2;
  y = height/2;

  // dx and dy are the small change in position each frame
  dx = random(-1, 1);
  dy = random(-1, 1);
  
}


void draw() {
  // blend the old frames into the background
  blendMode(BLEND);
  fill(random(255),random(255),random(255),15);
  rect(0, 0, width, height);
  rad = radians(frameCount);

  // calculate new position
  x += dx;
  y += dy;

  float max = 1;
  float min = 0.5;

  //When the shape hits the edge of the window, it reverses its direction and changes velocity
  if (x > width-100 || x < 100) {
    dx = dx > 0 ? -random(min, max) : random(min, max);
  }

  if (y > height-100 || y < 100) {
    dy = dy > 0 ? -random(min, max) : random(min, max);
  }

  float bx = x + 50 * sin(rad*2);
  float by = y + 50 * cos(rad*4);

  fill(random(255),random(255),random(255));

  float radius = 100 * sin(rad*0.1);
  float handX = bx + radius * sin(rad*3);
  float handY = by + radius * cos(rad*3);

  stroke(random(255),random(255),random(255), 100);
  ellipse(bx, by, handX, handY);
  ellipse(handX, handY, 2, 2);
}

