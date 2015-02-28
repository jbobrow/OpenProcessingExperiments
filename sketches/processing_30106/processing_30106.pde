
// '1' = shake it

float a=50, b=50;
float t = 0.0;
float s = 0.007;
float s2 = 2;
float inc = 0.003;

void setup() {
  size(600, 500);
  smooth();
}


void draw() {

  background(255);
  float Form = a;
  for (int i = 0; i < height; i++) {
    float x, y;
    x = noise((i+t)/100.0 + 8) * width;
    //x = noise(b)*width;
    y = noise(Form)*width;
    Form += 0.002;     // rund bis spitz
    b += 0.008;
    // Farben (1-Graustufen, 2-Grün)
    //stroke(random(0,255), random(0,255));
    stroke(119, 185, random(50, 255));
    line(width, i, -30, width-x);
    //line( width, i, i, height-100-x);
    t+=s;


    if ((keyPressed == true)&&(key == '1')) {
      t+=s2;
    }
  }

  a+= 50;
  b+= 50;
}


