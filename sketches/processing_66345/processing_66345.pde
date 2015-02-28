
void setup() {
  size(500, 500);
  background(255);
  smooth();
}

void draw() {  
  noStroke();
  
  //top
  for (int x = 0; x < 500; x+=40) {
    for (int y = 0; y < 500; y+=60) {
      fill(248, 208, 150);
      quad(0+x, -30+y, 20+x, -20+y, 0+x, -10+y, -20+x, -20+y);
    }
  }

  //left
  for (int x = 0; x < 500; x+=40) {
    for (int y = 0; y < 500; y+=60) {
      fill(174, 180, 150);
      quad(-20+x, -20+y, 0+x, -10+y, 0+x, 10+y, -20+x, 0+y);
    }
  }

  //right
  for (int x = 0; x < 500; x+=40) {
    for (int y = 0; y < 500; y+=60) {
      fill(20, 42, 81);
      quad(20+x, -20+y, 20+x, 0+y, 0+x, 10+y, 0+x, -10+y);
    }
  } 
  
  //2nd row top
  for (int x = 0; x < 500; x+=40) {
    for (int y = 0; y < 500; y+=60) {
      fill(248, 208, 150);
      quad(20+x, 0+y, 40+x, 10+y, 20+x, 20+y, 0+x, 10+y);
    }
  }

  //2nd row left
  for (int x = 0; x < 500; x+=40) {
    for (int y = 0; y < 500; y+=60) {
      fill(174, 180, 150);
      quad(40+x, 10+y, 40+x, 30+y, 20+x, 40+y, 20+x, 20+y);
    }
  }

  //2nd row right
  for (int x = 0; x < 500; x+=40) {
    for (int y = 0; y < 500; y+=60) {
      fill(20, 42, 81);
      quad(0+x, 10+y, 20+x, 20+y, 20+x, 40+y, 0+x, 30+y);
    }
  }
}
