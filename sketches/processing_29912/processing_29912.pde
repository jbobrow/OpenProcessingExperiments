
// opart! (07/06/11)

void setup() {
  size(1000, 600);
  noStroke();
  smooth();
  for (int i=0; i<num; i++) {
    float var = map(i, 0, num-1, 0, PI);
    grises[i]=10+235*sin(var);
  }
}

int num = 25;
int counter = 0;
int color_counter = 0;
float[] grises = new float[num];

void draw() {
  float r = sqrt(width*width+height*height)/num;
  pushMatrix();
  translate(width/2, height/2);
  for (int i=num; i>0; i--) {
    llenado(i);
    ellipse(0, 0, r*i, r*i);
  }
  popMatrix();
  counter++;
  if (counter == grises.length) {
    counter = 0;
  }
}

void mouseClicked() {
  color_counter = (color_counter+1) % 4;
}

void llenado(int i) {
  int d = 50;
  if (color_counter == 0) {
    fill(grises[(i + counter) % grises.length]);
  } else if (color_counter == 1) {
    fill(grises[(i + counter) % grises.length], d, d);
  } else if (color_counter == 2) {
    fill(d, grises[(i + counter) % grises.length], d);
  } else if (color_counter == 3) {
    fill(d, d, grises[(i + counter) % grises.length]);
  } 
}

