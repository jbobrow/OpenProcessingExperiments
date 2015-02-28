
class Rock {
  //variables
  //color c;
  // int x, y, w, h;
  PImage rock;
  int w, h;
  float x, y;
  float xspeed;
  //conductor
  /* Rock(color tempC, int tempX, int tempY, int tempW, int tempH, float speed) {
   c = tempC;
   x = tempX;
   y = tempY;
   w = tempW;
   h = tempH;*/
  Rock(String filename, float tempX, float tempY, int tempW, int tempH, float speed) {
    rock = loadImage(filename);
    x = tempX;
    y = tempY;
    w = tempW;
    y = tempH;
    xspeed = speed;
  }


  void move() {
    x += xspeed;
    println("i'm moving!");
  }

  void display() {
    /*noStroke();
     fill(c);
     arc(x, y, w, h, PI, TWO_PI-PI/90);
     println("i'm on screen!");*/
    translate(x,y);
    image(rock,w,h);
    println("i'm on screen!");
    if (x<-10) {
      x = width+1;
    }
  }
}


