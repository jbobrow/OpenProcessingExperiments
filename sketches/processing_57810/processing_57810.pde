
// Ryanne Hollies
// PS3-4

float line1[] = new float[200];

float dia;

float value = 0;
void setup() {
  size(400, 400);


  for (int i = 0; i < line1.length; i++) {
    value+= .01;
    line1[i] = map( noise(value), 0, 1, 0, height);
  }
  smooth();
  frameRate(60);
}



void draw() {
  noStroke();
  fill(30, 240, 230, 25);
  rect(0, 0, width, height);

  value += map(mouseX, 0, width, .001, 0.05);
  float nvalue = noise(value);
  float new_y = map(nvalue, 0, 1, 0, width);

  shiftAndAdd(line1, new_y);


  float x1, y1, x2, y2, radius;
  strokeWeight(0.5);
  noFill();
  int offset = 30;
  for (int i = 0; i < line1.length; i++) {
    x1 = map(i, 0, line1.length, 0, width-offset);
    y1 = line1[i];
    dia = map(i, 0, line1.length, 2, 80);
    y1 -= width/2;
    y1 *= (i+width/2)/(float)line1.length;
    y1 += width/2;
    stroke(255, 13, 134, 200);
    rect(y1, x1, dia, dia);
  }
}

void shiftAndAdd(float a[], float value) {
  int a_length = a.length;
  System.arraycopy(a, 1, a, 0, a_length-1);
  a[a_length-1] = value;
}


