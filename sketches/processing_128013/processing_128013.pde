
int numBoxes = 400;
int clicks = 0;
Circles[] circle = new Circles[5];

ColorBox[] boxes = new ColorBox[numBoxes];
ArrayList<ColorBox> changeList = new ArrayList<ColorBox>();
void setup() {
  size(400, 500);
  circle[0] = new Circles(color(255), 20, 460);
  circle[1] = new Circles(color(255,0,0), 60, 460);
  circle[2] = new Circles(color(0), 100, 460);
  circle[3] = new Circles(color(#21078E), 140, 460);
  circle[4]= new Circles(color(#014811), 180, 460);
  int i = 0;
  for (int y = 0; y<400; y+=20) {
    for (int x = 0; x<width; x+=20) {
      boxes[i] = new ColorBox(i, x, y);
      i++;
    }
  }
  changeList.add(boxes[0]);
}
void draw() {
 
  background(#646464);
 for (int i = 0; i<5; i++){
   circle[i].display();
 }
 
  for (int i = 0; i < numBoxes; i++) {
    boxes[i].display();
  }
  noLoop();

  textSize(30);
  text("/30", 345, 475);

    text(clicks, 310, 475);

   
  if (clicks >= 30) {
    textSize(70);
    fill(0);
    rect(0,0,width,height);
    fill(#E9FA05);
    text("YOU LOSE", 30, height/2 -20);
    textSize(20);
    text("(you suck)", 160, height/2 + 10);
  }
 
    
 
}
void mousePressed() {
 for (int i = 0; i<5; i++){
   if(circle[i].hitTest(mouseX,mouseY)){
  color myColor = circle[i].c;
  checkColorAndAddToArrayList();
  changeColor(myColor);
  clicks += 1;
  break;
   }
 }
  loop();
}
void changeColor(color newColor) {
  for (int i = 0; i< changeList.size(); i++) {
    ColorBox current = (ColorBox)(changeList.get(i));
    current.c = newColor;
  }
}
void checkColorAndAddToArrayList() {
  color base = boxes[0].c;
  for (int i = 0; i <changeList.size(); i ++) {
    ColorBox current = changeList.get(i);
    //north
    if (current.index-20> 0 ) {
      ColorBox test = boxes[current.index-20];
      if (test.c== base) {
        if (!changeList.contains(test)) {
          changeList.add(test);
        }
      }
    }
    //east
    if ((current.index)%  20 != 19 ) {
      ColorBox test = boxes[current.index + 1];
      if (test.c== base) {
        if (!changeList.contains(test)) {
          changeList.add(test);
        }
      }
    }
    //south
    if (current.index+20 < 400 ) {
      ColorBox test = boxes[current.index+20];
      if (test.c== base) {
        if (!changeList.contains(test)) {
          changeList.add(test);
        }
      }
    }
    //west
    if (((current.index)%20) != 0 ) {
      ColorBox test = boxes[current.index-1];
      if (test.c== base) {
        if (!changeList.contains(test)) {
          changeList.add(test);
        }
      }
    }
  }
}

  
class Circles {
 boolean hitTest(float mx,float my){
    if (dist(xpos,ypos,mx,my) < 15){
    return true;
    }
    else{
      return false;
    }
  }
 
color c;
float xpos, ypos;

Circles(color _c, float _xpos, float _ypos) {
  c = _c;
  xpos = _xpos;
  ypos = _ypos;
}
void display() {
  fill(c);
  ellipse(xpos, ypos, 30, 30);
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
      c = color(255);
      break;
    case 1:
      c = color(255,0,0);
      break;
    case 2:
      c = color(0);
      break;
    case 3:
      c = color(#21078E);
      break;
    case 4:
      c = color(#014811);
      break;
    }
  }
  void display() {
    fill(c);
    noStroke();
    rect(x, y, boxSize, boxSize);
  }
}



