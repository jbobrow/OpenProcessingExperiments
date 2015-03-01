

PImage background;
RainDrop[] rainDrops = new RainDrop[30];

void setup(){
  size(800,530);
  background = loadImage("New-York-Skyline.jpg");
  for(int i = 0; i < 30; i++){
    rainDrops[i] = new RainDrop();
  }
  background(100);
}

void draw(){
  background.loadPixels();
  for(int i = 0; i < 30; i++){
    rainDrops[i].move();
    
    int x = (int)rainDrops[i].x;
    int y = (int)rainDrops[i].y;
    int loc = x + y*width;
    color c = background.pixels[loc];
    fill(c);
    rainDrops[i].display();
  }
}

class RainDrop {

  float x, y;

  RainDrop() {
    x = random(width);
    y = random(height);
  }

  void move() {
    x += random(-.9, .5);

    if (x<0) {
      x=width;
    }
    y += random(2, 3);

    if (y>=height) {
      y = 0;
    }
  }

  void display() {
    noStroke();
    ellipse(x, y,5,5);
  }
}



