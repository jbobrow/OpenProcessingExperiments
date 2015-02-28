
class BrocoliClasse {

  float x;
  float y;
  float v;
  PImage img; 

  BrocoliClasse (float x, float y, float v, PImage img) {

    this.x = x;
    this.y = y;
    this.v = v;
    this.img = img;
  }

  void brocoliClasse () {

    for (int i=0; i<10; i++) {
      y = y + v;
      if (y > height) {
        x = random(height);
        y = -30;
      }
      if (y > 330 && y < 334 && x >= mouseX-50 && x <= mouseX+50 ) {
        score = score + 1;
      } 
      image (brocoli, x, y);
    }
  }
  
  void draw() {
    brocoliClasse();
  }
}



