
int x, y;
PImage game;
PImage felix;
PImage fix;
PImage window;
boolean b = true;
boolean a = true;
boolean c = true;
boolean d = true;
boolean e = true;
boolean f = true;
boolean g = true;
boolean h = true;
boolean i = true;
boolean j = true;
boolean k = true;
boolean l = true;
boolean m = true;
boolean n = true;
void setup(){
  b = !b;
  a = !a;
  c = !c;
  d = !d;
  e = !e;
  f = !f;
  g = !g;
  h = !h;
  i = !i;
  j = !j;
  k = !k;
  l = !l;
  m = !m;
  n = !n;
  smooth();
  noStroke();
  size(345, 438);
  x = width / 2;
  y = height / 2;
  game = loadImage("wreckit.png");
  felix = loadImage("felix.png");
  fix = loadImage("fix.png");
  window = loadImage("normalw.png");
}
  void draw(){
    image(game, 0, 0);
    if (x > 235 && x < 250 && y > 130 && y < 175) {
      a = true;
    }
      if (a == true){
      image(window, 242, 148);
      }
      if (!a == true){
        fill(0, 0, 0);
        rect(242, 151, 28, 25);
      }
    if (x > 235 && x < 250 && y > 160 && y < 205) {
      b = true;
    }
      if (b == true){
      image(window, 242, 175);
      }
      if (!b == true){
        fill(0, 0, 0);
        rect(242, 178, 28, 25);
      }
       if (x > 110 && x < 135 && y > 160 && y < 205) {
      c = true;
    }
      if (c == true){
      image(window, 115, 175);
      }
      if (!c == true){
        fill(0, 0, 0);
        rect(115, 178, 28, 25);
      }
      if (x > 110 && x < 135 && y > 130 && y < 175) {
      d = true;
    }
      if (d == true){
      image(window, 115, 148);
      }
      if (!d == true){
        fill(0, 0, 0);
        rect(115, 151, 28, 25);
      }
       if (x > 110 && x < 135 && y > 237 && y < 282) {
      e = true;
    }
      if (e == true){
      image(window, 115, 255);
      }
      if (!e == true){
        fill(0, 0, 0);
        rect(115, 258, 28, 25);
      }
       if (x > 110 && x < 135 && y > 267 && y < 312) {
      f = true;
    }
      if (f == true){
      image(window, 115, 282);
      }
      if (!f == true){
        fill(0, 0, 0);
        rect(115, 285, 28, 25);
      }
      if (x > 173 && x < 198 && y > 267 && y < 312) {
      g = true;
    }
      if (g == true){
      image(window, 178, 282);
      }
      if (!g == true){
        fill(0, 0, 0);
        rect(178, 285, 28, 25);
      }
         if (x > 173 && x < 198 && y > 237 && y < 282) {
      h = true;
    }
      if (h == true){
      image(window, 178, 255);
      }
      if (!h == true){
        fill(0, 0, 0);
        rect(178, 258, 28, 25);
      }
         if (x > 302 && x < 325 && y > 237 && y < 282) {
      i = true;
    }
      if (i == true){
      image(window, 307, 255);
      }
      if (!i == true){
        fill(0, 0, 0);
        rect(307, 258, 28, 25);
      }
         if (x > 302 && x < 325 && y > 329 && y < 374) {
      j = true;
    }
      if (j == true){
      image(window, 307, 348);
      }
      if (!j == true){
        fill(0, 0, 0);
        rect(307, 351, 28, 25);
      }
       if (x > 302 && x < 325 && y > 359 && y < 404) {
      k = true;
    }
      if (k == true){
      image(window, 307, 376);
      }
      if (!k == true){
        fill(0, 0, 0);
        rect(307, 378, 28, 25);
      }
       if (x > 110 && x < 135 && y > 52 && y < 97) {
      l = true;
    }
      if (l == true){
      image(window, 115, 69);
      }
      if (!l == true){
        fill(0, 0, 0);
        rect(115, 71, 28, 25);
      }
      if (x > 110 && x < 135 && y > 25 && y < 70) {
      m = true;
    }
      if (m == true){
      image(window, 115, 42);
      }
      if (!m == true){
        fill(0, 0, 0);
        rect(115, 44, 28, 25);
      }
       if (x > 173 && x < 198 && y > 52 && y < 97) {
      n = true;
    }
      if (n == true){
      image(window, 178, 69);
      }
      if (!n == true){
        fill(0, 0, 0);
        rect(178, 71, 28, 25);
      }
      fill(255, 255, 255);
    rect(242, 280, 10, 12);
    fill(80, 100, 280);
    rect(232, 378, 18, 20);
    image(felix, x, y);
     if (x > 173 && x < 198 && y > 52 && y < 97){
    image(fix, x, y);
  }
   if (x > 110 && x < 135 && y > 25 && y < 70){
    image(fix, x, y);
  }
  if (x > 110 && x < 135 && y > 52 && y < 97){
    image(fix, x, y);
  }
  if (x > 302 && x < 325 && y > 359 && y < 404){
    image(fix, x, y);
  }
  if (x > 302 && x < 325 && y > 329 && y < 374){
    image(fix, x, y);
  }
  if (x > 302 && x < 325 && y > 237 && y < 282){
    image(fix, x, y);
  }
  if (x > 173 && x < 198 && y > 237 && y < 282){
    image(fix, x, y);
  }
  if (x > 173 && x < 198 && y > 267 && y < 312){
    image(fix, x, y);
  }
  if (x > 110 && x < 135 && y > 267 && y < 312){
    image(fix, x, y);
  }
  if (x > 110 && x < 135 && y > 237 && y < 282){
    image(fix, x, y);
  }
  if (x > 110 && x < 135 && y > 130 && y < 175){
    image(fix, x, y);
  }
  if (x > 110 && x < 135 && y > 160 && y < 205){
    image(fix, x, y);
  }
  if (x > 235 && x < 250 && y > 160 && y < 205) {
    image(fix, x, y);
  }
   if (x > 235 && x < 250 && y > 130 && y < 175) {
    image(fix, x, y);
  } 
     if (kL) x--;
  if (kR) x++;
  if (kD) y++;
  if (kU) y--;
  if (kF)
  {
    stroke(#FFAA88);
    line(x, y, width / 2, height / 2);
  }
  }
  boolean kL, kD, kU, kR, kF;
void keyPressed()
{
  if (key == CODED)
  {
    switch (keyCode)
    {
      case LEFT: kL = true; break;
      case DOWN: kD = true; break;
      case UP: kU = true; break;
      case RIGHT: kR = true; break;
      case CONTROL: kF = true; break;
    }
  }
}

void keyReleased()
{
  if (key == CODED)
  {
    switch (keyCode)
    {
      case LEFT: kL = false; break;
      case DOWN: kD = false; break;
      case UP: kU = false; break;
      case RIGHT: kR = false; break;
      case CONTROL: kF = false; break;
    }
  }
}


