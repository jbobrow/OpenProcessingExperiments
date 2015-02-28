
pacmanBody p;

void setup () {
  background(0, 0, 220);
  fill(255, 255, 0);
  size(500, 500);
  smooth();
  p = new pacmanBody ();
}

void draw () {
  background(0, 0, 220);
  p.displayFace();
  p.displayEye ();
  p.move();
}


class pacmanBody {

  float x = width/2;
  float y = height/2;

  void move() {
    x = mouseX; 
    y = mouseY;
  }


  void displayFace () {
    fill(255, 255, 0);
    arc(x, y, 200, 200, -PI, 2.3);
  }

  void displayEye () {
    fill(0);
    arc(x-35, y-38, 30, 50, -PI, 2.8);
  }
}








