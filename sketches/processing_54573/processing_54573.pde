
int numBoxes = 400;
ColorBox[]boxes = new ColorBox[numBoxes];

ArrayList changelist = new ArrayList();

void setup() {
  size(400, 400);
  int i = 0;
  for (int y = 0; y < height; y += 20) {
    for (int x = 0;x < width;x += 20) {
      boxes[i]=new ColorBox(i, x, y);
      i++;
    }
  }
  changelist.add(boxes[0]);
}

void draw() {
  for (int i = 0; i < numBoxes; i++) {
    boxes[i].display();
  }
  noLoop();
}

void mousePressed() {
  int x = (int)mouseX/20;
  int y = (int)mouseY/20;
  int i = x + (y*height/20);
  color myColor = boxes[i].c;

  //CHECK THE COLOR OF EACH OF THE SQUARES
  checkColorAndAddToArrayList();

  //CHANGE THE COLOR OF ALL THAT ARE TOUCHING
  changeColor(myColor);
  loop();
}

void changeColor(color newColor) {
  for(int i = 0; i<changelist.size();i++){
    ColorBox current = (ColorBox)(changelist.get(i));
    current.c = newColor;
  }//LOOP THROUGH THAT ARRAYLIST AND CHANGE THE COLOR
}

void checkColorAndAddToArrayList() {
  //FOR EACH ONE ON THE LIST-CHECK ITS NEIGHBORS
  //IF THEY ARE NOT ALREADY ON THE LIST, AND HAVE THE SAME COLOR AS 0, ADD THEM TO THE END OF THE LIST
  //CHANGE THE COLOR OF EVERYTHING ON THE LIST
  color base = boxes[0].c;
  for (int i = 0; i < changelist.size(); i++) {

    ColorBox current = (ColorBox)(changelist.get(i));
    //NORTH
    if (current.index-20>0) {
      ColorBox test = boxes[current.index-20]; 
      if (test.c==base) {
        if (!changelist.contains(test)) {
          changelist.add(test);
        }
      }
    }

    //EAST
    //CHECK THAT CURRENT IS NOT ON RIGHT SIDE OF SCREEN
    if ((current.index)%20!=19) {
      ColorBox test = boxes[current.index+1];
      if (test.c==base) {
        if (!changelist.contains(test)) {
          changelist.add(test);
        }
      }
    }

    //SOUTH
    if (current.index+20<400) {
      ColorBox test = boxes[current.index+20];
      if (test.c==base) {
        if (!changelist.contains(test)) {
          changelist.add(test);
        }
      }
    }
    //WEST
    //CHECK THAT CURRENT IS NOT ON LEFT SIDE OF SCREEN
    if (((current.index)%20) !=0) {
      ColorBox test = boxes[current.index-1];
      if (test.c==base) {
        if (!changelist.contains(test)) {
          changelist.add(test);
        }
      }
    }
  }
}


