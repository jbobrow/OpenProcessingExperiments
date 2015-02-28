
class Walker {
  int x;
  int y;
  color col;

  Walker() {
    x = width/2;
    y = height/2;

    float num = random(1);
    
    if (num < 0.15) {
      col = color(0, int(random(80, 110)), int(random(80, 255)));
    } 
    else if (num < 0.3) {
      col = color(0, int(random(80, 110)), int(random(100, 255)));
    } 
    else if (num < 0.45) {
      col = color(0, int(random(80, 110)), int(random(200, 255)));
    } 
    else {
      col = color(255, 255, 255);
    }
  }

  void display() {
    fill(col);
    rectMode(CENTER);
    rect(x, y, walkerSizeX-3, walkerSizeY-3);
  }

  void step() {
    int stepx = int(random(3))-1;
    int stepy = int(random(3))-1;
    x += stepx*walkerSizeX;
    y += stepy*walkerSizeX;
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }
}


