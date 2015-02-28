
Snake larry;

void setup() {
  size(500, 500);
  smooth();
  larry = new Snake(color(255,0,0));
}

void draw() {
  background(0);
  larry.display();
  larry.move();
}

class Snake {
  int[] xpos = new int [50];
  int[] ypos = new int [50];  
  color c;
  float x;
  float y;

  Snake(color tempc) {
    c = tempc;

    //initializing array in 0 
    for ( int i = 0; i < xpos.length; i++) {
      xpos[i] = 0;
      ypos[i] = 0;
    }
  }

  void display() {
    for (int i = 0; i<xpos.length; i++) {
      noStroke();
      fill(c-i*5);
      ellipse(xpos[i], ypos[i], i, i);
    }
  }


  void move() {
    xpos[xpos.length-1] = mouseX;
    ypos[ypos.length-1] = mouseY;

    for (int i = 0; i<xpos.length-1; i++) {
      xpos[i] = xpos[i+1];
      ypos[i] = ypos[i+1];
    }
  }
}
