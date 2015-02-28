
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: JooYongGill
// ID: 201420108


float t = 40; 
void setup()
{
  size(600, 600);
  background(#FFFDB4, 100);
  smooth();
  for (int i = 0; i < 800; i = i + 30) {
    for (int j = 5; j < 800; j = j + 30) {
      noFill();
      strokeWeight(3);
      pattern(i, j);
    }
  }
  for (int q = 30; q<600; q = q + 60) {
    for (int w = 30; w<600; w = w + 60) {
      noFill();
      rectMode(CENTER);
      rect(q, w, t, t); 
      line(q, 0, q, 600);
    }
  }
  for (float u = 27.5; u<600; u = u + 30) {
    line(0, u, 600, u);
  }
}
void pattern(int x, int y)
{
  fill(#FFF700);
  strokeWeight(3);
  triangle(x + 15, y, x, y + 15, x + 30, y + 15);
}

