
Traffic c1;
Stickman stickman;

float sx = 0;
float sy = 0;

int numCars = 10;
Traffic[] cars = new Traffic[numCars];


void setup() {
  size(600, 600);
  background(50);
  frameRate(15);
  smooth();
  noStroke();
  for (int i=0;i< cars.length; i++) {
    print(i);
    cars[i]= new Traffic();
    c1=new Traffic();
  }
  stickman = new Stickman(width/2, height-40, 10);
}

void draw() {
  float sx = width/2;
  float sy = height - 40;

  fill(50);
  rect(0, 0, 600, 600);

  fill(255, 255, 255);
  rect(width/2-20, height/2, 40, 200);
  rect(width/2-20, 0, 40, 50);

  for (int i=0;i<cars.length;i++) {

    cars[i].fall();
  }

  stickman.steer();
}

class Traffic {
  float r=random(600);
  float y=random(-height);
  public Traffic() {
  }

  private void fall() {

    y = y + 10;
    colorMode(RGB, 255);
    fill(random(250), 200, 200, 600);

    rect(r, y, 40, 60);

    if (y>height) {
      r=random(600);
      y=random(-200);
    }
  }
}

class Stickman {
  int sx = 0;
  int sy = 0;
  int m = 0;

  public Stickman(int sx, int sy, int m) {
    this.sx=sx;
    this.sy=sy;
    this.m=m;
  }

  public void steer() {
    if (keyPressed) {
      if (keyCode == 38) {
        sy-=3;
      }
      if (keyCode == 37) {
        sx-=3;
      }
      if (keyCode == 39) {
        sx+=3;
      }
      if (keyCode == 40) {
        sy+=3;
      }
    }
    fill(250, 159, 159);
    ellipse(sx, sy, 20, 20);
  }
}

//public void crash(){
  


