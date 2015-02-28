
import ddf.minim.*;

Minim minim;
AudioInput in;

ArrayList<Circle> myCircles;
int numCircles = 60;

void setup()
{
  size(600, 600, P3D);

  minim = new Minim(this);
  minim.debugOn();

  in = minim.getLineIn(Minim.STEREO, 512);

  myCircles = new ArrayList<Circle>();
  for (int i = 0; i < 60; i++) {
    myCircles.add( new Circle( (int)random(width), (int)random(height) ) );
  }
}
void draw()
{
  background(0);
   noStroke();

  for (int i = 0; i < in.bufferSize() - 1; i++) {
    fill (random (250), random(250), 255, 3);
    rect (0, height, width, 400 + in.left.get(i)*10500);
//    ellipse (mouseX, mouseY, 50 + in.right.get(i)*1000, 50 + in.right.get(i)*1000);
  }


  for (int i = 0; i < in.bufferSize() - 1; i++) {
    fill (255, random(255), random(255), 5);
    ellipse (width/2, height/2, 0 + in.left.get(i)*1000, 0 + in.left.get(i)*1000);
  }
  for (int i = 0; i < myCircles.size()-1; i++) {
    Circle tC = myCircles.get(i);
    tC.display();
    tC.move();
    tC.collision();
  }
}

void stop()
{
  in.close();
  minim.stop();
  super.stop();
}

class Circle {
  int x, y;
  int xDir = 1;
  int yDir = 1;
  int xSpeed = (int)random(1, 10);
  int ySpeed = (int)random(1, 10);
  int cSize = (int)random(10, 100);
  color cColor = color(random(40, 255), random(40, 255), random(40, 255), 100);


  Circle(int tx, int ty) {
    x = tx;
    y = ty;
  }

  void display () {
    noStroke();

    for (int i = 0; i < myCircles.size()-1; i++) {
      Circle CC = myCircles.get(i);
      fill(CC.cColor);
      ellipse(CC.x, CC.y, 10 + in.right.get(i)*500, 10 + in.right.get(i)*500);
    }
  }

  void move() {
    x += xSpeed * xDir;
    y += ySpeed * yDir;
  }

  void collision() {
    if (x <= 0 || x >= width) {
      xDir *= -1;
      xSpeed = (int)random(1, 10);
    }
    if (y <= 0 || y >= height) {
      yDir *= -1;
      ySpeed = (int)random(1, 10);
    }
  }
}



