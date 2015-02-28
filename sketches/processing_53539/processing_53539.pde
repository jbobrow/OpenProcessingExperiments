
pacmanBody p;
pacmanBody p2; 

void setup () {
  background(0, 0, 220);
  fill(255, 255, 0);
  size(500, 500);
  smooth();
  p = new pacmanBody ();
  p2 = new pacmanBody ();
}

void draw () {
  background(0, 0, 220);
  p2.displayFace2();
  p2.displayEye2(); 
  p.displayFace();
  p.displayEye ();
  p.move();
  p2.move(); 
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
  
   void displayFace2 () {
    fill(255, 0, 0);
    arc(x+125, y+95, 100, 100, -PI, 2.3);
  }

  void displayEye2 () {
    noStroke(); 
    fill(200);
    arc(x+110, y+75, 15, 25, -PI, 2.8);
  }
}










