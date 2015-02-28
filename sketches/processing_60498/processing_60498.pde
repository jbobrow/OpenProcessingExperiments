
class Cross {
  int crossX;
  int crossY;

  Cross() {
    rectMode(CENTER);
    crossX = 550;
    crossY = height/2;
  }


  void display() {
    pushMatrix();
    noStroke();
    fill(245, 44, 44);
    rect(crossX, crossY, 60, 5);
    rect(crossX, crossY, 5, 60);
    stroke(245, 44, 44);
    popMatrix();
  }

  void randomizeCross() {
    int crx = (int)random(5, 30);
    int cry = (int)random(5, 20);

    crossX = (crx*20);
    crossY = (cry*20);
  }
}


