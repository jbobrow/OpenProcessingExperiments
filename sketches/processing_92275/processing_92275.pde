
void setup() {
  size(400, 400);
  background(250);
}

void draw() {
  if (key == '1') 
      background(250);
  else if (key == '2')
      background(10);
  if(mousePressed){
    int rand = 255-(int)random(120);  // not too dark
    int rand2 = (int)random(120);  
    if (key == 'r') 
      stroke(rand, 0, rand2, 70);
    else if (key == 'g') 
      stroke(0, rand, rand2, 70);
    else if (key == 'b')    
      stroke(rand2, 0, rand, 70);
    else if (key == 'y')    
      stroke(rand, rand, 0, 70);
    else if (key == 'x') 
      stroke(255-rand, 70);
    else
      stroke(255-rand, 70);
    strokeWeight(12);
    drawLine(mouseX, mouseY, pmouseX, pmouseY);
  }
}

void drawLine(int x, int y, int x2, int y2) {
  line(400-x, 400-y, 400-x2, 400-y2);
} 
