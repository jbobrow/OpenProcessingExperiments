
//Emanuele Reis - Reforço Exercício 5
void setup () {
  size (200, 200);
  background (0);
}
void draw () {
  stroke (#FFDC0F);

  int y=50;
  while (y<200) {
    line(30, 50, 80-y*y/900, y);
    line (170, 50, 120+y*y/900, y);
    y=y+25;
  }
}
