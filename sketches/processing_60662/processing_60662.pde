
int x = 50;
int y = 50;
int w = 100;
int h = 100;
 
void setup() {
  size(200, 200);
   background(0);
}
 
void draw() {
 
  noStroke();
  fill(200,10,40,10);
   
 
  if (mouseX <= x+w && mouseX >= x && mouseY<= y+h && mouseY >= y) {
   fill(random(255),random(180),random(230));
   
  }
 
  rect(x, y, w, h);
}



