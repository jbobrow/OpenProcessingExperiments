
//Image and font titles
PFont font;
PImage apple;
PImage bananas;
PImage boat;
PImage car;
PImage football;
PImage cricket;
PImage badminton;
PImage grapes;
PImage plane;
PImage title;
//variables
int level = 0;
Rec rec1, rec2, rec3, rec4, rec5, rec6, rec7, rec8, rec9;
Particle[] z1 = new Particle[900];
int xPos = 25;
int yPos = 575;
int boxx = 500;
int boxy = 600;
int o1 = 100;//This is the opacity for the rectangles
int o2 = 100;
int o3 = 100;
int o4 = 100;
int o5 = 100;
int o6 = 100;
int o7 = 100;
int o8 = 100;
int fontY = 570;
boolean a = false;
boolean b = false;
boolean c = false;
boolean d = false;
boolean e = false;
boolean f = false;
boolean g = false;
boolean i = false;
boolean k = false;
boolean l = false;
boolean m = false;
boolean n = false;
boolean o = false;
boolean p = false;
boolean r = false;
boolean s = false;
boolean t = false;

void setup() {
  size(1000, 600);
  rectangles();
  for (int i1=0; i1 < z1.length; i1++) {
    z1[i1] = new Particle(boxx, boxy);
  }
  //load images and font
  font = loadFont("KristenITC-Regular-50.vlw");
  apple = loadImage("apple.jpg");
  bananas = loadImage("bananas.jpg");
  boat = loadImage("boat.jpg");
  car = loadImage("car.jpg");
  football = loadImage("football.jpg");
  grapes = loadImage("grapes.jpg");
  plane = loadImage("plane.jpg");
  cricket = loadImage("cricket.jpg");
  badminton = loadImage("badminton.jpg");
  title = loadImage("title.jpg");
  textFont(font, 50);
}
void draw() {//progresses through each level
  if (keyPressed == true && key == '2') {
    level = 0;
  }
  if (level == 0)
    startScreen();
  if (level == 1) 
    car();
  if (level == 2) 
    boat();  
  if (level == 3) 
    plane();
  if (level == 4) 
    banana();
  if (level == 5) 
    apple();
  if (level == 6) 
    grapes();
  if (level == 7) 
    football();
  if (level == 8) 
    cricket();
  if (level == 9) 
    badminton();
}
// class to make the squares covering the images
class Rec {
  int xPos = 20;
  int yPos = 50;
  int w = 0;
  int h = 0;

