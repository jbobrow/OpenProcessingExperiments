
class Drop {
  float x; //horizontal location of drop
  float speed; //speed of drop
  float y; //vertical location of drop
  float w; //width of drop
  float h; //height of drop

  Drop(float tempX, float tempY, float tempW, float tempH) {
    //all drops start at 0
    y = tempY;
    //all drops have a random positive speed
    x = tempX;
    speed = 1;
    w = tempW;
    h = tempH;
  }

  //draw drops
  void display() {
    //all drops are red and translucent
    fill(250, 0, 0, 50);
    stroke(0);
    ellipseMode(CENTER);
    ellipse(x, y, w, 20);
  }
  
  void reset() {
    y = 0; 
  }

  //trigger blood drops to drip
  void drip() {
    y += speed;
    for (float dropy = 0; dropy < y; dropy += 10) {
      fill(250, 0, 0, 50);
      stroke(255, 0, 0, 50);
      ellipseMode(CENTER);
      ellipse(x, dropy, w, 20);
    }
  }
}


