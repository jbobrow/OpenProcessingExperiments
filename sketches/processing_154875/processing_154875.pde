
//---- Alien Class ----------
class Alien {
  float x, y;
  color c;
  Alien(float x, float y, int imgnumber) {
    this.x = x; 
    this.y = y;
    c = (color) random(#000000);
  }

  void show() {
    noStroke();
    fill(c);
    ellipse(x, y, 10, 10);
  }

  void move() {
    y+=deltay;
  }
}

//------------  Add Aliens on the Screen ------ 

void AddAlien() {
  for (int i=0; i<10; i++) {
    for (int j=0; j<5; j++) {
      Alien F =  new Alien(i*width/10+20, j*40+10, (int)random(0, 3));
      AlienList.add(F);
    }
  }
}


