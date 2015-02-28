
//Ana Cecilia Thompson
//Homework Object

Flag brazil = new Flag();
Flag waved = new Flag ();

void setup() {
  //sky
  background(89,175,227);
  size (800, 400);
  waved.x = 604;
}

void draw() {
  //flag
  brazil.display();
  //waving
  if (mouseX>400) {
    waved.display();
    noStroke();
    fill (89,175,227);
    rect(0,0,400,400);
   }
  if (mouseX<400) {
    noStroke();
    fill (89,175,227);
    rect(405,0,400,400);
  }
  fill(14,224,46);
  //ground
  rect(0,300,800,100);

}



class Flag {
  int x;
  int y;
  int w;
  int h;
  boolean wave;


  Flag () {
    x = 400;
    y = 100;
    w = 4;
    h = 200;
    wave = false;
  }

  void display() {
    stroke(0);
    //pole
    fill(0);
    rect (400, 100, 4, 200);
    //green
    fill (92, 219, 20);
    rect (x-200, y, w+196, h-80);
    //yellow
    fill (250, 239, 23);
    beginShape();
    vertex (x-100, y);
    vertex (x, y+60);
    vertex (x-100, y+120);
    vertex (x-200, y+60);
    endShape(CLOSE);
    //blue
    fill (23, 47, 250);
    ellipse (x-100, y+60, 50, 50);
  }
}
