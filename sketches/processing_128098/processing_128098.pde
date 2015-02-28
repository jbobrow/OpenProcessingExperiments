
int numBoxes = 400;
ColorBox[] boxes = new ColorBox[numBoxes];
int tt = 45;
float t = tt;

ArrayList<ColorBox> changelist = new ArrayList<ColorBox>();

void setup() {
  size(400, 450);
  int i = 0;
  for (int y = 0; y < 400; y+=20) {
    for (int x = 0; x < 400; x+=20) {
      boxes[i] = new ColorBox(i, x, y);
      i++;
    }
  } 
  changelist.add(boxes[0]);
}
void draw () {
  background(255);
  for (int i = 0; i < numBoxes; i++) {
    boxes[i].display();
  }
  //  noLoop();

  fill(0);
  text("1", 10, 410);
  text("2", 90, 410);
  text("3", 170, 410);
  text("4", 250, 410);
  text("5", 330, 410);

  fill(#FF0000);
  ellipse(35, 425, 40, 40);
  fill(#1009E8);
  ellipse(115, 425, 40, 40);
  fill(#09DFE8);
  ellipse(195, 425, 40, 40);
  fill(#03FF0C);
  ellipse(275, 425, 40, 40);
  fill(#DDFF03);
  ellipse(355, 425, 40, 40);

  fill(0);
  text(nf(t, 2, 1), 210, 410);
  t -= .01;
  if (t < 0) {
    textSize(30);
    text("GAME OVER", 200, 200);
    noLoop();
  }
}
void mousePressed () {
  int x = int (mouseX / 20);
  int y = int (mouseY / 20);

  int i = int (x + (y * 400/20));
  color myColor = boxes[i].c;

  checkColorAndAddToArrayList();


  changeColor (myColor);
  loop();
}

void changeColor (color newColor) {
  for (int i = 0; i < changelist.size(); i++) {
    ColorBox current = (ColorBox)(changelist.get(i));
    current.c = newColor;
  }
}

void checkColorAndAddToArrayList() {

  color base = boxes[0].c;
  for (int i = 0; i < changelist.size(); i++) {
    ColorBox current = changelist.get(i);
    //north
    if (current.index-20 > 0) {
      ColorBox test = boxes[current.index-20];
      if (test.c==base) {
        if (!changelist.contains(test)) {
          changelist.add(test);
        }
      }
    }
    //east
    if ((current.index)% 20 != 19) {
      ColorBox test = boxes[current.index+1];
      if (test.c==base) {
        if (!changelist.contains(test)) {
          changelist.add(test);
        }
      }
    }
    //south
    if (current.index+20 < 400) {
      ColorBox test = boxes[current.index+20];
      if (test.c==base) {
        if (!changelist.contains(test)) {
          changelist.add(test);
        }
      }
    }
    //west
    if ((current.index)% 20 != 0) {
      ColorBox test = boxes[current.index-1];
      if (test.c==base) {
        if (!changelist.contains(test)) {
          changelist.add(test);
        }
      }
    }
  }
}

class ColorBox {
  int index;
  int x, y;
  color c;
  int boxSize = 20;

  ColorBox(int i, int newx, int newy) {
    index = i;
    x = newx;
    y = newy;
    int randNum = (int) random(5);
    switch(randNum) {
    case 0: 
      c = color(#FF0000);
      break;
    case 1:
      c = color(#1009E8);
      break;
    case 2: 
      c = color(#09DFE8);
      break;
    case 3:
      c = color(#03FF0C);
      break;
    case 4:
      c = color(#DDFF03);
      break;
    }
  }

  void display() {
    fill(c);
    noStroke();
    rect(x, y, boxSize, boxSize);
  }
}



