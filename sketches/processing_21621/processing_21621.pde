
//Adam Oaks

int num = 6;

Rect[] myRect = new Rect[num];
color[] myColor = new color [3];


void setup() {
  size(300,300);
  rectMode(CENTER);
  noStroke();
  smooth();

  myColor[0] = color(255,0,0,50);
  myColor[1] = color(0,255,0,50);
  myColor[2] = color(0,0,255,50);

  for( int i=0; i < myRect.length; i++) {
    myRect[i] = new Rect();
  }
}

void draw() {
  background(255);

  for( int i=0; i < myRect.length; i++) {
    myRect[i].update();
    myRect[i].display();
  }
}

class Rect {
  float x = random(20, width - 20);
  float y = random(20, height - 20);
  float rectSize = random(100);
  color colorChoice = myColor[floor(random(0,3))];


  Rect() {
  }

  void update() {
    rectSize++;
    if(rectSize > width) {
      rectSize = 0;
      x = random(20,width-20);
      y = random(20,height-20);
    }
  }


  void display() {

    fill(colorChoice);
    rect(x,y,rectSize,rectSize);
  }
}


