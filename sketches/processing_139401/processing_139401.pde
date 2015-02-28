
int counter;

void setup() {
  //setup function called initially, only once

  size(250, 250);

  background(0);
  //set background white

 counter = 0;

}


void draw() {


for (int x = 0; x < 15; x++) {
    for (int y = 0; y < 15; y++) {
        fill((int)random(255), (int)random(255), (int)random(255));
        rect(x*30, y*30, 30, 30);
    }
}

}
