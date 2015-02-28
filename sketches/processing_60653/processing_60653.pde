

int x = 300;
int y = 200;
int w = 650;
int h = 400;
 
void setup() {
  size(1350, 900);

}
 
void draw() {
  background(255,0,0);
  noStroke();
  
  
  if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) {
    fill(0,255,0);

    
  }
  else {
    fill(0,0,255);

  }
  
  
    rect(x, y, w, h);

    saveFrame("thumbnail.png");

    

}



