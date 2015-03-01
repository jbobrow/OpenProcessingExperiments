
Triangle T1;
Triangle T2;
Triangle T3;
Triangle T4;
Triangle T5;
Triangle T6;
Triangle T7;
Triangle T8;

Circle C1;
Circle C2;
Circle C3;

void setup() {
  size(600, 400);
  smooth();
  T1 = new Triangle (50, 50, 55, 60, 47, 57);
  T2 = new Triangle (150, 150, 155, 155, 145, 157);
  T3 = new Triangle (250, 250, 265, 267, 240, 265);
  T4 = new Triangle (380, 210, 390, 235, 365, 231);
  T5 = new Triangle (180, 380, 210, 400, 163, 388);
  T6 = new Triangle (479, 356, 465, 389, 510, 399);
  T7 = new Triangle (520, 287, 528, 300, 514, 310);
  T8 = new Triangle (110, 187, 124, 210, 99, 215);

  C1 = new Circle (50, 50, 10);
  C2 = new Circle (150, 150, 20);
  C3 = new Circle (250, 250, 30);
}

void draw() {
  background (0);
  T1.move();
  T2.move();
  T3.move();
  T4.move();
  T5.move();
  T6.move();
  T7.move();
  T8.move();

  T1.update();
  T2.update();
  T3.update();
  T4.update();
  T5.update();
  T6.update();
  T7.update();
  T8.update();

  T1.display();
  T2.display();
  T3.display();
  T4.display();
  T5.display();
  T6.display();
  T7.display();
  T8.display();

  C1.move();
  C2.move();
  C3.move();

  C1.update();
  C2.update();
  C3.update();

  C1.display();
  C2.display();
  C3.display();
}

class Circle {

  float x;
  float y;

  float xspeed;
  float yspeed;

  float circleSize;

  Circle (float  xpos, float ypos, float cSize) {

    x = xpos;
    y = ypos;
    circleSize = cSize;

    xspeed = random (-10, 10); 
    yspeed = random (-10, 10);
  }

  void move () {
    if ( (x<0) || (x>width)) {
      xspeed = -xspeed;
    }

    if ( (y<0) || (y>height)) {
      yspeed = -yspeed;
    }
  }

  void update() {
    x += xspeed;
    y += yspeed;
  }

  void display() {

    fill (random (255), random (255), random (255));
    ellipse (x, y, circleSize, circleSize);
  }
}


class Triangle {
  float x1,y1,x2,y2,x3,y3;
  color fillColor;
  
  float xspeed;
  float yspeed;
  
  Triangle(float _x1,float _y1, float _x2, float _y2, float _x3, float _y3){
    x1 = _x1;
    y1 = _y1;
    x2 = _x2;
    y2 = _y2;
    x3 = _x3;
    y3 = _y3;

    
    xspeed = random (-10,10);
    yspeed = random (-5,5);
    
  }
  
  void move () {
    if ( (x1<0) || (x1>width)) {
      xspeed = -xspeed;
    }
    
    if ( (y1<0) || (y1>height)) {
      yspeed = -yspeed;
    }
  }
  
  void update() {
    x1 += xspeed;
    y1 += yspeed;
  }
  
  void display() {
    
    fill (random(255), random(255), random(255));
    triangle(x1,y1,x2,y2,x3,y3);
  }
}
  


