
//the width and height of each small rect
int rectX;
//the postion of the group of rects
int positionX, positionY;
String button_text;
PFont button_font;
//time of keypressed;
int n = 0;
int outputY = 300;


void setup() {
  size(800, 600);

  button_text="?";
  button_font= loadFont("Monospaced-48.vlw");
}

void draw() {
  rectMode(CENTER);
  //input rectangle
  rect(400, 150, 600, 30);
  fill(255);
  textFont(button_font);
  textAlign(LEFT, BOTTOM);
  textSize(13);
  text(button_text, 110, 165);
  text("Type in your sentence here.", 110, 150);
  fill(0);
}

void keyPressed() {
  button_text += key;
  n++;
  if (key == 'a' || key =='A') {
    a(10, 60+n*40, outputY);
  }
  else if (key == 'b' || key == 'B') {
    b(10, 60+n*40, outputY);
  }
  else if (key == 'c' || key == 'C') {
    c(10, 60+n*40, outputY);
  }
  else if (key == 'd' || key == 'D') {
    d(10, 60+n*40, outputY);
  }
  else if (key == 'e' || key == 'E') {
    e(10, 60+n*40, outputY);
  }
  else if (key == 'f' || key == 'F') {
    f(10, 60+n*40, outputY);
  }
  else if (key == 'g' || key == 'G') {
    g(10, 60+n*40, outputY);
  }
  else if (key == 'h' || key == 'H') {
    h(10, 60+n*40, outputY);
  }
  else if (key == 'i' || key == 'I') {
    i(10, 60+n*40, outputY);
  }
  else if (key == 'j' || key == 'J') {
    j(10, 60+n*40, outputY);
  }
  else if (key == 'k' || key == 'K') {
    k(10, 60+n*40, outputY);
  }
  else if (key == 'l' || key == 'L') {
    l(10, 60+n*40, outputY);
  }
  else if (key == 'm' || key == 'M') {
    m(10, 60+n*40, outputY);
  }
  else if (key == 'n' || key == 'N') {
    n(10, 60+n*40, outputY);
  }
  else if (key == 'o' || key == 'O') {
    o(10, 60+n*40, outputY);
  }
  else if (key == 'p' || key == 'P') {
    p(10, 60+n*40, outputY);
  }
  else if (key == 'q' || key == 'Q') {
    q(10, 60+n*40, outputY);
  }
  else if (key == 'r' || key == 'R') {
    r(10, 60+n*40, outputY);
  }
  else if (key == 's' || key == 'S') {
    s(10, 60+n*40, outputY);
  }
  else if (key == 't' || key == 'T') {
    t(10, 60+n*40, outputY);
  }
  else if (key == 'u' || key == 'U') {
    u(10, 60+n*40, outputY);
  }
  else if (key == 'v' || key == 'V') {
    v(10, 60+n*40, outputY);
  }
  else if (key == 'w' || key == 'W') {
    w(10, 60+n*40, outputY);
  }
  else if (key == 'x' || key == 'X') {
    x(10, 60+n*40, outputY);
  }
  else if (key == 'y' || key == 'Y') {
    y(10, 60+n*40, outputY);
  }
  else if (key == 'z' || key == 'Z') {
    z(10, 60+n*40, outputY);
  }

  if ((60 + n* 40) >= 700 ) {
    outputY += 40;
    n=0;
  }
}

//define shape of every alphabet
void a (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);
  //1
  rect(positionX, positionY, rectX, rectX);
  noFill();
  //2
  rect(positionX+rectX, positionY, rectX, rectX);
  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX);
  //4
  rect(positionX, positionY+rectX, rectX, rectX);
  //5
  rect(positionX+rectX, positionY+rectX, rectX, rectX);
  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);
}

void b (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);
  rect(positionX+rectX, positionY, rectX, rectX);
  noFill();
  rect(positionX, positionY, rectX, rectX);
  rect(positionX+rectX+rectX, positionY, rectX, rectX);
  rect(positionX, positionY+rectX, rectX, rectX);
  rect(positionX+rectX, positionY+rectX, rectX, rectX);
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);
}

