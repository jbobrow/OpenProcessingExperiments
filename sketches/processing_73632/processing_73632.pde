


Kar myKar1;
Kar myKar2; 
Kar myKar3;
Kar myKar4;

void setup() {
  size(400,200);
  myKar1 = new Kar(0, 40); // Parameters go inside the parentheses when the object is constructed.
  myKar2 = new Kar(0, 80);
  myKar3 = new Kar(0, 120);
  myKar4 = new Kar(0, 160);
  smooth();
  
}

void draw() {
  background(100, 60, 100, 0);
  myKar1.move();
  myKar1.display();
  myKar2.move();
  myKar2.display();
  myKar3.move();
  myKar3.display();
  myKar4.move();
  myKar4.display();
}

class Kar { // Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.Isn’t object-oriented programming swell?
  color c;
  float xpos;
  float ypos;
  float xspeed;
  int colorstep; // how much to brighten color each lap?

  Kar(float tempXpos, float tempYpos) { // The Constructor is defined with arguments.
    c = 0;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = 0.5 + random(2.); // Every Kar gets a random speed
    colorstep = 50;
  }

  void display() {
    stroke(0);
    fill(c + (xpos/width * colorstep)); // Kars get brighter as they get closer to finish
    rectMode(CENTER);
    rect(xpos, ypos, 20 + c/6, 10); // Kars get LONGER as they get closer to finish!
    ellipse(xpos - 6, ypos + 6, 6, 6); // wheels!
    ellipse(xpos + 6, ypos + 6, 6, 6);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
      c = c + colorstep; // brighten color each lap
    }
    if(c > 255) c = 0; // if finished, start over
  }
}

