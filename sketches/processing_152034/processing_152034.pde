
/*
 * Use LEFT and RIGHT to change the span of the circles journey
 * Drag the mouse to change the delay of the second circle
 */
int span;
int maxSpan;
int delay = 20;
int updown = 25;

int     num;    // the number of items in the array (# of circles)
float[] y;      // y-position of each circle (fixed)
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle

float red = 120;
float green = 120;
float blue = 120;

void setup() {
  size(800, 500);
  span = (int) (width / 2.5);
  maxSpan = span;
  num = 6;

  // allocate space for each array
  y = new float[num];
  speed = new float[num];
  phase = new float[num]; 

  // calculate the gap in y based on the number of circles
  float gap = height / (num + 1);

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once
    speed[i] = random(2, 6);
    phase[i] = random(TWO_PI);
  }
}

void draw() {
  background(red, green, blue);
  for (int i=0; i<num; i++) {
    // calculate the x-position of each ball based on the speed, phase and current frame
    float x1 = width/2 + sin(radians(frameCount*speed[i] ) + phase[i])* span;
    float x2 = width/2 + sin(radians(frameCount*speed[i] - delay ) + phase[i])* span;
    float y1 =  y[i] + cos(frameCount*0.2/speed[i]) * updown;
    float y2 = y[i] + cos((frameCount-delay)*0.2/speed[i]) * updown;
    stroke(0);
    line(x1, y1, x2, y2);
    noStroke();
    fill(255);
    ellipse(x1, y1, 20, 20);
    fill(255, 50);
    ellipse(x2, y2, 20, 20);
  }
}

void keyReleased() {
  if (keyCode == RIGHT && span < maxSpan) {
    span += 5;
  }
  if ( keyCode == LEFT && span > 40) {
    span -= 5;
  }
}

// change the background colour if the mouse is dragged
void mouseDragged() {
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(mouseX+mouseY, 0, width+height, 255, 0);
  delay = (int) map(mouseX, 0, width, 0, 50);
}

