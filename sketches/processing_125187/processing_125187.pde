
void setup () {
  size(400, 400);
  smooth ();
  background (255);
}
void draw () {
  float y=0;
  float x=0;
  float td1=100;
  fill(td1);
  ellipse  (260, 158, 80, 20);
  while (y <= 260 && x <= 160 ) {
    fill(td1);
    ellipse  (x, y, x, y);
    td1 = td1 + 10;
    y = y + 10;
    x = x +10;
  }
  fill(td1-30);
  ellipse  (197, 141, 30, 30);
  fill(td1-30);
  ellipse  (170, 320, 210, 210);
  ellipse  (260, 158, 80, 20);
  while (y <= 300 ) {
    fill(120);
    ellipse  (200, y+75, 10, 10);
    y = y + 30;
  }
}

