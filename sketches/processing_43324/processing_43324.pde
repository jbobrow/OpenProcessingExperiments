
LineDup miLineDup1;
LineDup miLineDup2;
LineDup miLineDup3;

void setup () {
  size(600, 600);
  background(127);
  miLineDup1 = new LineDup(255, 75, 75);
  miLineDup2 = new LineDup(50, 150, 150);
  miLineDup3 = new LineDup(0, 250, 250);
}

void draw() {
  miLineDup1.reset();
  miLineDup1.recLine();
  miLineDup1.drawLine();

  miLineDup2.reset();
  miLineDup2.recLine();
  miLineDup2.drawLine();

  miLineDup3.reset();
  miLineDup3.recLine();
  miLineDup3.drawLine();
}

