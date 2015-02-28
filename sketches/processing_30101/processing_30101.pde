
float a=50, b=50;

void setup() {
  size(600, 600);
  smooth();
  frameRate(2.2);
}


void draw() {
  a+=.01;
  background(255);
  float Form = a;
  for (int i = 0; i < height; i++) {
    float x, y;
    x = noise(b)*width;
    y = noise(Form)*width;
    // rund bis spitz
    Form += 0.002;
    // Stofflichkeit
    b += 0.008;
    // Farben (1-Graustufen, 2-Grün)
    //stroke(random(0,255), random(0,255));
    stroke(119, 185, random(50, 255));
    line(width, i, -30, width-x);
    line( height, i, i, height-100-x);

    // Abstrakte Formen
    //    line(width-y, height,y, i);
    //  line(i, width-y, height-100, height-x);
  }

  a+= 50;
  b+= 50;
}


