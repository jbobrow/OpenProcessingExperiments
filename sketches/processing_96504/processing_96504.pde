
void setup () {
  size (200, 200);
  background (255);
}
int x=-100;
int y=05;

void draw () {
  int spacing= 6;
  int endegs= 80;

  smooth();
  strokeWeight(5);
  x=x+spacing;
  point (x+100, x*x/100+100);
  point (-x+100, -x*x/100+100);
  point (x*x/100+100, x+100);
  point (-x*x/100+100, -x+100);
}
