
void setup () {
  size (600, 200);
  smooth();
}

void draw () {

  background (#57385c);
  fill (#ffedbc);
  stroke(#A75265);
  strokeWeight(2);

  foo6(20);
}

void foo6(float steps) {
  float x = 0;
  int counter = 0;
  while (x < width) {
    float y = 25;
    if (counter == 1) {
      y = y + 50;
    }
    rect(x, y, steps, height-100);

    counter = counter + 1;
    if (counter == 2) {
      counter = 0;
    }
    x = x + steps;
  }
}

