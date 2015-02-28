
PImage level;
PImage [] bee;
float x = 0;
float y = 250;
Bee [] bees;


void setup() {
  size (500, 500);

  bee = new PImage[3];
  bees = new Bee[100];
  for (int i = 0; i< bees.length; i ++) {
    bees[i]= new Bee(random(100, 400), random(100, 400));
  }
  for (int i = 0; i< bee.length; i ++) {
    bee[i]= loadImage("bee"+(i+1)+".png");
  }
  level= loadImage("level.jpeg");
}



void draw() {

  image(level, 0, 0, 500, 500);
  for (int i=0; i<bees.length; i++) {
    bees[i].update();
  }
}

class Bee {
  float x;
  float y;
  float velX;
  float velY;
  float destinX;
  float destinY;
  int counter;
  int frame;
  int speedFrame;
  boolean beePick;

  Bee( float xpos, float ypos) {
    x=xpos;
    y=ypos;
    speedFrame = int(random(2, 25));
    destinX=x;
    destinY=y;
    beePick = boolean(int(random(2)));
  }

  void update () {

    pushMatrix();
    translate(x, y);

    if (counter%100 ==0) {
      destinX =int(random(-100, 600));
    }
    if (counter%60 ==0) {
      destinY =int(random(-100, 600));
    }
    x += (destinX-x)*0.01;
    y += (destinY-y)*0.01;
    if (counter%speedFrame==0) {
      frame++;
    }
    if (frame > 2) frame= 0;
    if (beePick) {

      image(bee[frame], -50, -50, 100, 100);
    }
    popMatrix();
    counter ++;
  }
}


