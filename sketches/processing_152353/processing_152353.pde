
int     num;    // the number of items in the array (# of circles)
float[] y;      // y-position of each circle (fixed)
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle
float[] mag;

float red = 255;
float green = 255;
float blue = 255;

void setup() {
  size(500, 500);

  num = 10;

  // allocate space for each array
  y = new float[num];
  speed = new float[num];
  phase = new float[num]; 
  mag = new float[num];

  // calculate the gap in y based on the number of circles
  float gap = height / (num + 1);

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once
    speed[i] = random(2, 5);
    phase[i] = random(TWO_PI);
    mag[i] = random(150, 230);
  }
  frameRate(60);
}


void draw() {
  //if(frameCount%30==0)
  //background(red, green, blue, 1);
  for (int i=0; i<num; i++) {
    // calculate the x-position of each ball based on the speed, phase and current frame
    float x1 = width/2 + sin(radians(frameCount*speed[i] ) + phase[i])* mag[i];
    noStroke();
    fill(255-red, 255-green, 255-blue);
    ellipse(x1, y[i], 20, 20);
    if(i>0){
      stroke(255-red, 255-green, 255-blue);
      float x2 = width/2 + sin(radians(frameCount*speed[i-1]) + phase[i-1])*mag[i-1];
      line(x1, y[i], x2, y[i-1]);
    }
  }
  fill(red, green, blue, 20);
  rect(0, 0, width, height);
    red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(mouseX+mouseY, 0, width+height, 255, 0);

}


// change the background colour if the mouse is dragged
void mouseDragged() {
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(mouseX+mouseY, 0, width+height, 255, 0);
}

