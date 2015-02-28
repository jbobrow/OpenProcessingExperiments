
class Fly {
  float xpos, ypos, xspeed, yspeed;
  int xdir = 1;
  int ydir = 1;
  int size = 70;
  int w = 70;
  int h = 30;

  Fly(float tempXpos, float tempYpos, float tempXspeed, float tempYspeed) {
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed; 
    yspeed = tempYspeed;
  }

  void display() {
    fill(random(0),random(255),random(255),50);

    ellipseMode(CENTER);
    ellipse(xpos,ypos, random(w), random(h)); //random w&h create flapping effect
  }

  void go() {
    xpos += random(xspeed*xdir); 
    ypos += random(yspeed*ydir);
    
    //Tells shapes to stay within screen boundaries
    if(xpos > width-size || xpos < 0 ) {
      xdir *= -1; 
    } 
    if (ypos > height-size || ypos < 0) {
      ydir *= -1;    
    }
  }
}







