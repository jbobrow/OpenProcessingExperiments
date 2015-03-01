
import colors.pde; /*comment out for java, uncomment for javascript */


int base = 330;

void setup(){
  size(850,370);
  background(grey);
  redCup();
  yellowCup();
  greenCup();
  pinkCup();
}

void redCup () {
  strokeWeight(6);
  strokeJoin(MITER);
  fill(red);
  stroke(darkGrey);
  cup(80, 230, base, 60, 245);
}

void yellowCup () {
  strokeWeight(4);
  strokeJoin(MITER);
  strokeCap(SQUARE);
  fill(yellow);
  stroke(darkGrey2);
  cup(280, 190, base+2, 47, 205);
}

void greenCup () {
  strokeWeight(8);
  strokeJoin(BEVEL);
  strokeCap(ROUND);
  fill(green);
  stroke(darkGrey);
  cup(480, 160, base, 80, 180);
}

void pinkCup () {
  strokeWeight(14);
  strokeJoin(ROUND);
  strokeCap(PROJECT);
  fill(pink);
  stroke(darkGrey);
  cup(685, 285, base-3, 70, 300);
}

void cup (int x, int y, int base, int w, int rh) {
  beginShape();
  vertex(x, y);
  vertex(x, base);
  vertex(x+w, base);
  vertex(x+w, rh);
  endShape();
}
color black  = #000000,
      white = #ffffff,
      red = #ffb28c,
      orange = #FF9217,
      yellow = #fcffb4,
      green = #cfffd3,
      blue = #586CBB,
      pink = #ffd2ff,
      grey= #f2f4f2,
      darkGrey = #858585,
      darkGrey2 = #949494;


