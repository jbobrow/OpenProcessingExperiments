


Rect r;

void setup() {
  r = new Rect();
  
  size(500,500);  
  background(0);
}


void draw() {
  
  
  r.display();  //Draw a rectangle
  
  r.grow();  //Grow the rectangle
  
  //r.edge();   //Once the rectangle gets bigger
              //bigger than the screen
              //draw a new, small rectangle
}








class Rect {
  float x;
  float a;
  float b;
  float c;
  float d;
  float e;
  float centerX;
  float centerY;
  int savedTime;


  Rect() {
    centerX = 250;
    centerY = 250;
    float x = random(mouseX-10, mouseX+10);
    float y = random(mouseY-10, mouseY+10);
    a = 10;
    b = a*x;
    c = b*x;
    d = c*x;
    e = d*x;
  }

  void display() {
    rectMode(CENTER);
    stroke(255);
    noFill();
    rect(centerX, centerY, a, a);
  }

  void grow() {
    for (a = 1; a <= width; a*=1.618) {
      stroke(255);
      noFill();
      rect(mouseX, mouseY, a, a);

      a=1.618*a;

      rect(x, x, a, a);
    }
  }
}



