


//////   WALLPAPER PROJECT 2   ////////
//////       -------------     ////////

void setup(){
  size(400,800);
  
  background(167, 10, 84);
  smooth();
  noLoop();
  
  strokeWeight(1);
  stroke(255);
}

final float xStart = 30;
final float yStart = 40;

float xs, ys;

float xDiff;
float yDiff;

void draw(){
  
  
  xs = xStart - width / 2;
  ys = yStart - height / 2;
  xDiff = (width / 2 - xStart) / 4;
  yDiff = (height / 2 - yStart) / 4;
  
  translate(width / 2, height / 2);
  
  horiLines();
  rotate(PI);
  horiLines();
  
  rotate(PI);
  diaLines();
  scale(-1.0, 1.0);
  diaLines();
  rotate(PI);
  diaLines();
  scale(-1.0, 1.0);
  diaLines();
  rotate(PI);
  

  
  float at = xs + xDiff * 5;
  fill(255);
  quad(at, ys, at + xDiff / 2, ys + yDiff / 2, at, ys + yDiff, at - xDiff / 2, ys + yDiff / 2);
  
  fill(33, 135, 234);
  rotate(PI);
  quad(at, yStart, at + xDiff / 2, yStart / 2, at, 0, at - xDiff / 2, yStart / 2);
  
  rotate(PI);
  fill(255);
  quad(at, yStart, at + xDiff / 2, yStart / 2, at, 0, at - xDiff / 2, yStart / 2);
  
  
  
}

void horiLines() {
  int i = 0;
  line(xs + xDiff, ys, width / 2 - (xStart + xDiff), ys);
  while (i < 4) {
    line(xs + i * xDiff, ys + yDiff + i * yDiff,
         width / 2 - (xStart + i * xDiff), ys + yDiff + i * yDiff);
    i += 1;
  }
  float at = xs + xDiff * 5;
  fill(240, 193, 2);
  
  
  
}

void diaLines() {
  int i = 0;
  while (i < 4) {
    line(xs + i * xDiff, ys + (i + 1) * yDiff, xs + (i * 2 + 1) * xDiff, ys);
    i += 1;
  }
  line(xs + 5 * xDiff, ys + 4 * yDiff, xs + 8 * xDiff, ys + yDiff);
  
  float at = xs + xDiff * 5;
  fill(180);
  quad(at, ys + yDiff, at + xDiff / 2, (ys + yDiff / 2) + yDiff, at, (ys + yDiff) + yDiff, at - xDiff / 2, (ys + yDiff / 2) + yDiff);
  
  fill(149, 20, 201);
  quad(at + xDiff, ys + yDiff, (at + xDiff / 2) + xDiff, (ys + yDiff / 2) + yDiff, at + xDiff, (ys + yDiff) + yDiff, (at - xDiff / 2) + xDiff, (ys + yDiff / 2) + yDiff);
  
  fill(33, 135, 234);
  quad(0, ys, 0 + xDiff / 2, ys + yDiff / 2, 0, ys + yDiff, 0 - xDiff / 2, ys + yDiff / 2);
  
  fill(150); 
  quad(0, yDiff, 0 + xDiff / 2, yDiff / 2, 0, yDiff, 0 - xDiff / 2, 0 - yDiff / 2);
  
  fill(11, 29, 118);
  quad(0, yDiff * 1.5, 0 + xDiff / 2, (yDiff / 2) * 1.5, 0, yDiff * 1.5, 0 - xDiff / 2, (0 - yDiff / 2) * 1.5);
  
  fill(33, 135, 234);
  quad(at, yStart, at + xDiff / 2, yStart / 2, at, yDiff, at - xDiff / 2, yStart / 2);
  
  fill(149, 20, 201);
  
  quad(at / 4, ys / 4, (at + xDiff / 2) / 4, (ys + yDiff / 2) / 4, at / 4, (ys + yDiff) / 4, (at - xDiff / 2) / 4, (ys + yDiff / 2) / 4);
  
  fill(150);
  quad(at / 3, ys / 3, (at + xDiff / 2) / 3, (ys + yDiff / 2) / 3, at / 3, (ys + yDiff) / 3, (at - xDiff / 2) / 3, (ys + yDiff / 2) / 3);
  
  
  
  

  
  
  
}

