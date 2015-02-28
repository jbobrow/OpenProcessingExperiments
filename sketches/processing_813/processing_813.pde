


int rectWidth = 25;
int rectHeight = 25;
void setup() {
  size(396,396);



}

void draw() {
  background(0);
  fill(255);
  for (int y= 5; y<height; y += 30){
    for (int x= 5; x<width; x += 30){


      rect(x, y,rectWidth, rectHeight);

      if (mouseX >= x && mouseX <= x+rectWidth && 
        mouseY >= y && mouseY <= y+rectHeight) {
        fill(0);
        rect(x, y,rectWidth, rectHeight);
      }
      fill(255);
    }
  }

}



