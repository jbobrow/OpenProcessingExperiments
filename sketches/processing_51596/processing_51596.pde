
int y = 0;
  int x = 0;
  int spacing = 50;
  int len = 400;
  
void setup() {
  size(400,400);
  background(255);
}
  
void draw() {
  stroke(0);
  while(x <= width)  {
   line(x, y, x, y+len);
   x = x + spacing;
  }
    
   stroke(0);
   while(y <= height) {
     line(0, y, x+len, y);
     y = y + spacing;

  }
}
void keyPressed() {
  saveFrame("PS1_04image.jpeg");
}

