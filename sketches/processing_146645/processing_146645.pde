
Sphere[] mySpheres = new Sphere[5];
Box[] myBoxes = new Box[5];
Orb[] myOrbs = new Orb[10];
Rect[] myRects = new Rect[10];

void setup() {
  size(600, 600, P3D);

  background (240, 255, 240);

  for (int i = 0; i < mySpheres.length; i++) {
    PVector vector1 = new PVector(random(width), random(height));
    PVector vector2 = new PVector(random(-1, 1), random(-3, 3));
    color color1 = color(random(200, 255), random(200, 255), random(200, 255));
    mySpheres[i] = new Sphere(vector1, vector2, 20, color1);
  }

  for (int i = 0; i < myBoxes.length; i++) {
    PVector vector3 = new PVector(random(width), random(height));
    PVector vector4 = new PVector(random(-1, 1), random(-3, 3));
    color color1 = color(random(200, 255), random(200, 255), random(200, 255));
    myBoxes[i] = new Box(vector3, vector4, 20, color1);
  }

  for (int i = 0; i < myOrbs.length; i++) {
    PVector vector5 = new PVector(random(width), random(height));
    PVector vector6 = new PVector(random(-2, 2), random(-7, 7));
    color color1 = color(random(200, 255), random(200, 255), random(200, 255));
    myOrbs[i] = new Orb(vector5, vector6, 20, color1);
  }

  for (int i = 0; i < myRects.length; i++) {
    PVector vector7 = new PVector(random(width), random(height));
    PVector vector8 = new PVector(random(-2, 2), random(-7, 7));
    color color1 = color(random(200, 255), random(200, 255), random(200, 255));
    myRects[i] = new Rect(vector7, vector8, 20, color1);
  }
}

void draw() {
  lights();

  background (240, 255, 240);

  for (int i = 0; i < mySpheres.length; i++)
    mySpheres[i].run();

  for (int i = 0; i < myBoxes.length; i++)
    myBoxes[i].run();

  for (int i = 0; i < myOrbs.length; i++)
    myOrbs[i].run();

  for (int i = 0; i < myRects.length; i++)
    myRects[i].run();
}

//assigning class
class Box {
  PVector position, speed;
  float size;
  color c;

  Box(PVector _position, PVector _speed, float _size, color _c) {
    position = _position;
    speed = _speed;
    size = _size;
    c = _c;
  }

  void run() {
    //listing functions
    display();
  }

  void display() {
    //perameters for box
    pushMatrix();
    translate(random(width), random(height));
    fill(c);
    rotateY(radians(45));
    box(random(size));
    popMatrix();
  }

  public PVector getPosition() {
    return position;
  }
}


class Orb {
  PVector position, speed;
  float size;
  color c;

  Orb(PVector _position, PVector _speed, float _size, color _c) {
    position = _position;
    speed = _speed;
    size = _size;
    c = _c;
  }

  void run() {
    display();
    move();
    bounce();
    collision();
    mausAttract();
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(position.x, position.y, size, size);
  }

  void move() {
    position.add(speed);
  }

  void bounce() {
    if (position.y > height || position.y < 0) {
      speed.y = speed.y * -1;
    }
    if (position.x > width || position.x < 0) {
      speed.x = speed.x * -1;
      move();
      move();
    }
  }

  public PVector getPosition() {
    return position;
  }

  void collision() {
    for (int i = 0; i < myOrbs.length; i++) {
      float distance = PVector.dist(this.getPosition(), myOrbs[i].getPosition());
      if (distance < size && myOrbs[i] != this) {
        speed.x = speed.x * -1;
        speed.y = speed.y * -1;
        move(); 
        move();
      }
    }
  }

  void mausAttract() {
    if (mousePressed == true) {
      PVector mouse = new PVector(mouseX, mouseY);
      PVector direction = PVector.sub(mouse, position);
      direction.normalize();
      direction.mult(.5);
      speed.add(direction);
      speed.limit(3);
      position.add(speed);
      move();
      move();
    }
  }
}

class Rect {
  PVector position, speed;
  float size;
  color c;

  Rect(PVector _position, PVector _speed, float _size, color _c) {
    position = _position;
    speed = _speed;
    size = _size;
    c = _c;
  }

  void run() {
    display();
    move();
    bounce();
    collision();
    mausAttract();
  }

  void display() {
    fill(c);
    noStroke();
    rect(position.x, position.y, size, size);
  }

  void move() {
    position.add(speed);
  }

  void bounce() {
    if (position.y > height || position.y < 0) {
      speed.y = speed.y * -1;
    }
    if (position.x > width || position.x < 0) {
      speed.x = speed.x * -1;
      move();
      move();
    }
  }

  public PVector getPosition() {
    return position;
  }

  void collision() {
    for (int i = 0; i < myRects.length; i++) {
      float distance = PVector.dist(this.getPosition(), myRects[i].getPosition());
      if (distance < size && myRects[i] != this) {
        speed.x = speed.x * -1;
        speed.y = speed.y * -1;
        move(); 
        move();
      }
    }
  }

  void mausAttract() {
    if (mousePressed == true) {
      PVector mouse = new PVector(mouseX, mouseY);
      PVector direction = PVector.sub(mouse, position);
      direction.normalize();
      direction.mult(.5);
      speed.add(direction);
      speed.limit(3);
      position.add(speed);
      move();
      move();
    }
  }
}

//assigning class
class Sphere {
  PVector position, speed;
  float size;
  color c;

  Sphere(PVector _position, PVector _speed, float _size, color _c) {
    position = _position;
    speed = _speed;
    size = _size;
    c = _c;
  }

  void run() {
    //listing functions
    display();
  }

  void display() {
    //perameters for sphere
    pushMatrix();
    translate(random(width), random(height));
    noStroke();
    fill(c);
    rotateY(radians(45));
    sphere(random(size));
    popMatrix();
  }

  public PVector getPosition() {
    return position;
  }
}



