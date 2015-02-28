
int x = 50;
int y = 50;
int w = 100;
int h = 75;
 
void setup() {
  size(200, 200);
}
 
void draw() {
  
  background(0,0,255);
  stroke(255,255,0);
  strokeWeight(20);
  fill(255,150,10);
  
  
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
     fill(255,0,0);
     stroke(0,0,255);
     background(70,245,80);
     }
  
rect(x, y, w, h);
  
}


