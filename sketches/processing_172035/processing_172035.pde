

Star[] stars = new Star[200];
PImage hoopiter;
void setup() {
  size(600, 900);
  imageMode(CENTER);
  hoopiter = loadImage("hoopiter.png");
  for (int i = 0; i<stars.length; i++) {
    stars[i] = new Star(int(random(0, width)), (random(0, height)), (random(0.5, 2)), int(random(1, 6)), int(random(5)));
  }
}


void draw() {
  background(0);
  //image(hoopiter,300,200);
  for (int i=0; i<stars.length; i++) {
    stars[i].scroll();
    stars[i].mass();
    stars[i].display();
  }
}



class Star {
  int x;
  float y;
  float speed;
  int size;
  color[] colors = {color(131,40,46), color(170,83,39), color(55,62,118), color(82,56,103), color(200)};
  color c;
                    
  Star(int tempx, float tempy, float tempspeed, int tempsize, int starcolor) {
    x = tempx;
    y = tempy;
    speed = tempspeed;
    size = tempsize;
    c = colors[starcolor];
    
  }

  void mass() {
    if (size < 2) {
      speed = 0.5;
    }  
    if (size < 4 && size > 2) {
      speed = 1.5;
    }
    if (size < 6 && size > 4) {
      speed = 2;
    }
  }

  void scroll() {
    y = y+ speed;
    if (y > height) {
      y = 0;
      x = int(random(0, width));
      speed = (random(0.5, 2));
      size = int(random(1, 6));
    }
  }

  void display() {
    ellipseMode(CENTER);
    fill(c);
    rect(x, y, size, size); //pixels baby!
  }
}


