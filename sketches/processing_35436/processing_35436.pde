
void setup() {
  size(700, 483);
}

void draw() {
float[] sinwave = new float[width];

for (int i = 0; i < width; i++) {
  float amount = map(i, 0, width, 0, 10*PI);
  sinwave[i] = abs(sin(amount));
}

for (int i = 0; i < width; i++) {
  stroke(sinwave[i]*255);
  line(i, 0, i, height);
}

}


