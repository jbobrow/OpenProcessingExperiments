
/*
======
 SCIMA-300-03 Homework 02_v1
 William Felker 
 20140204
 ======
 */
Circle[] crclLight;
Circle[] crclDark;
void setup() {
  size(600, 600);
  crclLight = new Circle[25];
  crclDark = new Circle[25];
  for (int i=0; i< crclLight.length; i++) {
    crclLight[i] = new Circle(width/2, height/2, i, 0 ); // xPos, yPos, zPos, id
  }
}
void draw() {
  //background(255);

  for (int i = 0; i < crclDark.length;i++) {
    crclLight[i].move();
    //crclLight[i].collide();
    //crclLight[i].collision();
    crclLight[i].display();
  }
}

class Circle {
  //===Variables===
  float xPos, yPos, zPos;
  float speed;
  int id;
  Circle(float _xPos, float _yPos, float _zPos, int _id) {
    xPos = _xPos; //X position
    yPos = _yPos; //Y position
    zPos = _zPos; //Z position for scaling
    id = _id;//
    speed = 1;//
  }
  //===METHODS===
  void move() {
    xPos += random(-speed, speed);
    yPos += random(-speed, speed);
    zPos += random(-speed, speed);
    speed += .0001;
  }
  void display() {
    smooth();
    ellipse(xPos, yPos, zPos*.05, zPos*.05);
  }
  void collision() {
  }
  void collide() {
  }
}



