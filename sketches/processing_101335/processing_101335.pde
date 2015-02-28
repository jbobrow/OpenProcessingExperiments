
void setup() {
  background(0);
  size(640, 480);
  drawHead(100,100);
}

void draw() {
  if (mouseX != 0) {
    //set color based on mouse position
    color c = color((mouseY/2 - mouseX/2) % 100 + 155, mouseX/2 % 100 + 155, mouseY/2 % 100 + 155);
    fill(c);
    
    //draw worm body circles
    int xD = pmouseX - mouseX;
    int yD = pmouseY - mouseY;
    stroke((mouseY/2 - mouseX/2) % 100 + 100, mouseX/2 % 100 + 100, mouseY/2 % 100 + 100);
    ellipse(pmouseX, pmouseY, 100, 100);
    stroke((mouseY/2 - mouseX/2) % 100, mouseX/2 % 100, mouseY/2 % 100);
    ellipse(mouseX+ xD/2, mouseY + yD/2, 100, 100);
    
    //draw worm head circle
    drawHead(mouseX, mouseY); 
  }
}

void drawHead(int x, int y) {
  ellipse(x, y, 100, 100);
  strokeWeight(3);
  
  line(x - 30, y - 20, x - 20, y - 30);
  line(x + 20, y - 30, x + 30, y - 20);
  line(x - 20, y - 30, x - 10, y - 20);
  line(x + 20, y - 30, x + 10, y - 20);
  strokeWeight(1);
}


