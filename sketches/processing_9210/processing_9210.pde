

float SCALE = 4;
DensityPlotter plotter;
int curGrad = 0;
int curFunc = 0;
int time = 0;

void setup() {
  size(400, 400);
  background(0);
  frameRate(30);
  smooth();

  plotter = new DensityPlotter(functions[curFunc], -SCALE, SCALE, -SCALE, SCALE, gradients[curGrad]);
}

void draw() {
  time++;
  plotter.plot(time / 5f);
}

void keyPressed() {
  if (key == 'c') {
    curGrad++;
    curGrad = curGrad % gradients.length;
    plotter.setGradient(gradients[curGrad]);
  } 
  else if (key == '-') {
    SCALE++;
    plotter.setScale(SCALE);
  } 
  else if (key == '+') {
    if (SCALE > 2) {
      SCALE--;
      plotter.setScale(SCALE);
    }
  } 
  else if (key == 'f') {
    curFunc++;
    curFunc = curFunc % functions.length;
    plotter.setFunction(functions[curFunc]);
    time = 0;
  } 
  else if (key == ' ') {
    time = 0;
  }
}



