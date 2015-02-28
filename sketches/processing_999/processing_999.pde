
void setup() {
  size(100, 100);
}
void draw() {
  frameRate(100);
for (int i = 0; i < 100; i++) 
for (int n = 0; n < 100; n++){
stroke( random(255), random(255), random(255), random(255));

smooth();

  line(n, i, n, i);
  }
}

