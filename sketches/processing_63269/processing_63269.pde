
int x = 70;
int y = 70;
int w = 100;
int h = 100;

int x2 = 199;
int y2 = 199;
int w2 = 222;
int h2 = 222;
 
void setup() {
  size(300, 300);
}
 
void draw() {
  background(0,200,0);
  fill(255);
  
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    println("Over");
    fill(9);
  }
 
  rect(x, y, w, h);


  background(0,200,0);
  fill(255);
  
  if (mouseX > x2 && mouseX < x2 + w2 && mouseY > y2 && mouseY < y2 + h2) {
    println("Over");
    fill(9);
  }
 
  rect(x2, y2, w2, h2);
}

