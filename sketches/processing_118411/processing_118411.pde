
//Chun Yi Wu
//the  plants grow up with soil 
//practice " class & [ ] "


GroupupGrace[] graces = new GroupupGrace[100];

void setup() {
  frameRate(2);
  size (800, 400);
  background(255);
  smooth();
  for (int i = 1 ; i < graces.length; i ++) {
    float x = random(width);
    float y = random(height);
    int c1 = int(random(width));
    int c2 = int(random(height));
    graces[i]= new GroupupGrace(x, y, c1, c2);
  }
}

void draw() {

  for (int i = 1 ; i < graces.length; i ++) {
    graces[i].move();
    graces[i].display();
  }
}


class GroupupGrace {

  float x ;
  float y ;
  float a ;
  float b ;
  int c1 ;
  int c2 ;
  float speed = 100;
  float r ;
  GroupupGrace(float Fx, float Fy, int endpoint1, int endpoint2) {
    x = Fx;
    y = Fy;
    c1 = endpoint1;
    c2 = endpoint2;
    r=random(5, 25);
  }
  void move() {
    x +=random(-speed, speed);
    y +=random(-speed, speed);
    a  = random(0, 80)-40;
    b  = random(0, 80)-40;
  }
  void display() {

    // back-line
    stroke(149, random(80, 120), 50, 10);
    line(x, y, c1, c2);

    // center-line
    strokeWeight(random(1, 3));
    stroke(53, random(70, 198), 38, 70);
    beginShape();
    vertex(c1, c2);
    vertex(c1+a, c2+b);
    endShape();
    //  circle 
    //fill(149, 100, 50, 5);
    fill(222,166,110,5);
    stroke(149, random(80, 120), 50, 10);
    ellipse(c1, c2, r, r);
    fill(222,166,110, 2);
    ellipse(c1, c2, r-3, r-3);
  }
}



