
class SnakeFood { 
  int x, y; 
  SnakeFood() { 
    x = int(random(width/20))*20; 
    y = int(random(height/20))*20;
  } 
  void display() { 
    fill(219, 20, 20); 
    strokeWeight(5);
    rect(x, y, 20, 20);
  }
}