void c (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);

  rect(positionX+rectX+rectX, positionY, rectX, rectX);
  noFill();
  rect(positionX+rectX, positionY, rectX, rectX);
  rect(positionX, positionY, rectX, rectX);
  rect(positionX+rectX+rectX, positionY, rectX, rectX);
  rect(positionX, positionY+rectX, rectX, rectX);
  rect(positionX+rectX, positionY+rectX, rectX, rectX);
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);
}

void d (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);
  //4
  rect(positionX, positionY+rectX, rectX, rectX);
  noFill();
  //2
  rect(positionX+rectX, positionY, rectX, rectX);
  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX);

  //5
  rect(positionX+rectX, positionY+rectX, rectX, rectX);
  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);
  //1
  rect(positionX, positionY, rectX, rectX);
}

void e (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);

  //5
  rect(positionX+rectX, positionY+rectX, rectX, rectX);
  noFill();
  //2
  rect(positionX+rectX, positionY, rectX, rectX);
  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX);

  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);
  //1
  rect(positionX, positionY, rectX, rectX);
  //4
  rect(positionX, positionY+rectX, rectX, rectX);
}
void f (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);
  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);
  noFill();
  //4
  rect(positionX, positionY+rectX, rectX, rectX);
  //2
  rect(positionX+rectX, positionY, rectX, rectX);
  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX);

  //5
  rect(positionX+rectX, positionY+rectX, rectX, rectX);

  //1
  rect(positionX, positionY, rectX, rectX);
}
void g (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);
  //1
  rect(positionX, positionY, rectX, rectX);
  //5
  rect(positionX+rectX, positionY+rectX, rectX, rectX);
  noFill();
  //2
  rect(positionX+rectX, positionY, rectX, rectX);
  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX);

  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);

  //4
  rect(positionX, positionY+rectX, rectX, rectX);
}
void h (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);
  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);
  //1
  rect(positionX, positionY, rectX, rectX);

  noFill();
  //2
  rect(positionX+rectX, positionY, rectX, rectX);
  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX);

  //5
  rect(positionX+rectX, positionY+rectX, rectX, rectX);
  //4
  rect(positionX, positionY+rectX, rectX, rectX);
}

void i (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);
  //2
  rect(positionX+rectX, positionY, rectX, rectX);
  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX); 

  noFill();
  //5
  rect(positionX+rectX, positionY+rectX, rectX, rectX);

  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);
  //1
  rect(positionX, positionY, rectX, rectX);
  //4
  rect(positionX, positionY+rectX, rectX, rectX);
}

void j (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);
  //1
  rect(positionX, positionY, rectX, rectX);
  //2
  rect(positionX+rectX, positionY, rectX, rectX);
  noFill();
  //4
  rect(positionX, positionY+rectX, rectX, rectX);

  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX);

  //5
  rect(positionX+rectX, positionY+rectX, rectX, rectX);
  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);
}

void k (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);
  //1
  rect(positionX, positionY, rectX, rectX); 
  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX);
  noFill();
  //2
  rect(positionX+rectX, positionY, rectX, rectX);
  //5
  rect(positionX+rectX, positionY+rectX, rectX, rectX);


  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);

  //4
  rect(positionX, positionY+rectX, rectX, rectX);
}





void l (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);
  //1
  rect(positionX, positionY, rectX, rectX);
  //4
  rect(positionX, positionY+rectX, rectX, rectX);
  noFill();
  //2
  rect(positionX+rectX, positionY, rectX, rectX);
  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX);

  //5
  rect(positionX+rectX, positionY+rectX, rectX, rectX);

  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);
}

void m (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);
  //4
  rect(positionX, positionY+rectX, rectX, rectX);
  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX);
  noFill();
  //2
  rect(positionX+rectX, positionY, rectX, rectX);


  //5
  rect(positionX+rectX, positionY+rectX, rectX, rectX);
  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);
  //1
  rect(positionX, positionY, rectX, rectX);
}

void n (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);
  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX);

  //5
  rect(positionX+rectX, positionY+rectX, rectX, rectX);
  noFill();
  //2
  rect(positionX+rectX, positionY, rectX, rectX);

  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);
  //1
  rect(positionX, positionY, rectX, rectX);
  //4
  rect(positionX, positionY+rectX, rectX, rectX);
}

void o (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);
  //4
  rect(positionX, positionY+rectX, rectX, rectX);
  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX);
  noFill();
  //2
  rect(positionX+rectX, positionY, rectX, rectX);


  //5
  rect(positionX+rectX, positionY+rectX, rectX, rectX);
  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);
  //1
  rect(positionX, positionY, rectX, rectX);
}

