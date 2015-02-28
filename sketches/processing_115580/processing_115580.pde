
PImage droplet;
Raindrop[] r;
int numberOfDrops=80;

void setup() {

size(800,800);
  background(0);
  imageMode(CENTER);
  droplet= loadImage("drop.png");
  size(800, 800);
  r= new Raindrop[numberOfDrops];

  for (int i=0; i<r.length; i++) {
    r[i] = new Raindrop((int)random(random(1), width));
  }
}




void draw() {
  background(255);
  for (int i=0; i<r.length; i++) {
    r[i].draw();
    r[i].fall();
  }
}


class Raindrop {
  float speed;
  int x, y;
  int w= 15;
  int h =15;

  //constructor
  Raindrop (int _x) {
    x= _x;
    y= (int)random(1, height);
    speed= 10;
  }

  void fall() {

    y+=speed;
    if (y>=height) {
      y=-h;
    }
    if (y<0) {
      y=h;
      speed=10;
    }
    
    if ((dist (mouseX, mouseY, x, y)<200)) {
      speed=-2;
    }
  }

  void draw() {
    //background(255);
    noStroke();
    fill(0);
    //image(r);
    //ellipse(x, y, w, h);
    image(droplet,x,y);

    //fill(0, 255, 150);
  }
}



