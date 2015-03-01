


void setup() {
  size(600,600);
  background(0);
}

void draw() {
    for (int x = 10; x < 590; x = x+10) { //Array on x axis
      for (int y = 10; y < 590; y = y+10) { //Array on y axis
          rect(x,y,10,10);
    }
  }
}

  


