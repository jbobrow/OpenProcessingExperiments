
int     num;    // the number of items in the array (# of circles)
float[] y;      // y-position of each circle (fixed)
float[] x;      // x-position of each circle (fixed)
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle

float red = 120;
float green = 120;
float blue = 120;
float radio=50;

void setup() {
  size(500, 500);

  num = 5;

  // allocate space for each array
  y = new float[num];
  x = new float[num];
  speed = new float[num];
  phase = new float[num]; 

  // calculate the gap in y based on the number of circles
  float gap = height / (num + 1);

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once
    speed[i] = random(5);
    phase[i] = random(TWO_PI);
  }
}


void draw() {
  background(255);
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(mouseX+mouseY, 0, width+height, 255, 0);
  
  for (int i=0; i<num; i++) {
  
    // calculate the x-position of each ball based on the speed, phase and current frame
    x[i] = width/2 + sin(radians(frameCount*speed[i] ) + phase[i])* 200;
    fill(red, green, blue);
    noStroke();
    ellipse(x[i], y[i], radio, radio);
  }
}



void mouseClicked() {
  
  for(int i=0; i<num; i++){
  if (dist(mouseX, mouseY, x[i], y[i]) <= radio) {
    if (speed[i]>0){
      speed[i]=0;
    }else{
      speed[i]=random(5);
      phase[i]=random(TWO_PI);
    }
  }
  }
  
}

