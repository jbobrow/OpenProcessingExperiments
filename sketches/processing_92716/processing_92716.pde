
Pen bob = new Pen();
Pen brody = new Pen ();

void setup () {
  size (350, 600);
  brody.y = 240;
  brody.x = 100;
}

void draw () {
  bob.display();
  brody.display();  
}

class Pen {
  float inkAmount;
  int x;
  int y;
  int w;
  int h;
  boolean isClicked;
  
  Pen() {
    x = 20;
    y = 140;
    w = 100;
    h = 10;
    inkAmount = 300;
    isClicked = false;
  }
  void display(){
    rect(x, y, w, h);
    fill (0);  
}
  
  void drawStuff () {}
}
