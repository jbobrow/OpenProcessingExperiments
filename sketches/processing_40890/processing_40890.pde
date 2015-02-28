

stars [] stars = new stars[100];
float x1, x2, y1, y2;
color c1, c2;

void setup() {
  size(300, 300);
  smooth();

  int count = 0;

  // use a nested loop to set the variables for the Stars array
  for (int y=15;y<height;y+=30) {
    for (int x=15;x<width;x+=30) {
      stars[count] = new stars(100 * count); // use stars constructor, so each stars has different start
      stars[count].xpos = x;
      stars[count].ypos = y;
      count++;
    }
  }
}

void draw() {
  background(138, 157, 173);
  for (int i=0;i<stars.length;i++) {
    stars[i].update();
    stars[i].draw();
  }
}


class stars {
  color c = color(255, 30, 20, 60);
  float rot;
  float xpos;
  float ypos; 

  stars(float rot_) {
    // pass data from constructor to object
    rot = rot_;
  }

  void update() {

    //defines the area in which to draw and what color to use
    x1 = random(10, 150);
    y1 = random(10, 150);
    x2 = random(100, 200);
    y2 = random(100, 200);
    c1 = color(173, 139, 138);
    c2 = color(66, 97, 122);
  }

//draws the stars in the defined areas
  void draw() {
    frameRate (5);
    strokeWeight(5);
    stroke(c1);
    point(x1, y1);
    stroke(c2);
    point(x2, y2);
  }
}





