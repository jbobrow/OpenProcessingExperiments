
Footprint a;
Footprint b;
Footprint c;


void setup() {
  size(600, 800);

    a = new Footprint(500, 200);
    b = new Footprint(500, -800);
    c = new Footprint(500, -1600);

  }

void draw() {
  background(255);

  a.displayfootprint();
  b.displayfootprint();
  c.displayfootprint();

  a.movefootprint();
  b.movefootprint();
  c.movefootprint();
  
if (mousePressed==true){
textSize(100);
text("Times Square", 100, 200); }

else {
textSize(32);
text("Central Park", 90, 180); 
  
  
}}


class Footprint {

  float x;
  float y;
  float a;
  float b;
  float l;


  //Constructor
  Footprint(float posX, float posY) {

    x = posX;
    y = posY;
    a = 5;
    b = 5;
  }

  void displayfootprint() {

    fill(0);
    stroke(0);

    for (int i = -10000; i < 100; i = i+70) {

      ellipse(x+i, y, a, b);
      ellipse(x+10+i, y, a+7, b+2);

      ellipse(x + 30+i, y+10, a, b);
      ellipse(x+40+i, y+10, a+7, b+2);
    }
  }

  void movefootprint() {
    x = x + 2;

    if (mousePressed == true) {
      y = y + 2;


      fill(0);
      stroke(0);

      for (int i = -10000; i < 100; i = i+70) {

        ellipse(x+i, y, a, b);
        ellipse(x+10+i, y, a+7, b+2);

        ellipse(x + 30+i, y+10, a, b);
        ellipse(x+40+i, y+10, a+7, b+2);


        rotate(PI/30+l);
        l = l + 1;

        fill(0);
        stroke(0);



        ellipse(x+i, y, a, b);
        ellipse(x+10+i, y, a+7, b+2);

        ellipse(x + 30+i, y+10, a, b);
        ellipse(x+40+i, y+10, a+7, b+2);
      }
    } else {
    }
  }
}
