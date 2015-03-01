
int steps = 0;
int numBoxes = 400;
ColorBox[] boxes = new ColorBox[numBoxes];
ColorButton[] buttons = new ColorButton[5];
ArrayList<ColorBox> changelist = new ArrayList<ColorBox>();

void setup() {
  size(400, 520);
  int i = 0;
  for (int y = 0; y < 400; y+=20) {
    for (int x = 0; x < width; x+=20) {
      boxes[i] = new ColorBox(i, x, y);
      i++;
    }
  } 
  changelist.add(boxes[0]);

  buttons[0] = new ColorButton(0, 400, color(61, 76, 76));
  buttons[1] = new ColorButton(80, 400, color(153, 153, 46));
  buttons[2] = new ColorButton(160, 400, color(229, 229, 102));
  buttons[3] = new ColorButton(240, 400, color(242, 255, 191));
  buttons[4] = new ColorButton(320, 400, color(100, 40, 0));
}



void draw() {
  background(255);
  for (int i = 0; i < numBoxes; i++) {
    boxes[i].display();
  }
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].display();
  }

  textAlign(CENTER);
  textSize(20);
  text("Steps:  " + steps + "/40", width/2, 500 );
  if (steps >= 40) {
    text("GAME OVER! \n Press any key to play again!", width/2, 200);
  }
  noLoop();
}


void mousePressed() {
  steps++;
  if (steps <= 40) {
    for (int i = 0; i < buttons.length; i++) {
      if (buttons[i].hitTest(mouseX, mouseY) == true) {
        color myColor = buttons[i].c;  //  Check the color of each of the squares
        checkColorAndAddToArrayList();

        //Change the color of all that are touching
        changeColor(myColor);
        loop();
        return;
      }
    }
  }
}

void keyPressed() {
  if (steps > 40) {
    steps = 0; 
    changelist.clear(); 
    setup();
    loop();
  }
}



void changeColor(color newColor) {
  for (int i = 0; i< changelist.size(); i++) {
    ColorBox current = (ColorBox)(changelist.get(i));
    current.c = newColor;
  }
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

class ColorBox{
  int index;
  int x, y; 
  //color 
  color c;
  int boxSize = 20;

  ColorBox(int i, int newx, int newy){
    index = i;
    x = newx; 
    y = newy; 
    int randNum = (int) random(5);
    switch(randNum) {
    case 0: 
      c = color(61,76,76);
      break;
    case 1:
      c = color(153,153,46);
      break;
    case 2: 
      c = color(229,229,102);
      break;
    case 3:
      c = color(242,255,191);
      break;
    case 4:
      c = color(100,40,0);
      break;
    }
  }

  void display(){
    fill(c);
    noStroke();
    rect(x,y,boxSize,boxSize);

  }
}




class ColorButton {
  int x, y; 
  color c;
  int boxSize = 80;

  ColorButton(int nx, int ny, color nc) {
    x = nx;
    y = ny;
    c = nc;
  }



  void display() {
    fill(c);
    stroke(255);
    rect(x, y, boxSize, boxSize);
  }

  boolean hitTest(float mx, float my) {
    float centerX = x + boxSize/2;
    float centerY = y + boxSize/2;
    if (abs(centerX - mx)< boxSize/2 && abs(centerY -my)<boxSize/2) return true;
    else return false;
  }
}



