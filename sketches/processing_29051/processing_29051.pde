
int xPos = 1;

void setup() {
 size (450, 450);
 smooth();
 fill(0); 
}

void draw() {
  background (236, 237, 215);
  
  for (int x = 30; x <= width - 50; x += 40) {
    for (int y = 0; y <= height; y += 20) {
      quad( x+5, y, x+8, y+5, x + 5, y + 10, x + 2, y + 5);
      point(x+5, y + 15);
     // point(x + 25, y
     line (x+25, y, x+25, y + 20);
   
      
    }
  }
}

