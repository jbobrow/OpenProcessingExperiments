
class ColorBox {
  int index;
  int x, y;
  color c;
  int boxSize=20;

  ColorBox(int i, int newx, int newy) {
    index=i;
    x=newx;
    y=newy;
    int randNum=(int)random(5);
    switch(randNum) {
    case 0:
      c=color(61, 76, 76);
      break;
    case 1:
      c=color(153, 153, 46);
      break;
    case 2:
      c=color(229, 229, 102);
      break;
    case 3:
      c=color(242, 255, 191);
      break;
    case 4:
      c=color(100, 40, 0);
      break;
    }
  }
  void display() {
    fill(c);
    noStroke();
    rect(x, y, boxSize, boxSize);
  }
}


