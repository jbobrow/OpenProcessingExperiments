
  class Apple { 
    color c;
    float xpos;
    float ypos;
    float xspeed;
    
    Apple() { 
      c = color(250, 0, 0);
      xpos = width/2;
      ypos = height/2;
      xspeed = 1;
    }

    void display() { 

      ellipseMode(CORNER);
      stroke(0);
      fill(c);
      ellipse(xpos, ypos, 40, 30);
    }

    void move() { 
      ypos = ypos + xspeed;
      if (ypos > width) {
        ypos = 0;
      }
    }
  }

