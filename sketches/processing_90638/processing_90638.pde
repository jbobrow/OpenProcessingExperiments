
/*
 Pearlyn Lii
 ID 3
 12/21/13
 */

//global variables

int amount = 100;
int[] x = new int[amount];
int[] y = new int[amount];
int[] z = new int[amount];

int x1 = 360;
int y1 = 50;
int z1 = 20;

int x2 = 360;
int y2 = 60;
int z2 = 30;

float sw = .5;

void setup() {
  size(400, 800, P3D);
  smooth();
  colorMode(HSB, 360, 100, 100);
  background(0);
  noFill();
}
void draw() {
  background(0);

  translate(width/2, height/2);
  rotateX(frameCount / 150.0);
  rotateZ(frameCount / 150.0);

  renderHeater(); //draw le heater
}

//--------------heater + spikes--------------

void renderHeater() {
  for (int i = 0; i<amount/2; i++) {
    stroke(x1, y1, z1);
    strokeWeight(sw);
    box(x[i], y[i], z[i]);
    heat();
    line(0, 0, 0, x[i], y[i], z[i]);
  }
}

//--------------heat spikes!--------------

void heat() {

  for (int x2 = 1; x2<360; x2++) {
    stroke(x2, y2, y2);
  }
}

void randomize() {
  
  //--------------randomize heater drawing--------------

  for (int i = 0; i<amount; i++) {
    x[i] = int(random(-110, 80));
    y[i] = int(random(1, 60));
    z[i] = int(random(7, 350));
  }

  //--------------randomize color of heater--------------
  
  x1 = floor(random(100, 260));
  y1 = floor(random(50, 60));
  z1 = floor(random(30, 40));
  
  //--------------randomize stroke weight of heater drawing--------------

  sw = floor(random(1, 2));
}
  //--------------everytime 'r' is pressed, a new variation generates--------------

void keyPressed() {
  if (key == 'r') {
    randomize();
  }
}



