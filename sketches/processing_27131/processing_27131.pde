
class Food {
  
  int s = 10;
  float xPos = random(width);
  float yPos = random(height);
  
  void drawFood(){
    int n = int(random(5));
    if (n == 0) { fill(170, 0, 11); //dark red
    } else if (n == 1) { fill (255, 0, 0); //bright red
    } else if (n == 2) { fill (242, 247, 0); //yellow
    } else if (n == 3) { fill (250, 66, 94); //red
    } else if (n == 4) { fill (245, 147, 0); //orange
    } ellipse(xPos, yPos, s, s);
  }
  
  boolean isTouching(int x, int y) {
    return dist(x, y, xPos, yPos) <= s;
  }
  
}

