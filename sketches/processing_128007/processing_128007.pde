
int numBoxes = 400;
int counter;
ColorBox[] boxes = new ColorBox[numBoxes];
ColorPallette[] pallette = new ColorPallette[5];
ArrayList<ColorBox> changelist = new ArrayList<ColorBox>();

void setup() {
  size(400, 475);
  int i = 0;
  for (int y = 0; y < 400; y+=20) {
    for (int x = 0; x<width; x+=20) {
      boxes[i] = new ColorBox(i, x, y);
      i++;
    }
  }
  palletteStuff();
  changelist.add(boxes[0]);
}
void draw() {
  background(125);
  for (int i = 0; i < numBoxes; i++) {
    boxes[i].display();
  }
  for (int i = 0; i <pallette.length; i++) {
    pallette[i].display();
  }
  counting();
  win();
  checkColorAndAddToArrayList();
  noLoop();
}
void mousePressed() {
  for (int i = 0; i <pallette.length; i++) {
    if (pallette[i].hitTest(mouseX, mouseY)) {
      color myColor = pallette[i].c;
      changeColor(myColor);
      checkColorAndAddToArrayList();
      counter ++;
      break;
    }
  }
  loop();
}
void changeColor(color newColor) {
  for (int i = 0; i < changelist.size(); i ++) {
    ColorBox group = changelist.get(i);
    group.c = newColor;
  }
}
void checkColorAndAddToArrayList() {
  color base = boxes[0].c;
  for (int i = 0; i <changelist.size(); i ++) {
    ColorBox current = changelist.get(i);
    //north
    if (current.index-20> 0 ) {
      ColorBox test = boxes[current.index-20];
      if (test.c== base) {
        if (!changelist.contains(test)) {
          changelist.add(test);
        }
      }
    }
    //south
    if (current.index+20 < 400) {
      ColorBox test = boxes[current.index+20];
      if (test.c== base) {
        if (!changelist.contains(test)) {
          changelist.add(test);
        }
      }
    }
    //east
    if ((current.index) % 20 != 19) {
      ColorBox test = boxes[current.index+1];
      if (test.c== base) {
        if (!changelist.contains(test)) {
          changelist.add(test);
        }
      }
    }
    //west
    if ((current.index) %20 !=0) {
      ColorBox test = boxes[current.index-1];
      if (test.c== base) {
        if (!changelist.contains(test)) {
          changelist.add(test);
        }
      }
    }
  }
}

void palletteStuff() {
  pallette[0] = new ColorPallette(50, 437, color(255, 100, 100));
  pallette[1] = new ColorPallette(100, 437, color(100, 255, 100));
  pallette[2] = new ColorPallette(150, 437, color(100, 100, 255));
  pallette[3] = new ColorPallette(200, 437, color(255, 255, 100));
  pallette[4] = new ColorPallette(250, 437, color(255, 100, 255));
}

void counting() {
  textSize(25);
  fill(0);
  text(counter + " / 35", 300, 447);
  if (counter >= 35) {
    noLoop();
    fill(0);
    rect(0, 0, width, height);
    fill(170, 10, 10);
    textAlign(CENTER);
    text("YOU LOSE", width/2, height/2);
    text("'CAUSE YOU'RE WORTHLESS", width/2, height/2+50);
  }
}

void win() {
  if (changelist.size() == boxes.length) {
    fill(255);
    rect(0, 0, width, height);
    fill(#3865DE);
    textAlign(CENTER);
    text("YOU WIN A FREE PONY", width/2, height/2-25);
    text("FROM WALMART", width/2, height/2+25);
    text("Score: " + counter, width/2, height/2+100);
    noLoop();
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
      c = color(255, 100, 100);
      break;
    case 1:
      c = color(100, 255, 100);
      break;
    case 2:
      c = color(100, 100, 255);
      break;
    case 3: 
      c = color(255, 255, 100);
      break;
    case 4:
      c = color(255, 100, 255);
      break;
    }
  }
  void display(){
   fill(c);
  noStroke();
 rect(x,y,boxSize,boxSize); 
  }
}

class ColorPallette {
  int x, y;
  color c;

  ColorPallette(int _x, int _y, color _c) {
    x = _x;
    y = _y;
    c = _c;
  }
  
  void display(){
    ellipseMode(CENTER);
    fill(c);
   ellipse(x,y,40,40); 
  }
  
  boolean hitTest(float mx, float my){
   if(dist(mx,my,x,y) <= 20){
   return true;
   }  
   else{
    return false; 
   }
  }
}



