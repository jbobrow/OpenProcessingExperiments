
void setup() {
  size(500,500);
  background(255);
  noStroke();
}

void draw() {
  liquid(10,10);
}

void liquid(int x, int y) {
  for (int i = 0; i < 10; i++) {
    drop(int(random(500)),int(random(500)));
   }
}

void drop(int x, int y) {
  fill(x-40,x,y,3);
  translate(x,y);
  for (int i = 0; i < 380; i+=5) {
    ellipse(x,y,i-180,i-180);
  }
}


