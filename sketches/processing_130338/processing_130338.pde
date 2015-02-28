
class Cloud {
  int x, y, type;
  int savedTime = millis();
  int timeCheck = savedTime/100;

  //constructor
  Cloud(int myX, int myY) {
    x = myX;
    y = myY;
  }
  
  int cloudType () {
    int rand = int(random(1,3));
    if (rand == 1) {
      type = 1;
    }
    else if (rand == 2) {
      type = 2;
    }
    else if (rand == 3) {
      type = 3;
    }
    return type;
  }

  void dispay(int type) {
    fill(225);
    noStroke();
    if (type == 1) {
      cloud1(x, y);
    }
    else if (type == 2) {
      cloud2(x, y);
    }
    else if (type == 3) {
      cloud3(x, y);
    }
  }
  
  void cloud1(int i, int j) {
    fill(225);
    noStroke();
    ellipse(i, j, 20, 20);
    ellipse(i-10, j, 20, 20);
    ellipse(i, j-10, 20, 20);
    ellipse(i+10, j, 20, 20);
    ellipse(i, j+10, 20, 20);
  }
  
  void cloud2(int i, int j) {
    fill(225);
    noStroke();
    ellipse(i, j, 20, 20);
    ellipse(i+5, j+5, 20, 20);
    ellipse(i+10, j, 20, 20);
    ellipse(i+10, j+5, 20, 20);
    ellipse(i+10, j+10, 20, 20);
    ellipse(i-10, j, 20, 20);
    ellipse(i, j-15, 20, 20);
  }
  
  void cloud3(int i, int j) {
    fill(175);
    noStroke();
    ellipse(i, j, 20, 20);
    fill(225);
    noStroke();
    ellipse(i+10, j, 20, 20);
    ellipse(i-10, j, 20, 20);
    ellipse(i+5, j+5, 20, 20);
    ellipse(i-5, j+5, 20, 20);
  }

  void wind() {
    if (x <= w) {
      x += 1;
    }
    if (x == w) {
      x = 0;
    }
  }
}


