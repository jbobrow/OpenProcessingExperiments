
int counter;

void setup() {
  //setup function called initially, only once

  size(150, 150);

  background(0);
  //set background white

 counter = 0;

}


void draw() {


for (int x = 0; x < 15; x++) {
    for (int y = 0; y < 15; y++) {
        fill((int)random(255), (int)random(255), (int)random(255));
        rect(x*10, y*10, 10, 10);
    }
}

}
