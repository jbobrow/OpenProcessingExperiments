
//Program by Sarah Keeling, 1.31.12
//HW 5 for Jim Robert's Processing for the Arts, CMU Spr'12
//copyright 2012
int rectSize;
int grey = #373938;
int teal = #2FAD8C;
float x, y, wd, ht;
float circMove = 20;
color c;



void setup () {
  size (400, 400);
  smooth ();
  background (#CFF7ED);
  x = 200;
  y = 200;
  // wd = 100;
  //ht = 100;
}


void draw () {
  c = color (random (255), random (255), random (255));
  fill (#CFF7ED, 20);
  noStroke ();
  rect (0, 0, width, height);
  rectObjects (20, 1);
  myObject (100, 100);
}


void rectObjects (float rectSize, float numRects) {
  fill (teal, 40);
  noStroke ();
  for (int i =0; i< numRects; i++) {

    float xPos = random (0, width);
    float yPos = random (0, height);
    int tempSize = (int)random (10, rectSize);
    rect (xPos, yPos, tempSize, tempSize);
    rect (xPos, yPos, tempSize, tempSize);
  }
}


void myObject (float wd, float ht) {
  loop();
  stroke (random(255), random(255), random(255));
  fill (grey);

  float circleSize = map (x, mouseX, 0, 0, 300);

  if (mouseX < x- (wd/3)) {
    fill (255);
  }
  ellipse (x, y, wd*2+circleSize, ht*2);
}

void keyPressed () { 

  if (keyCode == UP) {
    y = y- circMove;
  }

  if ( keyCode == DOWN ) {

    y = y + circMove;
  }

  if (keyCode == RIGHT ) {
    x = x +  circMove;
  }

  if ( keyCode == LEFT ) {
    x = x - circMove;
  }

  if (key == 's') {
    for (int i = 0; i < 500; i = i + 20) {
      for (int j = 0; j < 500; j= j+ 20) {
        noStroke ();
        fill (c);
        ellipse(i, j, 5, 5);
      }
    }
  }
}


