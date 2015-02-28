
//////   WALLPAPER PROJECT 1   ////////
//////       -------------     ////////



void setup(){

  size(400,800);
  
  background(53,169,229);
  smooth();
  noLoop();
  
  strokeWeight(1);
  stroke(255);
  
  
}

final float xStart = 50;
final float yStart = 75;

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
  
  fill(85, 14, 137);
  quad(at, ys, at + xDiff / 2, ys + yDiff / 2, at, ys + yDiff, at - xDiff / 2, ys + yDiff / 2);
  quad(at / 3, ys / 3, (at + xDiff / 2) / 3, (ys + yDiff / 2) / 3, at / 3, (ys + yDiff) / 3, (at - xDiff / 2) / 3, (ys + yDiff / 2) / 3);
  
  fill(240, 193, 2);
  rotate(PI);
  quad(at, yStart, at + xDiff / 2, yStart / 2, at, 0, at - xDiff / 2, yStart / 2);
  
  rotate(PI);
  
  fill(222, 111, 7);
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
  fill(240, 193, 2);
  quad(at, ys, at + xDiff / 2, ys + yDiff / 2, at, ys + yDiff, at - xDiff / 2, ys + yDiff / 2);
  fill(85, 14, 137);
  quad(at + xDiff, ys, (at + xDiff / 2) + xDiff, ys + yDiff / 2, at + xDiff, ys + yDiff, (at - xDiff / 2) + xDiff, ys + yDiff / 2);
  
  fill(222, 111, 7);
  quad(at, ys + yDiff, at + xDiff / 2, (ys + yDiff / 2) + yDiff, at, (ys + yDiff) + yDiff, at - xDiff / 2, (ys + yDiff / 2) + yDiff);
  
  fill(149, 20, 201);
  quad(0, ys, 0 + xDiff / 2, ys + yDiff / 2, 0, ys + yDiff, 0 - xDiff / 2, ys + yDiff / 2);
  
  fill(222, 111, 7); 
  quad(0, yDiff, 0 + xDiff / 2, yDiff / 2, 0, yDiff, 0 - xDiff / 2, 0 - yDiff / 2);
  
  fill(149, 20, 201);
  quad(at, yStart, at + xDiff / 2, yStart / 2, at, 0, at - xDiff / 2, yStart / 2);
  quad(at / 2, ys / 2, (at + xDiff / 2) / 2, (ys + yDiff / 2) / 2, at / 2, (ys + yDiff) / 2, (at - xDiff / 2) / 2, (ys + yDiff / 2) / 2);
  
  fill(85, 14, 137);
  quad(at / 3, ys / 3, (at + xDiff / 2) / 3, (ys + yDiff / 2) / 3, at / 3, (ys + yDiff) / 3, (at - xDiff / 2) / 3, (ys + yDiff / 2) / 3);
  

  
  }
  
  



