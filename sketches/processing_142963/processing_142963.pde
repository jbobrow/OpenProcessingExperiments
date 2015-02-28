
Walker w;

void setup() {  //setup function called initially, only once
  size(400, 280);
  background(0);
  w = new Walker();
}

void draw() {  //draw function loops 
  w.choice();
  w.display();
}

class Walker {
  int x;
  int y;
  
  Walker() {
   x = 30;
   y = 30;
  }
  
  void choice() {
    int c = int(random(2));
    
    if (c == 0) {
      x++;
    } else {
      y++;
    }
  }
  
  void display() {
    stroke(255);
    point(x,y);
  }
}
