
//Wenda Lewis Teh
//Class Assignment Wk 7
int num_of_arcs = 100;
Arcs [] pacman = new Arcs[num_of_arcs];

void setup () {
  size(600, 600);
  for (int i = 0; i<num_of_arcs; i++) {
    pacman[i]= new Arcs();
  }
  smooth();
}

void draw () {
  background(0);
  for (int i = 0; i<num_of_arcs; i++) {
    pacman[i].ArcsDisplay();
    pacman[i].ArcsMove();
  }
}

class Arcs {
  int x;
  int y;
  int xSpeed;
  Arcs() { //constructor statement
    x = 30 ;
    y = 30;
    xSpeed = 8;
  }
  void ArcsDisplay() {
    fill(252, 128, 3);
    noStroke();
    arc(x, y, 50, 50, 0.52, 5.76);
    arc(x+50, y, 20, 20, 0.52, 5.76);
  }
  void ArcsMove() {

    x += xSpeed;
    if (x>width) {
      x=0;
      y+=50;
    }
    if (y>height) {
      y=25;
    }
  }
}
