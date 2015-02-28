
Robot[] cats = new Robot[5];

void setup() {
  size(670, 320);
  smooth();
  for (int i = 0; i < cats.length; i++) {
    float x = i * 160;
    float y = 124;
    cats[i] = new Robot(x, y);
  }
}

void draw() {
  background(255);
  for (int i = 0; i < cats.length; i++) {
    cats[i].shiftyEyes();
    cats[i].flashing();
    cats[i]. display();
  }
}
  

