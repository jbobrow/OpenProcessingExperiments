
int a = 200;
float movmax = 10;
float movmin = 1;
Box[] mybox;

void setup() {
  size (600, 600);
  background(0);
  mybox = new Box[a];

  for (int i = 0; i<a; i++) {
    mybox[i] = new Box();
    mybox[i].xmov = random(-3, 3);
    mybox[i].ymov = random(-3, 3);
    mybox[i].c = 128/a*i+127;
  }
}


void draw() {
  fill(0,5); // use black with alpha 10
  rectMode(CORNER);
  rect(0,0,width,height);
  for (int i = 0; i<a; i++) {
    mybox[i].movebox();
    mybox[i].display();
  }
}

void mouseMoved (){
  for (int i = 0; i<a; i++){
    mybox[i].c = color (random(128,255),random(128,255),random(128,255));
    }
  }

void mouseClicked (){
  background(0);
  }


class Box {
  color c;
  float xpos;
  float ypos;
  float xmov;
  float ymov;

  Box() {
    c = color (255);
    xpos = width/2;
    ypos = height/2;
    xmov = 0;
    ymov = 0;
  }

  void display() {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, 10, 10);
  }

  void movebox() {
    xpos = xpos + xmov;
    ypos = ypos + ymov;
    if (xpos > width) {
      xpos = width;
      xmov = random(0.2, 3) * -1;
    }
    else {
      if (xpos < 0) {
        xpos = 0;
        xmov = random(0.2, 3);
      }
    }

    if (ypos > height) {
      ypos = height;
      ymov = random(0.2, 3) * -1;
    }
    else {
      if (ypos < 0) {
        ypos = 0;
        ymov = random(0.2, 3);
      }
    }
  }
}


