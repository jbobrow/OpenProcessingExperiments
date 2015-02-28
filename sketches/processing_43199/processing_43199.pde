
Bugs[] bugs = new Bugs[200]; //how many initial points would you like? 25, 50, how about 500
 
float sw = 0.5;
 
 
 
void setup() {
  size(300, 300);

 rectMode(CENTER);
  for (int p=0; p < bugs.length;p++) {
    bugs[p] = new Bugs(width/2, height/2); //seeds point array.
  }
}
 
 
 
 
 
void draw() {
 noStroke();
 rect(height/2, width/2, height*1.5, width*1.5);
  fill(0, 1);

  for (int p=0; p < bugs.length; p++) {
    bugs[p].move(); //sets up move command.
    bugs[p].display(); //sets up the drawing of points.
 
 
  }
}
 
 
 
 
 
class Bugs {
 
  float x;
  float y;
 
  Bugs(float x_, float y_) {
    x = x_;
    y = y_;
  }
 
 
  //draws the points with random grayscale stroke color.
  void display() {
    //stroke((random(0, 255)), 10);
    
    stroke((random(0, 255)),(random(0, 255)),(random(0, 255)), 250);
    strokeWeight(sw);
   

    ellipse(x, y, .1, .1);
 
  }
 
 
  //Moves the bugs randomly in x or y between -5 and 5 points.
  void move() {
    x = x + random(-5, 5);
    y = y + random(-5, 5);
  }
}

