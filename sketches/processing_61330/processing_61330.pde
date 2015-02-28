
int x = 50;
int y = 50;
int w = 100;
int h = 75;
 
void setup() {
  size(200, 200);
}
 
void draw() {
  background(0);
  noStroke();
   
  
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    fill(10, 200, 255);
  }
  else {
    fill(255, 100, 20);
  }
  
  rect(x, y, w, h);
}


