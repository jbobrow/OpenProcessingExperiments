
PeachPie LinesLines;

PeachPie[] LineArray= new PeachPie[200];

void setup() {
  size (600, 600);
frameRate(30);
  for (int i=0; i<LineArray.length; i++) {
    LineArray[i] = new PeachPie();
  }

  LinesLines=new PeachPie();
}

void draw() {
  background(211, 166, 166);
  for (int i=0; i<LineArray.length; i++) {
    LineArray[i].display();
    LineArray[i].move();
  }
}



class PeachPie {
  int lineX;
  int lineY;
  int speedX;
  int speedY;

  PeachPie() {
    lineX=int(random(width));
    lineY=int(random(height));
    speedX=10;
    speedY=2;
  }

  void display() {
    strokeWeight(int(random(0, 4)));
    stroke(255);
    lineX=lineX-speedX;
    lineY=lineY-speedY;
    line(lineX, lineY, mouseX, mouseY);
  }

  void move() {

    if (lineX<0) {
      speedX=-speedX;
    }

    if (lineX>700) {
      speedX=-speedX;
    }

    if (lineY<0) {
      speedY=-speedY;
    }

    if (lineY>700) {
      speedY=-speedY;
    }
  }
}
