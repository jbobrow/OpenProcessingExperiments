
//Octododge
//by Hunter Bolin
// I examined his code in order to find out how I could my bircks to fall in the code
//That is all I used his code for and I even changed his code a little in order for it to work with my game
// And I changed the number of bricks that would fall, and I did my own code to make them hurt Felix
int x, y;
int[] xpos=new int[50];  
int[] ypos=new int[50];
int r;
int i = 0;
int above;
int value = 0;
int counter=0;
boolean lose;
int timer=20;
int timeLast = 0;
PFont font;
PImage game;
PImage ouch;
PImage felix;
PImage fix;
PImage gameover;
PImage win;
PImage window;
PImage broken;
PImage brick;
boolean b = true;
boolean a = true;
boolean c = true;
boolean d = true;
boolean e = true;
boolean f = true;
boolean g = true;
boolean h = true;
boolean o = true;
boolean j = true;
boolean k = true;
boolean l = true;
boolean m = true;
boolean n = true;
boolean p = true;
void setup(){
  lose = false;
  b = !b;
  a = !a;
  c = !c;
  d = !d;
  e = !e;
  f = !f;
  g = !g;
  h = !h;
  o = !o;
  j = !j;
  k = !k;
  l = !l;
  m = !m;
  n = !n;
  p = !p;
  smooth();
  noStroke();
  size(345, 438);
  x = width / 2;
  y = height / 2;
  game = loadImage("wreckit.png");
  felix = loadImage("felix.png");
  fix = loadImage("fix.png");
  window = loadImage("normalw.png");
  broken = loadImage("broken.png");
  brick = loadImage("brick1.png");
  gameover = loadImage("go1.png");
  ouch = loadImage("ouch.png");
  timeLast=second();
  win = loadImage("win.png");
  font = loadFont("Serif.plain-48.vlw");
  textFont(font, 32); 
  for (int i = 0; i < 50; i = i+1) {
    int r =int(random(0, 600));
    int above=int(random(-6000, -50));
    xpos[i]=r;
    ypos[i]=above;
    
  }
}
  void draw(){
    if (timer>0) {
    game();
  }
  counter+=1;
  float sec = millis() / 1000.0;
  if (sec > 19.5) {
    x++;  
   
    image(gameover, 0, 0);
  }
    if (a == true && b == true && c == true && d == true && e == true && f == true && g == true && h == true && o == true && j == true && k == true && l == true && m == true && n == true){
      image(win, 0, 0);
       
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
void game() {
    if (second()!=timeLast) {
      timeLast=second(); 
      timeLast=second();
      timer-=1;
    }
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
       image(broken, 242, 178);
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
        image(broken, 115, 151);
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
        image(broken, 115, 285);
      }
      if (x > 173 && x < 198 && y > 267 && y < 312) {
      g = true;
    }
      if (g == true){
      image(window, 178, 282);
      }
      if (!g == true){
        fill(0, 0, 0);
        image(broken, 178, 285);
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
      o = true;
    }
      if (o == true){
      image(window, 307, 255);
      }
      if (!o == true){
        fill(0, 0, 0);
        image(broken, 307, 258);
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
        image(broken, 307, 378);
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
        image(broken, 115, 44);
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
    image(fix, x-4, y-8);
  }
   if (x > 110 && x < 135 && y > 25 && y < 70){
    image(fix, x-4, y-8);
  }
  if (x > 110 && x < 135 && y > 52 && y < 97){
    image(fix, x-4, y-8);
  }
  if (x > 302 && x < 325 && y > 359 && y < 404){
    image(fix, x-4, y-8);
  }
  if (x > 302 && x < 325 && y > 329 && y < 374){
    image(fix, x-4, y-8);
  }
  if (x > 302 && x < 325 && y > 237 && y < 282){
    image(fix, x-4, y-8);
  }
  if (x > 173 && x < 198 && y > 237 && y < 282){
    image(fix, x-4, y-8);
  }
  if (x > 173 && x < 198 && y > 267 && y < 312){
    image(fix, x-4, y-8);
  }
  if (x > 110 && x < 135 && y > 267 && y < 312){
    image(fix, x-4, y-8);
  }
  if (x > 110 && x < 135 && y > 237 && y < 282){
    image(fix, x-4, y-8);
  }
  if (x > 110 && x < 135 && y > 130 && y < 175){
    image(fix, x-4, y-8);
  }
  if (x > 110 && x < 135 && y > 160 && y < 205){
    image(fix, x-4, y-8);
  }
  if (x > 235 && x < 250 && y > 160 && y < 205) {
    image(fix, x-4, y-8);
  }
   if (x > 235 && x < 250 && y > 130 && y < 175) {
    image(fix, x-4, y-8);
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
  for (int i = 0; i < 50; i = i+1) {
      if (dist(x, y, xpos[i], ypos[i])<30) {
       image(ouch, 0, 0);
    }
      image(brick, xpos[i], ypos[i]);
      ypos[i]+=3;
      if (counter>700) {
        ypos[i]+=4;
      
   }
     text("Timer: "+timer, 10, 25);
}
}

