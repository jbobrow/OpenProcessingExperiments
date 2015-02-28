
///BACKGROUND////////////////////////

class Star {
  color c;
  float xpos;
  float ypos;
  float xPos;
  float yPos;
  float xspeed;
  float yspeed;
  float size;

  Star() {
    c = color(random(200, 255), random(200, 240), random(100, 200),90);
    size = random(1, 3);
    xpos = random(1, width);
    ypos = random(1, height);
    xPos = random(1, width);
    yPos = random(1, height);
    yspeed = yspeed+0.1;
    xspeed = xspeed+0.1;
   // println(xspeed);
  }

  void display() {
    rectMode(CENTER);
    stroke(c+5);
    fill(c);
    rect ((xpos), (ypos), size, size);
    fill(c);
    rect ((xPos), (yPos), size, size);
    
    rectMode(CENTER);
    noStroke();
    fill(c,30);
    ellipse ((xPos), (yPos), 20, 20);
  }  

  void orbit() {

     
    xpos=xpos+xspeed;
    ypos=ypos+yspeed;
    xPos=xPos+xspeed;
    yPos=yPos-yspeed;
    //println(xpos);
  }
}



