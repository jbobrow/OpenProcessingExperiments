
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(0);  //set background white
  counter = 0;
}

void draw() {  //draw function loops
  if (++counter % 10 == 0) {
    fill(255, 255, 255, 5);
    rect(0, 0, 40, 40);
    fill(0);
    rect(40, 40, 100, 100);
    fill(255);
    text(counter / 10, 50, 50);
  }
}

                
                
