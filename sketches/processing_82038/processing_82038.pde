
Square square;

//set up
void setup() {
  size(600, 600);
  background(255);
  smooth();
  square = new Square();
  frameRate(15);
}
//call functions
void draw() {
  square.update();
  square.frame();
  square.show();
}

class Square {
  PVector loc;
  PVector velo;
  float r = 0.5;
  float theta = PI/4;

//create the 2D vectors
  Square() {
    loc = new PVector(random(130,170), random(-30,70));
    velo = new PVector(random(-1.5,0.5),r*cos(theta));
  }

  void update() {
    loc.add(velo);
  }

  void show () {   
    pushMatrix();
    translate(50, 50);
    noFill();
    stroke(0, 0, 0, 30);
    beginShape();
    vertex(loc.x, loc.y);
    bezierVertex(loc.x/2, loc.y, loc.x/2, loc.y-5, loc.y, loc.y); 
    bezierVertex(loc.x/2, loc.y*2, loc.x-55, loc.y*2, loc.y, loc.x);
    bezierVertex(loc.x+5, loc.y*2, loc.x-5, loc.y*2, loc.x, loc.x);
    bezierVertex(loc.x-5, loc.y-5, loc.x+5, loc.y+5, loc.x, loc.y);
    endShape();
    popMatrix();
  } 

  void frame() {
    if (loc.x > width-120) {
      loc.x = random(150,250);
    } 
    else if (loc.x < 0) {
      loc.x = random(100,500);
    }
    if (loc.y > height-320) {
      loc.y = 0;
    } 
    else if (loc.y < 0) {
      loc.y = 0;
    }
  }
}



