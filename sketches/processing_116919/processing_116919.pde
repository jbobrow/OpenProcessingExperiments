
Phone red;
Phone green;
Phone blue;

void setup() {
  size(800, 200);
  smooth();


  red = new Phone(150, 80, 1.2, 100, 255, 0, 0);
  green = new Phone(width/2, 50, 0.5, 50, 0, 255, 0);
  blue = new Phone(700, 100, 1.8, 200, 0, 0, 255);
}

void draw() {
  background(80,80,80);

  red.display();
  green.display();
  blue.display();
}

class Phone {

  float x, y;
  float a, b;
  float c, d, e;



  Phone(float xpos, float ypos, float r, float fv, float re, float gr, float bl) {
    x = xpos;
    y = ypos;
    a = fv;
    b = r;
    c = re;
    d = gr;
    e = bl;
  }



  void display() {
    noStroke();
    pushMatrix();
    translate(x, y);
    rotate(b);
    fill(255, a);
    rect(0, 0, 60, 117, 7);
    rect(27, 5, 8, 2, 5);
    rect(5, 20, 50, 78);
    ellipse(18, 13, 3, 3);
    rect(25, 12, 13, 1, 3);
    fill(c, d, e);
    ellipse(30, 107, 10, 10);
    popMatrix();
  }
}



