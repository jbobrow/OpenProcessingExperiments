
int x;
int n;
float y;

void setup() {
    size(700, 400);
    smooth();
  }
    
void draw() {
  background(255);
  stroke(#FFEE00);
  strokeWeight(25);
  strokeJoin(MITER);
  beginShape();
  vertex(350, 0);
  vertex(350, 200);
  vertex(700, 200);
  vertex(700, 0);
  vertex(350, 0);
  endShape();
  stroke(#32CD32);
  strokeWeight(20);
  strokeCap(SQUARE);
  n = 10;
  y=(height/n);
  if (mouseX < 350) {
  line(0, y*0, mouseX, y*0);
  line(0, y, mouseX, y);
  line(0, y*2, mouseX, y*2);
  line(0, y*3, mouseX, y*3);
  line(0, y*4, mouseX, y*4);
  line(0, y*5, mouseX, y*5);
  line(0, y*6, mouseX, y*6);
  line(0, y*7, mouseX, y*7);
  line(0, y*8, mouseX, y*8);
  line(0, y*9, mouseX, y*9);
  line(0, y*10, mouseX, y*10);
  } else {
  line(0, y*0, 350, y*0);
  line(0, y, 350, y);
  line(0, y*2, 350, y*2);
  line(0, y*3, 350, y*3);
  line(0, y*4, 350, y*4);
  line(0, y*5, 350, y*5);
  line(0, y*6, 350, y*6);
  line(0, y*7, 350, y*7);
  line(0, y*8, 350, y*8);
  line(0, y*9, 350, y*9);
  line(0, y*10, 350, y*10);
  }

  strokeCap(ROUND);
  stroke(#5F9F9F, 150);
  strokeWeight(10);
  n = 25;
  x=(width/n);
  if (mouseY > 200) {
  line(x*0, height, x*0, mouseY);
  line(x, height, x, mouseY);
  line(x*2, height, x*2, mouseY);
  line(x*3, height, x*3, mouseY);
  line(x*4, height, x*4, mouseY);
  line(x*5, height, x*5, mouseY);
  line(x*6, height, x*6, mouseY);
  line(x*7, height, x*7, mouseY);
  line(x*8, height, x*8, mouseY);
  line(x*9, height, x*9, mouseY);
  line(x*10, height, x*10, mouseY);
  line(x*11, height, x*11, mouseY);
  line(x*12, height, x*12, mouseY);
  line(x*13, height, x*13, mouseY);
  line(x*14, height, x*14, mouseY);
  line(x*15, height, x*15, mouseY);
  line(x*16, height, x*16, mouseY);
  line(x*17, height, x*17, mouseY);
  line(x*18, height, x*18, mouseY);
  line(x*19, height, x*19, mouseY);
  line(x*20, height, x*20, mouseY);
  line(x*21, height, x*21, mouseY);
  line(x*22, height, x*22, mouseY);
  line(x*23, height, x*23, mouseY);
  line(x*24, height, x*24, mouseY);
  line(x*25, height, x*25, mouseY);
  } else {
  line(x*0, height, x*0, 200);
  line(x, height, x, 200);
  line(x*2, height, x*2, 200);
  line(x*3, height, x*3, 200);
  line(x*4, height, x*4, 200);
  line(x*5, height, x*5, 200);
  line(x*6, height, x*6, 200);
  line(x*7, height, x*7, 200);
  line(x*8, height, x*8, 200);
  line(x*9, height, x*9, 200);
  line(x*10, height, x*10, 200);
  line(x*11, height, x*11, 200);
  line(x*12, height, x*12, 200);
  line(x*13, height, x*13, 200);
  line(x*14, height, x*14, 200);
  line(x*15, height, x*15, 200);
  line(x*16, height, x*16, 200);
  line(x*17, height, x*17, 200);
  line(x*18, height, x*18, 200);
  line(x*19, height, x*19, 200);
  line(x*20, height, x*20, 200);
  line(x*21, height, x*21, 200);
  line(x*22, height, x*22, 200);
  line(x*23, height, x*23, 200);
  line(x*24, height, x*24, 200);
  line(x*25, height, x*25, 200);
}
}
