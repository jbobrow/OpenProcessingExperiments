

Boba boba1;
Boba boba2;
Boba boba3;
Boba boba4;
Boba boba5;
Tapioca tapioca1;
Tapioca tapioca2;
Tapioca tapioca3;
Tapioca tapioca4;
Tapioca tapioca5;  


void setup() {
  size(760, 480);

  boba1 = new Boba(-30, 80, 10);
  boba2 = new Boba(100, 80, 150);
  boba3 = new Boba(230, 80, 200);
  boba4 = new Boba(360, 80, 100);
  boba5 = new Boba(490, 80, 200);
  tapioca1 = new Tapioca(-30, 80, 10);
  tapioca2 = new Tapioca(100, 80, 150);
  tapioca3 = new Tapioca(230, 80, 200);
  tapioca4 = new Tapioca(360, 80, 100);
  tapioca5 = new Tapioca(490, 80, 200);
  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);
  noStroke();
}

void draw() {
  background(random(10), random(10), random(10));
  boba1.display();
  boba1.move();
  tapioca1.display();
  boba2.display();
  tapioca2.display();
  boba3.display();
  boba3.move();
  boba4.display();
  tapioca4.display();
  boba5.display();
  tapioca5.display();
  boba5.move();
}

class Boba {
  float x;
  float y;
  float strokeColor;
  float speed = 10;
  float direction = 1;

  int n = 2;
  float d = random (0, n+1);


  Boba(float x_in, float y_in, float strokeColor_in) {
    x = x_in;
    y = y_in;
    strokeColor = strokeColor_in;
  }

  void display () {

    pushMatrix();
    translate(x, y);

    //cup
    fill(245, 242, 237, 175);
    quad(105, 115, 105+100, 115, 195, 115+150, 115, 115+150);
    fill(95, 178, 52);
    rect(155, 115, 110, 5);

    //drink
    fill(random(255), random(255), random(255), 175);
    noStroke();
    quad(107, 140, 103+100, 140, 195, 140+125, 115, 140+125);
    popMatrix();
  }

  void move() {
    //straw
    pushMatrix();
    translate(x, y);
    fill(245, 242, 237, 175);
    rect(100+50, 120, 10, mouseY-200);
    fill(255, 0, 0);
    rect(100+50, 120, 3, mouseY-200);
    popMatrix();
  }
}

class Tapioca {
  float x;
  float y;
  float strokeColor;
  float speed = -500;
  float direction = 1;
  int n = 2;
  float d = random (0, n+1);

  Tapioca(float x_in, float y_in, float strokeColor_in) {
    x = x_in;
    y = y_in;
    strokeColor = strokeColor_in;
  }

  void display () {

    pushMatrix();
    translate(x, y);
    //tapioca
    fill(0, random(255));
    int x = 1;
    while (x<=50)
    {
      ellipse(int(random(120, 193)), int(random(200, 260)), 9, 9);
      x=x+1;
    }   
    popMatrix();
  }
}



