
nyan[] cats = new nyan[5];

void setup() {

  size(600, 600);


  for (int i = 0; i < cats.length; i ++ ) {
    cats[i] = new nyan();
    cats[i].prime(i*width/cats.length, height/2, i*2);

  }
}

void draw() {
  background(#3A28E8);
  for (int i = 0; i < cats.length; i ++ ) {
    cats[i].move();
    cats[i].animate();
  }
}

class nyan {

  float x;
  float y;
  float xSpeed;


  void prime(float _x, float _y, float _xSpeed) {

    x=_x;
    y=_y;
    xSpeed = _xSpeed;
  }

  void animate() {

    //head
//    fill(255);
//    ellipse (x, y, 200, 300);
//    ellipse (x, y, 50, 50);

    //rainbow
    for (int i = 150; i< 220; i=i+10) {
      strokeWeight(random(3, 10));
      stroke(random(255), random(255), random(255));
      line (x, i+150, x-150, i+300);
    }

    //face
    noStroke();
    fill(#919193);
    ellipse (x, y, 200, 100);
    triangle (x, y-20, x+40, y-100, x+80, y-20);
    triangle (x-80, y-20, x-40, y-100, x, y-20);
    fill(0);
    ellipse (x, y, 15, 10);

    //eyes
    fill(255);
    ellipse (x+40, y-20, 20, 30);
    ellipse (x-40, y-20, 20, 30);
    fill(0);
    ellipse (x+40, y-15, 10, 15);
    ellipse (x-40, y-25, 10, 15);



  }

  void move() {

    x = x + xSpeed;
    if (x > width) {
      x = 0;
    }
  }
}
