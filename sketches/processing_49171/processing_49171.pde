
//lo mei wen
//growing grass
//qgirlvicki@hotmail.com
int num =60;

Leaves[] myLeaves = new Leaves [num]; //設樹葉量及顏色
color[] myColors = new color[3]; 
void setup() {
  size(400, 200);

  myColors[0] = color(35, 172, 56, 95);  //創造三個顏色
  myColors[1] = color(142, 195, 31, 50);
  myColors[2] = color(220, 76, 56, 80);

  background(255);
  smooth();
  frameRate(15);

  for (int i=0; i<myLeaves.length; i++) {
    myLeaves[i] = new Leaves();
  }
}


void draw() {

  for (int i=0; i < myLeaves.length; i++) {
    myLeaves[i].update();
    myLeaves[i].draw();
  }
}
class Leaves {
  int x = int(random(0, 500));  //控制出現在螢幕的畫面
  int y = int(random(200, 200));
  color c = myColors[floor(random(0, 3))];

  Leaves() {
  }

  void update() {

    x =  x+int(random (-4, 4)); //this updates the position of the point and makes it move across the screen
    y = y+int(random(-4, 4));
    if (mousePressed) {
      noLoop();
    }
    else {
      redraw();
    }
  }

  void draw() {
    if (random(20)>10) {
      fill(c);
    }
    else {
      strokeWeight(4);
      fill(0);
      stroke(c);
      point(x, y);
    }
  }
}


