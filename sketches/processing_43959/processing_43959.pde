
class Button {
  float x,y,r;
  //boolean overB;
  
  Button(float tX, float tY, float tR) {
    x = tX;
    y = tY;
    r = tR;   
  }
  
  void display() {
    strokeWeight(4);
    stroke(#1B9BE0);
    fill(255);
    ellipse(x,y,r,r);
    fill(0);
    textSize(12);
    text("Play\n Again", x, y-5);
  }
  
  void rollOver() {
    if(mouseX < x+r && mouseX > x-r && mouseY < y+r && mouseY > y-r) {
      overB = true;
    } else {
      overB = false;
    }
  }
}

