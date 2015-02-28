
//Xuan Li

//Lissajous Curve 
//Experiments Continued

color[] colors = new color[9];
color[] bMode = new color[14];

//GLOBAL LISSAJOUS VAR
float[] sSpeed = new float[9];
int[] a = new int[9];
int[] b = new int[9];
int c = 0;

int blending = 255;

Lj[] curves = new Lj[9];

void setup() {

  size(900, 900, JAVA2D);
  background(255);
  noStroke();

  blending = int(random(5, 50));

  color orange = color(204, 102, 0);
  color blu = color(0, 102, 153);

  bMode[0] = blendColor(orange, blu, BLEND);
  bMode[1] = blendColor(orange, blu, ADD);
  bMode[2] = blendColor(orange, blu, SUBTRACT);
  bMode[3] = blendColor(orange, blu, DARKEST);
  bMode[4] = blendColor(orange, blu, LIGHTEST);
  bMode[5] = blendColor(orange, blu, DIFFERENCE);
  bMode[6] = blendColor(orange, blu, EXCLUSION);
  bMode[7] = blendColor(orange, blu, MULTIPLY);
  bMode[8] = blendColor(orange, blu, SCREEN);
  bMode[9] = blendColor(orange, blu, OVERLAY);
  bMode[10] = blendColor(orange, blu, HARD_LIGHT);
  bMode[11] = blendColor(orange, blu, SOFT_LIGHT);
  bMode[12] = blendColor(orange, blu, DODGE);
  bMode[13] = blendColor(orange, blu, BURN);

  for (int i=0; i<9; i++) {
    colors[i] = bMode[int(random(0,14))];
  }

  for (int i=0; i<9; i++) {
    a[i] = int(random(1, 200));
    b[i] = int(random(1, 200));
    println(b[i] + " " + a[i]);
  }

  for (int i = 0; i < 9; i++) {
    sSpeed[i] = random(0.5, 10);
  }

  if (random(0, 10) < 5) {
    for (int i = 0; i < 3; i++) {
      for (int y = 0; y < 3; y++) {
        c = (c + 1) % 9;
        curves[c] = new Lj(i*300, y*300, colors[c], sSpeed[c], a[c], b[c]);
      }
    }
  } 
  else {
    for (int i = 0; i < 3; i++) {
      for (int y = 0; y < 3; y++) {
        c = (c + 1) % 9;
        curves[c] = new Lj(i*300, y*300, colors[c], sSpeed[c], i*20, y*20);
      }
    }
  }
}


void draw() {

  //fill(255, blending);
  fill(0, 10);
  rect(0,0,width,height);

  for (int i = 0; i < 9; i++) {
    curves[i].update();
  }
}

void mouseClicked() {
  setup();
}


