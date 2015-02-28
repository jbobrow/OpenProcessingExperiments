
//Tie-Dying

int num = 25; //number of sources
int ellipseSize = 10; //size of "paint"

Paint[] myPaint = new Paint[num]; //paint array

color[] paintColor = new color[3]; //color array

void setup() {
  size(200, 200);
  background(0, 100, 255);

  //add specific colors to choose later
  paintColor[0] = color(25, 25, 150, 5);
  paintColor[1] = color(255, 5);
  paintColor[2] = color(0, 0, 255, 5);

  //seed array
  for (int a=0; a<myPaint.length; a++) {
    myPaint[a] = new Paint();
  }
}

void draw() {
  for (int a=0; a<myPaint.length; a++) {
    myPaint[a].update();
    myPaint[a].draw();
  }
}

//creating a class
class Paint {
  int x = int(random(width));
  int y = int(random(height));
  color paint = paintColor[int(random(0, 3))];

  Paint() {
  }

  void update() { //feeds the update in previous void draw and moves the paint
    x = x + int(random(-5, 5));
    y = y + int(random(-5, 5));
  }

  void draw() { //draws the original circle to be altered
    noStroke();
    fill(paint);
    ellipse(x, y, ellipseSize, ellipseSize);
  }
}


