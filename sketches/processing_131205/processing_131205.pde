
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
  crclLight = new Circle[1000];
  crclDark = new Circle[25];
  for (int i=0; i< crclLight.length; i++) {
    crclLight[i] = new Circle(width/2, height/2, i, 44 ); // xPos, yPos, zPos, id
  }
}
void draw() {
  //background(255);

  for (int i = 0; i < crclDark.length;i++) {
    crclLight[i].move();
    crclLight[i].collide();
    crclLight[i].collision(mouseX,mouseY);
    crclLight[i].display();
  }
}

class Circle {
  //===Variables===
  float xPos, yPos, zPos,colorR, colorG,colorB;
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
    zPos += random(speed, speed);
    speed += .0001;
  }
  void display() {
    smooth();
    noStroke();
    //fill(255);
    //fill(colorR,colorG,colorB);
    ellipse(xPos, yPos, zPos*.003, zPos*.003);
  }
  void collision(float xOver, float yOver) {
    if (xOver >xPos &&xOver<xPos + 10 && yOver >yPos && yOver<yPos + 10 ) {//buttons
      smooth();
      fill(random(255),random(255),random(255));
      //setSpeed(0);
    }
  }
  void collide() {
    for (int i =0; i< crclLight.length; i++) {
      if (id !=i) {// then yor not looking at your self its abother bot
        collision(crclLight[i].getX(), crclLight[i].getY());
      }
    }
  }
  float getX() {
    return xPos;
  }
  float getY() {
    return yPos;
  }
}