  public Rec(int xPos, int yPos, int w, int h) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.w = w;
    this.h = h;
  }
  void rectangle(int a) {
    noStroke();
    fill(6, 62, 9, a+160);
    rect(xPos, yPos, w, h);
  }
}
void rectangles() {
  rec1 = new Rec(250, 50, 166, 166);
  rec2 = new Rec(416, 216, 166, 166);
  rec3 = new Rec(582, 382, 166, 166);

  rec4 = new Rec(250, 382, 166, 166);
  rec5 = new Rec(582, 50, 166, 166);
  rec6 = new Rec(416, 382, 166, 166);

  rec7 = new  Rec(582, 216, 166, 166);
  rec8 = new  Rec(250, 216, 166, 166);
  rec9 = new  Rec(416, 50, 166, 166);
}
void car() {//first picture
  if (c == true && a == true && r == true) {
    image(car, 0, 0);
    text("C    A    R", 370, fontY);
    text("Well done! Press SPACE to continue", 50, 150);
    if (key == ' ') {
      c = false;
      a = false;
      r = false;
      o1 = 100;
      o2 = 100;
      o3 = 100;
      level = 2;
    }
  }
  else {
    image(car, 0, 0);
    rec1.rectangle(o1);
    rec2.rectangle(o2);
    rec3.rectangle(o3);
    if (key == '1') {
      fill(0, 0, 0); 
      text("It has four wheels", 50, 300);
    }
    else {
      image(car, 0, 0);
      rec1.rectangle(o1);
      rec2.rectangle(o2);
      rec3.rectangle(o3);
    } 
    if (key == 'c') {
      c=true;
    }
    if (key == 'a') {
      a = true;
    }
    if (key == 'r') {
      r = true;
    }

    if (r == true) {
      o3 = o3-10;
      fill(0);
      text("R", 590, fontY);
    }
    if (a ==true) {
      o2 = o2-10;
      fill(0);
      text("A", 480, fontY);
    }
    if (c == true) {
      o1 = o1-10;
      fill(0);
      text("C", 370, fontY);
    }
  }
}
void boat() {//second picture
  if (b == true && o == true && a == true && t == true) {
    image(boat, 0, 0);
    text("B    O    A    T", 320, fontY);
    text("Well done! Press SPACE to continue", 50, 250);
    if (key == ' ') {
      b = false;
      o = false;
      a = false;
      t = false;

      o1 = 100;
      o2 = 100;
      o3 = 100;
      o4 = 100;
      level = 3;
    }
  }
  else {

    image(boat, 0, 0);
    rec1.rectangle(o1);
    rec2.rectangle(o2);
    rec3.rectangle(o3);
    rec4.rectangle(o4);
    if (key == '1') {
      fill(0, 0, 0); 
      text("It floats on water", 50, 300);
    }

    if (key == 'b') {
      b=true;
    }
    if (key == 'o') {
      o = true;
    }
    if (key == 'a') {
      a = true;
    }
    if (key == 't') {
      t = true;
    }

    if (t == true) {
      fill(0);
      text("T", 650, fontY);
      o4 = o4 - 10;
    }
    if (a ==true) {
      fill(0);
      text("A", 540, fontY);
      o3 = o3 - 10;
    }
    if (b == true) {
      fill(0);
      text("B", 320, fontY);
      o1 = o1 - 10;
    }
    if (o == true) {
      fill(0);
      text("O", 430, fontY);
      o2 = o2 -10;
    }
  }
}
void plane() {//third picture
  if (p == true && l == true && a == true && n == true && e == true) {
    image(plane, 0, 0);
    text("P    L    A    N    E", 270, fontY);
    text("Well done! Press SPACE to continue", 50, 250);
    if (key == ' ') {
      p = false;
      l = false;
      a = false;
      n = false;
      e = false;
      o1 = 100;
      o2 = 100;
      o3 = 100;
      o4 = 100;
      o5 = 100;
      level = 4;
    }
  }
  else {
    image(plane, 0, 0);
    rec1.rectangle(o1);
    rec2.rectangle(o2);
    rec3.rectangle(o3);
    rec4.rectangle(o4);
    rec5.rectangle(o5);
    if (key == '1') {
      fill(0, 0, 0); 
      text("It flys in the sky", 50, 300);
    }
    if (key == 'p') {
      p=true;
    }
    if (key == 'l') {
      l = true;
    }
    if (key == 'a') {
      a = true;
    }
    if (key == 'n') {
      n = true;
    }
    if (key == 'e') {
      e = true;
    }

    if (p == true) {
      o1 = o1 - 10;
      fill(0);
      text("P", 270, fontY);
    }
    if (l ==true) {
      o2 = o2 - 10;
      fill(0);
      text("L", 380, fontY);
    }
    if (a == true) {
      o3 = o3 - 10;
      fill(0);
      text("A", 490, fontY);
    }
    if (n == true) {
      o4 = o4 - 10;
      fill(0);
      text("N", 600, fontY);
    }
    if (e == true) {
      o5 = o5 - 10;
      fill(0);
      text("E", 710, fontY);
    }
  }
}
void banana() {//fourth picture
  if (b==true&&a==true&&n==true&&s==true) {
    image(bananas, 0, 0);
    text("B    A    N    A    N     A     S", 160, fontY);
    text("Well Done! Press SPACE to continue", 50, 250);
    if (key == ' ') {
      b = false;
      a = false;
      n = false;
      s = false;
      o1 = 100;
      o2 = 100;
      o3 = 100;
      o4 = 100;
      level = 5;
    }
  }
  else {
    image(bananas, 0, 0);
    rec1.rectangle(o1);
    rec2.rectangle(o2);
    rec3.rectangle(o3);
    rec4.rectangle(o4);
    if (key == '1') {
      fill(0, 0, 0); 
      text("It is yellow & comes in bunches", 50, 300);
    }
    if (key == 'b')
      b = true;
    if (key == 'a')
      a = true;
    if (key == 'n')
      n = true;
    if (key == 's')
      s = true;

    if (b == true) {
      o1 = o1 -10;
      fill(0);
      text("B", 160, fontY);
    }

    if (a == true) {
      o2 = o2 - 10;
      fill(0);
      text("A", 260, fontY);
      text("A", 470, fontY);
      text("A", 690, fontY);
    }

    if (n == true) {
      o3 = o3 - 10;
      fill(0);
      text("N", 360, fontY);
      text("N", 580, fontY);
      //text("N", 700, fontY);
    }
    if (s == true) {
      o4 = o4 - 10;
      fill(0);
      text("S", 810, fontY);
    }
  }
}
void apple() {//fith picture
  if (a==true&&p==true&&l==true&&e==true)
  {
    image(apple, 0, 0);
    text("A    P    P     L     E ", 270, fontY);
    text("Well done! Press Space to continue", 50, 250);
    if (key == ' ') {
      a = false;
      p = false;
      l = false;
      e = false;
      o1 = 100;
      o2 = 100;
      o3 = 100;
      o4 = 100;
      level = 6;
    }
  }
  else {
    image(apple, 0, 0);
    rec1.rectangle(o1);
    rec2.rectangle(o2);
    rec3.rectangle(o3);
    rec4.rectangle(o4);
    if (key == '1') {
      fill(0, 0, 0); 
      text("It is crunchy and good for your teeth", 50, 300);
    }
    if (key == 'a') {
      a=true;
    }
    if (key == 'p') {
      p=true;
    }
    if (key == 'l') {
      l=true;
    }
    if (key == 'e') {
      e=true;
    }
    if (a == true) {
      o1 = o1 - 10;
      fill(0);
      text("A", 270, fontY);
    }
    if (p == true) {
      o2 = o2 - 10;
      fill(0);
      text("P", 380, fontY);
      text("P", 490, fontY);
    }
    if (l == true) {
      o3 = o3 -10;
      fill(0);
      text("L", 600, fontY);
    }
    if (e == true) {
      o4 = o4 -10;
      fill(0);
      text("E", 710, fontY);
    }
  }
}
void grapes() {//sixth picture
  if (g == true && r == true && a == true && p == true && e == true && s == true) {
    image(grapes, 0, 0);
    text("G     R      A     P     E     S", 190, fontY);
    text("Well done! Press SPACE to continue", 50, 250);
    if (key == ' ') {
      g = false;
      r = false;
      a = false;
      p = false;
      e = false;
      s = false;
      o1 = 100;
      o2 = 100;
      o3 = 100;
      o4 = 100;
      o5 = 100;
      o6 = 100;
      level = 7;
    }
  }
  else {
    image(grapes, 0, 0);
    rec1.rectangle(o1);
    rec2.rectangle(o2);
    rec3.rectangle(o3);
    rec4.rectangle(o4);
    rec5.rectangle(o5);
    rec6.rectangle(o6);
    if (key == '1') {
      fill(0, 0, 0); 
      text("They are small, and are used in wine", 30, 300);
    }
    if (key == 'g') {
      g=true;
    }
    if (key == 'r') {
      r = true;
    }
    if (key == 'a') {
      a = true;
    }
    if (key == 'p') {
      p = true;
    }
    if (key == 'e') {
      e = true;
    }
    if (key == 's') {
      s = true;
    }

    if (g == true) {
      o1 = o1 - 10;
      fill(0);
      text("G", 190, fontY);
    }
    if (r ==true) {
      o2 = o2 - 10;
      fill(0);
      text("R", 300, fontY);
    }
    if (a == true) {
      o3 = o3 - 10;
      fill(0);
      text("A", 410, fontY);
    }
    if (p == true) {
      o4 = o4 -10;
      fill(0);
      text("P", 520, fontY);
    }
    if (e == true) {
      o5 = o5 - 10;
      fill(0);
      text("E", 630, fontY);
    }
    if (s == true) {
      o6 = o6 - 10;
      fill(0);
      text("S", 740, fontY);
    }
  }
}  
void football() {//seventh picture
  if (f == true && o == true && t == true && b == true && a == true && l == true) {
    image(football, 0, 0);
    text("F    O     O     T     B     A    L    L", 100, fontY);
    text("Well done! Press SPACE to continue", 50, 250);
    if (key == ' ') {
      f = false;
      o = false;
      t = false;
      b = false;
      a = false;
      l = false;
      o1 = 100;
      o2 = 100;
      o3 = 100;
      o4 = 100;
      o5 = 100;
      o6 = 100;
      level = 8;
    }
  }
  else {
    image(football, 0, 0);
    rec1.rectangle(o1);
    rec2.rectangle(o2);
    rec3.rectangle(o3);
    rec4.rectangle(o4);
    rec5.rectangle(o5);
    rec6.rectangle(o6);
    if (key == '1') {
      fill(0, 0, 0); 
      text("You kick the ball with your foot", 50, 300);
    }
    if (key == 'f')
      f=true;
    if (key == 'o')
      o=true;
    if (key == 't')
      t=true;
    if (key == 'b')
      b=true;
    if (key == 'a')
      a=true;
    if (key == 'l')
      l=true;

    if (f == true) {
      o1 = o1 - 10;
      fill(0);
      text("F", 100, fontY);
    }
    if (o == true) {
      o2 = o2 - 10;
      fill(0);
      text("O", 210, fontY);
      text("O", 320, fontY);
    }
    if (t == true) {
      o3 = o3 - 10;
      fill(0);
      text("T", 430, fontY);
    }
    if (b == true) {
      o4 = o4 - 10;
      fill(0);
      text("B", 540, fontY);
    }
    if (a == true) {
      o5 = o5 - 10;
      fill(0);
      text("A", 650, fontY);
    }
    if (l == true) {
      o6 = o6 - 10;
      text("L", 760, fontY);
      text("L", 870, fontY);
    }
  }
}
void cricket() {//eighth picture
  if (c == true && r == true && i == true && c == true && k == true && e == true && t == true) {
    image(cricket, 0, 0);
    text("C    R     I    C     K     E    T", 160, fontY);
    text("Well done! Press SPACE to continue", 50, 250);
    if (key == ' ') {
      c = false;
      r = false;
      i = false;
      c = false;
      k = false;
      e = false;
      t = false;
      o1 = 100;
      o2 = 100;
      o3 = 100;
      o4 = 100;
      o5 = 100;
      o6 = 100;
      o7 = 100;
      level = 9;
    }
  }
  else {
    image(cricket, 0, 0);
    rec1.rectangle(o1);
    rec2.rectangle(o2);
    rec3.rectangle(o3);
    rec4.rectangle(o4);
    rec5.rectangle(o5);
    rec6.rectangle(o6);
    rec7.rectangle(o7);
    if (key == '1') {
      fill(0, 0, 0); 
      text("You need a flat wooden bat", 50, 300);
    }
    if (key == 'c')
      c=true;
    if (key == 'r')
      r = true;    
    if (key == 'i')
      i = true;    
    if (key == 'c')
      c = true;    
    if (key == 'k')
      k = true;    
    if (key == 'e') 
      e = true;    
    if (key == 't')
      t = true;

    if (c == true) {
      o1 = o1-10;
      fill(0);
      text("C", 160, fontY);
    }
    if (r ==true) {
      o2 = o2 - 10;
      fill(0);
      text("R", 270, fontY);
    }
    if (i == true) {
      o3 = o3-10;
      fill(0);
      text("I", 380, fontY);
    }
    if (c == true) {
      o4 = o4-10 ;
      fill(0);
      text("C", 490, fontY);
    }
    if (k == true) {
      o5 = o5-10;
      fill(0);
      text("K", 600, fontY);
    }
    if (e == true) {
      o6 = o6-10;
      fill(0);
      text("E", 710, fontY);
    }
    if (t == true) {
      o7 = o7-10;
      fill(0);
      text("T", 820, fontY);
    }
  }
}

