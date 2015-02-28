
//although there is no indicator, you have 30 color switches to get the whole grid or you lose.

int numBoxes = 400;
int count=0;
ColorBox[] boxes = new ColorBox[numBoxes];
circle[] circles = new circle[5];

ArrayList<ColorBox> changelist = new ArrayList<ColorBox>();

void setup() {
  size(400, 430);
  int i = 0;
  for (int y = 0; y < height-30; y+=20) {
    for (int x = 0; x < width; x+=20) {
      boxes[i] = new ColorBox(i, x, y);
      i++;
    }
  }
  int x2=15;
  color c2 = color(61, 76, 76);
  for (int j=0; j<5; j++) {
    switch(x2) {
    case 15:
      c2 = color(61, 76, 76);
      break;
    case 35:
      c2 = color(153, 153, 46);
      break;
    case 55:
      c2 = color(229, 229, 102);
      break;
    case 75:
      c2 = color(242, 255, 191);
      break;
    case 95:
      c2 = color(100, 40, 0);
      break;
    }
    circles[j] = new circle(x2, c2);
    x2+=20;
  }
  changelist.add(boxes[0]);
}



void draw() {
  if (count<=29) {
    for (int i = 0; i < numBoxes; i++) {
      boxes[i].display();
    }
    for (int j = 0; j<5; j++) {
      circles[j].display();
    }
    noLoop();
  }
  else {
    background(0);
    textSize(30);
    text("YOU LOSE", width/2-40, height/2);
    noLoop();
  }
}


void mousePressed() {
  int i=0;
  if (dist(mouseX, mouseY, circles[0].x, 415) <= 15) {
    i=0;
  }
  else if (dist(mouseX, mouseY, circles[1].x, 415) <= 15) {
    i=1;
  }
  else if (dist(mouseX, mouseY, circles[2].x, 415) <= 15) {
    i=2;
  }
  else if (dist(mouseX, mouseY, circles[3].x, 415) <= 15) {
    i=3;
  }
  else if (dist(mouseX, mouseY, circles[4].x, 415) <= 15) {
    i=4;
  }
  color myColor = circles[i].c;

  //  Check the color of each of the squares
  checkColorAndAddToArrayList();

  //Change the color of all that are touching
  changeColor(myColor);
  loop();
}

void changeColor(color newColor) {
  for (int i = 0; i< changelist.size(); i++) {
    ColorBox current = (ColorBox)(changelist.get(i));
    current.c = newColor;
  }
  count+=1;
}





void checkColorAndAddToArrayList() {
  //  For each one on the list - check its neighbors
  //  If they aren't already on the list, and have the same color as 0, add them to the end of the list
  //  change the color of everything on the list
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
    //  Check that current is not on right side of screen
    if ((current.index)% 20 != 19) {
      ColorBox test = boxes[current.index+1];
      if (test.c == base) {
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
    // Check that current is not on left side of screen
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

class circle {
  int x;
  color c;

  circle(int tx, color tc) {
    x=tx;
    c=tc;
  }

  void display() {
    fill(c);
    ellipse(x, 415, 15, 15);
  }
}

class ColorBox {
  int index;
  int x, y;
  //color
  color c;
  int boxSize = 20;

  ColorBox(int newindex, int newx, int newy) {
    index = newindex;
    x = newx;
    y = newy;
    int randNum = (int) random(5);
    switch(randNum) {
    case 0:
      c = color(61, 76, 76);
      break;
    case 1:
      c = color(153, 153, 46);
      break;
    case 2:
      c = color(229, 229, 102);
      break;
    case 3:
      c = color(242, 255, 191);
      break;
    case 4:
      c = color(100, 40, 0);
      break;
    }
  }

  void display() {
    fill(c);
    noStroke();
    rect(x, y, boxSize, boxSize);
  }
}



