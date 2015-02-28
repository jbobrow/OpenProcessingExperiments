
void setup() {
  size (600, 600);
  smooth();
}

void draw() {
  background (250);
  fill (0);
  rect (width/2,0,width, height);

  for (int y = 40; y <= height; y = y + 100) {
    for (int x = 50; x <= width/2 -20; x = x + 100) {
      fill (196, 252, 248);
      ellipse (x, y, 10, 70);

   
        fill (255, 255, 0);
        ellipse (x, y+20, 30, 10);
        ellipse (x, y+25, 10, 20);
      
  }
}
  for (int y = 40; y <= height; y = y + 100) {
    for (int x = width/2 + 50; x <= width -20; x = x + 100) {
      fill (255);
      ellipse (x, y, 70, 30);
      fill (255, 200, 70);
      ellipse (x, y, 10, 30);
    }
  }

 for (int y = 40; y <= height; y = y + 100) {
    for (int x = width/2 + 50; x <= width -20; x = x + 100) {
      fill (0);
      rect(x-40, y-30, 100, 20);
      
    }
  }


}


