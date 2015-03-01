
void setup() {
  size(500,500);
  smooth();
}
void draw() {
  if (mousePressed) {
      stroke(255);
    int dir = (int) (Math.random()*4 +1);
    Double linelength = Math.random() * 100 + 1;
    float xLength = linelength.floatValue();
    
    if (dir == 1) { //make line go left to right - add to x
      line(mouseX, mouseY, mouseX + xLength, mouseY);
    }
    else if (dir == 2) {//make line go down - add to Y
      line(mouseX, mouseY, mouseX, mouseY + xLength);
    }
    else if (dir == 3) {//make line go right to left - subtract from x
      line(mouseX, mouseY, mouseX - xLength, mouseY);
    }
     else if (dir == 4) {//make line go up - subtract from y
      line(mouseX, mouseY, mouseX, mouseY - xLength);
    }
  }
}
    



