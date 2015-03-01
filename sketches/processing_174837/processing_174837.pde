


boolean clicked = false;
boolean sqr = false;
int counter = 0;
float siz = (30);
ArrayList<Circle> Cir;
color randColr = color(random(255), random(255), random(255));
void setup() {
  size(700, 700);
  Cir = new ArrayList<Circle>();
  int x = width/2;
  int y = width/2;
  Circle a = new Circle(x, y);
}
void draw() {
  background(255);
  rect(0, 0, 100, 100);
  if (counter%5==0) {
    Circle a = new Circle(mouseX, mouseY);
    Cir.add(a);
  }
  for (int i = 0; i<Cir.size (); i++)
    Cir.get(i).display();
  if (!clicked) {
    for (int i = Cir.size ()-1; i>=0; i--) {
      Cir.get(i).time++;
      if (Cir.get(i).time==25)
        Cir.remove(i);
    }
  }
  fill(randColr);
  if (sqr) {
    pushMatrix();
    rectMode(CENTER);
    rect(mouseX, mouseY, siz, siz);
    popMatrix();
  } else {
    ellipse(mouseX, mouseY, siz, siz);
  }
}
void mousePressed() {
  clicked=true;
  if (mouseX<100&&mouseY<100)
    sqr=!sqr;
}  
void mouseReleased() {
  clicked=false;
}

class Circle {
  float x;
  float y;
  int time = 0;
  color c = color(random(255), random(255), random(255));
  float rand = random (30);
  Circle(int tx, int ty) {
    x=tx;
    y=ty;
  }
  void display() {
    fill(c);
    math();
    noStroke();
    if (sqr) {
      pushMatrix();
      rectMode(CENTER);
      rect(x, y, rand, rand);
      popMatrix();
    } else {
      ellipse(x, y, rand, rand);
    }
  }
  void math() {
    int p = int(random(-10, 10));
    int b = int(random(-10, 10));
    x+=p;
    y+=b;
  }
}

