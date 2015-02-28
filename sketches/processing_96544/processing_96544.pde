
//Wictor Hugo - Variação quadrática
void setup () {
  size(200, 200);
  background(255);
  noStroke();
}

void draw () {
  for (int x=0; x < 80; x++)
  {
    fill (155,36,35);
    stroke (225, 150, 10);
    rect(x*30, 55, 8, 8);
    rect (x*30, 105, 8, 8);
    rect (75, x*25, 10, 8);
    rect (105, x*25, 10, 8);
  }
}