void badminton() {// final picture
  if (b == true && a == true && d == true && m == true && i == true && n == true && t == true && o == true) {
    image(badminton, 0, 0);
    fireworks();
    fill(0, 0, 0);
    text("B    A     D    M     I    N    T    O    N ", 50, fontY);
    fill(random(500), random(500), random(500));
    text("Well done you have Won!!", 200, 300);
  }
  else {
    image(badminton, 0, 0);
    rec1.rectangle(o1);
    rec2.rectangle(o2);
    rec3.rectangle(o3);
    rec4.rectangle(o4);
    rec5.rectangle(o5);
    rec6.rectangle(o6);
    rec7.rectangle(o7);
    rec8.rectangle(o8);
    if (key == '1') {
      fill(0, 0, 0); 
      text("You use a shuttlecock", 50, 300);
    }
    if (key == 'b') {
      b=true;
    }
    if (key == 'a') {
      a = true;
    }
    if (key == 'd') {
      d = true;
    }
    if (key == 'm') {
      m = true;
    }
    if (key == 'i') {
      i = true;
    }
    if (key == 'n') {
      n = true;
    }
    if (key == 't') {
      t = true;
    }
    if (key == 'o') {
      o = true;
    }

    if (b == true) {
      o1 = o1 - 10;
      fill(0);
      text("B", 50, fontY);
    }
    if (a ==true) {
      o2 = o2 -10;
      fill(0);
      text("A", 160, fontY);
    }
    if (d == true) {
      o3 = o3 - 10;
      fill(0);
      text("D", 270, fontY);
    }
    if (m == true) {
      o4 = o4 - 10;
      fill(0);
      text("M", 380, fontY);
    }
    if (i == true) {
      o5 = o5 - 10;
      fill(0);
      text("I", 490, fontY);
    }
    if (n == true) {
      o6 = o6 - 10;
      fill(0);
      text("N", 600, fontY);
      text("N", 930, fontY);
    }
    if (t == true) {
      o7 = o7 - 10;
      fill(0);
      text("T", 710, fontY);
    }
    if (o == true) {
      o8 = o8 - 10;
      fill(0);
      text("O", 820, fontY);
    }
  }
}
void startScreen() {//method to reset all values & run the start screen (set as level 0)
  o1 = 100;
  o2 = 100;
  o3 = 100;
  o4 = 100;
  o5 = 100;
  o6 = 100;
  o7 = 100;
  o8 = 100;
  a = false;
  b = false;
  c = false;
  d = false;
  e = false;
  f = false;
  g = false;
  i = false;
  k = false;
  l = false;
  m = false;
  n = false;
  o = false;
  p = false;
  r = false;
  s = false;
  t = false;
  int x =500;
  int y =510;
  int d = 100;
  image(title, 0, 0);
  fill(255, 0, 0);
  ellipse(x, y, d, d);
  fill(0, 0, 0);
  text("Press the button to start the game", 50, 290);
  fill(0, 0, 0);
  text("Start", 440, 520);
  if (dist(mouseX, mouseY, x, y) < d / 2) {
    fill(6, 62, 9);
    ellipse(x, y, d, d);
    fill(0, 0, 0);
    text("Start", 440, 520);
  }
  if (dist(mouseX, mouseY, x, y) < d / 2 && mousePressed == true)
  {
    level = 1;
  }
}
void fireworks() {//method to run the fireworks at the end of the game

  if (dist(boxx, boxy, xPos, yPos) < 30) {
    point(boxx, boxy);
    for (int i1=0;i1<z1.length;i1++) {
      z1[i1] = new Particle(500, 500);
    }
  }

  for (int i1=0;i1<z1.length;i1++) {
    z1[i1].render();
  }
}
class Particle {// class to create the array of ellipses used in the firework class

  float xPos=0;
  float yPos=0;
  float a1=0;
  float g=0;
  float m=0;


  int counter=0;

  public Particle(float x, float y) {
    xPos = x;
    yPos = y;
    a1 = random(360);
    m = random(2);
    counter=0;
  }

  public void render() {
    counter++;

    if (counter > 100) {
      xPos += m*cos(radians(a1));
      yPos += m*sin(radians(a1));
      yPos += g;
      g += 0.1;
    }
    else {
      yPos-=5;
    }
    fill(255, 217, 0, random(75));
    noStroke();
    ellipse(xPos, yPos, random(2, 10), random(2, 10));
  }
}
//End of code


