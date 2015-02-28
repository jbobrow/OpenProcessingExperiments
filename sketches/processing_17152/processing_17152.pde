
float value = 1;
float value2 = 1;
float value3 = 1;
float value4 = 1;
float change = 6;
float change2 = 8;
float change3 = 10;
float change4 = 10;
int screenwidth = 900;
int screenheigth = 900;
int r=0;
int g=50;
int b=130;

void setup() {
  size(screenwidth,screenheigth);
  smooth();
  frameRate(30);
}

void draw() {

  background(0);
  for (int j=0; j<40; j++) {

    strokeWeight(j+4);
    stroke(r,g,b,100);
    line(0,value+j*30,width,value3+j*30);
    line(0,value-j*30,width,value3-j*30);
    line(value2+j*30,0, value4+j*30,height);
    line(value2-j*30,0, value4-j*30,height);
  }

  r += change;
  g += change2;
  b += change3;

  value += change;
  value2 += change2;
  value3 += change3;
  value4 += change4;

  if (value > screenheigth || value < 1) {
    change *= -1;
  }
  if (value2 > screenwidth || value2 < 1) {
    change2 *= -1;
  }
  if (value3 > screenheigth || value3 < 1) {
    change3 *= -1;
  }
  if (value4 > screenwidth || value4 < 1) {
    change4 *= -1;
  }
}


