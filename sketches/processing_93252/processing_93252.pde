
void setup() {
  size (200, 200);
  background (0);
}

void draw() {
    int y=2;
    fill (y*255, y+255);
    stroke (100);
    
  while (y<=200) {
    rect (y*y, 10, 10, 10);   
    rect (y*y,100, 10, 10);
    
    rect (y*y, 180, 10, 10);
          
y=y+2;  }
}
