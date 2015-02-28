
class Food {
  
  int s = 10;
  float xPos = random(width);
  float yPos = random(height);
//  int n = 0;
  
  void drawFood(int n){
    
    if (n == 0) { fill(191, 2, 2); //red
    } else if (n == 1) { fill (0, 78, 209); //blue
    } else if (n == 2) { fill (242, 247, 0); //yellow
    } else if (n == 3) { fill (5, 170, 3); //green
    } else if (n == 4) { fill (245, 147, 0); //orange
    } else if (n == 5) { fill (149, 2, 152); //purple
    } else if (n == 6) { fill (0, 191, 214); //cyan
    } else if (n == 7) { fill (0, 103, 1); //dark green
    
    } ellipse(xPos, yPos, s, s);
  }
  
  boolean isTouching(int x, int y) {
    return dist(x, y, xPos, yPos) <= s;
  }
  
}

