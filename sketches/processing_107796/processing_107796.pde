
abstract class widget implements Clickable{
  //Every shape has a x-, y- location, size and color
  PVector location;
  float sz;
  color col;
  
  widget(){
    this(new PVector(random(width), random(height)), 30, color(0));
  }//widget()
  
  widget(PVector loc, float s, color c){
    location = loc;
    sz = s;
    col = c;
  }//widget()
  
  //Every shape can be displayed
  abstract void display();
  
  //Every shape can move
  abstract void move();
  
  //Set the speed at which the widget moves
  abstract void setSpeed(PVector s);
}//class widget

interface Clickable {
  boolean clicked();
}// interface Clickable

widget [] pieces;
int N = 40;
PVector pm, cm;
widget target;

void setup() {
  size(500, 500);
  smooth();

  pieces = new widget[N];
  for (int i=0; i<N; i++) {
    color c = color(random(50, 200), random(50, 200), random(50, 200));
    switch (int(random(2))) {
    case 0: 
      pieces[i] = new disc(new PVector(random(width), random(height)), 20, c);
      break;
    default:
      pieces[i] = new hexagon(new PVector(width/2, height/2), 40, c);
    }
  }
}//setup()

void draw() {
  background(0);
  for (int i=0; i<N; i++) {
    pieces[i].move();
    pieces[i].display();
  }
}//draw()

void mousePressed() {
  //found out which Widget was clicked
  for (int i=0; i<N; i++) {
    if (pieces[i].clicked()) {
      target = pieces[i];
    }
  }
  pm = new PVector(mouseX, mouseY);
  noLoop();
}// mousePressed()

void mouseDragged() {
  cm = new PVector(mouseX, mouseY);

  PVector d = PVector.sub(pm, cm);
  d.normalize();
  target.setSpeed(d);
  target.col = color(random(0, 9), random(50, 227), random(0, 9));
  loop();
}//mouseDragged()

class disc extends widget {
  //A disc is a circular shape
  float r;
  PVector speed;

  disc() {
    this(new PVector(random(width), random(height)), 30, color(0));
  }//disc()

  disc(PVector loc, float s, color c) {
    super(loc, s, c);
    r = sz/2;
    speed = new PVector(random(1, 3), random(1, 3));
  }//disc()

  boolean clicked() {
    PVector m = new PVector(mouseX, mouseY);
    return (PVector.dist(location, m) < r);
  }//clicked()

  void display() {
    noStroke();
    fill(col);
    ellipse(location.x, location.y, sz, sz);
  }//display()

  void setSpeed(PVector s) {
    speed = s;
  }//setSpeed()

  void move() {
    location.add(speed);
    bounce();
  }//move()

  void bounce() {
    if (location.x > (width-r)) {//bounce against the right edge
      location.x = width-r;
      speed.x = -speed.x;
    }
    if (location.x < r) {//bounce against the left edge
      location.x = r;
      speed.x = -speed.x;
    }
    if (location.y >(height-r)) {//bounce against bottom edge
      location.y = height-r;
      speed.y = -speed.y;
    }
    if (location.y < r) {//bounce against top edge
      location.y = r;
      speed.y = -speed.y;
    }
  }//bounce()
}//class disc

class hexagon extends widget {
  int nSides = 6;      //a hexagon has 6 sides
  float r;             //the size of the hexagon
  float rot;           // its orientation (rotation)
  PVector speed;       //speed at which it travels

  hexagon() {
    this(new PVector(random(width), random(height)), 30, color(0));
  }//hexagon()

  hexagon(PVector loc, float s, color c) {
    super(loc, s, c);
    r = sz/2;
    rot = 0;
    speed = new PVector(random(-2, 2), random(-2, 2));
  }//hexagon()
  
  boolean clicked() {
    PVector m = new PVector(mouseX, mouseY);
    return (PVector.dist(location, m) < r);
  }//clicked()

  void setSpeed(PVector s) {
    s.mult(-2);
    speed = s;
  }//setSpeed()

  void display() {
    float x1, y1;
    float theta = rot;

    noStroke();
    fill(col);

    beginShape();    //Draw the hexagon
    for (int i=0; i<nSides; i++) {
      x1 = location.x + r*cos(theta);
      y1 = location.y + r*sin(theta);
      vertex(x1, y1);
      theta += PI/3;
    }
    endShape(CLOSE);
  }//display()
  void move() {
    rot += 0.01;
    location.add(speed);
    bounce();
  }//move()

  void bounce() {
    if (location.x > (width-r)) {//bounce against the right edge
      location.x = width-r;
      speed.x = -speed.x;
    }
    if (location.x < r) {//bounce against the left edge
      location.x = r;
      speed.x = -speed.x;
    }
    if (location.y >(height-r)) {//bounce against bottom edge
      location.y = height-r;
      speed.y = -speed.y;
    }
    if (location.y < r) {//bounce against top edge
      location.y = r;
      speed.y = -speed.y;
    }
  }//bounce()
}//class hexagon
