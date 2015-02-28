
int numBoxes = 400;
int counters;
ColorBox[] boxes = new ColorBox [numBoxes];
ArrayList<ColorBox> changelist = new ArrayList<ColorBox>();
ColorButton[] buttons = new ColorButton [5];



void setup() {
  size (400, 500);
  int i=0;
  for (int y = 0; y< 400; y+=20) {
    for (int x =0; x< width; x+=20) {
      boxes[i] = new ColorBox(i, x, y);
      i++;
    }
  }
  buttons[0] = new ColorButton (10, 425, color (61, 76, 76));
  buttons[1] = new ColorButton (70, 425, color (153, 253, 46));
  buttons[2] = new ColorButton (130, 425, color (229, 255, 191));
  buttons[3] = new ColorButton (190, 425, color (100, 40, 0));
  buttons[4] = new ColorButton (250, 425, color (0));
  changelist.add(boxes[0]);
}
void draw() {
 background(255);
  for (int i=0; i<numBoxes; i++) {
    boxes[i].display();
  }
  for (int i= 0; i<buttons.length;i++) {
    buttons[i].display();
  }
  counters();
 
}

void mousePressed() {
  color myColor = color(0);
  for (int i= 0; i<buttons.length;i++) {
    if (buttons[i].hitTest(mouseX, mouseY)) {
      myColor= buttons[i].c;
      counters ++;
      break;
    }
  }

  checkColorAndAddToArrayList();

  changeColor(myColor);
  loop();
}
void changeColor (color newColor) {
  for (int i = 0; i< changelist.size(); i++) {
    ColorBox current = (ColorBox)(changelist.get(i));
    current.c = newColor;
  }
}

void checkColorAndAddToArrayList() {

  color base = boxes[0].c;
  for (int i=0;i<changelist.size();
  i++)
  {
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
      if (test.c == base) {
        if (!changelist.contains(test)) {
          changelist.add(test);
          println ("yay");
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

      if (((current.index)%20) != 0) {
      ColorBox test = boxes[current.index-1];
      if (test.c==base) {
        if (!changelist.contains(test)) {
          changelist.add(test);
        }
      }
    }
  }
}
void counters() {
  textSize(25);
  fill(0);
  text(counters + " /35", 310, 450);
  if (counters>=35) {
    noLoop();
    fill(0);
    rect(0, 0, width, height);
    fill(180, 10, 10);
    textAlign(CENTER);
    text("You Lost!!!", width/2, height/2);
  }
}

class ColorBox {
  int index;
  int x, y;
  //color
  color c;
  int boxSize = 20;

  ColorBox (int i, int newx, int newy) {
    index = i;
    x = newx;
    y = newy;
    int randNum = (int) random(5);
    switch(randNum) {
    case 0:
      c= color (61, 76, 76);
      break;
    case 1: 
      c = color(153, 253, 46);
      break;
    case 2: 
      c = color (229, 255, 191);
      break;
    case 3:
      c = color (100, 40, 0);
      break;
    
     case 4:
      c = color (0);
      break;
    }
  }
  void display() {
    fill(c);
    noStroke();
    rect(x, y, boxSize, boxSize);
  }
}

class ColorButton {
  int index;
  int x, y;
  color c;
  int boxSize = 50;

  ColorButton (int newx, int newy, color nc) {
    x = newx;
    y = newy;   
    c = nc;
  }
  void display() {
    fill(c);
    noStroke();
    rect(x, y, boxSize, boxSize);
  }
  boolean hitTest (float mouseX, float mouseY) {
    if (dist(x, y, mouseX, mouseY) <50) {
      return true;
    }
    else {
      return false;
    }
  }
}



