
int counter;

void setup() {  //setup function called initially, only once
size(700, 500);

// Set the background to black and turn off the fill color
background(0);
noFill();

noStroke();
background(51, 0, 0);
}

void draw() {
 // drawTarget(width, height, 200, 4);
    drawTarget(width*0.5, height*0.5, 300, 4);
  //drawTarget(width*0.75, height*0.3, 120, 6);
}

void drawTarget(float xloc, float yloc, int size, int num) {
  float grayvalues = 255/num;
  float steps = size/num;
  for (int i = 0; i < num; i++) {
    fill(i*grayvalues);
    ellipse(xloc, yloc, size - i*steps, size - i*steps);
  }
}
