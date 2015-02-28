
int countBall=1;
ArrayList balls;


void setup() {
  size(640, 480);
  smooth();
  noStroke();
  frameRate(30);
  balls = new ArrayList();
  balls.add(new Ball(width/2, height/2, int(random(20,100)), int(random(20,100)), color(255, 255, 255, 1), int(random(10,50))));
}

private class Ball { 
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
    colorMode(RGB, width-dia, 255, width-dia, 2);
    cirCol = color(width-(xPos+dia/2), 0, xPos+dia/2, 1);
    fill(cirCol);
    ellipse(xPos, yPos, dia, dia);
  }
}

// nice copy from examples, not that sure about arraylists yet (comments are original) - http://processing.org/learning/topics/arraylistclass.html
void draw() {
  background(128);
  // With an array, we say balls.length, with an ArrayList, we say balls.size()
  // The length of an ArrayList is dynamic
  // Notice how we are looping through the ArrayList backwards
  // This is because we are deleting elements from the list  
  for (int i = balls.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Ball ball = (Ball) balls.get(i);
    ball.moveBall();
  }  
  
}

void mousePressed() {
  balls.add(new Ball(mouseX, mouseY, int(random(20,100)), int(random(20,100)), color(255,255,255,1), int(random(10,50))));
}

