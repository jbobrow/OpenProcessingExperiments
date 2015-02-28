
class Figure {
  float xpos;
  float ypos;
  float r;

  Figure(float tempX, float tempY) {
    xpos = tempX;
    ypos = tempY;
    r=10;
  }

  void keys() {
    //need to fix
    if (keyPressed == true) {
      if (key == CODED) {

        if (keyCode == UP) 
          ypos-=2;
        else if (keyCode == DOWN) 
          ypos+=2;

        if (keyCode == RIGHT) 
          xpos +=2;
        else if (keyCode == LEFT)
          xpos -=2;
      }
    }
  }
  void display() {
    fill(170);
    ellipse(xpos, ypos, r*2, r*2);
  }

  void flash() {
    fill(0);
    maxDistance = dist(0, 0, width, height);
    for (int i = 0; i <= width; i += 40) {
      for (int j = 0; j <= height; j += 40) {
        float mouseDist = dist(self.xpos, self.ypos, i, j);
        float diameter = (mouseDist / maxDistance) * 240.0;
        ellipse(i, j, diameter, diameter);
      }
    }
  }

  void guideline() {

    color temp = get(round(xpos+10), round(ypos+10));
    if (temp == color(3, 5, 9)) { 
      ypos-=2;
      xpos-=2;
    }
    color temp2 = get(round(xpos-10), round(ypos-10));
    if (temp2 == color(2, 5, 9)) { 

      ypos+=2;
      xpos+=2;
    }
  }


  /*
  Changed this to a boolean instead of a float. I think it's better to check the distance
   inside the figure class. Theoretically then, you can have multiple figures that all check
   the distance to the same ghost.
   Check the draw loop to see how the boolean return value is handled. 
   */
  boolean checkCollision(Scary g) 
  {

    if ( dist(xpos, ypos, g.xpost, g.ypost) < r+g.r+25  )  
      return true;
    else 
      return false;
  }

  void wrap()
  {
    if (xpos >= width+10) {
      xpos = -10;
    }
    else if (xpos<=-10) {
      xpos = width+10;
    }
  }
}


