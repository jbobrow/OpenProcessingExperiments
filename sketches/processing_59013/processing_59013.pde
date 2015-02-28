
//Candice Ferreira. Problem sse 3 Question 5
// Order to Chaos
complex c[] = new complex[1000];

void setup() {
  size(400, 400);
  smooth();
  for (int i = 0; i < c.length; i++) {
    c[i] = new complex(20, 20, 20, 20);
  }
}

void draw() {
  background(220);
  for (int i = 0; i < c.length; i++) {
    c[i].display();
  }
}



class complex {
  float x;
  float y;
  float w;
  float h;
  float mp;

  complex( float x, float y, float w, float h) {
    this.x = width/2;
    this.y = height/2;
    this.w = random(5, 20);
    this.h = random(5, 20);
  }

  void display() {
    rectMode(CENTER);
    noFill();
    stroke(25);
    x= map(mouseX, 0, width, 0, random(0,width));
    y= map(mouseY, 0, height, 0, random(0,height));
    rect(x, y, w, h);
  }
}


