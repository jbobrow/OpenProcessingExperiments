
/*
=======================
 IXDSN-300-01 | 20130126
 William Felker
 
 =======================
 
 */
myObject[] object1;
void setup() {
  size(600, 600, "processing.core.PGraphicsRetina2D");
  smooth();
  object1 = new myObject[500]; //make 100
  for (int i = 0; i < object1 .length; i++) {
    object1[i] = new myObject(random(width), random(height),i);
  }
}
void draw() {

  for (int i = 0; i < object1.length; i++){
    object1[i].display();
    object1[i].move();
    object1[i].collisions();
  }
}

class myObject {
  float x, y;
  int id;
  int dirX = 1;
  int dirY = 1;
  
  myObject(float _x, float _y, int _id) {
    x=_x;
    y=_y;
    id=_id;
  }
  void display() {

    noStroke();
    ellipse (x, y, 5, 5);
  }

  void move() {
    x+=dirX;
    y+=dirY;

    if ( y > height || y < 0) {
      dirY = -dirY;
    }
    if (x < 0 || x > width) {
      dirX = -dirX;
    }
  }

  void collisions() {
    fill(255);
    for (int i = 0; i < object1.length; i++) {
      if (id != i) {
        if (dist(x, y, object1[i].x, object1[i].y) < 20) {
          fill(0);
        }
      }
    }
  }
}



