
float x;
float x2 = 200;
float x3 = 100;
float x4 = 100;
float y1 = 100;
float y2 = 100;

void setup() {
  size(200, 200);
}

void draw() {
  background(255);

  fill(0);
  rect(x, 30, 20, 20);
  rect(x2, 150, 20, 20);

  x++;
  x2--;

  x2 = constrain(x2, 90, 185);

  x = constrain(x, 0, 90);

  line(x3, 100, x4, 100);

  x3 = x3- 0.3;
  x4 = x4+0.3;

  if (x3<10) {
    line(10, y1, 10, y2);
    line(190, y1, 190, y2);
    y1 = y1+0.3;
    y2 = y2-0.3;
  }
  
}