void p (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);
  //2
  rect(positionX+rectX, positionY, rectX, rectX); 
  //4
  rect(positionX, positionY+rectX, rectX, rectX);
  noFill();
  //5
  rect(positionX+rectX, positionY+rectX, rectX, rectX);
  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX);

  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);
  //1
  rect(positionX, positionY, rectX, rectX);
}

void q (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);
  //2
  rect(positionX+rectX, positionY, rectX, rectX);
  //5
  rect(positionX+rectX, positionY+rectX, rectX, rectX);
  noFill();
  //4
  rect(positionX, positionY+rectX, rectX, rectX);
  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX);


  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);
  //1
  rect(positionX, positionY, rectX, rectX);
}

void r (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);
  //2
  rect(positionX+rectX, positionY, rectX, rectX);
  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);

  noFill();

  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX);

  //5
  rect(positionX+rectX, positionY+rectX, rectX, rectX);
  //1
  rect(positionX, positionY, rectX, rectX);
  //4
  rect(positionX, positionY+rectX, rectX, rectX);
}

void s (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);
  //1
  rect(positionX, positionY, rectX, rectX);
  //2
  rect(positionX+rectX, positionY, rectX, rectX);
  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX);
  noFill();
  //4
  rect(positionX, positionY+rectX, rectX, rectX);

  //5
  rect(positionX+rectX, positionY+rectX, rectX, rectX);
  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);
}

void t (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);
  //1
  rect(positionX, positionY, rectX, rectX);
  //4
  rect(positionX, positionY+rectX, rectX, rectX);
  //2
  rect(positionX+rectX, positionY, rectX, rectX);

  noFill();
  //5
  rect(positionX+rectX, positionY+rectX, rectX, rectX);

  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX);

  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);
}

void u (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);
  //1
  rect(positionX, positionY, rectX, rectX);
  rect(positionX+rectX, positionY+rectX, rectX, rectX);
  //2
  rect(positionX+rectX, positionY, rectX, rectX);
  noFill();

  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX);

  //5

  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);

  //4
  rect(positionX, positionY+rectX, rectX, rectX);
}

void v (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);

  //5
  rect(positionX+rectX, positionY+rectX, rectX, rectX);
  //4
  rect(positionX, positionY+rectX, rectX, rectX);
  noFill();
  //2
  rect(positionX+rectX, positionY, rectX, rectX);
  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX);

  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);
  //1
  rect(positionX, positionY, rectX, rectX);
}

void w (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);
  //4
  rect(positionX, positionY+rectX, rectX, rectX);
  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);
  //1
  noFill();
  //2
  rect(positionX+rectX, positionY, rectX, rectX);
  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX);

  //5
  rect(positionX+rectX, positionY+rectX, rectX, rectX);

  rect(positionX, positionY, rectX, rectX);
}

void x (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);

  //5
  rect(positionX+rectX, positionY+rectX, rectX, rectX);
  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);
  noFill();
  //2
  rect(positionX+rectX, positionY, rectX, rectX);
  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX);


  //1
  rect(positionX, positionY, rectX, rectX);
  //4
  rect(positionX, positionY+rectX, rectX, rectX);
}

void y (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);
  //1
  rect(positionX, positionY, rectX, rectX);
  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);
  //2
  rect(positionX+rectX, positionY, rectX, rectX);
  noFill();

  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX);

  //5
  rect(positionX+rectX, positionY+rectX, rectX, rectX);

  //4
  rect(positionX, positionY+rectX, rectX, rectX);
}

void z (int rectX, int positionX, int positionY) {
  strokeWeight(2);
  stroke(0);
  strokeCap(SQUARE);
  fill(255, 0, 0);
  //1
  rect(positionX, positionY, rectX, rectX);
  //4
  rect(positionX, positionY+rectX, rectX, rectX); 
  //3
  rect(positionX+rectX+rectX, positionY, rectX, rectX);


  noFill();
  //2
  rect(positionX+rectX, positionY, rectX, rectX);

  //6
  rect(positionX+rectX+rectX, positionY+rectX, rectX, rectX);

  //5
  rect(positionX+rectX, positionY+rectX, rectX, rectX);
}




