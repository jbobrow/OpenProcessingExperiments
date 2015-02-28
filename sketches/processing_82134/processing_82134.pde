
Square square;

void setup() {
  size(600, 600);
  background(255);
  smooth();
  square = new Square();
  frameRate(10);
}

void draw() {
  square.update();
  square.frame();
  square.show();
}

class Square {
  PVector loc;
  PVector velo;

  Square() {
    loc = new PVector(width/2, height/2);
    velo = new PVector(random(cos(0.5)*sin(2), 2), random(-1.5, cos(0.5)));
  }

  void update() {
    loc.add(velo);
  }

  void show () {   
    pushMatrix();
    translate(width,height);
    rotate(loc.x);
    noFill();
    stroke(0,0,0,30);
    beginShape();
    vertex(loc.x, loc.y);
    bezierVertex(loc.x-55, loc.y+5, loc.x-45, loc.y-5, loc.y, loc.y); 
    bezierVertex(loc.x-45, loc.y+55, loc.x-55, loc.y+45, loc.y, loc.x);
    bezierVertex(loc.x+5, loc.y+45, loc.x-5, loc.y+55, loc.x, loc.x);
    bezierVertex(loc.x-5, loc.y-5, loc.x+5, loc.y+5, loc.x, loc.y);
    endShape();
    popMatrix();
  } 

  void frame() {
    if (loc.x > width) {
      loc.x = 0;
    } 
    else if (loc.x < 0) {
      loc.x = width;
    }
    if (loc.y > height) {
      loc.y = 0;
    } 
    else if (loc.y < 0) {
      loc.y = height;
    }
  }
}



