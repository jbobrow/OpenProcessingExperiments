
Monster myMonster;
float x;
float y;
void setup() {
  size(800,800);
  myMonster = new Monster();
  x = 0;
  y = 0;
}

void draw() {
  background(255);
  myMonster.move();
  myMonster.display();
}

class Monster {
  float xpos;
  float ypos;
  float xspeed;
  
  Monster() {

    xpos = width/2;
    ypos = height/2;
    xspeed = 10;
  }
  
  void display() {
    beginShape();
//face
noStroke();
fill(0, 26, 51);
ellipse(400, 400, 500, 400);
//ears
ellipse(250, 200, 100, 100);
ellipse(550, 200, 100, 100);
fill (255);
ellipse(400, 400, 150, 130);
fill (0);
ellipse(400, 400, 50, 50); 
fill(0, 26, 51);
ellipse(300, 600, 50, 100);
ellipse(500, 600, 50, 100);
stroke(255);
arc(400, 550, 60, 60, -PI, 0); 
  }
  
  void move() { // Function.
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}
  


