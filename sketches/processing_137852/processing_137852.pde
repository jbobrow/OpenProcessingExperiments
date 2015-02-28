
class DrawCarpet {
  void DrawCarpet(){}
void drawCarp() {
  //Draw a multi-square carpet
  for (int i = 0; i<width; i+=10) {
    rectMode(CENTER);
    strokeWeight(1);
    noFill();
    //stroke(random(256),random(256),random(256),random(256));
    rect(200, 200, i, i);
    }
  }
}

