
int i;

float r_x = random(50,300);
float r_y = random(50,300);

float [] r = new float[5];
int [] stop = {
  20, 35, 50, 60, 80
};

void setup() {
  size(350, 350);
  background(0);
  smooth();
}

void draw() {
  fill(0, 5);
  noStroke();
  rect(0, 0, width, height);

  stroke(0);
  strokeWeight(5);
  fill(200, 0, 0);

  rose(r_x, r_y);
}

void rose(float x, float y) {
  pushMatrix();

  translate(x, y);

  ellipse(0, 0, r[4], r[4]);
  ellipse(-10, 10, r[3], r[3]);
  ellipse(0, 0, r[2], r[2]);
  ellipse(10, 0, r[1], r[1]);
  ellipse(0, 0, r[0], r[0]);

  r[i]+= 0.5 + i*0.2;
  if (r[i] > stop[i]) {
    r[i] = stop[i];
    i++;
    if (i > 4) {
      for (int j = 0;j< 5;j++) {
        r[j] = 0;
      }
      r_x = random(50,300);
      r_y = random(50,300);
      i = 0;
    }
  }

  popMatrix();
}


