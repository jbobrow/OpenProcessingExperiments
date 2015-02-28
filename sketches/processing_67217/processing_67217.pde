
int x;
int size = 20;

int value = 0;

void setup () {

  size (500, 500);
  smooth();
  background(0);
  noStroke();
  colorMode(RGB, 220, 50, 180);
  }

void draw () {
  if (mousePressed == true){
    for (int y=0; y<=height; y+=40) {
    for (int x=0; x<=width; x+=5){
    fill (30, x,y,5);
    ellipse (x, y, 20,20);
    fill (x, y, 120, 10);
    ellipse (x,y, 10,10);
    fill (155,255, 10, 10);
    ellipse (x, y, 30,30);
    fill (x,y, 15,15);
    ellipse (x,y, 40, 40);
    }
  }
  }
}

