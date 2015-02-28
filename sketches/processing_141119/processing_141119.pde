
Mouse theMouse;
Square [] theSquare = new Square[6];
Circle [] theCircle = new Circle [5];
Triangle [] theTriangle = new Triangle[3];
Star [] theStar = new Star[4];
float r = 12;
boolean startGame = false;

void setup() {
  size (900, 600); //P2D
  theMouse = new Mouse();
  for (int i=0; i<3; i++) {
    theSquare[i] = new Square (90);
  }
  for (int i=3; i<6; i++) {
    theSquare[i] = new Square (50);
  }
  for (int i=0; i<3; i++) {
    theCircle[i] = new Circle (80);
  }
  for (int i=3; i<5; i++) {
    theCircle[i] = new Circle (60);
  }
  for (int i = 0; i < theTriangle.length; i++) {
    theTriangle[i] = new Triangle (50);
  }
  for (int i = 0; i < theStar.length; i++) {
    theStar[i] = new Star ();
  }
}

void draw() {
  background (255);
  grid();

  theMouse.position(mouseX, mouseY);
  for (int i = 0; i < theSquare.length; i++) {
    theSquare[i].move();
    if (theMouse.intersectS(theSquare[i])) {
      theMouse.grow();
      theSquare[i].highlight();
    }
  }

  for (int i = 0; i < theCircle.length; i++) {
    theCircle[i].move();
    if (theMouse.intersectC(theCircle[i])) {
      theMouse.grow();
      theCircle[i].highlight();
    }
  }

  for (int i = 0; i < theTriangle.length; i++) {
    theTriangle[i].move();
    if (theMouse.intersectZ(theTriangle[i])) {
      theMouse.grow();
      theTriangle[i].highlight();
    }
  }

  for (int i = 0; i < theStar.length; i++) {
    theStar[i].move();
    if (theMouse.intersectD(theStar[i])) {
      theMouse.grow();
      theStar[i].highlight();
    }
  }

  theMouse.display();
  for (int i = 0; i < 5; i++) {
    theSquare[i].display();
  }

  for (int i = 0; i < 5; i++) {
    theCircle[i].display();
  }

  for (int i = 0; i < theTriangle.length; i++) {
    theTriangle[i].display();
  }

  for (int i = 0; i < theStar.length; i++) {
    theStar[i].display();
  }
}

void keyPressed() {
  if (key == 'q') {
    r = 12;
  }

  if (key == 'h') { //'help' button
    delay(500);
  }
}

class Circle {
  float w; //radius of circle
  float circleX, circleY; //circle location
  float circleXspeed, circleYspeed;
  color cc = color(0, 0, 255, 200);
  boolean fill = false;

  Circle(float tempW) {
    w = tempW;
    circleX = random(w, 5*w);
    circleY = random(w, 5*w);
    circleXspeed = random(3, 5);
    circleYspeed = random(3, 5);
  }

  void move() {
    circleX = circleX + circleXspeed;
    circleY = circleY + circleYspeed;
    //boundary conditions
    if (circleX>width-w/2||circleX<w/2) {
      circleXspeed = -circleXspeed;
    }
    if (circleY>=height-w/2||circleY<w/2) {
      circleYspeed = -circleYspeed;
    }
  }

  void highlight() {
    fill = true;
  }

  void display() {
    if (fill = true) {
      noStroke();
      fill (255, 215, 10, 200);
    } 
    else {
      stroke(0, 0, 255);
      noFill();
    }
    shapeMode(CENTER);
    ellipse(circleX, circleY, w, w);
    cc = color(0, 0, 255, 200);
  }
}

float k=0;
float j=0;//gridlines
float l = 100; //length of square

void grid() {
  for (k=0; k<height/l; k++) {
    for (j=0;j<width/l;j++) {
      stroke(103, 227, 215);
      strokeWeight(1.2);
      line(j*l, 0, j*l, height); //use j*s if width>height
      line(0, j*l, width, j*l); //use k*s if height>width
    }
  }
}


class Mouse {
  //float r; //radius
  float x, y; //position

  Mouse() {
    r = 12;
  }

  void grow() {
    r = r + 1;
  }

