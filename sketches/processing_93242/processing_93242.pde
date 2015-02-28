
void setup() {
  size (200, 200);
  background (255);
}

void draw() {
    int y=2;
    fill (y*255, y+255);
    stroke (0);
    
  while (y<=200) {
    rect (y*y, 10, 10, 10);   
    rect (y*y,80, 10, 10);
    
    rect (y*y, 150, 10, 10);
          
y=y+2;  }
}
