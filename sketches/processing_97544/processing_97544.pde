
int x=-100;
int y=5;
void setup () {
  size (200, 200);
}

void draw () {
  background (50);
  for (int y= 55; y< 165; y= y+25) {
    noStroke ();
    fill (238, 242, 12, y+100);
    ellipse (y, 60, 50, 50);


    int spacing= 10;
    for (int x=-100; x<200; x=x+spacing) {
      stroke (238, 242, 12);
      strokeWeight (4);
      point (x+100, x*x/100+100);
    }
  }
}
