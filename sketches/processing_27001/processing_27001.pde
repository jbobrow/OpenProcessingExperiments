
class Food {
  
  int s = 10;
  float xPos = random(width);
  float yPos = random(height);
  
  void drawFood(){
    int n = int(random(5));
    if (n == 0) { fill(0,250,126); //green
    } else if (n == 1) { fill(2,0,223); //purple
    } else if (n == 2) { fill(225,238,136); //yellow
    } else if (n == 3) { fill(250,66,94); //red
    } else if (n == 4) { fill(157,188,252); //blue
    } ellipse(xPos, yPos, s, s);
  }
  
  boolean isTouching(int x, int y) {
    return dist(x, y, xPos, yPos) <= s;
  }
  
}

