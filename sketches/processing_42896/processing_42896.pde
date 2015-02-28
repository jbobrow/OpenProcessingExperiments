
int countBall=1;
int dia=100;
Ball b1 = new Ball(100, 80, 10, 50, color(255,255,255, 1), 100);
Ball b2 = new Ball(200, 200, 40, 20, color(255,255,255, 1), 100);
Ball b3 = new Ball(60, 300, 20, 30, color(255,255,255, 1), 100);

void setup() {
  size(640, 480);
  smooth();
  noStroke();
  frameRate(60);
  colorMode(RGB, width-dia, 255, width-dia, 2);
}

class Ball { 
  int xPos, yPos, xAccel, yAccel, dia;
  color cirCol;
  Ball (int x, int y, int a, int b, color c, int d) {
    xPos = x;
    yPos = y;
    xAccel = a;
    yAccel = b;
    cirCol = c;
    dia = d;
  } 
  void moveBall() { 

    //horizontal bounce
    if (xPos<=0+dia/2)
    {
      xAccel=-xAccel;
      xPos=dia/2+1;
    }
    else if (xPos>=width-dia/2)
    {
      xAccel=-xAccel;
      xPos=width-dia/2-1;
    }
    else //increment xPos
    {
      xPos=xPos+xAccel;
    }

    //vertical bounce
    if (yPos<=0+dia/2)
    {
      yAccel=-yAccel;
      yPos=dia/2+1;
    }
    else if (yPos>=height-dia/2)
    {
      yAccel=-yAccel;
      yPos=height-dia/2-1;
    }
    else //increment yPos
    {
      yPos=yPos+yAccel;
    }
    //draw new position
    cirCol = color(width-(xPos+dia/2), 0, xPos+dia/2,1);
    fill(cirCol);
    ellipse(xPos, yPos, dia, dia);
  }
}

void draw() {
  background(128);
    b1.moveBall();
    b2.moveBall();
    b3.moveBall();
}




