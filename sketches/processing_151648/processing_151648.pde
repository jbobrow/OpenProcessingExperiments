
int     num;    // the number of items in the array (# of circles)
float[] y;      // y-position of each circle (fixed)
float[] x;      // x-position of each circle (changes draw() for loop with i)
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle
boolean[] moving; // boolean recording if moving for click test
color[] col;    // color object array to store color state

float dia = 40;
float red = 120;
float green = 120;
float blue = 120;

void setup() {
  size(500, 500);
  noStroke();
  num = 10;

  // allocate space for each array
  y = new float[num];
  x = new float[num];
  speed = new float[num];
  phase = new float[num];
  moving = new boolean[num];
  col = new color[num];

  // calculate the gap in y based on the number of circles
  float gap = height / (num + 1);

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once
    speed[i] = random(-2, 2);
    phase[i] = random(360);
    moving[i] = true;
    col[i] = color(255, 255, 255);
  }
}


void draw() {
  background(red, green, blue);
  for (int i=0; i<num; i++) {
    // calculate the x-position of each ball based on the speed, phase and current frame
    if (moving[i]) {
      float amp = width/2 - dia/2;
      x[i] = width/2 + sin(radians(frameCount*speed[i] + phase[i]))* amp;
    } 
    if ((dist(mouseX, mouseY, x[i], y[i]) <= dia/2)) {
      col[i] = color(255, 0, 0);
    } else if (!moving[i]) {
      col[i] = color(255-red, 255-green, 255-blue);
    } else {
      col[i] = color(lerp(0,255,(x[i]/width)), lerp(190,64,(x[i]/width)), lerp(255,0,(x[i]/width)));
    }
    fill(col[i]);
    ellipse(x[i], y[i], dia, dia);
  }
}


// change the background colour if the mouse is dragged
void mouseMoved() {
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(mouseX+mouseY, 0, width+height, 255, 0);
}

void mousePressed() {
  for (int i=0; i<num; i++) {
    if (dist(mouseX, mouseY, x[i], y[i]) <= dia/2) {
      moving[i] = !moving[i];
      speed[i] = random(-2, 2);
      if (moving[i]) {
        phase[i]= degrees(asin((x[i]-width/2)/(width/2)))-frameCount*speed[i];
      }
    }
  }
}