  void position(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  void display() {
    stroke(0);
    strokeWeight(3.5);
    noFill();
    ellipse(x, y, r*2, r*2);
  }

  boolean intersectS(Square q) {
    float distanceS = dist(x, y, q.squareX, q.squareY);
    if (distanceS < r + q.s) {
      return true;
    }
    else {
      return false;
    }
  }

  boolean intersectC(Circle t) {
    float distanceC = dist(x, y, t.circleX, t.circleY);
    if (distanceC < r + t.w) {
      return true;
    } 
    else {
      return false;
    }
  }

  boolean intersectZ(Triangle p) {
    float distanceZ = dist(x, y, p.triangleX, p.triangleY);
    if (distanceZ < r + p.h) {
      return true;
    } 
    else {
      return false;
    }
  }

  boolean intersectD(Star d) {
    float distanceD = dist(x, y, d.starX, d.starY);
    if (distanceD < r + 50) {
      return true;
    } 
    else {
      return false;
    }
  }
}

class Square {
  float s; //square side
  float squareX, squareY; //square location
  float squareXspeed, squareYspeed;
  color qc = color(255, 139, 242, 200);
  float rotation;

  Square(float tempS) {
    s = tempS;
    squareX = random(2*s, width - 4*s);
    squareY = random(2*s, width - 4*s);
    squareXspeed = random(4, 6);
    squareYspeed = random(4, 6);
  }

  void move() {
    squareX = squareX + squareXspeed;
    squareY = squareY + squareYspeed;
    //boundary conditions
    if (squareX>width-s/2||squareX<s/2) {
      squareXspeed = -squareXspeed;
    }
    if (squareY>=height-s/2||squareY<s/2) {
      squareYspeed = -squareYspeed;
    }
  }

  void highlight() {
    qc = color(0, 255, 0, 200);
  }

  void display() {
    noStroke();
    fill(qc);
    rotation = rotation+0.08;
    pushMatrix();
    translate(squareX, squareY);
    rotate(rotation);
    rectMode(CENTER);
    rect(0, 0, s, s);
    popMatrix();
    qc = color(255, 0, 0, 200);
  }
}

class Star {
  float starX, starY; //star location
  float starXspeed, starYspeed;
  color sc = color(0, 255, 0, 200);

  Star() {
    starX = random(150, width - 150);
    starY = random(150, 400);
    starXspeed = random(3, 5);
    starYspeed = random(2, 4);
  }

  void move() {
    starX = starX + starXspeed;
    starY = starY + starYspeed;
    //boundary conditions
    if (starX>width-50||starX<50) {
      starXspeed = -starXspeed;
    }
    if (starY>=height-50||starY<50) {
      starYspeed = -starYspeed;
    }
  }

  void highlight() {
    sc = color(255, 0, 0, 200);
  }

  void display() {
    noStroke();
    fill(sc);
    shapeMode(CENTER);
    beginShape();
    vertex(starX, starY-50);
    vertex(starX+14, starY-20);
    vertex(starX+47, starY-15);
    vertex(starX+23, starY+7);
    vertex(starX+29, starY+40);
    vertex(starX, starY+25);
    vertex(starX-29, starY+40);
    vertex(starX-23, starY+7);
    vertex(starX-47, starY-15);
    vertex(starX-14, starY-20);
    endShape(CLOSE);
    sc = color(0, 0, 255, 200);
  }
}

class Triangle {
  float h ; //half-side of tiangle
  float triangleX, triangleY; //location
  float triangleXspeed, triangleYspeed;
  float tc = (#C2CECD);
  float rotation;

  Triangle(float tempH) {
    h = tempH;
    triangleX = random(4*h, width-4*h);
    triangleY = random(4*h, height-4*h);
    triangleXspeed = random(3, 5);
    triangleYspeed = random(2, 4);
  }

  void move() {
    triangleX = triangleX + triangleXspeed;
    triangleY = triangleY + triangleYspeed;

    if (triangleX > width -h || triangleX < h) {
      triangleXspeed *= -1;
    }

    if (triangleY > height -h || triangleY < h) {
      triangleYspeed *=-1;
    }
  }
  
  void highlight(){
    tc = (#15FFE9);
  }
  
  void display() {
    stroke(0,255,0);
    strokeWeight(8);
    noFill();
    rotation = rotation+0.08;
    pushMatrix();
    translate(triangleX, triangleY);
    rotate(rotation);
    shapeMode(CENTER);
    triangle(-h, h, h, h, 0, -h/1.5);
    popMatrix();
    tc = color(255,0,0,200);
  }
}



