
void setup() {
  size(900, 900);
  background(0);
}

void draw () {

  stroke (255);
  for (int x=20; x<=300; x+=105) {
    line ( 200, mouseX, 300, mouseY); 
    for (int y=20; y<=300; y+=25) {
      line ( mouseX, 200, mouseY, 300); 
      rotate (10);
    }
  }

  stroke (215, 50, 75);
  for (int x=30; x<=150; x+=20) {
    for (int y=10; y<=300; y+=20) {
      line ( mouseX, 150, mouseY, 100); 
      rotate (20);
    }
  }
}




