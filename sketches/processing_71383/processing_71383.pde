
class Spot {
  color c;
  float xpos;
  float ypos;
  float xspeed;



  Spot(color c2, float xpos2, float ypos2, float xspeed2) {
    c = c2;
    xpos = xpos2;
    ypos = ypos2;
    xspeed = xspeed2;
  }

  void display() {
    rectMode(CENTER);
    stroke(30);
    fill(random(xpos+200), random(ypos+200), random(200),random(200));
    rect(xpos,ypos,mouseX, mouseY);
  }

  void move() {
    xpos = xpos+ xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}


