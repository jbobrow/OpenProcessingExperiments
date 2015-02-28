
// total number of possible points
int numpoints = 9;
float[] x = new float[numpoints];
float[] y = new float[numpoints];
float[] a = new float[numpoints];
float[] b = new float[numpoints];


void setup() {
  size(500, 500);
  // for main cells
  for (int i = 0; i < numpoints; i++) {
    x[i] = random(width);
    y[i] = random(height);
  }
  // for little background cells
  for (int i = 0; i < numpoints; i++) {
    a[i] = random(width);
    b[i] = random(height);
  }
}



void newStart() {
    // for main cells
  for (int i = 0; i < numpoints; i++) {
    x[i] = random(width);
    y[i] = random(height);
  }
}


int frame = 0;
String s = "Click 'R' key to reset the clock arrangement";

void draw() {
  frame++;
  background(0);
  noStroke();
  scale(0.8);
  fill(255);
  text(s, width-20, height+100);
  // if key 'r' pressed, new clock appears
  if(keyPressed) {
    if(key == 'r') {
      newStart();
    }
  } else {
    drawClocks();
  }

  //background cells
  fill(255, random(10, 80));
  for (int i = 0; i < numpoints; i++) {
    ellipse(a[i], b[i], 2, 2);
  }
}



void drawClocks() {
    // times
int Y = year(); 
int M = month(); 
int D = day(); 
int H = hour(); 
int T = minute(); 
int S = second();
int L = millis();
String ampm;

    for (int i = 3; i < numpoints; i++) {
    float size = ((30 + i) * 2) % 90;
    textAlign(CENTER);
    //line between buttons
    fill(255, 0, 0);
    curve(x[i], y[i], x[i-1], y[i-1], x[i-2], y[i-2], x[i-3], y[i-3]); 
    //first lime
    fill(255, 255, 175);
    ellipse(x[1], y[1], size, size);
    //second
    fill(0, 0, random(0, 255));
    ellipse(x[2], y[2], size*6/7, size*6/7);
    //third
    ellipse(x[3], y[3], size*5/7, size*5/7);
    //fourth
    ellipse(x[4], y[4], size*4/7, size*4/7);
    //fifth
    ellipse(x[5], y[5], size*3/7, size*3/7);
    //sixth
    ellipse(x[6], y[6], size*2/7, size*2/7);
    //last cyon button
    fill(0, 130, 153);
    ellipse(x[7], y[7], size*1/7, size*1/7);
    fill(255);
    text("year : " +Y, x[1], y[1]+50);
    text("month : " +M, x[2], y[2]+50);
    text("day : " +D, x[3], y[3]+50);
    text("hour : " +H, x[4], y[4]+50);
    text("minute : " +T, x[5], y[5]+50);
    text("second : " +S, x[6], y[6]+50);
    text("millis : " +L, x[7], y[7]+50);  
    // make it move
    if (! mousePressed) {
      //float phase = frame / random(0, 20);
      float phase = frame/ i;
      x[i] = x[i] + sin(phase);
      y[i] = y[i] + cos(phase);
    }
  }
}
