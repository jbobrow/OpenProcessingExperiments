
Traffic c1;
Stickman stickman;

float sx = 0;
float sy = 0;
float x = 0;
float y = 0;

int numCars = 10;
Traffic[] cars = new Traffic[numCars];


void setup() {
  size(600, 600);
  background(50);
  frameRate(40);
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
  float x=random(600);
  float y=random(-height);
  color c = 0;

  private void fall() {
    c=color((int)random(255), (int)random(255), (int)random(255));
    y = y + 10;
    fill(c);
    rect(x, y, 40, 60);

    if (y>height) {
      x=random(600);
      y=random(-200);
    }
  }
}


class Stickman {
  float sx = 0;
  float sy = 0;
  float m = 6;

  public Stickman(float sx, float sy, float m) {
    this.sx=sx;
    this.sy=sy;
    this.m=m;
  }

  public void steer() {
    if (keyPressed) {
      if (keyCode == 38) {
        sy-=m;
      }
      if (keyCode == 37) {
        sx-=m;
      }
      if (keyCode == 39) {
        sx+=m;
      }
      if (keyCode == 40) {
        sy+=m;
      }
      if (sy < 0) {
        sy = height;
      }
      if (sx < 0) {
        sx = width;
      }
      if (sy > height) {
        sy = 0;
      }
      if (sx > width) {
        sx = 0;
      }
    }
    fill(250, 159, 159);
    ellipse(sx, sy, 20, 20);
  }
}

public void crash() {
  if (sx<=x+40 && sx>=x) {
    fill(0);
    rect(0, 0, width, height);
  }
  if (sy<=y+60 && sy>=y) {
    fill(0);
    rect(0, 0, width, height);
  }
}










